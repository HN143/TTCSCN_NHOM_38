from django.urls import path, include
from .views import VanBanListCreateView, VanBanDetailView, DataListCreateView, DataDetailView, DieuKienTaiListCreateView, DieuKienTaiDetailView, DataUpdateCleanView
from .views import DataPdfNotConvert, FilterDataByDateView, DataDocxNotConvert, DataOctetNotConvert
from . import views
from rest_framework.routers import DefaultRouter
from .views import DataViewSet
router = DefaultRouter()
router.register('datas', DataViewSet)
from .views import DieuKienTaiViewSet
router.register('dieukientais',DieuKienTaiViewSet)
from .views import VanBanViewSet
router.register('vanbans',VanBanViewSet)

urlpatterns = [
    # Định tuyến cho VanBan
    path('vanban/', VanBanListCreateView.as_view(), name='vanban-list-create'),
    # GET /vanban/: Lấy danh sách tất cả các VanBan, POST /vanban/: Thêm một VanBan
    
    path('vanban/<int:pk>/', VanBanDetailView.as_view(), name='vanban-detail'),
    # GET /vanban/<id>/: Lấy thông tin chi tiết của một VanBan, PUT: Cập nhật toàn bộ thông tin
    # PATCH: Cập nhật một phần thông tin, DELETE

    # Định tuyến cho Data
    path('', include(router.urls)),
    path('data/', DataListCreateView.as_view(), name='data-list-create'),
    path('dataclean/', DataUpdateCleanView.as_view(), name='data-list-create'),
    path('data/pdfnotconvert/', DataPdfNotConvert.as_view(), name='data-pdf-not-convert'),
    path('data/docxnotconvert/', DataDocxNotConvert.as_view(), name='data-docx-not-convert'),
    path('data/octetnotconvert/', DataOctetNotConvert.as_view(), name='data-octet-not-convert'),
    path('data/<int:pk>/', DataDetailView.as_view(), name='data-detail'),
    path('databydate/', FilterDataByDateView.as_view(), name='data-by-date'),

    path('dieukientai/', DieuKienTaiListCreateView.as_view(), name='dieukientai-list-create'),
    path('dieukientai/<int:pk>/', DieuKienTaiDetailView.as_view(), name='dieukientai-detail'),

    path('download_original/<str:filename>', views.download_original_file, name='download_o_file'),
    path('download_converted/<str:filename>', views.download_converted_file, name='download_c_file'),

    path('update_original_links/<int:data_id>/', views.update_data_download_links_original, name='update_original_links'),
    path('update_converted_links/<int:data_id>/', views.update_data_download_links_converted, name='update_converted_links'),
]
