from rest_framework import generics
from .models import VanBan
from .serializers import VanBanSerializer
from .models import Data
from .serializers import DataSerializer
from .models import DieuKienTai
from .serializers import DieuKienTaiSerializer
import os
from django.http import HttpResponse, Http404
from django.conf import settings
from urllib.parse import quote
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import mimetypes
from datetime import datetime
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

# Thêm mới và xem danh sách các VanBan

class VanBanListCreateView(generics.ListCreateAPIView):
    queryset = VanBan.objects.all()
    serializer_class = VanBanSerializer

# Xem, sửa, xóa một VanBan cụ thể
class VanBanDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = VanBan.objects.all()
    serializer_class = VanBanSerializer

# Thêm mới và xem danh sách các Data
class DataListCreateView(generics.ListCreateAPIView):
    queryset = Data.objects.all()
    serializer_class = DataSerializer
# lấy ds pdf chưa convert
class DataPdfNotConvert(generics.ListAPIView):
    queryset = Data.objects.filter(active = True, convert=False, type = 'application/pdf')
    serializer_class = DataSerializer
# Xem, sửa, xóa một Data cụ thể
class DataDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Data.objects.all()
    serializer_class = DataSerializer
# xem data theo ngay params startDate, endDate
class FilterDataByDateView(APIView):
    def get(self, request, *args, **kwargs):
        # Lấy các tham số từ URL
        start_date_str = request.query_params.get('startDate')
        end_date_str = request.query_params.get('endDate')

        # Kiểm tra tính hợp lệ của tham số
        if not start_date_str or not end_date_str:
            return Response({"error": "startDate and endDate are required."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Chuyển đổi định dạng ngày thành Unix timestamp
            start_date_s = datetime.strptime(start_date_str, '%d/%m/%Y')
            start_date = int(start_date_s.timestamp()*1000)
            end_date_s = datetime.strptime(end_date_str, '%d/%m/%Y')
            end_date = int(end_date_s.timestamp()*1000)
        except ValueError:
            return Response({"error": "Invalid date format. Use 'dd/mm/yyyy'."}, status=status.HTTP_400_BAD_REQUEST)

        # Truy vấn VanBan dựa trên khoảng ngày
        vanban_ids = VanBan.objects.filter(
            ngay_ban_hanh__gte=start_date,
            ngay_ban_hanh__lte=end_date
        ).values_list('id', flat=True)

        # Lấy các Data liên kết với VanBan
        data = Data.objects.filter(van_ban_id__in=vanban_ids)

        # Serialize dữ liệu
        serializer = DataSerializer(data, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
# Thêm mới và xem danh sách các DieuKienTai
class DieuKienTaiListCreateView(generics.ListCreateAPIView):
    queryset = DieuKienTai.objects.all()
    serializer_class = DieuKienTaiSerializer

# Xem, sửa, xóa một DieuKienTai cụ thể
class DieuKienTaiDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = DieuKienTai.objects.all()
    serializer_class = DieuKienTaiSerializer

def download_original_file(request, filename):
    # Đường dẫn tới thư mục chứa file
    file_path = os.path.join(settings.MEDIA_ROOT, 'pdfdata', filename)
    if os.path.exists(file_path):
        mime_type, _ = mimetypes.guess_type(file_path)  # Xác định MIME type
        with open(file_path, 'rb') as file:
            response = HttpResponse(file.read(), content_type=mime_type or 'application/octet-stream')
            response['Content-Disposition'] = f'inline; filename="{filename}"'  # Thiết lập inline
            return response
    else:
        raise Http404("File not found.")
    
def download_converted_file(request, filename):
    # Đường dẫn tới thư mục chứa file
    file_path = os.path.join(settings.MEDIA_ROOT, 'pdfconvert', filename)
    if os.path.exists(file_path):
        mime_type, _ = mimetypes.guess_type(file_path)  # Xác định MIME type
        with open(file_path, 'rb') as file:
            response = HttpResponse(file.read(), content_type=mime_type or 'application/octet-stream')
            response['Content-Disposition'] = f'inline; filename="{filename}"'  # Thiết lập inline
            return response
    else:
        raise Http404("File not found.")

@csrf_exempt   
def update_data_download_links_original(request, data_id):
    if request.method == 'POST':
        try:
            # Lấy đối tượng Data cần cập nhật
            data = Data.objects.get(id=data_id)
            
            # Lấy tên file từ trường original_file
            if data.original_file:
                file_name = data.original_file.name.split('\\')[-1]  # Lấy tên file
                encoded_file_name = quote(file_name)  # Mã hóa tên file cho URL
                download_url = f"http://127.0.0.1:8000/database/download_original/{encoded_file_name}"  # Tạo link tải
                
                # Cập nhật trường download_original_file
                data.download_original_file = download_url
                
                # Lưu lại thay đổi
                data.save()
                
                # Trả về dữ liệu JSON sau khi cập nhật
                return JsonResponse({
                    'message': 'Download link updated successfully.',
                    'data': {
                        'id': data.id,
                        'name': data.name,
                        'download_original_file': data.download_original_file
                    }
                }, status=200)
            else:
                return JsonResponse({'error': 'Original file is not set.'}, status=400)
        
        except Data.DoesNotExist:
            return JsonResponse({'error': 'Data instance not found.'}, status=404)
    
    return JsonResponse({'error': 'Invalid request method, only POST is allowed.'}, status=405)

@csrf_exempt 
def update_data_download_links_converted(request, data_id):
    if request.method == 'POST':
        try:
            # Lấy đối tượng Data cần cập nhật
            data = Data.objects.get(id=data_id)
            
            # Lấy tên file từ trường converted_file
            if data.converted_file:
                file_name = data.converted_file.name.split('/')[-1]  # Lấy tên file
                encoded_file_name = quote(file_name)  # Mã hóa tên file cho URL
                download_url = f"http://127.0.0.1:8000/database/download_converted/{encoded_file_name}"  # Tạo link tải
                
                # Cập nhật trường download_converted_file
                data.download_converted_file = download_url
                
                # Lưu lại thay đổi
                data.save()
                
                # Trả về dữ liệu JSON sau khi cập nhật
                return JsonResponse({
                    'message': 'Download link updated successfully.',
                    'data': {
                        'id': data.id,
                        'name': data.name,
                        'download_converted_file': data.download_converted_file
                    }
                }, status=200)
            else:
                return JsonResponse({'error': 'Converted file is not set.'}, status=400)
        
        except Data.DoesNotExist:
            return JsonResponse({'error': 'Data instance not found.'}, status=404)
    
    return JsonResponse({'error': 'Invalid request method, only POST is allowed.'}, status=405)