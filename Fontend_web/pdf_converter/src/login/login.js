// import React, { useState } from 'react';
// import logoLogin from "../assets/logoLogin2.png";
// import { useNavigate } from 'react-router-dom';
// import { login } from '../services/authService';

// function Login({ onLogin, onGuestLogin }) {
//     const [email, setEmail] = useState('');
//     const [password, setPassword] = useState('');
//     const [error, setError] = useState('');
//     const navigate = useNavigate();

//     const handleSubmit = (event) => {
//         event.preventDefault();

//         if (email === 'admin@example.com' && password === 'password123') {
//             console.log('Đăng nhập thành công!');
//             localStorage.setItem('isLoggedIn', 'true');
//             navigate('/home');
//             onLogin();
//         } else {
//             setError('Tên đăng nhập hoặc mật khẩu không chính xác');
//         }
//     };

//     const handleGuestLogin = () => {
//         onGuestLogin();
//         navigate('/home');
//     };

//     return (
//         <div className="flex items-center justify-center h-screen bg-gray-100">
//             <div className="flex flex-col md:flex-row items-center bg-white shadow-lg rounded-lg overflow-hidden max-w-4xl">

//                 <div className="w-full md:w-/2 p-8">
//                     {/* Logo above Login title */}
//                     <div className="flex justify-center mb-6">
//                         <img src={logoLogin} alt="Logo" className="h-8" />
//                     </div>

//                     <h3 className="text-2xl font-bold mb-6 text-gray-700">Log in</h3>
//                     <form onSubmit={handleSubmit} className="space-y-4">
//                         <input
//                             type="email"
//                             className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
//                             placeholder="Email address"
//                             value={email}
//                             onChange={(e) => setEmail(e.target.value)}
//                         />
//                         <input
//                             type="password"
//                             className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
//                             placeholder="Password"
//                             value={password}
//                             onChange={(e) => setPassword(e.target.value)}
//                         />
//                         <button
//                             type="submit"
//                             className="w-full bg-blue-500 text-white py-3 rounded-md hover:bg-blue-600 transition duration-300"
//                         >
//                             Login
//                         </button>
//                     </form>

//                     {error && <p className="text-red-500 text-center mt-2">{error}</p>}

//                     <button
//                         onClick={handleGuestLogin}
//                         className="w-full mt-4 bg-gray-300 text-gray-800 py-3 rounded-md hover:bg-gray-400 transition duration-300"
//                     >
//                         Access as Guest
//                     </button>

//                     <div className="text-center mt-6 text-sm text-gray-600">
//                         <a href="#!" className="underline">Forgot password?</a>
//                     </div>
//                     <div className="text-center mt-4 text-sm text-gray-600">
//                         Don't have an account? <a href="#!" className="text-blue-500 underline">Register here</a>
//                     </div>
//                 </div>

//                 {/* <div className="hidden md:block w-1/3 bg-cover" style={{ backgroundImage: `url('https://cdn.haitrieu.com/wp-content/uploads/2021/10/Logo-Hoc-Vien-Ky-Thuat-Mat-Ma-ACTVN.png')` }}></div> */}
//             </div>
//         </div>
//     );
// }

// export default Login;





import React, { useState } from 'react';
import logoLogin from "../assets/logoLogin2.png";
import { useNavigate } from 'react-router-dom';
import { login } from '../services/authService';

function Login({ onLogin, onGuestLogin }) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false); // Thêm trạng thái loading
    const navigate = useNavigate();

    const handleSubmit = async (event) => {
        event.preventDefault();
        setLoading(true); // Hiển thị trạng thái loading
        setError(''); // Xóa thông báo lỗi trước đó

        try {
            // Gọi API login từ authService
            const { access_token } = await login(email, password);

            // Lưu token vào localStorage
            localStorage.setItem('access_token', access_token);
            console.log('Đăng nhập thành công!');

            // Gọi onLogin và điều hướng đến Home
            onLogin();
            navigate('/home');
        } catch (err) {
            // Hiển thị lỗi từ server
            setError(err.message || 'Đăng nhập thất bại. Vui lòng thử lại.');
        } finally {
            setLoading(false); // Tắt trạng thái loading
        }
    };

    const handleGuestLogin = () => {
        onGuestLogin();
        navigate('/home');
    };

    return (
        <div className="flex items-center justify-center h-screen bg-gray-100">
            <div className="flex flex-col md:flex-row items-center bg-white shadow-lg rounded-lg overflow-hidden max-w-4xl">

                <div className="w-full md:w-/2 p-8">
                    {/* Logo above Login title */}
                    <div className="flex justify-center mb-6">
                        <img src={logoLogin} alt="Logo" className="h-8" />
                    </div>

                    <h3 className="text-2xl font-bold mb-6 text-gray-700">Log in</h3>
                    <form onSubmit={handleSubmit} className="space-y-4">
                        <input
                            type="text"
                            className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
                            placeholder="Email address"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                        />
                        <input
                            type="password"
                            className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
                            placeholder="Password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                        />
                        <button
                            type="submit"
                            className="w-full bg-blue-500 text-white py-3 rounded-md hover:bg-blue-600 transition duration-300 flex items-center justify-center"
                            disabled={loading} // Disable the button when loading
                        >
                            {loading ? (
                                <span className="flex items-center">
                                    <svg
                                        className="animate-spin h-5 w-5 mr-3 text-white"
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                    >
                                        <circle className="opacity-25" cx="12" cy="12" r="10" strokeWidth="4"></circle>
                                        <path
                                            className="opacity-75"
                                            fill="none"
                                            d="M4 12a8 8 0 0116 0"
                                            strokeLinecap="round"
                                            strokeLinejoin="round"
                                            strokeWidth="4"
                                        ></path>
                                    </svg>
                                    Loading...
                                </span>
                            ) : (
                                'Login'
                            )}
                        </button>

                    </form>

                    {error && <p className="text-red-500 text-center mt-2">{error}</p>}

                    <button
                        onClick={handleGuestLogin}
                        className="w-full mt-4 bg-gray-300 text-gray-800 py-3 rounded-md hover:bg-gray-400 transition duration-300"
                    >
                        Access as Guest
                    </button>

                    <div className="text-center mt-6 text-sm text-gray-600">
                        <a href="#!" className="underline">Forgot password?</a>
                    </div>
                    <div className="text-center mt-4 text-sm text-gray-600">
                        Don't have an account? <a href="#!" className="text-blue-500 underline">Register here</a>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Login;















// import React, { useState } from 'react';
// import logoLogin from "../assets/logoLogin2.png"
// import './login.scss';
// import {
//     MDBBtn,
//     MDBContainer,
//     MDBRow,
//     MDBCol,
//     MDBInput
// } from 'mdb-react-ui-kit';
// import { useNavigate } from 'react-router-dom';

// function Login({ onLogin, onGuestLogin }) { // Thêm onGuestLogin prop
//     const [email, setEmail] = useState('');
//     const [password, setPassword] = useState('');
//     const [error, setError] = useState('');
//     const navigate = useNavigate();

//     const handleSubmit = (event) => {
//         event.preventDefault();

//         if (email === 'admin@example.com' && password === 'password123') {
//             console.log('Đăng nhập thành công!');
//             localStorage.setItem('isLoggedIn', 'true');
//             navigate('/home');
//             onLogin();
//         } else {
//             setError('Tên đăng nhập hoặc mật khẩu không chính xác');
//         }
//     };

//     const handleGuestLogin = () => {
//         onGuestLogin(); // Kích hoạt chế độ đăng nhập khách
//         navigate('/home'); // Điều hướng đến trang chủ
//     };

//     return (
//         <div style={{ display: 'flex', alignItems: "center", height: '100vh' }}>



//             <MDBContainer fluid>
//                 <MDBRow className='justify-content-center'>
//                     <MDBCol sm='6'>
//                         <div className='d-flex flex-row ps-5 pt-5'>
//                             <span style={{ marginLeft: '-4px' }} className="h1 fw-bold mb-0"><img src={logoLogin}></img></span>
//                         </div>

//                         <div className='d-flex flex-column justify-content-center h-custom-2 w-75 pt-4'>
//                             <h3 className="fw-normal mb-3 ps-5 pb-3" style={{ letterSpacing: '1px' }}>Log in</h3>

//                             <form onSubmit={handleSubmit}>
//                                 <MDBInput
//                                     wrapperClass='mb-4 mx-5 w-100'
//                                     label='Email address'
//                                     id='formControlLg'
//                                     type='email'
//                                     size="lg"
//                                     value={email}
//                                     onChange={(e) => setEmail(e.target.value)}
//                                 />
//                                 <MDBInput
//                                     wrapperClass='mb-4 mx-5 w-100'
//                                     label='Password'
//                                     id='formControlLg'
//                                     type='password'
//                                     size="lg"
//                                     value={password}
//                                     onChange={(e) => setPassword(e.target.value)}
//                                 />

//                                 <MDBBtn className="mb-4 px-5 mx-5 w-100" color='info' size='lg' type="submit">
//                                     Login
//                                 </MDBBtn>
//                             </form>

//                             {error && <p className="text-danger text-center">{error}</p>}

//                             <MDBBtn className="mb-4 px-5 mx-5 w-100" color='secondary' size='lg' onClick={handleGuestLogin}>
//                                 Access as Guest
//                             </MDBBtn>

//                             <p className="small mb-5 pb-lg-3 ms-5">
//                                 <a className="text-muted" href="#!">Forgot password?</a>
//                             </p>
//                             <p className='ms-5'>
//                                 Don't have an account? <a href="#!" className="link-info">Register here</a>
//                             </p>
//                         </div>
//                     </MDBCol>

//                     <MDBCol sm='2' className='d-none d-sm-block px-0 mt-5 d-flex align-items-center'>
//                         <img src="https://cdn.haitrieu.com/wp-content/uploads/2021/10/Logo-Hoc-Vien-Ky-Thuat-Mat-Ma-ACTVN.png"
//                             alt="Login image" className="w-100" style={{ objectFit: 'cover', objectPosition: 'left' }} />
//                     </MDBCol>
//                 </MDBRow>
//             </MDBContainer>

//         </div>
//     );
// }

// export default Login;
