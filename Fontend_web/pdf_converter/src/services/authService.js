import API from './api';

// Đăng nhập
export const login = async (username, password) => {
    try {
        const response = await API.post('/user/login/', { username, password });
        return response.data; // Trả về access_token, refresh_token hoặc thông tin người dùng
    } catch (error) {
        console.error('Login failed:', error);
        throw error.response.data; // Ném lỗi để xử lý ở component
    }
};

// Tạo tài khoản
export const createUser = async (userData) => {
    try {
        const response = await API.post('/user/users/', userData);
        return response.data; // Trả về thông tin user vừa tạo
    } catch (error) {
        console.error('Create user failed:', error);
        throw error.response.data;
    }
};

// Lấy thông tin người dùng theo ID
export const getUserById = async (userId) => {
    try {
        const response = await API.get(`/user/users/${userId}/`);
        return response.data; // Trả về thông tin người dùng
    } catch (error) {
        console.error('Fetch user by ID failed:', error);
        throw error.response.data;
    }
};

// Lấy danh sách người dùng
export const getAllUsers = async () => {
    try {
        const response = await API.get('/user/users/');
        return response.data; // Trả về danh sách user
    } catch (error) {
        console.error('Fetch all users failed:', error);
        throw error.response.data;
    }
};
