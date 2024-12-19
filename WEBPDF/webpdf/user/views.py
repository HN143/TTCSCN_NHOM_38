from rest_framework import viewsets, generics, permissions, status
from .models import User
from .serializers import UserSerializer
from rest_framework.response import Response
import requests
from django.shortcuts import get_object_or_404
import json
# Create your views here.
# user
class IsSelf(permissions.BasePermission):
    #Custom permission to only allow users to access their own data.
    def has_object_permission(self, request, view, obj):
        # neu la superuser thi luon cho phep
        if request.user.is_superuser:
            return True
        return obj == request.user  # Chỉ cho phép truy cập nếu obj là chính user đang đăng nhập

class IsStaff(permissions.BasePermission):
    """
    Custom permission để kiểm tra user có is_staff = true khong.
    """
    def has_permission(self, request, view):
        # Kiểm tra nếu user đã đăng nhập và có is_staff = true
        return request.user.is_authenticated and request.user.is_staff == True
    
class IsSuperUser(permissions.BasePermission):
    """
    Custom permission để kiểm tra user có is_superuser = true khong.
    """
    def has_permission(self, request, view):
        # Kiểm tra nếu user đã đăng nhập và có is_staff = true
        return request.user.is_authenticated and request.user.is_superuser == True
    
class UserViewSet(viewsets.ViewSet,
                  generics.CreateAPIView,
                  generics.RetrieveAPIView,
                  generics.ListAPIView,
                  generics.DestroyAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer

    def get_permissions(self):
        """
        Quyền truy cập được thiết lập theo từng action:
        - is_superuser có toàn quyền.
        - is_staff chỉ được truy cập tài khoản của chính họ.
        """
        if self.action in ['list', 'create', 'destroy']:
            # Chỉ cho phép is_superuser thực hiện các hành động này
            return [permissions.IsAuthenticated(), IsSuperUser()]
        elif self.action == 'retrieve':
            # is_staff chỉ có thể xem thông tin của chính họ
            return [permissions.IsAuthenticated(), IsSelf()]
        return [permissions.AllowAny()]

    def retrieve(self, request, *args, **kwargs):
        """
        Lấy thông tin người dùng từ URL (qua pk) và kiểm tra quyền truy cập.
        """
        user = get_object_or_404(User, pk=kwargs.get('pk'))

        # Kiểm tra quyền truy cập
        self.check_object_permissions(request, user)

        # Nếu hợp lệ, trả về thông tin user
        serializer = self.get_serializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        """
        Trả về danh sách người dùng. Chỉ is_superuser có quyền truy cập.
        """
        self.check_permissions(request)
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        """
        Xóa người dùng. Chỉ is_superuser có quyền thực hiện.
        """
        user = get_object_or_404(User, pk=kwargs.get('pk'))
        self.check_permissions(request)
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class LoginUser(generics.GenericAPIView):
    """
    API for user login. Accepts username and password,
    automatically adds client_id and client_secret.
    """
    def post(self, request, *args, **kwargs):
        # Lấy dữ liệu username và password từ request.data
        username = request.data.get('username')
        password = request.data.get('password')

        # Kiểm tra xem username và password có đủ không
        if not username or not password:
            return Response(
                {"error": "Missing username or password."},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Lấy client_id và client_secret từ settings

<<<<<<< HEAD
        client_id = 'mk3yLaK165X4WQScKvuoODCkoioF40kJuthZnpGD'
        client_secret = 'kZNgtp2SJsdRUmKnfqoRVh7dqtekTvZtzOlrQi84ViIVGdA7gn7dFBRgNKMKQOowLAuj0qbBt2dIQRFN1mrVGjPzGBm9IzaLFQKEY5a2cnVZ0wPyvBq7IpOtp9mwjDDi'
=======
        client_id = 'ihaRHAOQ5qRy9DD2Y3xrxiUiKbaaxLMDeMNBP6id'
        client_secret = 't2taN99GjWXLcJwWCmN2reXA6RTO9YtQSr0ZFGWcTuim4G3A2spVOWMcZHk05Q5ipORCJkp9eZDljBkNJw7QGMSlwKd3Uqil8NDvCblIy2vPq8gqsTFq4KdkhyZHusmh'
>>>>>>> a1ff520a6ba52d2778ea4daec2a1e83b0f1d329a


        if not client_id or not client_secret:
            return Response(
                {"error": "OAuth2 client_id or client_secret is not configured."},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

        # Endpoint của OAuth2 để lấy token
        token_url = 'http://127.0.0.1:8000/o/token/'

        # Payload gửi tới endpoint OAuth2
        payload = {
            'grant_type': 'password',
            'username': username,
            'password': password,
            'client_id': client_id,
            'client_secret': client_secret,
        }

        # Gửi yêu cầu tới /o/token/
        try:
            response = requests.post(token_url, data=payload)
            if response.status_code == 200:
                # Trả về token nếu thành công
                # Lấy thông tin token
                token_data = response.json()

                # Lấy thông tin từ model User
                try:
                    user = User.objects.get(username=username)
                    is_staff = user.is_staff
                    user_id = user.id  # Lấy thêm trường id của user
                    # Thêm is_staff và id vào token_data
                    token_data['is_staff'] = is_staff
                    token_data['id'] = user_id
                except User.DoesNotExist:
                    return Response(
                        {"error": "User does not exist."},
                        status=status.HTTP_404_NOT_FOUND
                    )

                # Trả về token và is_staff nếu thành công
                return Response(token_data, status=status.HTTP_200_OK)
            else:
                # Trả về lỗi nếu thông tin đăng nhập không đúng
                return Response(
                    {
                        "error": "Invalid credentials or unauthorized.",
                        "details": response.json(),
                    },
                    status=response.status_code
                )
        except requests.exceptions.RequestException as e:
            # Xử lý lỗi khi không kết nối được tới OAuth2 server
            return Response(
                {"error": "Failed to connect to the token endpoint.", "details": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )