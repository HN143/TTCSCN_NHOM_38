from rest_framework.serializers import ModelSerializer
from .models import User

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields =['id','username', 'password','is_staff', 'role','email','first_name','last_name','is_active']

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user
    
    def update(self, instance, validated_data):
        # Nếu có trường password trong validated_data, băm password
        if 'password' in validated_data:
            instance.set_password(validated_data['password'])
            validated_data.pop('password')  # Xóa password khỏi validated_data để tránh overwrite trực tiếp
        
        # Cập nhật các trường khác
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        
        instance.save()
        return instance