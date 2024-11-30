// import React, { useState } from 'react';
// import './updateFile.scss'
// function UpdateFile({ updateFiles, fileManage }) {


//     const handleUpdate = () => {
//         const newFiles = [



//             {
//                 title: 'nghị định về bổ sung cần kiểm tra', infomation: 'this is information', orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)'
//                 , numberOrSign: '1155/QĐ-HVM', preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)fffffffffffffffffffffffff', fileType: 'pdf',
//                 dateIssued: '2/3/2024', author: 'Nguyễn Thị Thùy', isSecure: 'none', immediately: 'none(độ khẩn)',
//                 urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf', destination: '(nơi nhận nội bộ)'
//             },
//             {
//                 title: 'nghị định về bổ sung cần kiểm tra', infomation: 'this is information', orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)'
//                 , numberOrSign: '1155/QĐ-HVM', preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)', fileType: 'pdf',
//                 dateIssued: '2/3/2024', author: 'Nguyễn Thị Thùy', isSecure: 'none', immediately: 'none(độ khẩn)',
//                 urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf', destination: '(nơi nhận nội bộ)'
//             },
//             {
//                 title: 'nghị định về bổ sung cần kiểm tra', infomation: 'this is information', orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)'
//                 , numberOrSign: '1155/QĐ-HVM', preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)', fileType: 'pdf',
//                 dateIssued: '2/3/2024', author: 'Nguyễn Thị Thùy', isSecure: 'none', immediately: 'none(độ khẩn)',
//                 urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf', destination: '(nơi nhận nội bộ)'
//             },
//             {
//                 title: 'nghị định về bổ sung cần kiểm tra', infomation: 'this is information', orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)'
//                 , numberOrSign: '1155/QĐ-HVM', preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)', fileType: 'pdf',
//                 dateIssued: '2/3/2024', author: 'Nguyễn Thị Thùy', isSecure: 'none', immediately: 'none(độ khẩn)',
//                 urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf', destination: '(nơi nhận nội bộ)'
//             },
//             {
//                 title: 'nghị định về bổ sung cần kiểm tra', infomation: 'this is information', orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)'
//                 , numberOrSign: '1155/QĐ-HVM', preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)', fileType: 'pdf',
//                 dateIssued: '2/3/2024', author: 'Nguyễn Thị Thùy', isSecure: 'none', immediately: 'none(độ khẩn)',
//                 urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf', destination: '(nơi nhận nội bộ)'
//             },


//         ];
//         updateFiles(newFiles); // Cập nhật danh sách file bằng cách truyền newFiles
//     };

//     return (
//         <div className="update-wrapper" >
//             <div className="update-content">
//                 <div className="update-content_tilte">Bạn chưa cập nhật file, ấn Update phía dưới để làm mới</div>
//                 <div className="update-content_button">
//                     <button className='button1' onClick={handleUpdate}>Update</button>
//                 </div>



//             </div>
//         </div>
//     );
// }

// export default UpdateFile
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';  // Thêm hook useNavigate để chuyển hướng
import './updateFile.scss';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';

function UpdateFile({ accessToken }) {
    const [isLoading, setIsLoading] = useState(false); // Trạng thái loading
    const [endDate, setEndDate] = useState(new Date()); // Ngày kết thúc mặc định: Hôm nay
    const [startDate, setStartDate] = useState(new Date()); // Ngày bắt đầu mặc định: Hôm nay
    const [error, setError] = useState(""); // Trạng thái lỗi
    const [successMessage, setSuccessMessage] = useState(""); // Thông báo thành công
    const navigate = useNavigate(); // Hook để chuyển hướng trang

    // Sử dụng useEffect để cập nhật startDate mỗi khi endDate thay đổi
    useEffect(() => {
        const newStartDate = new Date(endDate);
        newStartDate.setDate(newStartDate.getDate() - 5); // Cập nhật startDate cách endDate 5 ngày
        setStartDate(newStartDate);
    }, [endDate]); // Khi endDate thay đổi, sẽ cập nhật startDate

    // Cập nhật lại ngày khi người dùng thay đổi endDate
    const handleEndDateChange = (date) => {
        setEndDate(date);
    };

    const handleUpdate = () => {
        if (startDate > endDate) {
            setError("Ngày bắt đầu không thể lớn hơn ngày kết thúc. Vui lòng chọn lại.");
            return; // Nếu startDate lớn hơn endDate thì không tiếp tục
        }

        setError(""); // Nếu không có lỗi, xóa thông báo lỗi
        setIsLoading(true); // Bắt đầu loading

        // Gửi khoảng thời gian đến backend qua API
        const payload = {
            start_date: startDate.toISOString().split('T')[0], // Định dạng yyyy-mm-dd
            end_date: endDate.toISOString().split('T')[0],     // Định dạng yyyy-mm-dd
        };

        console.log('Payload:', payload); // Log payload để kiểm tra
        // Thực hiện giả lập hoặc API call
        setTimeout(() => {
            const newFiles = [
                {
                    title: 'nghị định về bổ sung cần kiểm tra',
                    infomation: 'this is information',
                    orgCreateName: 'Phòng Chính trị - Tổ chức(đơn vị soạn)',
                    numberOrSign: '1155/QĐ-HVM',
                    preview: 'QĐ vv khen thưởng tổng kết công tác năm 2024(trích yếu)',
                    fileType: 'pdf',
                    dateIssued: '2/3/2024',
                    author: 'Nguyễn Thị Thùy',
                    isSecure: 'none',
                    immediately: 'none(độ khẩn)',
                    urlFile: 'https://www.rd.usda.gov/sites/default/files/pdf-sample_0.pdf',
                    destination: '(nơi nhận nội bộ)',
                },
            ];







            setIsLoading(false); // Tắt loading
            setSuccessMessage("Cập nhật thành công!"); // Thông báo thành công

            // Chuyển hướng đến trang quản lý file sau khi cập nhật thành công
            setTimeout(() => {
                navigate('/manage-file'); // Đảm bảo rằng /manage-files là đường dẫn trang quản lý file của bạn
            }, 1500); // Chờ 1.5s trước khi chuyển hướng
        }, 2000); // Giả lập thời gian xử lý là 2 giây
    };

    return (
        <div className="update-wrapper">
            {isLoading ? (
                // Màn hình loading
                <div className="loading-screen">
                    <div className="spinner"></div>
                    <p className="text-2xl"> Đang cập nhật file, vui lòng chờ</p>
                </div>
            ) : (
                // Giao diện chính khi không loading
                <div className="update-content ">
                    <div className="update-content_title">
                        <p className='text-3xl mb-4'>Chọn khoảng thời gian để cập nhật file:</p>
                        <div className="date-picker-group">
                            <div className=''>
                                <label htmlFor="start-date">Từ ngày:</label>
                                <DatePicker
                                    id="start-date"
                                    selected={startDate}
                                    onChange={(date) => setStartDate(date)}
                                    dateFormat="dd/MM/yyyy"
                                    className="date-picker ml-2"
                                    maxDate={endDate} // Giới hạn ngày bắt đầu không được lớn hơn ngày kết thúc
                                />
                            </div>
                            <div>
                                <label htmlFor="end-date">Đến ngày:</label>
                                <DatePicker
                                    id="end-date"
                                    selected={endDate}
                                    onChange={handleEndDateChange}
                                    dateFormat="dd/MM/yyyy"
                                    className="date-picker ml-1"
                                    minDate={new Date()} // Ngày kết thúc không thể nhỏ hơn ngày hiện tại
                                />
                            </div>
                        </div>
                        {error && <p className="error-message text-red-500">{error}</p>} {/* Hiển thị thông báo lỗi */}
                        {successMessage && <p className="success-message text-green-500">{successMessage}</p>} {/* Hiển thị thông báo thành công */}
                    </div>
                    <div className="update-content_button">
                        <button className="button1" onClick={handleUpdate}>
                            Update
                        </button>
                    </div>
                </div>
            )}
        </div>
    );
}

export default UpdateFile;
