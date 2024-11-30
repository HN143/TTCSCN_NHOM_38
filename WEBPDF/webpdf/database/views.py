from rest_framework import generics
from .models import VanBan
from .serializers import VanBanSerializer
from .models import Data
from .serializers import DataSerializer
from .models import DieuKienTai
from .serializers import DieuKienTaiSerializer

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