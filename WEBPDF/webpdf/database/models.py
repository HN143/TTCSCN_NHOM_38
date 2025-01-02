from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver

# Create your models here.
class VanBan(models.Model):
    # Các trường của VanBan
    ngay_tao =  models.BigIntegerField(null= True, blank= True) # "createDate" của Data chính
    ngay_ban_hanh = models.BigIntegerField(null= True, blank= True)  # "dateIssued"
    id_api = models.IntegerField(unique=True,null= True, blank= True)  # "id"
    so_ky_hieu = models.CharField(max_length=255,null= True, blank= True)  # "numberOrSign"
    loai_van_ban = models.CharField(max_length=100,null= True, blank= True)  # "docTypeName"
    nguoi_tao = models.CharField(max_length=100,null= True, blank= True)  # "personEnterName"
    trich_yeu = models.TextField(null= True, blank= True)  # "preview"
    don_vi_soan_thao = models.CharField(max_length=255,null= True, blank= True)  # "orgCreateName"
    so_van_ban = models.CharField(max_length=255,null= True, blank= True)  # "bookName"
    do_mat = models.CharField(max_length=50,null= True, blank= True)  # "docSecurityName"
    do_khan = models.CharField(max_length=50,null= True, blank= True)  # "docUrgentName"
    nguoi_ky = models.CharField(max_length=255,null= True, blank= True)  # "listSignersName"
    so_luong_data = models.IntegerField(default=0)  
    active = models.BooleanField(default=True)  

    def __str__(self):
        return f"{self.so_ky_hieu} - {self.loai_van_ban}"

@receiver(post_delete, sender=VanBan)
def delete_related_data_files(sender, instance, **kwargs):
    # Lấy tất cả các đối tượng Data liên quan đến VanBan bị xóa
    related_data = instance.data.all()
    
    for data in related_data:
        if data.original_file:
            data.original_file.delete(save=False)
        if data.converted_file:
            data.converted_file.delete(save=False)

class Data(models.Model):
    # Trường liên kết với VanBan
    van_ban = models.ForeignKey(VanBan, on_delete=models.CASCADE, related_name='data',null= True, blank= True)  
    # Các trường của Data
    name = models.CharField(max_length=255,null= True, blank= True)  # "displayName"
    type = models.CharField(max_length=50,null= True, blank= True)  # "type"
    original_file = models.FileField(upload_to='pdfdata/', blank=True, null=True, max_length=512)
    converted_file = models.FileField(upload_to='pdfconvert/', blank=True, null=True, max_length=512)
    text_content = models.TextField(null= True, blank= True)  # Nội dung text
    active = models.BooleanField(default=True)  
    convert = models.BooleanField(default=False)  
    clean = models.BooleanField(default=False)  
    data_chinh = models.BooleanField(default=False)
    download_original_file = models.URLField(blank=True, null=True, max_length=512)
    download_converted_file = models.URLField(blank=True, null=True, max_length=512)
    def __str__(self):
        return self.name

@receiver(post_delete, sender=Data)
def delete_files_on_model_delete(sender, instance, **kwargs):
    if instance.original_file:
        instance.original_file.delete(save = False)
    if instance.converted_file:
        instance.converted_file.delete(save = False)

class DieuKienTai(models.Model):
    data = models.OneToOneField(
        Data,
        on_delete= models.CASCADE,
        related_name= 'profile',
        null= True,
        blank= True
    )
    ngay_tai =  models.BigIntegerField(null= True, blank= True)