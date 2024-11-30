import axios from 'axios';

// Tạo một instance của Axios
const API = axios.create({
    baseURL: 'http://127.0.0.1:8000', // Đặt URL gốc của API
    headers: {
        'Content-Type': 'application/json',
    },
});

// Tự động thêm token vào headers nếu có
API.interceptors.request.use((config) => {
    const token = localStorage.getItem('access_token'); // Lấy token từ localStorage
    if (token) {
        config.headers.Authorization = `Bearer ${token}`; // Thêm Bearer token
    }
    return config;
}, (error) => {
    return Promise.reject(error);
});

export default API;
