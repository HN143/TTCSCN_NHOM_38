
import React, { useState, useEffect, useMemo } from 'react';
import './manageFile.scss';
import { Link } from 'react-router-dom'; // Thêm import Link
import searchIcon from '../assets/Vector.png';
import fileIcon from '../assets/device-fill.png';
import downloadIcon from '../assets/download-white.png';
import deleteIcon from '../assets/delete-bin-5-white.png';
import eyeIcon from '../assets/eye-line.png'
import { getListData, getMergedDataByDate, getDataByDate } from '../services/pdfService';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import emptyImage from '../assets/empty_file.png'
function ManageFile({ fileManage: initFile }) {
    const today = new Date()

    const [data1, setData1] = useState([]);
    const [FilteredData, setFilteredData] = useState([])
    const [notShow, setNotShow] = useState(true) //toggle lọc ngày
    const [originalData, setOriginalData] = useState([]); // Lưu dữ liệu gốc
    const [data, setData] = useState([]); // Dữ liệu hiện tại

    useEffect(() => {
        const fetchData = async () => {
            const result = await getListData();
            setOriginalData(result); // Lưu dữ liệu gốc
            setData(result); // Cập nhật dữ liệu để hiển thị
            setData1(result)
        };

        fetchData();
    }, []);

    //hàm toggle lọc file theo ngày
    const handleSpe = () => {
        setData1(data)
        setNotShow(false)
    }
    // //hàm gửi yc lọc file theo ngày đến server
    // const handleSentDay = async () => {
    //     try {
    //         // Chuyển ngày về định dạng DD/MM/YYYY
    //         const formattedStartDate = `${startDate.getDate()}/${startDate.getMonth() + 1}/${startDate.getFullYear()}`;
    //         const formattedEndDate = `${endDate.getDate()}/${endDate.getMonth() + 1}/${endDate.getFullYear()}`;
    //         // Gửi yêu cầu lấy dữ liệu theo ngày
    //         const filteredData = await getDataByDate(formattedStartDate, formattedEndDate);
    //         setData1(filteredData); // Cập nhật dữ liệu từ server

    //         const filterWhenDate = data.filter(item => {
    //             return item.van_ban_list.some(vanBan =>
    //                 data1.some(dataItem => dataItem.van_ban === vanBan.van_ban && dataItem.file === vanBan.file)
    //             );
    //         });

    //         setNotShow(true); // Đóng box chọn ngày
    //         if (filterWhenDate) {
    //             setData(filterWhenDate)
    //         }

    //         setNotShow(true); // Đóng box chọn ngày
    //     } catch (error) {
    //         console.error('Failed to fetch data by date:', error);
    //     }
    // }

    const handleSentDay = async () => {
        try {
            // Chuyển ngày về định dạng DD/MM/YYYY
            const formattedStartDate = `${startDate.getDate()}/${startDate.getMonth() + 1}/${startDate.getFullYear()}`;
            const formattedEndDate = `${endDate.getDate()}/${endDate.getMonth() + 1}/${endDate.getFullYear()}`;

            // Gửi yêu cầu lấy dữ liệu theo ngày từ server
            const filteredData = await getDataByDate(formattedStartDate, formattedEndDate);

            // Kết hợp dữ liệu từ server với dữ liệu cũ
            const newFilteredData = data.filter(item => {
                return item.van_ban_list.some(vanBan =>
                    filteredData.some(dataItem => dataItem.van_ban === vanBan.van_ban && dataItem.file === vanBan.file)
                );
            });
            setFilteredData(newFilteredData)
            setData1(newFilteredData)
            setNotShow(true); // Đóng box chọn ngày



        } catch (error) {
            console.error('Failed to fetch data by date:', error);
        }
    };


    useEffect(() => {
        const fetchData = async () => {
            const result = await getListData();
            setData1(result);
        };

        fetchData();
    }, []);
    const [endDate, setEndDate] = useState(today); // Ngày kết thúc mặc định: Hôm nay
    const [startDate, setStartDate] = useState(today); // Ngày bắt đầu mặc định: Hôm nay
    const [searchTerm, setSearchTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const [filesPerPage, setFilesPerPage] = useState(15); // Default files per page
    const [screenWidth, setScreenWidth] = useState(window.innerWidth);
    const [tags, setTags] = useState([]); // Lưu các tag được chọn
    const [suggestions, setSuggestions] = useState([]); // Gợi ý tìm kiếm
    const [isHaveFile, setIsHaveFile] = useState(true)


    // Chuyển đổi dữ liệu sang danh sách phẳng
    const FileLists = useMemo(() =>
        data1?.flatMap(doc =>
            doc?.van_ban_list?.map(file => ({
                id: file?.id || null,
                name: file?.name || 'Unknown',
                type: file?.type || 'Unknown',
                original_file: file?.original_file || null,
                converted_file: file?.converted_file || null,
                download_converted_file: file?.download_converted_file || null,
                download_original_file: file?.download_original_file || null,
                text_content: file?.text_content || '',
                active: file?.active || false,
                convert: file?.convert || false,
                clean: file?.clean || false,
                data_chinh: file?.data_chinh || null,
                van_ban: doc?.id || null,
                ngay_tao: doc?.ngay_tao || 'N/A',
                ngay_ban_hanh: doc?.ngay_ban_hanh || 'N/A',
                so_ky_hieu: doc?.so_ky_hieu || 'N/A',
                loai_van_ban: doc?.loai_van_ban || 'Unknown',
                nguoi_tao: doc?.nguoi_tao || 'Unknown',
                trich_yeu: doc?.trich_yeu || '',
                don_vi_soan_thao: doc?.don_vi_soan_thao || 'Unknown',
                so_van_ban: doc?.so_van_ban || 'Unknown',
                do_mat: doc?.do_mat || 'Unknown',
                do_khan: doc?.do_khan || 'Unknown',
                nguoi_ky: doc?.nguoi_ky || 'Unknown',
            }))
        ) || [] // Fallback giá trị rỗng nếu `data` không hợp lệ
        , [data1]);


    const [isGridView, setGridView] = useState(false) // setup hiển thị grid hay table
    // Update filesPerPage based on screen width
    useEffect(() => {
        const updateFilesPerPage = () => {
            setScreenWidth(window.innerWidth);
            if (window.innerWidth <= 640) {
                setFilesPerPage(3); // Mobile view
            } else if (window.innerWidth <= 1024) {
                setFilesPerPage(6); // Tablet view
            } else {
                setFilesPerPage(14); // Desktop view
            }
        };

        // Gọi hàm ngay khi component render lần đầu
        updateFilesPerPage();

        // Thêm event listener
        window.addEventListener('resize', updateFilesPerPage);

        // Cleanup
        return () => window.removeEventListener('resize', updateFilesPerPage);
    }, []);
    useEffect(() => {
        setIsHaveFile(FileLists.length > 0);
    }, [FileLists]);



    const handleDownload = (fileName) => {
        console.log(`Tải xuống file: ${fileName}`);
    };
    // Xử lý khi nhập từ khóa
    const handleSearchInput = (value) => {
        setSearchTerm(value);
        // Gợi ý theo các tiêu chí
        const filteredSuggestions = [
            { type: 'Tên file', value },
            { type: 'Đơn vị soạn', value },
            { type: 'Số/kí hiệu', value },
            { type: 'Trích yếu', value },
            { type: 'Loại văn bản', value },
            { type: 'Ngày ban hành', value },
            { type: 'Nội dung', value },
        ].filter(suggestion => suggestion.value.trim());

        setSuggestions(filteredSuggestions);
    };

    // Thêm tag khi chọn gợi ý
    const addTag = (tag) => {
        if (!tags.some(t => t.type === tag.type && t.value === tag.value)) {
            setTags([...tags, tag]);
        }
        setSearchTerm(''); // Xóa từ khóa sau khi chọn
        setSuggestions([]); // Ẩn gợi ý
    };

    // Xóa tag
    const removeTag = (tagToRemove) => {
        setTags(tags.filter(tag => tag !== tagToRemove));
    };


    // Lọc file dựa trên tags và searchTerm
    const filteredFiles = FileLists.filter(file => {
        // Lọc theo tags

        const matchesTags = tags.every(tag => {
            if (tag.type === 'Tên file') {
                return file.name?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Đơn vị soạn thảo') {
                console.log(file.don_vi_soan_thao)
                return file.don_vi_soan_thao?.includes(tag.value);
            } else if (tag.type === 'Số/kí hiệu') {
                return file.so_ky_hieu?.includes(tag.value);
            } else if (tag.type === 'Trích yếu') {
                return file.trich_yeu?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Loại văn bản') {
                return file.loai_van_ban?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Ngày ban hành') {
                return file.ngay_ban_hanh?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Nội dung') {
                return file.text_content?.toLowerCase().includes(tag.value.toLowerCase());
            }

            return true;
        });
        // Lọc theo searchTerm (nếu có)
        const matchesSearchTerm = searchTerm
            ? file.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
            file.text_content?.toLowerCase().includes(searchTerm.toLowerCase())
            : true;
        return matchesTags && matchesSearchTerm;
    });

    // Hàm xử lý khi người dùng thay đổi endDate
    const handleEndDateChange = (date) => {
        const selectedDate = new Date(date);
        if (selectedDate > today) {
            alert('Ngày kết thúc không được vượt quá hôm nay!');
            setEndDate(today);
        } else {
            setEndDate(selectedDate);
        }
    };

    // Hàm xử lý khi người dùng thay đổi startDate
    const handleStartDateChange = (date) => {
        setStartDate(new Date(date)); // Cho phép ngày bắt đầu thay đổi tự do
    };



    //set the index per page
    const indexOfLastFile = currentPage * filesPerPage;
    const indexOfFirstFile = indexOfLastFile - filesPerPage;
    const currentFiles = filteredFiles.slice(indexOfFirstFile, indexOfLastFile);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    const pageNumbers = [];
    for (let i = 1; i <= Math.ceil(filteredFiles.length / filesPerPage); i++) {
        pageNumbers.push(i);
    }
    // Display the page numbers around the current page
    const visiblePageNumbers = () => {
        const maxPagesToShow = 5; // Maximum pages to show
        const startPage = Math.max(1, currentPage - Math.floor(maxPagesToShow / 2));
        const endPage = Math.min(pageNumbers.length, currentPage + Math.floor(maxPagesToShow / 2));

        return pageNumbers.slice(startPage - 1, endPage);
    };
    console.log('data>>', data)
    console.log('data 00000000>>', data1)
    console.log('fileter', FilteredData)
    console.log('currents file', currentFiles)
    return (
        <div>
            {isHaveFile ? (
                <div style={{ height: '86vh', overflowY: 'auto' }} className='p-2'>
                    <div className="search-bar w-full">
                        <div className="tags flex flex-wrap mb-2">
                            {tags.map((tag, index) => (
                                <div key={index} className="tag bg-blue-500 text-white px-3 py-1 rounded-full mr-2 mb-2 flex items-center">
                                    {`${tag.type}: ${tag.value}`}
                                    <button onClick={() => removeTag(tag)} className="ml-2 text-base">×</button>
                                </div>
                            ))}
                        </div>
                        <div className="search-input relative">
                            <input
                                type="text"
                                value={searchTerm}
                                onChange={(e) => handleSearchInput(e.target.value)}
                                placeholder="Nhập từ khóa..."
                                className="p-2 border rounded w-full focus:outline-none"
                            />
                            {suggestions.length > 0 && (
                                <ul className="suggestions absolute bg-white border rounded w-full mt-1 z-10">
                                    {suggestions.map((suggestion, index) => (
                                        <li
                                            key={index}
                                            onClick={() => addTag(suggestion)}
                                            className="p-2 hover:bg-gray-100 cursor-pointer"
                                        >
                                            {`Search theo ${suggestion.type}: ${suggestion.value}`}
                                        </li>
                                    ))}
                                </ul>
                            )}
                        </div>
                        <div className='mt-2 mb-2 flex content-center justify-between'>
                            <div>
                                <button onClick={() => setGridView(false)} className={`py-2 px-6 font-semibold mr-2 rounded-md ${!isGridView ? 'bg-blue-500 text-white' : 'bg-gray-200 text-black'}`}>
                                    Table
                                </button>
                                <button onClick={() => setGridView(true)} className={`py-2 px-6 font-semibold rounded-md ${isGridView ? 'bg-blue-500 text-white' : 'bg-gray-200 text-black'}`}>
                                    Grid
                                </button>
                            </div>
                            {notShow ? (


                                <div>
                                    <button onClick={handleSpe} className='btn_switch-tranfer-day text-white p-1 px-4 py-2 rounded'>Lọc danh sách theo ngày</button>
                                </div>

                            )
                                :
                                (

                                    <div>
                                        <div style={{ flexDirection: 'row', gap: '0' }} className="date-picker-group  flex content-center flex-row">
                                            <div style={{ marginTop: '1px' }} className='flex content-center'>
                                                <div className=''>
                                                    <label className='' htmlFor="start-date">Từ</label>
                                                    <DatePicker
                                                        id="start-date"
                                                        selected={startDate}
                                                        onChange={(date) => setStartDate(date)}
                                                        dateFormat="dd/MM/yyyy"
                                                        className=" ml-2 p-1 w-24"
                                                        maxDate={endDate} // Giới hạn ngày bắt đầu không được lớn hơn ngày kết thúc
                                                    />
                                                </div>
                                                <div>
                                                    <label className='' htmlFor="end-date">đến</label>
                                                    <DatePicker
                                                        id="end-date"
                                                        selected={endDate}
                                                        onChange={handleEndDateChange}
                                                        dateFormat="dd/MM/yyyy"
                                                        className=" ml-1 p-1 w-24"
                                                    />
                                                </div>
                                            </div>
                                            <div>
                                                <button onClick={handleSentDay} className='btn_switch-tranfer-day text-white p-1 px-4 py-2 rounded'>Áp dụng</button>
                                            </div>
                                        </div>

                                    </div>
                                )}

                        </div>

                    </div>
                    <div style={{ padding: '4px' }}>
                        {isGridView ? (
                            <div className='wrap-container1'>
                                <div className='container1'>
                                    <div className='search-file1 grid grid-cols-5  gap-4'>
                                        {currentFiles.map((val, key) => (
                                            <div className='search-file_wrapper1' key={key}>
                                                <div className='file-wrapper1 bg-white p-4 rounded-lg shadow-md relative group'>
                                                    <div className='file-icon1'>
                                                        <img src={fileIcon} alt='img file' className='w-8 h-8' />
                                                    </div>
                                                    <div className='file-title1 text-lg font-semibold'>{val.name}</div>
                                                    <div className='file-action1 flex justify-between mt-2'>
                                                        {val.download_converted_file && (
                                                            <div
                                                                className='download-action1 cursor-pointer'
                                                                onClick={() => window.open(val.download_converted_file, '_blank')}
                                                            >
                                                                <img src={eyeIcon} alt='preview' className='w-6 h-6' />
                                                            </div>
                                                        )}

                                                        {val.download_converted_file && (
                                                            <div
                                                                className='download-action1 cursor-pointer'
                                                                onClick={async () => {
                                                                    const response = await fetch(val.download_converted_file);
                                                                    const blob = await response.blob();
                                                                    const url = window.URL.createObjectURL(blob);
                                                                    const a = document.createElement('a');
                                                                    a.href = url;
                                                                    a.download = val.name; // Sử dụng giá trị trực tiếp của `val.name` cho thuộc tính `download`
                                                                    document.body.appendChild(a);
                                                                    a.click();
                                                                    document.body.removeChild(a);
                                                                }}
                                                            >
                                                                <img src={downloadIcon} alt='download' className='w-6 h-6' />
                                                            </div>
                                                        )}

                                                        <div className='delete-action1 cursor-pointer' >
                                                            <img src={deleteIcon} alt='delete' className='w-6 h-6' />
                                                        </div>
                                                    </div>
                                                    {/* Container thông tin chi tiết */}
                                                    <div
                                                        className={`absolute top-0 left-0 w-full h-full bg-white p-4 rounded-lg shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-opacity duration-100 ${(key + 1) % 5 === 0 ? "file-detail" : "file-detail"
                                                            }`}
                                                    >
                                                        <p><strong>Tên file:</strong> {val.name}</p>
                                                        <p><strong>Đơn vị soạn:</strong> {val.don_vi_soan_thao || 'Không xác định'}</p>
                                                        <p><strong>Số/kí hiệu</strong> {val.so_ky_hieu}</p>
                                                        <p><strong>Trích yếu:</strong> {val.trich_yeu}</p>
                                                        <p><strong>Loại văn bản:</strong> {val.loai_van_ban || 'Không xác định'}</p>
                                                        <p><strong>Ngày ban hành:</strong> {val.ngay_ban_hanh ? new Date(val.ngay_ban_hanh).toLocaleDateString('vi-VN') : 'Không xác định'}</p>

                                                    </div>
                                                </div>

                                            </div>
                                        ))}
                                    </div>
                                </div>
                            </div>

                        )
                            : (
                                <div className="table-view max-h-[400px] overflow-y-auto">
                                    <table className="table-auto w-full text-left">
                                        <thead>
                                            <tr>
                                                <th className="p-2">Tên file</th>
                                                <th className="p-2">Đơn vị soạn</th>
                                                <th className="p-2">Số/kí hiệu</th>
                                                <th className="p-2">Trích yếu</th>
                                                <th className="p-2">Loại văn bản</th>
                                                <th className="p-2">Ngày ban hành</th>
                                                <th className="p-2">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {currentFiles.map((val, key) => (
                                                <tr key={key}>
                                                    <td className="p-2 max-w-36 truncate">{val.name}</td>
                                                    <td className="p-2 max-w-40 truncate">{val.don_vi_soan_thao || 'Không xác định'}</td>
                                                    <td className="p-2 max-w-12 truncate">{val.so_ky_hieu || 'Không xác định'}</td>
                                                    <td className="p-2 max-w-44 truncate">{val.trich_yeu || 'Không xác định'}</td>
                                                    <td className="p-2 max-w-xs truncate">{val.loai_van_ban || 'Không xác định'}</td>
                                                    <td className="p-2 max-w-xs truncate">{val.ngay_ban_hanh ? new Date(val.ngay_ban_hanh).toLocaleDateString('vi-VN') : 'Không xác định'}</td>
                                                    <td className="p-2">
                                                        {val.download_converted_file && (
                                                            <button
                                                                onClick={() => window.open(val.download_converted_file, '_blank')}
                                                                className="look_btn_row p-2 rounded"
                                                            >
                                                                <img src={eyeIcon} alt="preview" className="w-6 h-6" />
                                                            </button>
                                                        )}

                                                        {val.download_converted_file && (
                                                            <button
                                                                onClick={async () => {
                                                                    const response = await fetch(val.download_converted_file);
                                                                    const blob = await response.blob();
                                                                    const url = window.URL.createObjectURL(blob);
                                                                    const a = document.createElement('a');
                                                                    a.href = url;
                                                                    a.download = val.name; // Đặt tên cho file khi tải về, bạn có thể thay 'file_name' bằng tên file cụ thể nếu có.
                                                                    document.body.appendChild(a);
                                                                    a.click();
                                                                    document.body.removeChild(a);
                                                                }}
                                                                className="download_btn_row p-2 rounded"
                                                            >
                                                                <img src={downloadIcon} alt="download" className="w-6 h-6" />
                                                            </button>
                                                        )}


                                                        <button className="delete_btn_row p-2 rounded">
                                                            <img src={deleteIcon} alt="delete" className="w-6 h-6" />
                                                        </button>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>

                                </div>
                            )
                        }
                    </div>
                    {/* Pagination */}
                    <div className='pagination1 flex justify-center mt-4'>
                        {visiblePageNumbers().map(number => (
                            <button
                                key={number}
                                onClick={() => paginate(number)}
                                className={`pagination-button1 px-4 py-2 mx-2 border rounded ${currentPage === number ? 'bg-blue-500 text-white' : 'bg-white text-blue-500'}`}
                            >
                                {number}
                            </button>
                        ))}
                    </div>
                </div>
            ) : (
                <div className='empty-state flex justify-center content-center flex-col w-full h-full'>
                    <div>
                        <img src={emptyImage} alt='Trạng thái trống' className='empty-image' />
                        <p>Chưa có tệp nào được nạp.</p>
                        <Link to='/update-file' className='home-link'>
                            Quay về trang UpdateFile
                        </Link>

                    </div>
                </div>
            )}

        </div>


    );
}
export default ManageFile;