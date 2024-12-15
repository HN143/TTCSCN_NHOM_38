

import React from 'react';
import './backtologin.scss';
import { useNavigate } from 'react-router-dom';

function BacktoLogin({ onBackToLogin }) {
    const navigate = useNavigate();

    const handleBackToLogin = () => {
        onBackToLogin(); // Gọi hàm để set authStatus về null
        navigate('/login');
    };

    return (
        <div className="back-to-login">
            <div className="back-to-login-content">
                <div className="back-to-login-content_title">Chức năng này yêu cầu đăng nhập với Premium Account</div>
                <div className="back-to-login_button">
                    <button className="button1 text-xl" onClick={handleBackToLogin}>Quay về trang login</button>
                </div>
            </div>
        </div>
    );
}

export default BacktoLogin;


