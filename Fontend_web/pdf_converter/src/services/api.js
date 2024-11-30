import axios from 'axios';
import { BASE_URL } from './config';
// Tạo một instance của Axios
const API = axios.create({
    baseURL: BASE_URL, // Đặt URL gốc của API
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
    if (!token) {
        console.warn('No access token found in localStorage');
    }
    return config;
}, (error) => {
    return Promise.reject(error);
});

export default API;
