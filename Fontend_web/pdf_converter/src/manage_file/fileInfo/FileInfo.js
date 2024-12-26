import React, { useState, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import downloadIcon from '../../assets/download-white.png'

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


    function getFileExtension(fileName) {
        const parts = fileName.split('.');
        return parts.length > 1 ? parts[parts.length - 1].toLowerCase() : null;
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

    const handlePreview = (fileUrl, fileName) => {
        // Mở cửa sổ mới để xem file
        const newWindow = window.open(fileUrl, '_blank');
        if (newWindow) {
            newWindow.document.title = fileName; // Tùy chỉnh tiêu đề cửa sổ nếu cần
        }
    }
    return (
        <div className='h-[650px] overflow-auto'>

            <div className="w-full flex flex-col lg:flex-row gap-6 p-4 lg:p-6 bg-gray-100 rounded-lg shadow-lg">

            {/* Thông tin File */}
            <div className="w-full lg:w-1/2 bg-white p-4 lg:p-6 rounded-lg shadow-sm">
                <h1 className="text-2xl lg:text-3xl font-bold text-gray-700 mb-4 border-b-2 border-gray-300 pb-2">Thông tin File</h1>
                <ul className="space-y-2 lg:space-y-3 text-sm lg:text-lg text-gray-600">
                    <li><strong className="text-gray-800">ID:</strong> {file.id}</li>
                    <li><strong className="text-gray-800">Tên File:</strong> {file.name}</li>
                    <li><strong className="text-gray-800">Ngày Tạo:</strong> {file.ngay_tao}</li>
                    <li><strong className="text-gray-800">Ngày ban hành:</strong> {file.ngay_ban_hanh}</li>
                    <li><strong className="text-gray-800">Trạng thái chuyển đổi OCR:</strong> {file.download_converted_file ? 'Đã chuyển đổi' : 'Chưa chuyển đổi'}</li>
                    <li><strong className="text-gray-800">Số kí hiệu:</strong> {file.so_ky_hieu}</li>
                    <li><strong className="text-gray-800">Người tạo:</strong> {file.nguoi_tao}</li>
                    <li><strong className="text-gray-800">Trích yếu:</strong> {file.trich_yeu}</li>
                    <li><strong className="text-gray-800">Đơn vị soạn thảo:</strong> {file.don_vi_soan_thao}</li>
                    <li><strong className="text-gray-800">Số văn bản cùng trích yếu:</strong> {file.so_van_ban}</li>
                    <li><strong className="text-gray-800">Độ mật:</strong> {file.do_mat}</li>
                    <li><strong className="text-gray-800">Độ khẩn:</strong> {file.do_khan}</li>
                    <li><strong className="text-gray-800">Người ký:</strong> {file.nguoi_ky}</li>
                </ul>
            </div>

            {/* Preview File */}
            <div className="w-full lg:w-1/2 bg-white p-4 lg:p-6 rounded-lg shadow-sm">
                <h2 className="text-xl lg:text-2xl font-bold text-gray-700 mb-4 border-b-2 border-gray-300 pb-2">Xem trước File</h2>
                <div className="w-full border rounded-lg overflow-hidden mb-4 overflow-x-auto">
                    {getFileExtension(file.name) === 'pdf' ? (
                        <iframe
                            height="570px"
                            width="100%"
                            src={file.download_converted_file ? file.download_converted_file : file.download_original_file}
                            className="border-none">
                        </iframe>
                    ) : (
                        <p className='h-[570px] ml-1'>Không có bản xem trước cho file này</p>
                    )
                    }

                </div>

                {/* Action Buttons */}
                <div className="w-full flex flex-wrap gap-4 justify-center">
                    {file.download_converted_file && (
                        <button
                            className="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 lg:py-3 lg:px-6 rounded-lg flex items-center gap-2 shadow-md"
                            onClick={() => handleDownload(file.download_converted_file, file.name)}>
                            <span>Tải xuống file đã chuyển đổi</span>
                            <img src={downloadIcon} alt="Download" className="w-4 h-4 lg:w-5 lg:h-5" />
                        </button>
                    )}
                    {file.download_original_file && (
                        <button
                            className="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 lg:py-3 lg:px-6 rounded-lg flex items-center gap-2 shadow-md"
                            onClick={() => handleDownload(file.download_original_file, file.name)}>
                            <span>Tải xuống file gốc</span>
                            <img src={downloadIcon} alt="Download" className="w-4 h-4 lg:w-5 lg:h-5" />
                        </button>
                    )}
                    {file.download_original_file && (
                        <button
                            className="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 lg:py-3 lg:px-6 rounded-lg flex items-center gap-2 shadow-md"
                            onClick={() => handlePreview(file.download_original_file, file.name)}>
                            <span>Xem file gốc</span>

                        </button>
                    )}
                    <button
                        className="bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 lg:py-3 lg:px-6 rounded-lg shadow-md"
                        onClick={() => navigate('/manage-file')}>
                        Quay lại
                    </button>
                </div>
            </div>
        </div>


        </div>
        
    );

}

export default FileInfo;
