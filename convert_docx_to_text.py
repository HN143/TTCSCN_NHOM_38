import os
from docx import Document
from PIL import Image
import pytesseract

# Cấu hình đường dẫn đến Tesseract OCR (nếu cần thiết)
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# Đường dẫn file đầu vào và đầu ra
input_docx_path = "file_pdf/input.docx"
output_txt_path = "file_pdf/output_file2.txt"

# Hàm để lưu ảnh từ DOCX
def extract_images_from_docx(docx_path, output_dir):
    doc = Document(docx_path)
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    image_paths = []
    for i, rel in enumerate(doc.part.rels.values()):
        if "image" in rel.target_ref:
            img_data = rel.target_part.blob
            image_path = os.path.join(output_dir, f"image_{i}.png")
            with open(image_path, "wb") as img_file:
                img_file.write(img_data)
            image_paths.append(image_path)
    return image_paths

# Hàm nhận diện chữ từ ảnh
def extract_text_from_images(image_paths):
    text = ""
    custom_config = r'--oem 3 --psm 6'  # Sử dụng OCR Engine Mode và Page Segmentation phù hợp
    for image_path in image_paths:
        img = Image.open(image_path)
        text += pytesseract.image_to_string(img, lang="vie+eng", config = custom_config)  # Thêm "kor" nếu nhận diện tiếng Hàn
    return text

# Xử lý
def main():
    # Tạo thư mục tạm để lưu ảnh
    temp_dir = "temp_images"
    image_paths = extract_images_from_docx(input_docx_path, temp_dir)
    
    # Nhận diện chữ
    extracted_text = extract_text_from_images(image_paths)
    
    # Ghi kết quả ra file text
    with open(output_txt_path, "w", encoding="utf-8") as text_file:
        text_file.write(extracted_text)
    
    print(f"Text đã được nhận diện và lưu vào: {output_txt_path}")
    
    # Xóa ảnh tạm
    for img_path in image_paths:
        os.remove(img_path)
    os.rmdir(temp_dir)

if __name__ == "__main__":
    main()
