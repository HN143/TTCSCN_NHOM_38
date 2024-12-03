from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import FileViewSet

# Tạo router để quản lý các endpoint
router = DefaultRouter()
router.register('files', FileViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
