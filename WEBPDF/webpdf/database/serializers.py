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
    ngay_bat_dau = serializers.IntegerField(read_only=True)  # Hiển thị timestamp
    ngay_ket_thuc = serializers.IntegerField(read_only=True)  # Hiển thị timestamp
    ngay_bat_dau_display = serializers.SerializerMethodField(read_only=True)
    ngay_ket_thuc_display = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = DieuKienTai
        fields = '__all__'

    def create(self, validated_data):
        # Xử lý timestamp ở đây
        validated_data['ngay_bat_dau'] = int(
            datetime.strptime(validated_data.pop('ngay_bat_dau'), "%d/%m/%Y").timestamp() * 1000
        )
        validated_data['ngay_ket_thuc'] = int(
            datetime.strptime(validated_data.pop('ngay_ket_thuc'), "%d/%m/%Y").timestamp() * 1000
        )
        return super().create(validated_data)

    def update(self, instance, validated_data):
        if 'ngay_bat_dau' in validated_data:
            validated_data['ngay_bat_dau'] = int(
                datetime.strptime(validated_data.pop('ngay_bat_dau'), "%d/%m/%Y").timestamp() * 1000
            )
        if 'ngay_ket_thuc' in validated_data:
            validated_data['ngay_ket_thuc'] = int(
                datetime.strptime(validated_data.pop('ngay_ket_thuc'), "%d/%m/%Y").timestamp() * 1000
            )
        return super().update(instance, validated_data)

    def get_ngay_bat_dau_display(self, obj):
        # Chuyển đổi từ milliseconds sang ngày
        if obj.ngay_bat_dau:
            return datetime.fromtimestamp(obj.ngay_bat_dau / 1000).strftime("%d/%m/%Y")
        return None

    def get_ngay_ket_thuc_display(self, obj):
        if obj.ngay_ket_thuc:
            return datetime.fromtimestamp(obj.ngay_ket_thuc / 1000).strftime("%d/%m/%Y")
        return None
