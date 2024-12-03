import React from 'react';
import { useLocation, useNavigate } from 'react-router-dom';

function FileInfo() {
    const location = useLocation();
    const navigate = useNavigate();
    const { file } = location.state || {}; // Lấy thông tin file từ state

    if (!file) {
        return (
            <div>
                <p>Không có thông tin file nào được truyền. Quay lại trang quản lý file.</p>
                <button onClick={() => navigate('/manage-file')}>Quay lại</button>
            </div>
        );
    }

    const handleDownload = async (fileUrl, fileName) => {
        try {
            const response = await fetch(fileUrl);
            if (!response.ok) {
                throw new Error('Không thể tải file');
            }
            const blob = await response.blob();
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = fileName; // Đặt tên cho file khi tải về
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        } catch (error) {
            console.error('Lỗi khi tải xuống file:', error);
            alert('Không thể tải file. Vui lòng thử lại sau.');
        }
    };

    return (
        <div>
            <h1>Thông tin File</h1>
            <p><strong>ID:</strong> {file.id}</p>
            <p><strong>Tên File:</strong> {file.name}</p>
            <p><strong>Ngày Tạo:</strong> {file.ngay_tao}</p>
            <p><strong>Trạng thái:</strong> {file.convert ? 'Đã chuyển đổi' : 'Chưa chuyển đổi'}</p>
            <p><strong>Số kí hiệu:</strong> {file.so_ky_hieu}</p>
            <p><strong>Người tạo:</strong> {file.nguoi_tao}</p>
            <p><strong>Trích yếu:</strong> {file.trich_yeu}</p>
            <p><strong>Đơn vị soạn thảo:</strong> {file.don_vi_soan_thao}</p>
            <p><strong>Số văn bản cùng trích yếu:</strong> {file.so_van_ban}</p>
            <p><strong>Độ mật:</strong> {file.do_mat}</p>
            <p><strong>Độ khẩn:</strong> {file.do_khan}</p>
            <p><strong>Người ký:</strong> {file.nguoi_ky}</p>

            {/* Preview File (Kiểm tra nếu có file để preview) */}

            <div>
                <h2>Preview File</h2>
                <iframe
                    src={file.download_converted_file}  // Đường dẫn đến file PDF
                    title="File Preview"
                    width="100%"
                    height="800px"
                    style={{ border: "none" }}
                />
            </div>


            {/* Tải xuống File */}
            {file.download_converted_file && (
                <button onClick={() => handleDownload(file.download_converted_file, file.name)}>
                    Tải xuống file đã chuyển đổi
                </button>
            )}
            {file.download_original_file && (
                <button onClick={() => handleDownload(file.download_original_file, file.name)}>
                    Tải xuống file gốc
                </button>
            )}

            {/* Nút Quay lại trang quản lý */}
            <button onClick={() => navigate('/manage-file')}>Quay lại</button>
        </div>
    );
}

export default FileInfo;
