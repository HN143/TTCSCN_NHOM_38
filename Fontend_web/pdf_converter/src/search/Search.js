// import React, { useState, useEffect } from 'react';
// import { Link } from 'react-router-dom'; // Thêm import Link
// import './search.scss';
// import searchIcon from '../assets/Vector.png';
// import fileIcon from '../assets/device-fill.png';
// import downloadIcon from '../assets/download-white.png';
// import emptyImage from '../assets/empty_file_2.png'
// import { deleteUserFileByID, getAllUserFile } from '../services/pdfService'
// function Search({ convertedFiles, authStatus }) {
//     const [file, setFile] = useState([]);
//     const [searchTerm, setSearchTerm] = useState('');
//     const [searchData, setSearchData] = useState([]);





//     useEffect(async () => {
//         if (authStatus === 'user' || authStatus === 'guest') {
//             const data = await getAllUserFile();
//             setFile(data);
//         } else {
//             setFile([]); // Đặt lại file khi đăng xuất (authStatus === null)
//         }
//     }, [convertedFiles, authStatus]);
//     console.log(convertedFiles)

//     const handleDownload = (fileUrl) => {
//         window.open(fileUrl, '_blank');
//         console.log(`Tải xuống file: ${fileUrl}`);
//     };

//     const handleDelete = (fileName) => {
//         setFile((prevFiles) => prevFiles.filter(file => file.title !== fileName));
//         console.log(`Đã xóa file: ${fileName}`);
//     };

//     const filteredFiles = file.filter((val) =>
//         (val.name && val.name.toLowerCase().includes(searchTerm.toLowerCase()))

//     );

//     return (
//         <div className='p-2 w-full h-full'>
//             {/* Thanh tìm kiếm */}
//             <div className='search-wrapper'>
//                 <div className='search-typing'>
//                     <div className='search-icon'>
//                         <img src={searchIcon} alt='search icon' />
//                     </div>
//                     <div className='search-typing-location'>
//                         <input
//                             type='text'
//                             placeholder='Nhập nội dung bạn muốn tìm...'
//                             value={searchTerm}
//                             onChange={(e) => setSearchTerm(e.target.value)}
//                         />
//                     </div>
//                 </div>
//             </div>

//             {/* Khu vực hiển thị file */}
//             {filteredFiles.length > 0 ? (
//                 <div className='search-file'>
//                     {filteredFiles.map((val, key) => (
//                         <div key={key} className='search-file_wrapper'>
//                             <div className='file-wrapper'>
//                                 <div className='file-icon'>
//                                     <img src={fileIcon} alt='img file' />
//                                 </div>
//                                 <div className='file-title'>{val.name}</div>
//                                 <div className='file-action'>
//                                     <div className='download-action' onClick={() => handleDownload(val.preview_file)}>
//                                         <img src={downloadIcon} alt='download' />
//                                     </div>
//                                 </div>
//                                 <div className='file-action'>
//                                     <div className='download-action' onClick={() => handleDownload(val.preview_file)}>
//                                         <img src={downloadIcon} alt='download' />
//                                     </div>
//                                 </div>
//                             </div>
//                         </div>
//                     ))}
//                 </div>
//             ) : (
//                 <div className='empty-state flex justify-center w-full h-full mt-7'>
//                     <div>
//                         <img src={emptyImage} alt='Trạng thái trống' className='empty-image' />
//                         <p>Chưa có tệp nào được nạp.</p>
//                         <Link to='/home' className='home-link'>
//                             Quay về trang Home
//                         </Link>
//                     </div>
//                 </div>
//             )}
//         </div>

//     );
// }

// export default Search;


import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import './search.scss';
import searchIcon from '../assets/Vector.png';
import fileIcon from '../assets/device-fill.png';
import downloadIcon from '../assets/download-white.png';
import deleteIcon from '../assets/delete-bin-5-white.png'
import emptyImage from '../assets/empty_file_2.png';
import { deleteUserFileByID, getAllUserFile } from '../services/pdfService';

function Search({ convertedFiles, authStatus }) {
    const [file, setFile] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        const fetchData = async () => {
            if (authStatus === 'user' || authStatus === 'guest') {
                const data = await getAllUserFile();
                console.log('Dữ liệu từ API:', data); // Kiểm tra dữ liệu
                setFile(data);
            } else {
                setFile([]);
            }
        };

        fetchData();

        return () => {
            // Thêm logic cleanup nếu cần
        };
    }, [convertedFiles, authStatus]);

    const handleDownload = (fileUrl) => {
        window.open(fileUrl, '_blank');
        console.log(`Tải xuống file: ${fileUrl}`);
    };

    const handleDelete = async (fileName, id) => {
        const res = await deleteUserFileByID(id);
        setFile((prevFiles) => prevFiles.filter((file) => file.name !== fileName));

        console.log(`Đã xóa file: ${fileName}`);
    };

    const filteredFiles = file.filter((val) =>
        val.name?.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <div className="p-4 w-full h-full bg-gray-50">
            <div className="w-full h-12 border border-gray-300 rounded-lg shadow-md flex items-center justify-between px-4 bg-white">
                <div className="flex w-full items-center space-x-2">
                    <img src={searchIcon} alt="search icon" className="w-6 h-6 text-gray-500" />
                    <input
                        type="text"
                        placeholder="Nhập file bạn muốn tìm..."
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        className="w-full px-3 py-2 text-lg border-none outline-none rounded-lg shadow-sm focus:ring-none"
                    />
                </div>
            </div>

            {filteredFiles.length > 0 ? (
                <div className="mt-8 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
                    {filteredFiles.map((val, key) =>
                        // val.preview_file && (
                        <div key={key} className="w-full h-auto bg-white shadow-lg rounded-lg border border-gray-200 hover:bg-gray-50 cursor-pointer transition ease-in-out transform hover:scale-105">
                            <div className="relative p-4 py-10">
                                <div className="flex justify-center mb-4">
                                    <img src={fileIcon} alt="file icon" className="w-16 h-16" />
                                </div>
                                <div className="text-center text-sm font-semibold text-gray-700 truncate">
                                    {val.name}
                                </div>
                                <div className="absolute top-2 right-2 flex space-x-2">
                                    <button
                                        className="bg-customGreen p-2 rounded-full text-white shadow hover:bg-primary-600"
                                        onClick={() => handleDownload(val.preview_file)}
                                    >
                                        <img src={downloadIcon} alt="download" className="w-5 h-5" />
                                    </button>
                                    <button
                                        className="bg-red-500 p-2 rounded-full text-white shadow hover:bg-red-600"
                                        onClick={() => handleDelete(val.name, val.id)}
                                    >
                                        <img src={deleteIcon} alt="delete" className="w-5 h-5" />
                                    </button>
                                </div>
                            </div>
                        </div>
                        //  )
                    )}
                </div>
            ) : (
                <div className="flex justify-center items-center w-full h-full ">
                    <div className="text-center">
                        <img src={emptyImage} alt="Trạng thái trống" className="w-64 mb-5 mx-auto" />
                        <p className="text-lg text-gray-600">Chưa có tệp nào được nạp.</p>
                        <Link to="/home" className="text-blue-500 text-lg hover:underline">
                            Quay về trang Home
                        </Link>
                    </div>
                </div>
            )}
        </div>
    );

}

export default Search;
