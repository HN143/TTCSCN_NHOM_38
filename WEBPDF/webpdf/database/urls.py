from django.urls import path
from .views import VanBanListCreateView, VanBanDetailView, DataListCreateView, DataDetailView, DieuKienTaiListCreateView, DieuKienTaiDetailView
from .views import DataPdfNotConvert
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
]
