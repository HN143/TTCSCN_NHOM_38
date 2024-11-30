from django.urls import path
from .views import VanBanListCreateView, VanBanDetailView, DataListCreateView, DataDetailView, DieuKienTaiListCreateView, DieuKienTaiDetailView
from .views import DataPdfNotConvert
from . import views
urlpatterns = [
    # Định tuyến cho VanBan
    path('vanban/', VanBanListCreateView.as_view(), name='vanban-list-create'),
    # GET /vanban/: Lấy danh sách tất cả các VanBan, POST /vanban/: Thêm một VanBan
    
    path('vanban/<int:pk>/', VanBanDetailView.as_view(), name='vanban-detail'),
    # GET /vanban/<id>/: Lấy thông tin chi tiết của một VanBan, PUT: Cập nhật toàn bộ thông tin
    # PATCH: Cập nhật một phần thông tin, DELETE

    # Định tuyến cho Data
    path('data/', DataListCreateView.as_view(), name='data-list-create'),
    path('data/notconvert/', DataPdfNotConvert.as_view(), name='data-not-convert'),
    path('data/<int:pk>/', DataDetailView.as_view(), name='data-detail'),

    path('dieukientai/', DieuKienTaiListCreateView.as_view(), name='dieukientai-list-create'),
    path('dieukientai/<int:pk>/', DieuKienTaiDetailView.as_view(), name='dieukientai-detail'),

    path('download_original/<str:filename>', views.download_original_file, name='download_o_file'),
    path('download_converted/<str:filename>', views.download_converted_file, name='download_c_file'),

    path('update_original_links/<int:data_id>/', views.update_data_download_links_original, name='update_original_links'),
    path('update_converted_links/<int:data_id>/', views.update_data_download_links_converted, name='update_converted_links'),
]
