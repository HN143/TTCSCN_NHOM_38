
import React, { useState, useEffect, useMemo } from 'react';
import './manageFile.scss';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faAngleDoubleLeft } from '@fortawesome/free-solid-svg-icons';
import { faAngleDoubleRight } from '@fortawesome/free-solid-svg-icons';
import { Link, useLocation, useNavigate } from 'react-router-dom'; // Thêm import Link
import searchIcon from '../assets/Vector.png';
import fileIcon from '../assets/device-fill.png';
import downloadIcon from '../assets/download-white.png';
import deleteIcon from '../assets/delete-bin-5-white.png';
import eyeIcon from '../assets/eye-line.png'
import tick from '../assets/Group 61.png'
import { getListData, getMergedDataByDate, getDataByDate, deleteFileById, changeAttribute, changeAttributeClean } from '../services/pdfService';
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
    const [isFavorite, setIsFavorite] = useState(false); // Trạng thái ban đầu là không yêu thích
    const [idfile, setIdfile] = useState(null); // Trạng thái ban đầu là không yêu thích
    const location = useLocation();
    const navigate = useNavigate();
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

    const handleCancel = () => {
        setData1(data)
        setIsFavorite(false)
        setIsFilterMode(false)
    }

    const favorite = () => {
        setIsFavorite(!isFavorite); // Đổi trạng thái mỗi lần nhấn
    }


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
            if (newFilteredData.length > 0) {
                setFilteredData(newFilteredData)
                setData1(newFilteredData)
            } else {
                alert('Không có flie')
                setFilteredData(data); // Khôi phục dữ liệu ban đầu
            }

            setNotShow(true); // Đóng box chọn ngày
        } catch (error) {
            console.error('Failed to fetch data by date:', error);
        }
    };


    useEffect(() => {
        const storedPage = localStorage.getItem('currentPage'); // Lấy trang từ localStorage
        if (storedPage) {
            setCurrentPage(Number(storedPage)); // Nếu có, đặt lại trang hiện tại từ localStorage
        }
    }, []);


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
    const [isFilterMode, setIsFilterMode] = useState(false)


    const FileLists = useMemo(() =>
        data1?.flatMap(doc =>
            doc?.van_ban_list?.map(file => {
                // Chuyển đổi ngày từ timestamp sang định dạng 'DD/MM/YYYY'
                const formatDate = (timestamp) => {
                    if (!timestamp) return 'N/A';
                    const date = new Date(timestamp);
                    const day = String(date.getDate()).padStart(2, '0');
                    const month = String(date.getMonth() + 1).padStart(2, '0');
                    const year = date.getFullYear();
                    return `${day}/${month}/${year}`;
                };

                return {
                    id: file?.id || null,
                    name: file?.name || 'Unknown',
                    type: file?.type || 'Unknown',
                    original_file: file?.original_file || null,
                    converted_file: file?.converted_file || null,
                    download_converted_file: file?.download_converted_file || null,
                    download_original_file: file?.download_original_file || null,
                    text_content: file?.text_content?.replace(/\s+/g, ' ').trim() || '',
                    active: file?.active || false,
                    convert: file?.convert || false,
                    clean: file?.clean || false,
                    data_chinh: file?.data_chinh || null,
                    van_ban: doc?.id || null,
                    ngay_tao: formatDate(doc?.ngay_tao),
                    ngay_ban_hanh: formatDate(doc?.ngay_ban_hanh),
                    so_ky_hieu: doc?.so_ky_hieu || 'N/A',
                    loai_van_ban: doc?.loai_van_ban || 'Unknown',
                    nguoi_tao: doc?.nguoi_tao || 'Unknown',
                    trich_yeu: doc?.trich_yeu || '',
                    don_vi_soan_thao: doc?.don_vi_soan_thao || 'Unknown',
                    so_van_ban: doc?.so_van_ban || 'Unknown',
                    do_mat: doc?.do_mat || 'Unknown',
                    do_khan: doc?.do_khan || 'Unknown',
                    nguoi_ky: doc?.nguoi_ky || 'Unknown',
                };
            })
        ) || [] // Fallback giá trị rỗng nếu `data` không hợp lệ
        , [data1]);


    const [isGridView, setGridView] = useState(false) // setup hiển thị grid hay table
    // Update filesPerPage based on screen width
    useEffect(() => {
        const updateFilesPerPage = () => {
            setScreenWidth(window.innerWidth);
            if (window.innerWidth <= 640) {
                setFilesPerPage(6); // Mobile view
            } else if (window.innerWidth <= 1024) {
                setFilesPerPage(10); // Tablet view
            } else {
                setFilesPerPage(15); // Desktop view
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
        ].filter(suggestion => suggestion.value.trim().length > 0); // Lọc gợi ý không trống

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

    const normalizeString = (str) => {
        return str
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "") // Loại bỏ dấu tiếng Việt
            .toLowerCase()
            .trim(); // Chuyển về chữ thường và loại bỏ khoảng trắng thừa
    };


    // Lọc file dựa trên tags và searchTerm
    const filteredFiles = FileLists.filter(file => {
        // Lọc theo tags
        const matchesTags = tags.every(tag => {
            if (tag.type === 'Tên file') {
                return file.name?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Đơn vị soạn') {
                return file.don_vi_soan_thao && file.don_vi_soan_thao.toLowerCase().includes(tag.value.toLowerCase()); // Kiểm tra null/undefined
            } else if (tag.type === 'Số/kí hiệu') {
                return file.so_ky_hieu?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Trích yếu') {
                return file.trich_yeu?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Loại văn bản') {
                return file.loai_van_ban?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Ngày ban hành') {
                return file.ngay_ban_hanh?.toLowerCase().includes(tag.value.toLowerCase());
            } else if (tag.type === 'Nội dung') {
                //return file.text_content?.toLowerCase().includes(tag.value.toLowerCase());
                return normalizeString(file.text_content || '').includes(normalizeString(tag.value));

            }
            return true; // Nếu không có tag phù hợp
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


    const handleDelete = async (id) => {
        const isConfirmed = window.confirm("Bạn có chắc chắn muốn xóa?");

        if (!isConfirmed) {
            console.log("Hủy xóa");
            return; // Nếu người dùng không xác nhận, dừng lại không làm gì
        }

        try {
            const data = await deleteFileById(id);
            // Sau khi xóa thành công, tải lại dữ liệu từ server
            const result = await getListData(); // Gọi lại API để lấy dữ liệu mới
            setOriginalData(result); // Cập nhật lại dữ liệu gốc
            setData(result); // Cập nhật lại dữ liệu hiển thị
            setData1(result); // Cập nhật lại dữ liệu trong `data1`


        } catch (e) {
            console.error('error delete file ', e)
        }
    }

    const handleFavorite = async (id, name, type, text_content, van_ban, newCleanStatus) => {
        console.log(id); // In ra id để kiểm tra
        // const isConfirmed = window.confirm("Bạn có chắc chắn muốn thêm vào yêu thích?");

        // if (!isConfirmed) {
        //     console.log("Hủy");
        //     return; // Nếu người dùng không xác nhận, dừng lại không làm gì
        // }

        try {
            // Gọi hàm changeAttribute để cập nhật thuộc tính 'clean' thành true
            const data = await changeAttribute(id, name, type, text_content, van_ban, !newCleanStatus);

            // Sau khi cập nhật thành công, tải lại dữ liệu từ server
            const result = await getListData(); // Gọi lại API để lấy dữ liệu mới

            setOriginalData(result); // Cập nhật lại dữ liệu gốc
            setData(result); // Cập nhật lại dữ liệu hiển thị
            setData1(result); // Cập nhật lại dữ liệu trong `data1`
        } catch (e) {
            console.error('Lỗi khi cập nhật yêu thích: ', e);
        }
    };


    //set the index per page
    const indexOfLastFile = currentPage * filesPerPage;
    const indexOfFirstFile = indexOfLastFile - filesPerPage;
    const currentFiles = filteredFiles.slice(indexOfFirstFile, indexOfLastFile);
    const totalPages = Math.ceil(filteredFiles.length / filesPerPage);


    const paginate = (pageNumber) => {
        setCurrentPage(pageNumber);
        localStorage.setItem('currentPage', pageNumber); // Lưu vào localStorage
    }

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



    const handleShowFavo = () => {
        // // Giả sử bạn đang lưu trữ danh sách các file trong state `data` hoặc `originalData`
        // const favoriteFiles = FileLists.filter(file => file.clean === true);
        const result = data1.map(entry => ({
            ...entry,
            van_ban_list: entry.van_ban_list.filter(file => file.clean)
        }));

        setIsFilterMode(true)

        if (result.length > 0) {
            setData1(result)
        } else {
            alert('Không có file yêu thích nào!');
        }
        setIsFavorite(true)
    };


    return (
        <div>
            {isHaveFile ? (
                <div style={{ height: '86vh', overflowY: 'auto' }} className='p-2'>
                    <div className="search-bar w-full">
                        <div className="tags flex flex-wrap mb-2 ">
                            {tags.map((tag, index) => (
                                <div key={index} className="tag bg-blue-500 text-white px-3 py-1  rounded-full mr-2 mb-2 flex items-center ">
                                    <div title={`${tag.type}: ${tag.value}`} className='max-w-[300px] truncate'> {`${tag.type}: ${tag.value}`}</div>
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
                                    Bảng
                                </button>
                                <button onClick={() => setGridView(true)} className={`py-2 px-6 font-semibold rounded-md ${isGridView ? 'bg-blue-500 text-white' : 'bg-gray-200 text-black'}`}>
                                    Lưới
                                </button>
                            </div>


                            <div className='flex content-center items-center'>
                                <div>
                                    <div className='mr-4'>
                                        {
                                            isFavorite ? (
                                                <div style={{ backgroundColor: 'red' }} className='btn_switch-tranfer-day cursor-pointer text-white p-1 px-4 py-2 rounded' onClick={handleCancel}>
                                                    Hủy
                                                </div>
                                            ) : (<div className='btn_switch-tranfer-day text-white cursor-pointer p-1 px-4 py-2 rounded' onClick={handleShowFavo}>
                                                Đánh dấu
                                            </div>)

                                        }

                                    </div>

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
                                                <div style={{ marginTop: '4px' }} className='flex content-center'>
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

                    </div>
                    <div className='' style={{ padding: '4px' }}>
                        {isGridView ? (
                            <div className='wrap-container1  mt-9'>
                                <div className="container   mx-auto px-4">
                                    <div className="grid  grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-9">
                                        {currentFiles.map((val, key) => (
                                            <div
                                                key={key}
                                                onClick={() => navigate(`/manage-file/info/${val.id}`, { state: { file: val } })}
                                                className="relative group cursor-pointer"
                                            >
                                                <div className="bg-white p-4 rounded-lg shadow-md flex flex-col relative">

                                                    {/* Các nút hành động (Preview, Download, Delete) */}
                                                    <div className="absolute top-[-8px] right-[-1px] flex space-x-2 z-20">
                                                        {/* Preview Action */}
                                                        <div
                                                            className={`cursor-pointer p-2 rounded-full ${val.convert ? 'bg-customGreen hover:bg-customHoverGreen' : 'bg-gray-400'}`}
                                                            onClick={(e) => {
                                                                const link = val.download_converted_file || val.download_original_file;
                                                                e.stopPropagation(); // Ngừng sự kiện bấm để không làm hover
                                                                if (link) window.open(link, '_blank');
                                                            }}
                                                        >
                                                            <img src={eyeIcon} alt="preview" className="w-6 h-6" />
                                                        </div>
                                                        {/* Download Action */}
                                                        <div
                                                            className={`cursor-pointer p-2 rounded-full ${val.convert ? 'bg-customGreen hover:bg-customHoverGreen' : 'bg-gray-400'}`}
                                                            onClick={async (e) => {
                                                                e.stopPropagation();
                                                                const link = val.download_converted_file || val.download_original_file;
                                                                if (link) {
                                                                    const response = await fetch(link);
                                                                    const blob = await response.blob();
                                                                    const url = window.URL.createObjectURL(blob);
                                                                    const a = document.createElement('a');
                                                                    a.href = url;
                                                                    a.download = val.name || 'file';
                                                                    document.body.appendChild(a);
                                                                    a.click();
                                                                    document.body.removeChild(a);
                                                                }
                                                            }}
                                                        >
                                                            <img src={downloadIcon} alt="download" className="w-6 h-6" />
                                                        </div>
                                                        {/* Delete Action */}
                                                        <div className="cursor-pointer p-2 rounded-full bg-red-500 hover:bg-red-600">
                                                            <img
                                                                onClick={(e) => {
                                                                    e.stopPropagation();
                                                                    handleDelete(val.id);
                                                                }}
                                                                src={deleteIcon} alt="delete" className="w-6 h-6" />
                                                        </div>
                                                    </div>

                                                    {/* Icon của file */}
                                                    <div className="flex justify-center mb-4">
                                                        <img src={fileIcon} alt="file icon" className="w-16 h-16 object-contain" />
                                                    </div>

                                                    {/* Tên file */}
                                                    <div className="text-lg font-semibold text-center text-gray-700 truncate">{val.name}</div>

                                                    {/* Phần thông tin chi tiết khi hover */}
                                                    <div
                                                        className="absolute left-0 bg-white p-4 rounded-lg shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-opacity duration-500 z-50"
                                                        style={{
                                                            top: '36px', // Vị trí cho màn hình lớn
                                                            transitionDelay: '0.8s',
                                                        }}
                                                    >
                                                        <p>
                                                            <strong>Tên file:</strong> {val.name}
                                                        </p>
                                                        <p>
                                                            <strong>Đơn vị soạn:</strong> {val.don_vi_soan_thao || 'Không xác định'}
                                                        </p>
                                                        <p>
                                                            <strong>Số/kí hiệu:</strong> {val.so_ky_hieu}
                                                        </p>
                                                        <p>
                                                            <strong>Trích yếu:</strong> {val.trich_yeu}
                                                        </p>
                                                        <p>
                                                            <strong>Loại văn bản:</strong> {val.loai_van_ban || 'Không xác định'}
                                                        </p>
                                                        <p>
                                                            <strong>Ngày ban hành:</strong> {val.ngay_ban_hanh || 'Không xác định'}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            </div>


                        )
                            : (
                                <div className="table-view max-h-[400px] overflow-x-auto overflow-y-auto">
                                    <table className="table-auto min-w-full text-left border border-gray-300">
                                        <thead className="bg-gray-200">
                                            <tr>
                                                <th className="p-2 border border-gray-300">Tên file</th>
                                                <th className="p-2 border border-gray-300 hidden sm:table-cell">Đơn vị soạn</th>
                                                <th className="p-2 border border-gray-300 hidden md:table-cell">Số/kí hiệu</th>
                                                <th className="p-2 border border-gray-300">Trích yếu</th>
                                                <th className="p-2 border border-gray-300 hidden lg:table-cell">Loại văn bản</th>
                                                <th className="p-2 border border-gray-300 hidden lg:table-cell">Ngày ban hành</th>
                                                <th className="p-2 border border-gray-300">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {currentFiles.map((val, key) => (
                                                <tr
                                                    key={key}
                                                    onClick={() =>
                                                        navigate(`/manage-file/info/${val.id}`, {
                                                            state: { file: val },
                                                        })
                                                    }
                                                    className="hover:bg-gray-100 cursor-pointer"
                                                >
                                                    <td className="p-2 border border-gray-300 max-w-[100px] truncate">
                                                        {val.name}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 max-w-[100px] truncate hidden sm:table-cell">
                                                        {val.don_vi_soan_thao || 'Không xác định'}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 w-[180px] truncate hidden md:table-cell">
                                                        {val.so_ky_hieu || 'Không xác định'}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 max-w-[150px] truncate">
                                                        {val.trich_yeu || 'Không xác định'}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 w-[140px] truncate hidden lg:table-cell">
                                                        {val.loai_van_ban || 'Không xác định'}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 w-[180px] truncate hidden lg:table-cell">
                                                        {val.ngay_ban_hanh || 'Không xác định'}
                                                    </td>
                                                    <td className="p-2 border border-gray-300 w-[200px]">
                                                        <div className="flex gap-2 justify-around">
                                                            {/* Nút Preview */}
                                                            <button
                                                                onClick={(e) => {
                                                                    e.stopPropagation();
                                                                    const link = val.download_converted_file || val.download_original_file;
                                                                    if (link) window.open(link, '_blank');
                                                                }}
                                                                className={`p-2 rounded ${val.convert
                                                                    ? 'bg-customGreen hover:bg-customHoverGreen'
                                                                    : 'bg-gray-400'
                                                                    }`}
                                                            >
                                                                <img src={eyeIcon} alt="preview" className="w-5 h-5" />
                                                            </button>
                                                            {/* Nút Download */}
                                                            <button
                                                                onClick={async (e) => {
                                                                    e.stopPropagation();
                                                                    const link = val.download_converted_file || val.download_original_file;
                                                                    if (link) {
                                                                        const response = await fetch(link);
                                                                        const blob = await response.blob();
                                                                        const url = window.URL.createObjectURL(blob);
                                                                        const a = document.createElement('a');
                                                                        a.href = url;
                                                                        a.download = val.name || 'file';
                                                                        document.body.appendChild(a);
                                                                        a.click();
                                                                        document.body.removeChild(a);
                                                                    }
                                                                }}
                                                                className={`p-2 rounded ${val.convert
                                                                    ? 'bg-customGreen hover:bg-customHoverGreen'
                                                                    : 'bg-gray-400'
                                                                    }`}
                                                            >
                                                                <img src={downloadIcon} alt="download" className="w-5 h-5" />
                                                            </button>
                                                            {/* Nút Delete */}
                                                            <button
                                                                onClick={(e) => {
                                                                    e.stopPropagation();
                                                                    handleDelete(val.id);
                                                                }}
                                                                className="p-2 rounded bg-red-500 hover:bg-red-600"
                                                            >
                                                                <img src={deleteIcon} alt="delete" className="w-5 h-5" />
                                                            </button>
                                                            <button
                                                                onClick={(e) => {
                                                                    e.stopPropagation();
                                                                    console.log(val.clean)
                                                                    handleFavorite(val.id, val.name, val.type, val.text_content, val.van_ban, val.clean);
                                                                }}
                                                                className={`p-2 rounded ${val.clean ? ' bg-blue-400  hover:bg-blue-500' : 'bg-gray-400  hover:bg-gray-600'} ${isFilterMode && 'hidden'}`}
                                                            >
                                                                <img src={tick} alt="pick" className="w-5 h-5" />
                                                            </button>
                                                        </div>
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
                        {/* Nút đầu (First) */}
                        <button
                            onClick={() => paginate(1)}
                            className={`pagination-button1 px-4 py-2 mx-2 border rounded ${currentPage === 1 ? 'bg-blue-500 text-white' : 'bg-white text-blue-500'}`}
                        >
                            <FontAwesomeIcon icon={faAngleDoubleLeft} />
                        </button>

                        {/* Các trang hiện tại */}
                        {visiblePageNumbers().map(number => (
                            <button
                                key={number}
                                onClick={() => paginate(number)}
                                className={`pagination-button1 px-4 py-2 mx-2 border rounded ${currentPage === number ? 'bg-blue-500 text-white' : 'bg-white text-blue-500'}`}
                            >
                                {number}
                            </button>
                        ))}

                        {/* Nút cuối (Last) */}
                        <button
                            onClick={() => paginate(totalPages)}
                            className={`pagination-button1 px-4 py-2 mx-2 border rounded ${currentPage === totalPages ? 'bg-blue-500 text-white' : 'bg-white text-blue-500'}`}
                        >
                            <FontAwesomeIcon icon={faAngleDoubleRight} />
                        </button>
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