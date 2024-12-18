import os
from django.conf import settings
from django.shortcuts import render
import requests
from django.http import HttpResponse
from database.models import VanBan, Data, DieuKienTai
import logging
import urllib3
from django.http import JsonResponse
import json
from datetime import datetime
import urllib.parse
from urllib.parse import quote
from rest_framework.decorators import api_view, permission_classes
from user.views import IsStaff

# Create your views here.
def pdfdata(request):
    return render(request, 'pdfdata/pdfdata.html')

#Lam tron timestamp 00:00:00
def timestamp_to_start_day(times):
    timestamp = times/1000
    date_obj = datetime.fromtimestamp(timestamp)
    start_day =datetime(date_obj.year, date_obj.month, date_obj.day)
    return int(start_day.timestamp()*1000)

#timestamp to day
def timestamp_to_day(times):
    date_format ="%d/%m/%Y"
    timestamp = times/1000
    date_obj = datetime.fromtimestamp(timestamp)
    return date_obj.strftime(date_format)

# Hàm đăng nhập và lấy token
def login_and_get_token():
    user_name = urllib.parse.quote('ldthuan@bcy.gov.vn')
    password = urllib.parse.quote('123456')
    login_url = f'https://backend8181.bcy.gov.vn/api/users/login?userName={user_name}&password={password}'
    headers = {
        #'Content-Type': 'application/x-www-form-urlencoded',
        #'User-Agent': 'PostmanRuntime/7.42.0',
        'Accept': '*/*',
        'Connection': 'keep-alive'
    }
    try:
        response = requests.post(login_url, headers=headers, verify=False)
        response.raise_for_status()
        return response.json()['data']['tokenInfo']['accessToken']
    except requests.exceptions.RequestException as e:
        logging.error("Lỗi khi kết nối: %s", e)
        raise

# Hàm tải tài liệu theo từng trang-> lấy json của api ngoài
def download_documents(headers, page, size):
    base_url = 'https://backend8181.bcy.gov.vn/api/document_out/knowable'
    params = {
        'page': page,
        'sortBy': '',
        'direction': 'DESC',
        'size': size,
        'read': False
    }
    try:
        response = requests.get(base_url, headers=headers, params=params, verify=False)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        logging.error("Lỗi khi lấy tài liệu tại trang %d: %s", page, e)
        raise

#Hàm lấy json của api trong
def download_json_trong(headers, id_data):
    base_url = f'https://backend8181.bcy.gov.vn/api/document_out/getDetailToShow/{id_data}'

    try:
        # Gửi yêu cầu GET tới API
        response = requests.get(base_url, headers=headers, verify=False)
        response.raise_for_status()  # Kiểm tra lỗi HTTP

        # Trả về JSON từ phản hồi
        return response.json()
    except requests.exceptions.RequestException as e:
        logging.error("Lỗi khi lấy chi tiết tài liệu với ID %s: %s", id_data, e)
        raise
# Hàm tải và lưu file
def save_file(headers, name, download_url, id_data, van_ban, type, data_chinh):
    try:
        # Gửi yêu cầu tải file
        response = requests.get(download_url, headers=headers, verify=False)
        response.raise_for_status()

        if response.status_code == 200:
            clean_name = name.split('__')[0]  # Làm sạch tên file

            # Xây dựng đường dẫn đến thư mục đích `pdfdata`
            pdfdata_dir = os.path.join(settings.MEDIA_ROOT, 'pdfdata')
            if not os.path.exists(pdfdata_dir):  # Kiểm tra nếu thư mục chưa tồn tại
                os.makedirs(pdfdata_dir)  # Tạo thư mục

            # Đường dẫn tương đối của file
            file_path_data = os.path.relpath(os.path.join(pdfdata_dir, clean_name), settings.MEDIA_ROOT)
            file_path = os.path.join(pdfdata_dir, clean_name)
            # Lưu file vào hệ thống
            with open(file_path, 'wb') as file:
                file.write(response.content)

            # Lưu thông tin Data vào cơ sở dữ liệu
            encoded_file_name = quote(clean_name)
            download_url = f"http://127.0.0.1:8000/database/download_original/{encoded_file_name}"
            data= Data.objects.create(van_ban = van_ban, name = clean_name, type = type, original_file = file_path_data, data_chinh = data_chinh, download_original_file =download_url)
            #PDFFile.objects.create(name=clean_name, pdf_url=download_url, file_path=file_path)
            return data
            logging.info("Tải thành công và lưu file: %s", clean_name)
    except requests.exceptions.RequestException as e:
        logging.error("Lỗi khi tải file %s: %s", name, e)
    except Exception as e:
        logging.error("Lỗi không xác định khi lưu file %s: %s", name, e)
#Tìm kiếm nhị phân trong ngày tải
def is_ngay_tai(ngay_tai_sorted, ngayTai):
    """
    Thực hiện tìm kiếm nhị phân trong danh sách đã sắp xếp.
    :param ngay_tai_sorted: Danh sách các giá trị đã sắp xếp.
    :param ngayTai: Giá trị cần tìm.
    :return: True nếu tìm thấy, False nếu không tìm thấy.
    """
    left = 0# ngay_tai[left]= ngay
    right = len(ngay_tai_sorted) - 1

    while left <= right:
        mid = (left + right) // 2  # Tìm vị trí giữa
        if ngay_tai_sorted[mid] == ngayTai:
            return True  # Tìm thấy
        elif ngay_tai_sorted[mid] < ngayTai:
            left = mid + 1  # Dịch sang nửa phải
        else:
            right = mid - 1  # Dịch sang nửa trái

    return False  # Không tìm thấy
# Hàm chính
@api_view(['POST'])
@permission_classes([IsStaff])  # Áp dụng phân quyền
def download_all_pdf(request):
    if request.method != 'POST':
        return HttpResponse("Invalid request", status=405)

    try:
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

        data = request.data
        s_date = data.get('startDate')
        s_time =datetime.strptime(s_date, '%d/%m/%Y')

        e_date = data.get('endDate')
        e_time = datetime.strptime(e_date, '%d/%m/%Y')

        start_date = int(s_time.timestamp() * 1000)
        end_date = int(e_time.timestamp() * 1000)

        if not start_date or not end_date:
            return JsonResponse({"error": "Missing startDate or endDate"}, status=400)
        if start_date > end_date:
            return JsonResponse({"error": "Ngày bắt đầu phải nhỏ hơn ngày kết thúc"}, status=400)

        access_token = login_and_get_token()
        headers = {
            'Authorization': f'Bearer {access_token}',
            'Content-Type': 'application/json'
        }
        print("dang nhap thanh cong")
        page = 1
        size = 1

        while True:
            data = download_documents(headers, page, size)

            if not data.get('data') or not data['data'].get('content'):
                logging.info("Không còn dữ liệu ở trang %d. Kết thúc.", page)
                break
            print("lấy json api ngoài thành công")
            logging.info("Đang xử lý trang %d với %d tài liệu.", page, len(data['data']['content']))
            # kiểm tra ngày
            content = data['data']['content']

            if isinstance(content, list):
                for item in content:
                    id_data = item.get('id')
                    # Thực hiện xử lý ở đây
            else:
                id_data = content.get('id')
            #dateIssued = data['data']['content']['dateIssued']
            
            if isinstance(content, list):
                for item in content:
                    if isinstance(item, dict):  # Đảm bảo item là từ điển
                        attachments = item.get('attachments', [])
                        if isinstance(attachments, list) and attachments:
                            createDate = attachments[0].get('createDate')
                        else:
                            createDate = None
                            print("LỖI không lấy được ngày")
                    else:
                        print("LỖI: Phần tử trong content không phải từ điển:", item)
            else:
                if isinstance(content, dict):  # Đảm bảo content là từ điển
                    attachments = content.get('attachments', [])
                    if isinstance(attachments, list) and attachments:
                        createDate = attachments[0].get('createDate')
                    else:
                        createDate = None
                        print("LỖI không lấy được ngày")
                else:
                    print("LỖI: content không phải là từ điển hoặc danh sách.")
            times = timestamp_to_start_day(createDate)
            if times < start_date:
                break
            if times > end_date:
                page += 1
                print("Data khong hop le, chuyen trang tiep...")
                continue

            # Lấy tất cả các giá trị ngay_tai và sắp xếp từ bé đến lớn
            ngay_tai_sorted = DieuKienTai.objects.order_by('ngay_tai').values_list('ngay_tai', flat=True)

            dieuKien = is_ngay_tai(ngay_tai_sorted, createDate)
            print(dieuKien)
            if dieuKien: # nếu tồn tại ngày continue
                print("Data khong hop le, chuyen trang tiep")
                page += 1
                continue
            else:
                print("Data hop le, lay Data...")
            #Luu điều kiện
            dieu_kien_tai = DieuKienTai.objects.create(ngay_tai = createDate)
            #id_data = data['data']['content']['id']
            # tạo database VanBan
            dataVanBan = download_json_trong(headers, id_data)
            dataVanBan_data =dataVanBan['data']
            print("lay api trong thanh công")
            van_ban = VanBan.objects.create(
                ngay_tao = times,
                ngay_ban_hanh = dataVanBan_data.get('dateIssued'),
                id_api = dataVanBan_data.get('id'),
                so_ky_hieu = dataVanBan_data.get('numberOrSign'),
                loai_van_ban = dataVanBan_data.get('docTypeName'),
                nguoi_tao = dataVanBan_data.get('personEnterName'),
                trich_yeu = dataVanBan_data.get('preview'),
                don_vi_soan_thao = dataVanBan_data.get('orgCreateName'),
                so_van_ban = dataVanBan_data.get('bookName'),
                do_mat = dataVanBan_data.get('docSecurityName'),
                do_khan = dataVanBan_data.get('docUrgentName'),
                nguoi_ky = dataVanBan_data.get('listSignersName')
            )
            sokihieu = dataVanBan_data.get('numberOrSign')
            print("tạo Van Ban thanh cong")

            content = data['data']['content']
            so_luong_data = 0

            # Kiểm tra content có phải là danh sách hoặc từ điển
            if isinstance(content, list):
                for item in content:
                    # Kiểm tra item có phải là từ điển
                    if isinstance(item, dict):
                        attachments = item.get('attachments', [])
                        for attachment in attachments:
                            name = attachment['name']
                            download_url = f'https://backend8181.bcy.gov.vn/api/doc_out_attach/download/{name}'
                            type = attachment['type']
                            ngay_tao = attachment['createDate']
                            if ngay_tao == createDate:
                                data_chinh = True
                            else:
                                data_chinh = False
                            data = save_file(headers, name, download_url, id_data, van_ban, type, data_chinh)
                            print("Tạo Data thành công")
                            so_luong_data += 1
                    else:
                        print("LỖI: Phần tử trong content không phải từ điển:", item)
            else:
                # Xử lý nếu content không phải danh sách, giả sử là từ điển
                attachments = content.get('attachments', [])
                for attachment in attachments:
                    name = attachment['name']
                    download_url = f'https://backend8181.bcy.gov.vn/api/doc_out_attach/download/{name}'
                    type = attachment['type']
                    ngay_tao = attachment['createDate']
                    if ngay_tao == createDate:
                        data_chinh = True
                    else:
                        data_chinh = False
                    data = save_file(headers, name, download_url, id_data, van_ban, type, data_chinh)
                    print("Tạo Data thành công")
                    so_luong_data += 1

            van_ban.so_luong_data = so_luong_data
            van_ban.save()
            dieu_kien_tai.data = data
            dieu_kien_tai.save()
            
            print("ĐÃ LƯU", ", SO/KI HIEU:", sokihieu, ", NGAY:", timestamp_to_day(createDate))
            page += 1

        return HttpResponse("All files downloaded and saved successfully")
    except Exception as e:
        logging.critical("Lỗi không xác định: %s", e)
        return HttpResponse(f"Lỗi không xác định: {e}", status=500)