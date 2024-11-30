from rest_framework import generics, status
from rest_framework.response import Response
from database.models import Data
from database.serializers import DataSerializer
from django.views import View
import ocrmypdf
import os
from PyPDF2 import PdfReader
from django.http import JsonResponse
import requests
from django.views.decorators.csrf import csrf_exempt

# Upload PDF View
"""class UploadPDFView(generics.CreateAPIView):
    queryset = PDFFile.objects.all()
    serializer_class = PDFFileSerializer
"""
        
# Convert PDF View (update logic)
class ConvertPDFView(generics.UpdateAPIView):
    queryset = Data.objects.filter(active = True, convert=False, type = 'application/pdf')
    serializer_class = DataSerializer
    
    #trich xuat van ban
    def extract_text_from_pdf(self, pdf_path):
            """Hàm trích xuất văn bản từ file PDF"""
            try:
                reader = PdfReader(pdf_path)
                text = ""
                for page in reader.pages:
                    text += page.extract_text()
                return text
            except Exception as e:
                raise ValueError(f"Lỗi khi trích xuất văn bản: {str(e)}")
            
    def update(self, request, *args, **kwargs):
        pdf_file = self.get_object()
        input_path = pdf_file.original_file.path

        output_filename = f'converted_{pdf_file.name}'
        if not output_filename.endswith('.pdf'):
            output_filename += '.pdf'

        output_path = os.path.join('media/pdfconvert/', output_filename)

        try:
            # Kiem tra va tao thu muc neu chua ton tai
            os.makedirs(os.path.dirname(output_path), exist_ok=True)

            # Run OCR de chuyen doi file
            try:
                ocrmypdf.ocr(input_path, output_path, force_ocr=True, lang="vie")
            except ocrmypdf.exceptions.PriorOcrFoundError:
                return Response({"error": "PDF da co du lieu OCR."}, status=status.HTTP_400_BAD_REQUEST)
            except ocrmypdf.exceptions.MissingDependencyError:
                return Response({"error": "Thieu phu thuoc can thiet cho OCRmyPDF."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            except ocrmypdf.exceptions.InputFileError:
                return Response({"error": "Dinh dang file dau vao khong hop le hoac khong duoc ho tro."}, status=status.HTTP_400_BAD_REQUEST)
            except ocrmypdf.exceptions.OutputFileAccessError:
                return Response({"error": "Khong the ghi file dau ra. Kiem tra quyen truy cap file."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            except ocrmypdf.exceptions.SubprocessOutputError as e:
                return Response({"error": f"Loi xay ra trong qua trinh OCR: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            except Exception as e:
                return Response({"error": f"Loi khong mong muon xay ra trong qua trinh OCR: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            # Cap nhat file da duoc convert
            try:
                # Trích xuất văn bản từ file đã OCR
                extracted_text = self.extract_text_from_pdf(output_path)
                # luu database
                pdf_file.converted_file.name = f'pdfconvert/{output_filename}'
                pdf_file.text_content = extracted_text  # Lưu nội dung vào TextField
                pdf_file.convert = True
                pdf_file.save()
            except Exception as e:
                return Response({"error": f"Loi cap nhat co so du lieu: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            return Response({"message": "Chuyen doi file thanh cong"}, status=status.HTTP_200_OK)

        except FileNotFoundError:
            return Response({"error": "Khong tim thay file dau vao."}, status=status.HTTP_404_NOT_FOUND)
        except PermissionError:
            return Response({"error": "Khong du quyen truy cap file."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except OSError as e:
            return Response({"error": f"Loi he thong: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except Exception as e:
            return Response({"error": f"Loi khong mong muon xay ra: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@csrf_exempt        
#class ConvertAllData(View):
def convert_all_pdf(request):
    # URL của API đầu tiên để lấy danh sách dữ liệu
    url_get = "http://127.0.0.1:8000/database/data/notconvert/"

    try:
        # Gửi yêu cầu GET để lấy dữ liệu
        response_get = requests.get(url_get)

        if response_get.status_code == 200:
            data = response_get.json()  # Chuyển đổi dữ liệu JSON thành danh sách Python

            # Duyệt qua từng item và lấy id
            for item in data:
                id_value = item['id']

                # URL API thứ hai để thực hiện PUT
                url_put = f"http://127.0.0.1:8000/pdf_convert/convert/{id_value}/"

                # Gửi yêu cầu PUT tới API thứ hai
                response_put = requests.put(url_put)

                # Kiểm tra kết quả của yêu cầu PUT
                if response_put.status_code == 200:
                    print(f"Convert Data có ID {id_value} thành công")
                else:
                    print(f"Lỗi khi gửi PUT cho ID {id_value}: {response_put.status_code}")
            
            return JsonResponse({"status": "success", "message": "Tất cả đã được convert"})

        else:
            return JsonResponse({"status": "error", "message": f"Failed to fetch data: {response_get.status_code}"})

    except requests.exceptions.RequestException as e:
        return JsonResponse({"status": "error", "message": str(e)})
        
"""
# Get Converted PDF View
class GetConvertedPDFView(generics.RetrieveAPIView):
    queryset = PDFFile.objects.all()
    serializer_class = PDFFileSerializer

    def get(self, request, *args, **kwargs):
        pdf_file = self.get_object()
        if pdf_file.converted_file:
            response = Response()
            # Lấy tên file từ đường dẫn
            filename = pdf_file.converted_file.name.split("/")[-1]
            # Thêm .pdf nếu tên file chưa có
            if not filename.endswith('.pdf'):
                filename += '.pdf'
            response['Content-Disposition'] = f'attachment; filename="{filename}"'
            response['X-Accel-Redirect'] = f'/media/{pdf_file.converted_file.name}'
            return response
        return Response({"error": "Converted file not available"}, status=status.HTTP_404_NOT_FOUND)
"""