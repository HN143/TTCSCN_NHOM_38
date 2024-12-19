
import React, { useEffect, useState } from 'react';
import { getAllUser, deleteUserById, deleteAllFile, createUser } from '../services/pdfService'; // Thêm createUser
import { Link, useLocation, useNavigate } from 'react-router-dom'; // Thêm import Link
import { getUserById } from '../services/authService';
function ManageAccount() {
    const [accounts, setAccounts] = useState([]);
    const [showForm, setShowForm] = useState(false); // State để hiển thị form
    const [newAccount, setNewAccount] = useState({ username: '', password: '', is_staff: false }); // State cho tài khoản mới
    const [role, setRole] = useState(); // State để hiển thị form
    const [id, setId] = useState(); // State để hiển thị form
    const navigate = useNavigate();


    // Thông tin bộ nhớ
    const totalMemory = 100; // Tổng dung lượng bộ nhớ (GB)
    const [usedMemory, setUsedMemory] = useState(75); // Dung lượng bộ nhớ đã sử dụng (GB)
    const remainingMemory = totalMemory - usedMemory; // Dung lượng bộ nhớ còn lại (GB)

    useEffect(() => {
        const a = localStorage.getItem('role');
        const b = localStorage.getItem('id');
        if (a) {
            setRole(a);
        }
        if (b) {
            setId(b)
        }
    }, []);

    const fetchData = async () => {
        if (role === 'admin') {
            try {
                const result = await getAllUser(); // Cần kiểm tra token ở đây
                setAccounts(result);
            } catch (error) {
                console.error("Error fetching users:", error);
                alert("Không thể tải danh sách tài khoản. Vui lòng kiểm tra quyền hoặc token xác thực!");
            }
        }
        if (role === 'user') {
            try {
                const result = await getUserById(id); // Lấy thông tin người dùng theo id
                setAccounts([result]); // Đưa vào mảng để giữ cấu trúc thống nhất
            } catch (error) {
                console.error("Error fetching user info:", error);
                alert("Không thể tải thông tin người dùng. Vui lòng thử lại!");
            }
        }
    };

    useEffect(() => {
        fetchData();
    }, [role, id]); // Gọi fetchData khi role hoặc id thay đổi


    useEffect(() => {
        if (role === 'admin') {
            fetchData();
        }
    }, [role]); // Chỉ gọi fetchData khi role đã được cập nhật




    // Hàm xóa bộ nhớ
    const handleDeleteMemory = async () => {
        const confirmDeleteMemory = window.confirm("Bạn có chắc chắn muốn xóa toàn bộ file ?");
        if (confirmDeleteMemory) {
            setUsedMemory(0); // Giảm bộ nhớ đã sử dụng về 0
            try {
                // Gọi API để xóa user
                const data = await deleteAllFile();
                console.log("Data removed successfully:", data);
            } catch (error) {
                console.error("Error remove:", error);
                alert("Xóa dữ liệu thất bại! Vui lòng thử lại.");

            }
        }
    };

    const handleUpdateMemory = () => {
        navigate('/update-file')
    }


    // Hàm xử lý thay đổi trường dữ liệu
    const handleChange = (e) => {
        const { name, value, type, checked } = e.target;
        setNewAccount(prev => ({
            ...prev,
            [name]: type === 'checkbox' ? checked : value,
        }));
    };

    // Hàm xử lý tạo tài khoản mới
    const handleCreateAccount = async () => {
        try {
            const data = await createUser(newAccount); // Gọi API để tạo tài khoản mới
            setAccounts([...accounts, data]); // Cập nhật danh sách tài khoản
            alert('Tài khoản đã được tạo thành công!');
            setShowForm(false); // Ẩn form sau khi tạo xong
            setNewAccount({ username: '', password: '', is_staff: false }); // Reset form
        } catch (error) {
            console.error("Error creating user:", error);
            alert('Tạo tài khoản thất bại. Vui lòng thử lại!');
        }
    };


    const handleDelete = async (id) => {
        const confirmDelete = window.confirm("Bạn có chắc chắn muốn xóa người dùng này?");

        if (confirmDelete) {
            // Cập nhật giao diện trước
            setAccounts(accounts.filter(account => account.id !== id));
            try {
                // Gọi API để xóa user
                const data = await deleteUserById(id);
                console.log("User deleted successfully:", data);
            } catch (error) {
                console.error("Error deleting user:", error);
                alert("Xóa người dùng thất bại! Vui lòng thử lại.");
                // Khôi phục danh sách nếu cần
                setAccounts(prevAccounts => [...prevAccounts, accounts.find(account => account.id === id)]);
            }
        }
    };


    return (
        <div className="container mx-auto px-6 py-8">
            {role === 'admin' && (
                <div className="manage-account bg-white p-8 rounded-lg shadow-lg mb-8">
                    {/* Quản lý tài khoản */}
                    <h2 className="text-3xl font-semibold text-gray-800 mb-6">Quản lý tài khoản</h2>
                    <div className="mb-6">
                        <button
                            onClick={() => setShowForm(!showForm)}
                            className="bg-blue-600 text-white px-6 py-2 rounded-full hover:bg-blue-700 transition-all duration-300"
                        >
                            Thêm tài khoản
                        </button>
                    </div>

                    {showForm && (
                        <div className="bg-gray-50 p-6 rounded-lg shadow-md mb-6">
                            <h3 className="text-2xl font-semibold mb-4">Tạo tài khoản mới</h3>
                            <div className="mb-4">
                                <label className="block text-gray-700 mb-2">Tên đăng nhập</label>
                                <input
                                    type="text"
                                    name="username"
                                    value={newAccount.username}
                                    onChange={handleChange}
                                    className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                />
                            </div>
                            <div className="mb-4">
                                <label className="block text-gray-700 mb-2">Mật khẩu</label>
                                <input
                                    type="password"
                                    name="password"
                                    value={newAccount.password}
                                    onChange={handleChange}
                                    className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                />
                            </div>
                            <div className="mb-4">
                                <label className="block text-gray-700 mb-2">
                                    <input
                                        type="checkbox"
                                        name="is_staff"
                                        checked={newAccount.is_staff}
                                        onChange={handleChange}
                                        className="mr-2"
                                    />
                                    Là nhân viên
                                </label>
                            </div>
                            <button
                                onClick={handleCreateAccount}
                                className="bg-green-600 text-white px-6 py-2 rounded-full hover:bg-green-700 transition-all duration-300"
                            >
                                Tạo tài khoản
                            </button>
                        </div>
                    )}

                    <div className="overflow-x-auto bg-white shadow-md rounded-lg">
                        <table className="min-w-full table-auto">
                            <thead className="bg-blue-600 text-white">
                                <tr>
                                    <th className="py-3 px-6 text-left">Tên tài khoản</th>
                                    <th className="py-3 px-6 text-left">Quyền hạn</th>
                                    <th className="py-3 px-6 text-left">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                {accounts.map(account => (
                                    <tr key={account.id} className="border-b hover:bg-gray-50 transition-all duration-300">
                                        <td className="py-3 px-6">{account.username}</td>
                                        <td className="py-3 px-6">
                                            {account.username === 'admin'
                                                ? 'Admin'
                                                : account.is_staff
                                                    ? 'Cán bộ giảng viên'
                                                    : 'Người dùng'}
                                        </td>
                                        <td className="py-3 px-6 text-red-500">
                                            {account.username === 'admin' ? (
                                                ''
                                            ) : (
                                                <button
                                                    onClick={() => handleDelete(account.id)}
                                                    className="hover:text-red-700 transition-all duration-300"
                                                >
                                                    Xóa
                                                </button>
                                            )}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>

                    {/* Phần quản lý bộ nhớ */}
                    <div className="bg-white shadow-md rounded-lg p-8 mt-10">
                        <h3 className="text-2xl font-semibold mb-6">Quản lý bộ nhớ</h3>
                        <div className="flex space-x-4">
                            <button
                                onClick={handleDeleteMemory}
                                className="bg-red-600 text-white px-6 py-2 rounded-full hover:bg-red-700 transition-all duration-300"
                            >
                                Xóa bộ nhớ đã sử dụng
                            </button>
                            <button
                                onClick={handleUpdateMemory}
                                className="bg-blue-600 text-white px-6 py-2 rounded-full hover:bg-blue-700 transition-all duration-300"
                            >
                                Cập nhật thêm file
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {role === 'user' && (
                <div className="user-info bg-gray-50 p-8 rounded-lg shadow-lg">
                    <h2 className="text-3xl font-semibold text-gray-800 mb-6 border-b-2 border-blue-600 pb-2">
                        Thông Tin Tài Khoản
                    </h2>
                    {accounts.length > 0 ? (
                        <div className="flex flex-col gap-6 bg-white rounded-lg shadow-md p-8">
                            <div className="flex items-center gap-6">
                                <div className="w-20 h-20 bg-blue-600 rounded-full flex items-center justify-center text-white text-2xl font-bold">
                                    {accounts[0].username?.charAt(0).toUpperCase()}
                                </div>
                                <div>
                                    <h3 className="text-2xl font-semibold text-gray-700">{accounts[0].username}</h3>
                                    <p className="text-md text-gray-500">
                                        {accounts[0].is_staff ? 'Cán bộ giảng viên' : 'Người dùng'}
                                    </p>
                                </div>
                            </div>
                            <div className="text-gray-600">
                                <p className="mb-4">
                                    <strong>Email:</strong> {accounts[0].email || 'Chưa cập nhật'}
                                </p>
                                <p>
                                    <strong>Ngày tham gia:</strong> {accounts[0].created_at || 'Chưa rõ'}
                                </p>
                            </div>
                        </div>
                    ) : (
                        <div className="text-center text-gray-500">
                            <p>Không thể tải thông tin tài khoản. Vui lòng thử lại sau.</p>
                        </div>
                    )}
                </div>
            )}
        </div>
    );

}

export default ManageAccount;











