// import React from 'react'

// const BacktoLogin = () => {
//     return (
//         <div>BacktoLogin</div>
//     )
// }

// export default BacktoLogin

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
        <div className="update-wrapper">
            <div className="update-content">
                <div className="update-content_title">Chức năng này yêu cầu đăng nhập với Premium Account</div>
                <div className="update-content_button">
                    <button className="button1" onClick={handleBackToLogin}>Quay về trang login</button>
                </div>
            </div>
        </div>
    );
}

export default BacktoLogin;


