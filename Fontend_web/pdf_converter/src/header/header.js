// import './header.scss';
// import logo from '../assets/logo.png';
// import userIcon from '../assets/user-circle.png';
// import { useState } from 'react';
// import { useNavigate } from 'react-router-dom';
// import { deleteAllUserFile } from '../services/pdfService'
// import moreIcon from '../assets/more.png'
// function Header({ onLogout, onSidebarToggle }) { // Nhận prop onLogout
//     const [showTooltip, setShowTooltip] = useState(false);
//     const navigate = useNavigate();

//     const handleTooltipToggle = () => {
//         setShowTooltip(!showTooltip);
//     };

//     const handleLogout = async () => {
//         const res = await deleteAllUserFile();
//         localStorage.removeItem('isLoggedIn'); // Xóa thông tin trạng thái đăng nhập
//         localStorage.removeItem('premium'); // Xóa thông tin trạng thái đăng nhập
//         setShowTooltip(false); // Ẩn tooltip
//         onLogout(); // Gọi hàm onLogout từ props
//         navigate('/login'); // Điều hướng về trang đăng nhập
//     };

//     return (
//         <div className="wrapper-header">
//             <div className="header">

//                 <div className="headerIcon flex flex-row content-center items-center">
//                     <div className='w-6 mr-3' onClick={onSidebarToggle}> {/* Khi nhấn vào đây, gọi hàm toggle sidebar */}
//                         <img className='w-full' src={moreIcon} alt="more icon" />
//                     </div>
//                     <img src={logo} alt="logo" />
//                 </div>
//                 <div className="user-icon" onClick={handleTooltipToggle}>
//                     <img className='user-icon1' src={userIcon} alt="user icon" />
//                     {showTooltip && (
//                         <div className='toggle'>
//                             <div className='logout' onClick={handleLogout} style={{
//                                 width: '100%',
//                                 height: '100%',
//                                 display: 'grid',
//                                 placeItems: 'center',
//                                 textAlign: 'center',
//                                 cursor: 'pointer'
//                             }}>
//                                 Đăng xuất
//                             </div>
//                         </div>
//                     )}
//                 </div>
//             </div>
//         </div>
//     );
// }

// export default Header;
import './header.scss';
import logo from '../assets/logo.png';
import userIcon from '../assets/user-circle.png';
import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { deleteAllUserFile } from '../services/pdfService';
import { getUserById } from '../services/authService';
import moreIcon from '../assets/more.png';

function Header({ onLogout, onSidebarToggle }) {
    const [showTooltip, setShowTooltip] = useState(false);
    const [userInfo, setUserInfo] = useState(null); // Lưu thông tin người dùng
    const navigate = useNavigate();
    const userid = localStorage.getItem('id'); // Lấy user ID từ localStorage

    useEffect(() => {
        // Gọi API để lấy thông tin người dùng
        const getUserInfo = async () => {
            try {
                if (userid) {
                    const user = await getUserById(userid); // Truyền userID vào hàm API
                    setUserInfo(user); // Cập nhật thông tin người dùng
                } else {
                    console.warn('Không tìm thấy ID người dùng trong localStorage');
                }
            } catch (error) {
                console.error('Lỗi khi lấy thông tin người dùng:', error);
            }
        };
        getUserInfo();
    }, [userid, setUserInfo]);

    const handleTooltipToggle = () => {
        setShowTooltip(!showTooltip);
    };

    const handleLogout = async () => {
        try {
            await deleteAllUserFile();
            localStorage.removeItem('isLoggedIn');
            localStorage.removeItem('premium');
            localStorage.removeItem('id'); // Xóa ID người dùng
            setShowTooltip(false);
            onLogout();
            navigate('/login');
        } catch (error) {
            console.error('Lỗi khi đăng xuất:', error);
        }
    };

    return (
        <div className="wrapper-header">
            <div className="header">
                <div className="headerIcon flex flex-row content-center items-center">
                    <div className="w-6 mr-3" onClick={onSidebarToggle}>
                        <img className="w-full" src={moreIcon} alt="more icon" />
                    </div>
                    <div className="flex items-center justify-center">
                        <img src={logo} alt="logo" />
                    </div>
                </div>
                <div className="user-icon" onClick={handleTooltipToggle}>
                    <div className="flex items-center">
                        {userInfo && (
                            <span className="user-name text-white mr-1" style={{ marginLeft: '10px' }}>
                                {userInfo.username}
                            </span>
                        )}
                        {userInfo ? (
                            <div
                                className="w-10 h-10 bg-blue-400 rounded-full flex items-center justify-center text-white text-lg font-bold"
                                style={{ marginRight: '10px' }}
                            >
                                {userInfo.username?.charAt(0).toUpperCase()}
                            </div>
                        ) : (
                            <img className="user-icon1" src={userIcon} alt="user icon" />
                        )}

                    </div>
                    {showTooltip && (
                        <div className="toggle">
                            <div
                                className="logout"
                                onClick={handleLogout}
                                style={{
                                    width: '100%',
                                    height: '100%',
                                    display: 'grid',
                                    placeItems: 'center',
                                    textAlign: 'center',
                                    cursor: 'pointer',
                                }}
                            >
                                Đăng xuất
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}

export default Header;
