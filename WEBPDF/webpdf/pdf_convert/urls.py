from django.urls import path
from .views import  ConvertPDFView
from . import views

urlpatterns = [
    #path('upload/', UploadPDFView.as_view(), name='upload_pdf'),
    path('convert/<int:pk>/', ConvertPDFView.as_view(), name='convert_pdf_id'),
    path('convert/all/', views.convert_all_pdf, name='convert_all_pdf'),
    #path('get/<int:pk>/', GetConvertedPDFView.as_view(), name='get_converted_pdf'),
]