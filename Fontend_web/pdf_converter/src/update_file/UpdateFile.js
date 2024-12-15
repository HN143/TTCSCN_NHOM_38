// import React, { useState, useEffect } from 'react';
// import { useNavigate } from 'react-router-dom';
// import './updateFile.scss';
// import DatePicker from 'react-datepicker';
// import 'react-datepicker/dist/react-datepicker.css';
// import { updateFileRange, convertAllFiles, getAllDateHaveUpdated } from '../services/pdfService';

// function UpdateFile({ accessToken }) {
//     const [isLoading, setIsLoading] = useState(false);
//     const [endDate, setEndDate] = useState(new Date());
//     const [startDate, setStartDate] = useState(new Date());
//     const [error, setError] = useState("");
//     const [successMessage, setSuccessMessage] = useState("");
//     const [dayUpdated, setDayUpdated] = useState([]);

//     const navigate = useNavigate();

//     useEffect(() => {
//         if (!startDate || startDate.getTime() > endDate.getTime()) {
//             const newStartDate = new Date(endDate);
//             newStartDate.setDate(newStartDate.getDate() - 5);
//             setStartDate(newStartDate);
//         }
//     }, [endDate, startDate]);

//     const handleEndDateChange = (date) => setEndDate(date);
//     const handleUpdate = async () => {
//         if (startDate > endDate) {
//             setError('Ngày bắt đầu không thể lớn hơn ngày kết thúc.');
//             return;
//         }

//         setError('');
//         setIsLoading(true);

//         try {
//             // Gọi hàm API từ pdfService
//             const response = await updateFileRange(
//                 startDate.toLocaleDateString('vi-VN'),
//                 endDate.toLocaleDateString('vi-VN')
//             );

//             // Hiển thị thông báo thành công từ server (nếu có)
//             setSuccessMessage(response.message || 'Cập nhật file thành công trên server!');
//         } catch (error) {
//             setError(error.message);
//         } finally {
//             setIsLoading(false);
//         }
//     };
//     const handleTranferAllFile = async () => {
//         setError('');
//         setSuccessMessage('');
//         setIsLoading(true);

//         try {
//             // Gọi API để chuyển đổi tất cả file
//             const response = await convertAllFiles();

//             // Hiển thị thông báo thành công
//             setSuccessMessage(response.message || 'Chuyển đổi tất cả file thành công!');
//         } catch (error) {
//             // Hiển thị lỗi nếu có
//             setError(error.message);
//         } finally {
//             setIsLoading(false);
//         }
//     };

//     useEffect(() => {
//         const fetchDates = async () => {
//             try {

//                 const data = await getAllDateHaveUpdated();
//                 setDayUpdated(data); // Lưu dữ liệu vào state
//             } catch (err) {
//                 console.error(err);
//                 setError("Không thể tải dữ liệu ngày cập nhật.");
//             } finally {

//             }
//         };

//         fetchDates();
//     }, []);


//     console.log(dayUpdated)

//     return (
//         <div className="update-wrapper">
//             {isLoading ? (
//                 <div className="loading-screen">
//                     <div className="spinner"></div>
//                     <p className="text-2xl">Đang cập nhật file, vui lòng chờ</p>
//                 </div>
//             ) : (

//                 <div className="update-content flex relative">
//                     <div>
//                         <div className="update-content_title">
//                             <p className="text-3xl mb-8">Chọn khoảng thời gian để cập nhật file:</p>
//                             <div className="date-picker-group">
//                                 <div>
//                                     <label htmlFor="start-date">Từ ngày:</label>
//                                     <DatePicker
//                                         id="start-date"
//                                         selected={startDate}
//                                         onChange={(date) => setStartDate(date)}
//                                         dateFormat="dd/MM/yyyy"
//                                         className="date-picker ml-2"
//                                         maxDate={endDate}
//                                     />
//                                 </div>
//                                 <div>
//                                     <label htmlFor="end-date">Đến ngày:</label>
//                                     <DatePicker
//                                         id="end-date"
//                                         selected={endDate}
//                                         onChange={handleEndDateChange}
//                                         dateFormat="dd/MM/yyyy"
//                                         className="date-picker ml-1"
//                                         maxDate={new Date()}
//                                     />
//                                 </div>
//                             </div>
//                             {error && <p className="error-message text-red-500">{error}</p>}
//                             {successMessage && <p className="success-message text-green-500">{successMessage}</p>}
//                         </div>
//                         <div className='flex gap-2 justify-center'>
//                             <div className="update-content_button">
//                                 <button className="button-update" onClick={handleUpdate} disabled={isLoading}>
//                                     {isLoading ? "Đang cập nhật..." : "Update dữ liệu"}
//                                 </button>
//                             </div>
//                             <div className="update-content_button">
//                                 <button className="button-update" onClick={handleTranferAllFile} disabled={isLoading}>
//                                     {isLoading ? "Đang cập nhật..." : "Chuyển đổi file"}
//                                 </button>
//                             </div>
//                         </div>
//                     </div>
//                     <div className='absolute'>
//                         <div>
//                             <h1>Các ngày đã cập nhật</h1>
//                             <table border="1" style={{ width: "100%", textAlign: "left" }}>
//                                 <thead>
//                                     <tr>
//                                         <th>ID</th>
//                                         <th>Ngày bắt đầu</th>
//                                         <th>Ngày kết thúc</th>
//                                     </tr>
//                                 </thead>
//                                 <tbody>
//                                     {dayUpdated.map((date) => (
//                                         <tr key={date.id}>
//                                             <td>{date.id}</td>
//                                             <td>{date.ngay_bat_dau_display}</td>
//                                             <td>{date.ngay_ket_thuc_display}</td>
//                                         </tr>
//                                     ))}
//                                 </tbody>
//                             </table>
//                         </div>
//                     </div>
//                 </div>

//             )}
//         </div>
//     );
// }

// export default UpdateFile;


import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './updateFile.scss';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { updateFileRange, convertAllFiles, getAllDateHaveUpdated } from '../services/pdfService';
import inf from '../assets/inf.png'
import x from '../assets/x.png'
function UpdateFile({ accessToken }) {
    const [isLoading, setIsLoading] = useState(false);
    const [endDate, setEndDate] = useState(new Date());
    const [startDate, setStartDate] = useState(new Date());
    const [error, setError] = useState("");
    const [successMessage, setSuccessMessage] = useState("");
    const [dayUpdated, setDayUpdated] = useState([]);
    const [isTableVisible, setIsTableVisible] = useState(false); // State để quản lý bảng hiển thị

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
            const response = await updateFileRange(
                startDate.toLocaleDateString('vi-VN'),
                endDate.toLocaleDateString('vi-VN')
            );
            setSuccessMessage(response.message || 'Cập nhật file thành công trên server!');
        } catch (error) {
            setError(error.message);
        } finally {
            setIsLoading(false);
        }
    };

    const handleTranferAllFile = async () => {
        const confirm = window.confirm("Bạn có chắc chắn muốn chuyển đổi tất cả file?");
        if (confirm) {
            setError('');
            setSuccessMessage('');
            setIsLoading(true);

            try {
                const response = await convertAllFiles();
                setSuccessMessage(response.message || 'Chuyển đổi tất cả file thành công!');
            } catch (error) {
                setError(error.message);
            } finally {
                setIsLoading(false);
            }
        }

    };

    useEffect(() => {
        const fetchDates = async () => {
            try {
                const data = await getAllDateHaveUpdated();
                setDayUpdated(data);
            } catch (err) {
                console.error(err);
                setError("Không thể tải dữ liệu ngày cập nhật.");
            }
        };

        fetchDates();
    }, []);

    return (
        <div className="update-wrapper">
            {isLoading ? (
                <div className="loading-screen">
                    <div className="spinner"></div>
                    <p className="text-2xl">Đang cập nhật file, vui lòng chờ</p>
                </div>
            ) : (
                <div className="update-content flex relative">
                    <div>
                        <div className="update-content_title">
                            <p className="text-2xl mb-8">Chọn khoảng thời gian để cập nhật file</p>
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
                        <div className='flex gap-2 justify-center flex-col md:flex-row '>
                            <div className="update-content_button">
                                <button className="button-update" onClick={handleUpdate} disabled={isLoading}>
                                    {isLoading ? "Đang cập nhật..." : "Cập nhật file"}
                                </button>
                            </div>
                            <div className="update-content_button">
                                <button className="button-update" onClick={handleTranferAllFile} disabled={isLoading}>
                                    {isLoading ? "Đang cập nhật..." : "Chuyển đổi file"}
                                </button>
                            </div>
                            {/* <button style={{ fontSize: '20px' }}
                                className="toggle_dayUpdated text-blue-500 underline mb-4 absolute bottom-0 right-3"
                                onClick={() => setIsTableVisible(!isTableVisible)}
                            >
                                {isTableVisible ? (<img src={x}></img>) : (<img src={inf}></img>)}
                            </button> */}
                        </div>
                    </div>
                    <div className="absolute  -bottom-1/3 right-0 left-0 text-sm">
                        <div style={{ height: '100px', overflowY: 'auto' }}>


                            {isTableVisible && (<>
                                <h1 >Các ngày đã cập nhật</h1>
                                <table className='text-center' border="1" style={{ width: "100%", height: '100%', textAlign: "left" }}>

                                    <thead>
                                        <tr>

                                            <th className='border'>bắt đầu</th>
                                            <th className='border'>kết thúc</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {dayUpdated.map((date) => (
                                            <tr key={date.id}>

                                                <td className='border'>{date.ngay_bat_dau_display}</td>
                                                <td className='border'>{date.ngay_ket_thuc_display}</td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </>
                            )}
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
