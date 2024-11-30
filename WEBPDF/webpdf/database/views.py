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
        with open(file_path, 'rb') as file:
            response = HttpResponse(file.read(), content_type='application/octet-stream')
            response['Content-Disposition'] = f'attachment; filename="{filename}"'
            return response
    else:
        raise Http404("File not found.")
    
def download_converted_file(request, filename):
    # Đường dẫn tới thư mục chứa file
    file_path = os.path.join(settings.MEDIA_ROOT, 'pdfconvert', filename)
    if os.path.exists(file_path):
        with open(file_path, 'rb') as file:
            response = HttpResponse(file.read(), content_type='application/octet-stream')
            response['Content-Disposition'] = f'attachment; filename="{filename}"'
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