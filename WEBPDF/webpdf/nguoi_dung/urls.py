from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import FileViewSet
from . import views

# Tạo router để quản lý các endpoint
router = DefaultRouter()
router.register('files', FileViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('download_pdf_converted/<str:filename>',views.download_pdf_file),
    path('download_docx_converted/<str:filename>',views.download_docx_file),
    path('upload_and_get_pdf/',views.upload_and_get_pdf),
    path('upload_and_get_docx/',views.upload_and_get_docx),
]
