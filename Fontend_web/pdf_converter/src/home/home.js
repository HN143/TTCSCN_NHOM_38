import React, { useState } from "react";
import './home.scss';
import pdfIcon from '../assets/filePdf-mau.png';
import docxIcon from '../assets/docx-mau.png';
import deleteIcon from '../assets/delete-bin-5-white.png';
import downUpload from '../assets/download-upload.png';
import { useNavigate } from 'react-router-dom';
import ticked from '../assets/ticked.png';
import { uploadFileDOC, uploadFilePDF } from '../services/pdfService'; // Import hàm gửi file từ file service
function Home({ onFileConvert }) {
    const [selectedFile, setSelectedFile] = useState(null);
    const [fileInfo, setFileInfo] = useState(null);
    const [selectedFormat, setSelectedFormat] = useState(null);
    const [isLoading, setIsLoading] = useState(false); // Trạng thái loading
    const navigate = useNavigate();


    const formatFileSize = (size) => {
        if (size < 1024) return `${size} B`;
        else if (size < 1024 * 1024) return `${(size / 1024).toFixed(2)} KB`;
        else if (size < 1024 * 1024 * 1024) return `${(size / (1024 * 1024)).toFixed(2)} MB`;
        else return `${(size / (1024 * 1024 * 1024)).toFixed(2)} GB`;
    };



    const handleFileChange = (event) => {
        const file = event.target.files[0];
        if (file) {
            const fileSizeInKB = (file.size / 1024).toFixed(2); // Kích thước file tính bằng KB
            setFileInfo({
                name: file.name,
                size: formatFileSize(file.size),
            });
        }
        setSelectedFile(file);
    };

    const handleRemoveFile = () => {
        setSelectedFile(null);
        setSelectedFormat(null);
    };



    const handleFormatSelect = (format) => {
        setSelectedFormat(format);
    };

    const handleConvert = async () => {
        if (selectedFile && selectedFormat) {
            setIsLoading(true);
            if (selectedFormat == 'pdf') {
                // đây là định dạng pdf
                try {
                    // Gửi file và định dạng qua server
                    const convertedFile = await uploadFilePDF(selectedFile, selectedFormat);

                    // Xử lý dữ liệu trả về từ server
                    onFileConvert(convertedFile);
                    navigate('/search');
                } catch (error) {
                    console.error('Lỗi trong quá trình chuyển đổi:', error);
                    alert('Chuyển đổi thất bại, vui lòng thử lại!');
                } finally {
                    setIsLoading(false);
                }
            }
            else if (selectedFormat == 'doc') {
                // đây là định dạng pdf
                try {
                    // Gửi file và định dạng qua server
                    const convertedFile = await uploadFileDOC(selectedFile, selectedFormat);

                    // Xử lý dữ liệu trả về từ server
                    onFileConvert(convertedFile);
                    navigate('/search');
                } catch (error) {
                    console.error('Lỗi trong quá trình chuyển đổi:', error);
                    alert('Chuyển đổi thất bại, vui lòng thử lại!');
                } finally {
                    setIsLoading(false);
                }
            }


        } else {
            alert("Vui lòng chọn file và định dạng chuyển đổi!");
        }
    };

    return (
        <div className="home-wrapper">
            <div className="home-content">
                {/* Overlay hiển thị khi loading */}
                {isLoading && (
                    <div className="loading-overlay">
                        <div className="loading-spinner"></div>
                        <p style={
                            { color: 'white', marginLeft: '20px' }
                        }>Đang chuyển đổi, vui lòng đợi...</p>
                    </div>
                )}

                {!selectedFile ? (
                    <>
                        <div style={{ fontFamily: 'roboto' }} className="home-content_tilte">
                            Chuyển đổi thông minh tệp PDF của bạn
                        </div>
                        <div className="home-content_button">
                            <input
                                type="file"
                                accept=".pdf"
                                onChange={handleFileChange}
                                style={{ display: 'none' }}
                                id="file-upload"
                            />
                            <label htmlFor="file-upload" className="button1">
                                Chọn tệp / File PDF
                            </label>
                        </div>
                    </>
                ) : (
                    <div style={{ display: 'flex', alignItems: 'center' }}>
                        <div className="uploaded-content">
                            <div className="uploader-content-left">
                                <div style={{ display: 'flex', justifyContent: 'center', flexDirection: 'column' }}>
                                    <div className="file-Icon-red flex content-center justify-center">
                                        <img src={pdfIcon} alt="pdf" />
                                    </div>
                                    <div className="file-name">{fileInfo.name}</div>
                                    <div className="file-name text-blue-600 mb-0">{fileInfo.size}</div>
                                </div>
                                <button className="upload-button delete-file" onClick={handleRemoveFile}>
                                    <img src={deleteIcon} alt="delete" />
                                </button>
                            </div>
                        </div>

                        <div>
                            <div style={{ fontSize: '22px', marginBottom: '10px', textAlign: 'center' }}>
                                Chọn phương hướng chuyển đổi
                            </div>
                            <div className="uploader-content-right p-5">
                                <div onClick={() => handleFormatSelect('doc')} className={`file-word flex-col`}>
                                    <div className="word-icon">
                                        <img src={docxIcon} alt="docx" />
                                    </div>
                                    <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>
                                        File .doc
                                    </div>
                                    <div style={{ position: 'absolute', top: '-10px', right: '-12px' }} className={`${selectedFormat === 'doc' ? 'selected' : 'hiden'}`}>
                                        <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
                                    </div>
                                </div>

                                <div onClick={() => handleFormatSelect('pdf')} className="file-pdf flex-col">
                                    <div className="pdf-icon">
                                        <img src={pdfIcon} alt="pdf" />
                                    </div>
                                    <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>
                                        File .pdf
                                    </div>
                                    <div style={{ position: 'absolute', top: '-10px', right: '-12px' }} className={`${selectedFormat === 'pdf' ? 'selected' : 'hiden'}`}>
                                        <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
                                    </div>
                                </div>
                            </div>

                            <div style={{ width: '100%', height: '80px', display: 'flex', alignItems: 'center' }}>
                                {selectedFormat && (
                                    <button className="button-download" style={{ margin: '0 auto' }} onClick={handleConvert}>
                                        Chuyển đổi
                                        <img style={{ marginLeft: '6px' }} src={downUpload} alt="upload" />
                                    </button>
                                )}
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}

export default Home;






















// import React, { useState } from "react";
// import './home.scss';
// import pdfIcon from '../assets/filePdf-mau.png';
// import docxIcon from '../assets/docx-mau.png';
// import deleteIcon from '../assets/delete-bin-5-white.png';
// import downUpload from '../assets/download-upload.png';
// import { useNavigate } from 'react-router-dom';
// import ticked from '../assets/ticked.png';

// function Home({ onFileConvert }) {
//     const [selectedFile, setSelectedFile] = useState(null);
//     const [selectedFormat, setSelectedFormat] = useState(null);
//     const navigate = useNavigate();

//     const handleFileChange = (event) => {
//         const file = event.target.files[0];
//         setSelectedFile(file);
//     };

//     const handleRemoveFile = () => {
//         setSelectedFile(null);
//         setSelectedFormat(null);
//     };

//     const handleFormatSelect = (format) => {
//         setSelectedFormat(format);
//     };

//     const handleConvert = () => {
//         if (selectedFile && selectedFormat) {
//             const convertedFile = {
//                 title: `${selectedFile.name.split('.')[0]}.${selectedFormat}`,
//                 information: 'Thông tin về file',
//                 fileType: selectedFormat,
//             };

//             onFileConvert(convertedFile);
//             navigate('/search'); // Navigate to search after conversion
//         }
//     };

//     return (
//         <div className="home-wrapper">
//             <div className="home-content">
//                 {!selectedFile ? (
//                     <>
//                         <div style={{ fontFamily: 'roboto' }} className="home-content_tilte">
//                             Chuyển đổi thông minh tệp PDF của bạn
//                         </div>
//                         <div className="home-content_button">
//                             <input
//                                 type="file"
//                                 accept=".pdf"
//                                 onChange={handleFileChange}
//                                 style={{ display: 'none' }}
//                                 id="file-upload"
//                             />
//                             <label htmlFor="file-upload" className="button1">
//                                 Chọn tệp / File PDF
//                             </label>
//                         </div>
//                     </>
//                 ) : (
//                     <div style={{ display: 'flex', alignItems: 'center' }}>
//                         <div className="uploaded-content">
//                             <div className="uploader-content-left">
//                                 <div style={{ display: 'flex', justifyContent: 'center', flexDirection: 'column' }}>
//                                     <div className="file-Icon-red">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div className="file-name">{selectedFile.name}</div>
//                                 </div>
//                                 <button className="upload-button delete-file" onClick={handleRemoveFile}>
//                                     <img src={deleteIcon} alt="delete" />
//                                 </button>
//                             </div>
//                         </div>

//                         <div>
//                             <div style={{ fontSize: '22px', marginBottom: '10px', textAlign: 'center' }}>
//                                 Chọn phương hướng chuyển đổi
//                             </div>
//                             <div className="uploader-content-right">
//                                 <div onClick={() => handleFormatSelect('doc')} className={`file-word`}>
//                                     <div className="word-icon">
//                                         <img src={docxIcon} alt="docx" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>
//                                         File .doc
//                                     </div>
//                                     <div style={{ position: 'absolute', top: '-10px', right: '-12px' }} className={`${selectedFormat === 'doc' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>

//                                 <div onClick={() => handleFormatSelect('pdf')} className="file-pdf">
//                                     <div className="pdf-icon">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>
//                                         File .pdf
//                                     </div>
//                                     <div style={{ position: 'absolute', top: '-10px', right: '-12px' }} className={`${selectedFormat === 'pdf' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>
//                             </div>

//                             <div style={{ width: '100%', height: '80px', display: 'flex', alignItems: 'center' }}>
//                                 {selectedFormat && (
//                                     <button className="button-download" style={{ margin: '0 auto' }} onClick={handleConvert}>
//                                         Chuyển đổi
//                                         <img style={{ marginLeft: '6px' }} src={downUpload} alt="upload" />
//                                     </button>
//                                 )}
//                             </div>
//                         </div>
//                     </div>
//                 )}
//             </div>
//         </div>
//     );
// }

// export default Home;
















// import React, { useState } from 'react';
// import './home.scss';
// import pdfIcon from '../assets/filePdf-mau.png';
// import docxIcon from '../assets/docx-mau.png';
// import deleteIcon from '../assets/delete-bin-5-white.png';
// import downUpload from '../assets/download-upload.png';
// import { useNavigate } from 'react-router-dom';
// import ticked from '../assets/ticked.png';

// function Home({ onFileConvert }) { // Thêm props onFileConvert
//     const [selectedFile, setSelectedFile] = useState(null);
//     const [selectedFormat, setSelectedFormat] = useState(null);
//     const navigate = useNavigate();
//     const handleFileChange = (event) => {
//         const file = event.target.files[0];
//         setSelectedFile(file);
//     };

//     const handleRemoveFile = () => {
//         setSelectedFile(null);
//         setSelectedFormat(null);
//     };

//     const handleFormatSelect = (format) => {
//         setSelectedFormat(format);
//     };

//     const handleConvert = () => {
//         if (selectedFile && selectedFormat) {
//             // Logic chuyển đổi file
//             // const convertedFile = {
//             //     name: `${selectedFile.name.split('.')[0]}.${selectedFormat}`,
//             //     type: selectedFormat,
//             // };

//             const convertedFile = {
//                 title: `${selectedFile.name.split('.')[0]}.${selectedFormat}`, // Tên file
//                 information: 'Thông tin về file', // Bạn có thể thay đổi thông tin này tùy ý
//                 fileType: selectedFormat, // Định dạng file
//             };


//             // Gọi hàm onFileConvert để truyền file đã chuyển đổi đến component cha
//             onFileConvert(convertedFile);
//             navigate('/search');

//         }
//     };

//     return (
//         <div className="home-wrapper">
//             <div className="home-content">
//                 {!selectedFile ? (
//                     <>
//                         <div style={{ fontFamily: 'roboto' }} className="home-content_tilte">Chuyển đổi thông minh tệp PDF của bạn</div>
//                         <div className="home-content_button">
//                             <input
//                                 type="file"
//                                 accept=".pdf"
//                                 onChange={handleFileChange}
//                                 style={{ display: 'none' }}
//                                 id="file-upload"
//                             />
//                             <label htmlFor="file-upload" className="button1">
//                                 Chọn tệp / File PDF
//                             </label>
//                         </div>
//                     </>
//                 ) : (
//                     <div style={{ display: 'flex', alignItems: 'center' }}>
//                         <div className="uploaded-content">
//                             <div className="uploader-content-left">
//                                 <div style={{ display: 'flex', justifyContent: 'center', flexDirection: 'column' }}>
//                                     <div className="file-Icon-red">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div className="file-name">{selectedFile.name}</div>
//                                 </div>
//                                 <button className="upload-button delete-file" onClick={handleRemoveFile}>
//                                     <img src={deleteIcon} alt="delete" />
//                                 </button>
//                             </div>
//                         </div>

//                         <div>
//                             <div style={{ fontSize: '22px', marginBottom: '10px', textAlign: 'center' }}>Chọn phương hướng chuyển đổi</div>
//                             <div className="uploader-content-right">
//                                 <div onClick={() => handleFormatSelect('doc')} className={`file-word `}>
//                                     <div className="word-icon">
//                                         <img src={docxIcon} alt="docx" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>File .doc</div>
//                                     <div style={{ position: 'absolute', top: '-28px', right: '-12px' }} className={` ${selectedFormat === 'doc' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>

//                                 <div onClick={() => handleFormatSelect('pdf')} className="file-pdf">
//                                     <div className="pdf-icon">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>File .pdf</div>
//                                     <div style={{ position: 'absolute', top: '-28px', right: '-12px' }} className={` ${selectedFormat === 'pdf' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>
//                             </div>

//                             <div style={{ width: '100%', height: '80px', display: 'flex', alignItems: 'center' }}>

//                                 {selectedFormat ? (<button className="button-download" style={{ margin: '0 auto' }} onClick={handleConvert}>Chuyển đổi
//                                     <img style={{ marginLeft: '6px' }} src={downUpload} alt="upload" />
//                                 </button>) : ""}
//                             </div>
//                         </div>
//                     </div>
//                 )}
//             </div>
//         </div>
//     );
// }

// export default Home;












// import React, { useState } from 'react';
// import './home.scss';
// import pdfIcon from '../assets/filePdf-mau.png';
// import docxIcon from '../assets/docx-mau.png';
// import deleteIcon from '../assets/delete-bin-5-white.png';
// import downUpload from '../assets/download-upload.png';
// import ticked from '../assets/ticked.png'
// function Home() {
//     const [selectedFile, setSelectedFile] = useState(null);
//     const [selectedFormat, setSelectedFormat] = useState(null); // State mới để lưu định dạng đã chọn

//     const handleFileChange = (event) => {
//         const file = event.target.files[0];
//         setSelectedFile(file);
//     };

//     const handleRemoveFile = () => {
//         setSelectedFile(null);
//         setSelectedFormat(null); // Reset định dạng khi xoá file
//     };

//     const handleFormatSelect = (format) => {
//         setSelectedFormat(format);
//         console.log(format)
//     };

//     return (
//         <div className="home-wrapper">
//             <div className="home-content">
//                 {!selectedFile ? (
//                     <>
//                         <div style={{ fontFamily: 'roboto' }} className="home-content_tilte">Chuyển đổi thông minh tệp PDF của bạn</div>
//                         <div className="home-content_button">
//                             <input
//                                 type="file"
//                                 accept=".pdf"
//                                 onChange={handleFileChange}
//                                 style={{ display: 'none' }}
//                                 id="file-upload"
//                             />
//                             <label htmlFor="file-upload" className="button1">
//                                 Chọn tệp / File PDF
//                             </label>
//                         </div>
//                     </>
//                 ) : (
//                     <div style={{ display: 'flex', alignItems: 'center' }}>
//                         <div className="uploaded-content">
//                             <div className="uploader-content-left">
//                                 <div style={{ display: 'flex', justifyContent: 'center', flexDirection: 'column' }}>
//                                     <div className="file-Icon-red">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div className="file-name">{selectedFile.name}</div>
//                                 </div>

//                                 <button className="upload-button delete-file" onClick={handleRemoveFile}>
//                                     <img src={deleteIcon} alt="delete" />
//                                 </button>
//                             </div>
//                         </div>

//                         <div>
//                             <div style={{ fontSize: '22px', marginBottom: '10px', textAlign: 'center' }}>Chọn phương hướng chuyển đổi</div>
//                             <div className="uploader-content-right">
//                                 <div onClick={() => handleFormatSelect('doc')} className={`file-word `}>
//                                     <div className="word-icon">
//                                         <img src={docxIcon} alt="docx" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>File .doc</div>
//                                     <div style={{ position: 'absolute', top: '-28px', right: '-12px' }} className={` ${selectedFormat === 'doc' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>

//                                 <div onClick={() => handleFormatSelect('pdf')} className="file-pdf">
//                                     <div className="pdf-icon">
//                                         <img src={pdfIcon} alt="pdf" />
//                                     </div>
//                                     <div style={{ fontSize: '20px', textAlign: 'center', marginTop: '22px' }}>File .pdf</div>

//                                     <div style={{ position: 'absolute', top: '-28px', right: '-12px' }} className={` ${selectedFormat === 'pdf' ? 'selected' : 'hiden'}`}>
//                                         <img style={{ width: '24px', height: '24px' }} src={ticked} alt='ticked'></img>
//                                     </div>
//                                 </div>
//                             </div>

//                             <div style={{ width: '100%', height: '80px', display: 'flex', alignItems: 'center' }}>
//                                 <button className="button-download" style={{ margin: '0 auto' }}>Chuyển đổi
//                                     <img style={{ marginLeft: '6px' }} src={downUpload} alt="upload" />
//                                 </button>
//                             </div>
//                         </div>
//                     </div>
//                 )}
//             </div>
//         </div>
//     );
// }

// export default Home;


