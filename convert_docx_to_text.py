from easyocr import Reader
import os
from docx import Document


# Hàm để lưu ảnh từ DOCX
def extract_images_from_docx(docx_path, output_dir):
    """
    Trích xuất ảnh từ file DOCX và lưu vào thư mục chỉ định.

    :param docx_path: Đường dẫn tới file DOCX.
    :param output_dir: Thư mục lưu ảnh trích xuất.
    :return: Danh sách đường dẫn tới các ảnh đã lưu.
    """
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


# Hàm nhận diện văn bản từ ảnh sử dụng EasyOCR
def perform_ocr(image_paths, languages=["en"], use_gpu=False):
    """
    Nhận diện văn bản từ danh sách ảnh sử dụng EasyOCR.

    :param image_paths: Danh sách đường dẫn tới các file ảnh.
    :param languages: Danh sách ngôn ngữ để OCR (ví dụ: ["en", "vi"]).
    :param use_gpu: Boolean cho biết có sử dụng GPU hay không.
    :return: Chuỗi văn bản nhận diện được.
    """
    reader = Reader(languages, gpu=use_gpu)
    text = ""
    for image_path in image_paths:
        results = reader.readtext(image_path)
        text += " ".join([res[1] for res in results]) + "\n"
    return text


# Ví dụ sử dụng
if __name__ == "__main__":
    # Đường dẫn tới file DOCX
    docx_path = "file_pdf/anh1.docx"
    
    # Ngôn ngữ nhận diện (tiếng Anh và tiếng Việt)
    languages = ["en", "vi"]

    # Tạo thư mục tạm để lưu ảnh
    temp_dir = "temp_images"
    image_paths = extract_images_from_docx(docx_path, temp_dir)
    
    if image_paths:
        # Gọi hàm OCR
        detected_text = perform_ocr(image_paths, languages=languages, use_gpu=False)
        # In kết quả
        print("Detected Text:")
        print(detected_text)
    else:
        print("No images found in the DOCX file.")
    
    # # Xóa ảnh tạm
    # for img_path in image_paths:
    #     os.remove(img_path)
    # os.rmdir(temp_dir)
