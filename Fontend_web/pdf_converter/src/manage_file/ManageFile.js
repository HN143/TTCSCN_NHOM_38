
import React, { useState, useEffect } from 'react';
import './manageFile.scss';
import searchIcon from '../assets/Vector.png';
import fileIcon from '../assets/device-fill.png';
import downloadIcon from '../assets/download-white.png';
import deleteIcon from '../assets/delete-bin-5-white.png';
import eyeIcon from '../assets/eye-line.png'
import { getListData } from '../services/pdfService';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
function ManageFile({ fileManage: initFile }) {



    const today = new Date()
    const [data, setData] = useState([]);
    const [notShow, setNotShow] = useState(true) //toggle lọc ngày
    //hàm toggle lọc file theo ngày
    const handleSpe = () => {
        setNotShow(false)
    }
    //hàm gửi yc lọc file theo ngày đến server
    const handleSentDay = () => {
        ///logic gọi api 

        //đóng box chọn ngày
        setNotShow(true)

    }

    useEffect(() => {
        const fetchData = async () => {
            const result = await getListData();
            setData(result);
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

    const FileLists = data.flatMap(doc =>
        doc.van_ban_list.map(file => ({
            id: file.id,
            name: file.name,
            type: file.type,
            original_file: file.original_file,
            converted_file: file.converted_file,
            text_content: file.text_content,
            active: file.active,
            convert: file.convert,
            clean: file.clean,
            data_chinh: file.data_chinh,
            van_ban: doc.id,
            ngay_tao: doc.ngay_tao,
            ngay_ban_hanh: doc.ngay_ban_hanh,
            so_ky_hieu: doc.so_ky_hieu,
            loai_van_ban: doc.loai_van_ban,
            nguoi_tao: doc.nguoi_tao,
            trich_yeu: doc.trich_yeu,
            don_vi_soan_thao: doc.don_vi_soan_thao,
            so_van_ban: doc.so_van_ban,
            do_mat: doc.do_mat,
            do_khan: doc.do_khan,
            nguoi_ky: doc.nguoi_ky
        }))
    );
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



    return (
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
                                        <button onClick={handleSentDay} className='btn_switch-tranfer-day text-white p-1 px-4 py-2 rounded'>Duyệt</button>
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
                                                <div className='download-action1 cursor-pointer' onClick={() => window.open(val.converted_file, '_blank')}>
                                                    <img src={eyeIcon} alt='preview' className='w-6 h-6' />
                                                </div>
                                                <div className='download-action1 cursor-pointer' onClick={() => handleDownload(val.title)}>
                                                    <img src={downloadIcon} alt='download' className='w-6 h-6' />
                                                </div>
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
                                                <button onClick={() => window.open(val.
                                                    converted_file, '_blank')} className="look_btn_row p-2 rounded">
                                                    <img src={eyeIcon} alt="preview" className="w-6 h-6" />
                                                </button>

                                                <button onClick={() => handleDownload(val.title)} className="download_btn_row p-2 rounded">
                                                    <img src={downloadIcon} alt="download" className="w-6 h-6" />
                                                </button>
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
    );
}
export default ManageFile;