1. cài thư viện
pip install django
pip install mysqlclient
pip install requests
pip install djangorestframework
python -m pip install Pillow
pip install pytesseract pdf2image reportlab pillow
pip install ocrmypdf
pip install PyPDF2 # xu ly lay text tu pdf
python -m pip install django-cors-headers
pip install django-oauth-toolkit
pip install easyocr

2. chỉnh sửa  database trong setting
'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django', # thay đổi
        'USER': 'root',
        'PASSWORD': 'root', # thay đổi
        'HOST': 'localhost',
        'PORT': '3306', # thay đổi nếu đổi port
    }

3. Tạo và ánh xạ cơ sở dữ liệu từ model
python manage.py migrate
python manage.py makemigrations
tạo superuser
python manage.py createsuperuser

5. run server
python manage.py runserver 8000

4. Tạo token đăng nhập
Vào http://127.0.0.1:8000/o/applications
tạo client id và client secret
với 
    Client type: confidential
    Authorization grant type: password-based

5. Lấy được chuỗi client id, client secret 
copy vào client id và client secret user.views.LoginUser