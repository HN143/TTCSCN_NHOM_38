


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

    const handleToggleDayUpdated = () => {
        // Kiểm tra nếu `dayUpdated` là một object và có dữ liệu
        if (dayUpdated && dayUpdated.ngay_bat_dau_display && dayUpdated.ngay_ket_thuc_display) {
            const dateInfo = ` ${dayUpdated.ngay_bat_dau_display} --> ${dayUpdated.ngay_ket_thuc_display}`;

            // Hiển thị thông báo với các ngày đã cập nhật
            alert(`Ngày đã cập nhật\n${dateInfo}`);
        } else {
            alert("Không có dữ liệu ngày đã cập nhật.");
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
                console.log(data)
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
                        <div className='flex gap-2 justify-center flex-col lg:flex-row '>
                            <div className="update-content_button w-34">
                                <button className="button-update" onClick={handleUpdate} disabled={isLoading}>
                                    {isLoading ? "Đang cập nhật..." : "Cập nhật file"}
                                </button>
                            </div>
                            <div className="update-content_button w-34">
                                <button className="button-update" onClick={handleTranferAllFile} disabled={isLoading}>
                                    {isLoading ? "Đang cập nhật..." : "Chuyển đổi file"}
                                </button>
                            </div>
                            <button
                                style={{ fontSize: '20px' }}
                                className="toggle_dayUpdated text-blue-500 underline mb-4 absolute bottom-0 right-3"
                                onClick={handleToggleDayUpdated}
                            >
                                {isTableVisible ? (<img src={x} alt="close" />) : (<img src={inf} alt="info" />)}
                            </button>

                        </div>
                    </div>


                </div>
            )}
        </div>
    );
}

export default UpdateFile;





