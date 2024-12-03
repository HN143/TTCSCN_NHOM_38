import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './updateFile.scss';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { updateFileRange, convertAllFiles } from '../services/pdfService';

function UpdateFile({ accessToken }) {
    const [isLoading, setIsLoading] = useState(false);
    const [endDate, setEndDate] = useState(new Date());
    const [startDate, setStartDate] = useState(new Date());
    const [error, setError] = useState("");
    const [successMessage, setSuccessMessage] = useState("");
    const navigate = useNavigate();

    useEffect(() => {
        if (!startDate || startDate.getTime() > endDate.getTime()) {
            const newStartDate = new Date(endDate);
            newStartDate.setDate(newStartDate.getDate() - 5);
            setStartDate(newStartDate);
        }
    }, [endDate, startDate]);

    const handleEndDateChange = (date) => setEndDate(date);
    const handleUpdate = async () => {
        if (startDate > endDate) {
            setError('Ngày bắt đầu không thể lớn hơn ngày kết thúc.');
            return;
        }

        setError('');
        setIsLoading(true);

        try {
            // Gọi hàm API từ pdfService
            const response = await updateFileRange(
                startDate.toLocaleDateString('vi-VN'),
                endDate.toLocaleDateString('vi-VN')
            );

            // Hiển thị thông báo thành công từ server (nếu có)
            setSuccessMessage(response.message || 'Cập nhật file thành công trên server!');
        } catch (error) {
            setError(error.message);
        } finally {
            setIsLoading(false);
        }
    };
    const handleTranferAllFile = async () => {
        setError('');
        setSuccessMessage('');
        setIsLoading(true);

        try {
            // Gọi API để chuyển đổi tất cả file
            const response = await convertAllFiles();

            // Hiển thị thông báo thành công
            setSuccessMessage(response.message || 'Chuyển đổi tất cả file thành công!');
        } catch (error) {
            // Hiển thị lỗi nếu có
            setError(error.message);
        } finally {
            setIsLoading(false);
        }
    };


    return (
        <div className="update-wrapper">
            {isLoading ? (
                <div className="loading-screen">
                    <div className="spinner"></div>
                    <p className="text-2xl">Đang cập nhật file, vui lòng chờ</p>
                </div>
            ) : (
                <div className="update-content">
                    <div className="update-content_title">
                        <p className="text-3xl mb-8">Chọn khoảng thời gian để cập nhật file:</p>
                        <div className="date-picker-group">
                            <div>
                                <label htmlFor="start-date">Từ ngày:</label>
                                <DatePicker
                                    id="start-date"
                                    selected={startDate}
                                    onChange={(date) => setStartDate(date)}
                                    dateFormat="dd/MM/yyyy"
                                    className="date-picker ml-2"
                                    maxDate={endDate}
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
                                    maxDate={new Date()}
                                />
                            </div>
                        </div>
                        {error && <p className="error-message text-red-500">{error}</p>}
                        {successMessage && <p className="success-message text-green-500">{successMessage}</p>}
                    </div>
                    <div className='flex gap-2'>
                        <div className="update-content_button">
                            <button className="button-update" onClick={handleUpdate} disabled={isLoading}>
                                {isLoading ? "Đang cập nhật..." : "Update dữ liệu"}
                            </button>
                        </div>
                        <div className="update-content_button">
                            <button className="button-update" onClick={handleTranferAllFile} disabled={isLoading}>
                                {isLoading ? "Đang cập nhật..." : "Chuyển đổi file"}
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}

export default UpdateFile;








// import React, { useState, useEffect } from 'react';
// import { useNavigate } from 'react-router-dom';  // Thêm hook useNavigate để chuyển hướng
// import './updateFile.scss';
// import DatePicker from 'react-datepicker';
// import 'react-datepicker/dist/react-datepicker.css';
// import { updateFileRange } from '../services/pdfService'
// function UpdateFile({ accessToken }) {
//     const [isLoading, setIsLoading] = useState(false); // Trạng thái loading
//     const [endDate, setEndDate] = useState(new Date()); // Ngày kết thúc mặc định: Hôm nay
//     const [startDate, setStartDate] = useState(new Date()); // Ngày bắt đầu mặc định: Hôm nay
//     const [error, setError] = useState(""); // Trạng thái lỗi
//     const [successMessage, setSuccessMessage] = useState(""); // Thông báo thành công
//     const navigate = useNavigate(); // Hook để chuyển hướng trang

//     useEffect(() => {
//         if (!startDate || startDate > endDate) {
//             const newStartDate = new Date(endDate);
//             newStartDate.setDate(newStartDate.getDate() - 5); // Cách endDate 5 ngày
//             setStartDate(newStartDate);
//         }
//     }, [endDate]);

//     // Cập nhật lại ngày khi người dùng thay đổi endDate
//     const handleEndDateChange = (date) => {
//         setEndDate(date);
//     };

//     const handleUpdate = async () => {
//         if (startDate > endDate) {
//             setError("Ngày bắt đầu không thể lớn hơn ngày kết thúc. Vui lòng chọn lại.");
//             return; // Nếu startDate lớn hơn endDate thì không tiếp tục
//         }

//         setError(""); // Nếu không có lỗi, xóa thông báo lỗi
//         setIsLoading(true); // Bắt đầu loading

//         // Gửi khoảng thời gian đến backend qua API
//         const payload = {
//             start_date: startDate.toISOString().split('T')[0], // Định dạng yyyy-mm-dd
//             end_date: endDate.toISOString().split('T')[0],     // Định dạng yyyy-mm-dd
//         };

//         console.log('Payload:', payload); // Log payload để kiểm tra
//         // Thực hiện giả lập hoặc API call
//         try {
//             const response = await updateFileRange(
//                 payload.start_date, payload.end_date
//             );

//             setSuccessMessage("Cập nhật thành công!");
//             setTimeout(() => navigate('/manage-file'), 1500); // Điều hướng
//         } catch (error) {
//             setError(error.message); // Hiển thị lỗi
//         } finally {
//             setIsLoading(false);
//         }
//     };

//     return (
//         <div className="update-wrapper">
//             {isLoading ? (
//                 // Màn hình loading
//                 <div className="loading-screen">
//                     <div className="spinner"></div>
//                     <p className="text-2xl"> Đang cập nhật file, vui lòng chờ</p>
//                 </div>
//             ) : (
//                 // Giao diện chính khi không loading
//                 <div className="update-content ">
//                     <div className="update-content_title">
//                         <p className='text-3xl mb-8'>Chọn khoảng thời gian để cập nhật file:</p>
//                         <div className="date-picker-group">
//                             <div className=''>
//                                 <label htmlFor="start-date">Từ ngày:</label>
//                                 <DatePicker
//                                     id="start-date"
//                                     selected={startDate}
//                                     onChange={(date) => setStartDate(date)}
//                                     dateFormat="dd/MM/yyyy"
//                                     className="date-picker ml-2"
//                                     maxDate={endDate} // Giới hạn ngày bắt đầu không được lớn hơn ngày kết thúc
//                                 />
//                             </div>
//                             <div>
//                                 <label htmlFor="end-date">Đến ngày:</label>
//                                 <DatePicker
//                                     id="end-date"
//                                     selected={endDate}
//                                     onChange={handleEndDateChange}
//                                     dateFormat="dd/MM/yyyy"
//                                     className="date-picker ml-1"
//                                     maxDate={new Date()} // Ngày kết thúc không thể lớn hơn ngày hiện tại
//                                 />
//                             </div>
//                         </div>
//                         {error && <p className="error-message text-red-500">{error}</p>} {/* Hiển thị thông báo lỗi */}
//                         {successMessage && <p className="success-message text-green-500">{successMessage}</p>} {/* Hiển thị thông báo thành công */}
//                     </div>
//                     <div className="update-content_button">
//                         <button className="button-update" onClick={handleUpdate}>
//                             Update
//                         </button>
//                     </div>
//                 </div>
//             )}
//         </div>
//     );
// }

// export default UpdateFile;
