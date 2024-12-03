from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver

# Create your models here.
class File(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    preview_file = models.URLField(blank=True, null=True, max_length=512)
    original_file = models.FileField(upload_to='nguoidung/original_file/', blank=True, null=True, max_length=512)
    converted_pdf = models.FileField(upload_to='nguoidung/pdf/', blank=True, null=True, max_length=512)
    converted_doc = models.FileField(upload_to='nguoidung/doc/', blank=True, null=True, max_length=512)

    def save(self, *args, **kwargs):
        # Nếu trường `name` trống, tự động lấy cả tên file và phần mở rộng từ `original_file`
        if not self.name and self.original_file:
            self.name = self.original_file.name.split('/')[-1]  # Chỉ lấy tên file (không bao gồm đường dẫn)
        super().save(*args, **kwargs)
        
    def __str__(self):
        return self.name
@receiver(post_delete, sender=File)
def delete_files_on_model_delete(sender, instance, **kwargs):
    if instance.original_file:
        instance.original_file.delete(save = False)
    if instance.converted_pdf:
        instance.converted_pdf.delete(save = False)
    if instance.converted_doc:
        instance.converted_doc.delete(save = False)