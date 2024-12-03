# # import the necessary packages
# from easyocr import Reader
# import argparse
# import cv2

# def cleanup_text(text):
# 	# strip out non-ASCII text so we can draw the text on the image
# 	# using OpenCV
# 	return "".join([c if ord(c) < 128 else "" for c in text]).strip()

# # construct the argument parser and parse the arguments
# ap = argparse.ArgumentParser()
# ap.add_argument("-i", "--image", required=True,
# 	help="path to input image to be OCR'd")
# ap.add_argument("-l", "--langs", type=str, default="en",
# 	help="comma separated list of languages to OCR")
# ap.add_argument("-g", "--gpu", type=int, default=-1,
# 	help="whether or not GPU should be used")
# args = vars(ap.parse_args())

# # break the input languages into a comma separated list
# langs = args["langs"].split(",")
# print("[INFO] OCR'ing with the following languages: {}".format(langs))
# # load the input image from disk
# image = cv2.imread(args["image"])
# # OCR the input image using EasyOCR
# print("[INFO] OCR'ing input image...")
# reader = Reader(langs, gpu=args["gpu"] > 0)
# results = reader.readtext(image)

# # loop over the results
# data = ""
# for (bbox, text, prob) in results:
# 	# display the OCR'd text and associated probability
# 	# print("[INFO] {:.4f}: {}".format(prob, text))
# 	print("{}".format(text))

# 	# unpack the bounding box
# 	(tl, tr, br, bl) = bbox
# 	tl = (int(tl[0]), int(tl[1]))
# 	tr = (int(tr[0]), int(tr[1]))
# 	br = (int(br[0]), int(br[1]))
# 	bl = (int(bl[0]), int(bl[1]))
# 	# cleanup the text and draw the box surrounding the text along
# 	# with the OCR'd text itself
# 	text = cleanup_text(text)
# 	cv2.rectangle(image, tl, br, (0, 255, 0), 2)
# 	cv2.putText(image, text, (tl[0], tl[1] - 10),
# 		cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
# # show the output image
# cv2.imshow("Image", image)
# cv2.waitKey(0)

from easyocr import Reader

def perform_ocr(image_path, languages=["en"], use_gpu=False):
    """
    Nhận diện văn bản từ ảnh sử dụng EasyOCR.

    :param image_path: Đường dẫn tới file ảnh.
    :param languages: Danh sách ngôn ngữ để OCR (ví dụ: ["en", "vie"]).
    :param use_gpu: Boolean cho biết có sử dụng GPU hay không.
    :return: Chuỗi văn bản nhận diện được.
    """
    # Khởi tạo trình đọc EasyOCR
    reader = Reader(languages, gpu=use_gpu)
    # Thực hiện OCR trên ảnh
    results = reader.readtext(image_path)
    # Trích xuất và ghép các đoạn văn bản lại
    text = " ".join([res[1] for res in results])
    return text

# Ví dụ sử dụng
if __name__ == "__main__":
    # Đường dẫn tới file ảnh
    image_path = "temp_images/image_6_processed.png"
    # Ngôn ngữ nhận diện (tiếng Anh và tiếng Việt)
    languages = ["en", "vi"]
    # Gọi hàm OCR
    detected_text = perform_ocr(image_path, languages=languages, use_gpu=False)
    # In kết quả
    print("Detected Text:")
    print(detected_text)