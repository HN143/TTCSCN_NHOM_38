from django.urls import path
from .views import  ConvertPDFView, ConvertDocxView, ConvertOctetView
from . import views

urlpatterns = [
    #path('upload/', UploadPDFView.as_view(), name='upload_pdf'),
    path('convert/all/', views.convert_files, name='convert_all_pdf'),
    path('convertpdf/<int:pk>/', ConvertPDFView.as_view(), name='convert_pdf_id'),
    path('convertdocx/<int:pk>/', ConvertDocxView.as_view(), name='convert_docx_id'),
    path('convertoctet/<int:pk>/', ConvertOctetView.as_view(), name='convert_octet_id'),
    #path('convert/docx/', views.upload_and_print),
    #path('get/<int:pk>/', GetConvertedPDFView.as_view(), name='get_converted_pdf'),
]