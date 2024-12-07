import './header.scss';
import logo from '../assets/logo.png';
import userIcon from '../assets/user-circle.png';
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { deleteAllUserFile } from '../services/pdfService'
function Header({ onLogout }) { // Nhận prop onLogout
    const [showTooltip, setShowTooltip] = useState(false);
    const navigate = useNavigate();

    const handleTooltipToggle = () => {
        setShowTooltip(!showTooltip);
    };

    const handleLogout = async () => {
        const res = await deleteAllUserFile();
        localStorage.removeItem('isLoggedIn'); // Xóa thông tin trạng thái đăng nhập
        setShowTooltip(false); // Ẩn tooltip
        onLogout(); // Gọi hàm onLogout từ props
        navigate('/login'); // Điều hướng về trang đăng nhập
    };

    return (
        <div className="wrapper-header">
            <div className="header">
                <div className="headerIcon">
                    <img src={logo} alt="logo" />
                </div>
                <div className="user-icon" onClick={handleTooltipToggle}>
                    <img className='user-icon1' src={userIcon} alt="user icon" />
                    {showTooltip && (
                        <div className='toggle'>
                            <div className='logout' onClick={handleLogout} style={{
                                width: '100%',
                                height: '100%',
                                display: 'grid',
                                placeItems: 'center',
                                textAlign: 'center',
                                cursor: 'pointer'
                                // borderBottom: '1px solid #EEEEEE'
                            }}>
                                Đăng xuất
                            </div>
                            {/* <div className='qltk' style={{
                                width: '100%',
                                height: '50%',
                                display: 'grid',
                                placeItems: 'center',
                                textAlign: 'center',
                            }}>
                                Quản lý tài khoản
                            </div> */}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}

export default Header;















