import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Thêm import Link
import './search.scss';
import searchIcon from '../assets/Vector.png';
import fileIcon from '../assets/device-fill.png';
import downloadIcon from '../assets/download-white.png';
import emptyImage from '../assets/empty_file_2.png'
function Search({ convertedFiles, authStatus }) {
    const [file, setFile] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        if (authStatus === 'user' || authStatus === 'guest') {
            setFile(convertedFiles);
        } else {
            setFile([]); // Đặt lại file khi đăng xuất (authStatus === null)
        }
    }, [convertedFiles, authStatus]);

    const handleDownload = (fileName) => {
        console.log(`Tải xuống file: ${fileName}`);
    };

    const handleDelete = (fileName) => {
        setFile((prevFiles) => prevFiles.filter(file => file.title !== fileName));
        console.log(`Đã xóa file: ${fileName}`);
    };

    const filteredFiles = file.filter((val) =>
        (val.title && val.title.toLowerCase().includes(searchTerm.toLowerCase())) ||
        (val.information && val.information.toLowerCase().includes(searchTerm.toLowerCase()))
    );

    return (
        <div className='p-2 w-full h-full'>
            {filteredFiles.length > 0 ? (
                <div className='search' style={{ display: 'flex', flexDirection: 'column' }}>
                    <div className='search-wrapper'>
                        <div className='search-typing'>
                            <div className='search-icon'>
                                <img src={searchIcon} alt='search icon' />
                            </div>
                            <div className='search-typing-location'>
                                <input
                                    type='text'
                                    placeholder='Nhập nội dung bạn muốn tìm...'
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>
                    <div className='search-file'>
                        {filteredFiles.map((val, key) => (
                            <div key={key} className='search-file_wrapper'>
                                <div className='file-wrapper'>
                                    <div className='file-icon'>
                                        <img src={fileIcon} alt='img file' />
                                    </div>
                                    <div className='file-title'>{val.title}</div>
                                    <div className='file-action'>
                                        <div className='download-action' onClick={() => handleDownload(val.title)}>
                                            <img src={downloadIcon} alt='download' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            ) : (
                <div className='empty-state flex justify-center  w-full h-full mt-7'>
                    <div>
                        <img src={emptyImage} alt='Trạng thái trống' className='empty-image' />
                        <p>Chưa có tệp nào được nạp.</p>
                        <Link to='/home' className='home-link'>
                            Quay về trang Home
                        </Link>
                    </div>
                </div>
            )}
        </div>
    );
}

export default Search;