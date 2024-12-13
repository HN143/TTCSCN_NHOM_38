from rest_framework import serializers
from .models import VanBan
from .models import Data
from .models import DieuKienTai
from datetime import datetime

class VanBanSerializer(serializers.ModelSerializer):
    class Meta:
        model = VanBan
        fields = '__all__' 

class DataSerializer(serializers.ModelSerializer):
    class Meta:
        model = Data
        fields = '__all__'  # Bao gồm tất cả các trường của model

class DieuKienTaiSerializer(serializers.ModelSerializer):
    ngay_tai = serializers.IntegerField(read_only=True)  # Hiển thị timestamp
    ngay_tai_display = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = DieuKienTai
        fields = '__all__'

    def create(self, validated_data):
        # Xử lý timestamp ở đây
        validated_data['ngay_tai'] = int(
            datetime.strptime(validated_data.pop('ngay_tai'), "%d/%m/%Y").timestamp() * 1000
        )
        return super().create(validated_data)

    def update(self, instance, validated_data):
        if 'ngay_tai' in validated_data:
            validated_data['ngay_tai'] = int(
                datetime.strptime(validated_data.pop('ngay_tai'), "%d/%m/%Y").timestamp() * 1000
            )
        return super().update(instance, validated_data)

    def ngay_tai_display(self, obj):
        # Chuyển đổi từ milliseconds sang ngày
        if obj.ngay_tai:
            return datetime.fromtimestamp(obj.ngay_tai / 1000).strftime("%d/%m/%Y")
        return None
