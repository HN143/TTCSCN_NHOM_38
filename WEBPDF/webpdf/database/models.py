from django.db import models

# Create your models here.
class VanBan(models.Model):
    # Các trường của VanBan
    ngay_tao =  models.BigIntegerField(null= True, blank= True) # "createDate" của Data chính
    ngay_ban_hanh = models.BigIntegerField()  # "dateIssued"
    id_api = models.IntegerField(unique=True)  # "id"
    so_ky_hieu = models.CharField(max_length=255)  # "numberOrSign"
    loai_van_ban = models.CharField(max_length=100)  # "docTypeName"
    nguoi_tao = models.CharField(max_length=100)  # "personEnterName"
    trich_yeu = models.TextField()  # "preview"
    don_vi_soan_thao = models.CharField(max_length=255)  # "orgCreateName"
    so_van_ban = models.CharField(max_length=255)  # "bookName"
    do_mat = models.CharField(max_length=50)  # "docSecurityName"
    do_khan = models.CharField(max_length=50)  # "docUrgentName"
    nguoi_ky = models.CharField(max_length=255)  # "listSignersName"
    so_luong_data = models.IntegerField(default=0)  
    active = models.BooleanField(default=True)  

    def __str__(self):
        return f"{self.so_ky_hieu} - {self.loai_van_ban}"


class Data(models.Model):
    # Trường liên kết với VanBan
    van_ban = models.ForeignKey(VanBan, on_delete=models.CASCADE, related_name='data')  
    # Các trường của Data
    name = models.CharField(max_length=255)  # "displayName"
    type = models.CharField(max_length=50)  # "type"
    original_file = models.FileField(upload_to='pdfdata/', blank=True, null=True, max_length=512)
    converted_file = models.FileField(upload_to='pdfconvert/', blank=True, null=True, max_length=512)
    text_content = models.TextField()  # Nội dung text
    active = models.BooleanField(default=True)  
    convert = models.BooleanField(default=False)  
    clean = models.BooleanField(default=False)  
    data_chinh = models.BooleanField(default=False)
    download_original_file = models.URLField(blank=True, null=True, max_length=512)
    download_converted_file = models.URLField(blank=True, null=True, max_length=512)
    def __str__(self):
        return self.name

class DieuKienTai(models.Model):
    ngay_bat_dau =  models.BigIntegerField(null= True, blank= True)
    ngay_ket_thuc =  models.BigIntegerField(null= True, blank= True)