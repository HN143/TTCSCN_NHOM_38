import axios from 'axios';
import { BASE_URL } from './config';

// Tạo một instance của Axios
const API = axios.create({
    baseURL: BASE_URL, // Đặt URL gốc của API
    headers: {
        'Content-Type': 'application/json',
    },
});

// Hàm lấy token từ localStorage
const getAccessToken = () => localStorage.getItem('access_token');
const getRefreshToken = () => localStorage.getItem('refresh_token');


// Interceptor xử lý thêm token vào headers trước khi gửi request
API.interceptors.request.use((config) => {
    const token = getAccessToken(); // Lấy access token từ localStorage
    if (token) {
        config.headers.Authorization = `Bearer ${token}`; // Thêm Bearer token
    } else {
        console.warn('No access token found in localStorage');
    }
    return config;
}, (error) => {
    return Promise.reject(error);
});


// Interceptor xử lý lỗi 401 và làm mới access token nếu cần
API.interceptors.response.use(
    response => response, // Nếu không có lỗi thì trả về kết quả
    async (error) => {
        const originalRequest = error.config;

        // Nếu lỗi 401 và chưa thử làm mới token
        if (error.response?.status === 401 && !originalRequest._retry) {
            originalRequest._retry = true; // Đánh dấu request đã thử làm mới token

            try {
                const refreshToken = getRefreshToken(); // Lấy refresh token từ localStorage
                //console.log(refreshToken)
                if (refreshToken) {
                    // Làm mới access token với 4 trường yêu cầu
                    const response = await axios.post('http://localhost:8000/o/token/', {
                        grant_type: 'refresh_token',  // grant_type luôn là 'refresh_token'
                        refresh_token: refreshToken,  // refresh token lấy từ localStorage
                        client_id: process.env.REACT_APP_CLIENT_ID, // Lấy client_id từ biến môi trường
                        client_secret: process.env.REACT_APP_CLIENT_SECRET, // Lấy client_secret từ biến môi trường
                    },
                        {
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded', // Định dạng dữ liệu đúng chuẩn
                            }
                        }
                    );

                    const newAccessToken = response.data.access_token; // Lấy access token mới từ response
                    localStorage.setItem('access_token', newAccessToken); // Lưu lại access token mới

                    // Gắn token mới vào header và gửi lại request gốc
                    originalRequest.headers.Authorization = `Bearer ${newAccessToken}`;
                    return API(originalRequest); // Gửi lại request ban đầu
                } else {
                    console.error('No refresh token found');
                    localStorage.clear();
                    window.location.href = '/login'; // Redirect về trang login nếu không có refresh token
                }
            } catch (refreshError) {
                //console.error('Refresh token failed:', refreshError);
                console.error('Refresh token failed:', refreshError.response?.data || refreshError.message);
                // Nếu làm mới token thất bại, logout và chuyển hướng về trang login
                localStorage.clear();
                window.location.href = '/login';
                throw refreshError;
            }
        }
        return Promise.reject(error); // Trả về lỗi nếu không phải lỗi 401 hoặc không làm mới token được
    }
);





export default API;
