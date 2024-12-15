
import React, { useEffect, useState } from 'react';
import { getAllUser, deleteUserById, deleteAllFile, createUser } from '../services/pdfService'; // Thêm createUser
import { Link, useLocation, useNavigate } from 'react-router-dom'; // Thêm import Link
function ManageAccount() {
    const [accounts, setAccounts] = useState([]);
    const [showForm, setShowForm] = useState(false); // State để hiển thị form
    const [newAccount, setNewAccount] = useState({ username: '', password: '', is_staff: false }); // State cho tài khoản mới

    const navigate = useNavigate();


    // Thông tin bộ nhớ
    const totalMemory = 100; // Tổng dung lượng bộ nhớ (GB)
    const [usedMemory, setUsedMemory] = useState(75); // Dung lượng bộ nhớ đã sử dụng (GB)
    const remainingMemory = totalMemory - usedMemory; // Dung lượng bộ nhớ còn lại (GB)


    useEffect(() => {
        const fetchData = async () => {
            const result = await getAllUser();
            setAccounts(result);
        };

        fetchData();
    }, []);




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
        <div className="manage-account p-6">
            {/* Quản lý tài khoản */}
            <h2 className="text-2xl font-semibold mb-6">Quản lý tài khoản</h2>
            <div className="mb-4">
                <button
                    onClick={() => setShowForm(!showForm)}
                    className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
                >
                    +
                </button>
            </div>

            {showForm && (
                <div className="bg-gray-100 p-4 rounded shadow-md mb-6">
                    <h3 className="text-xl font-semibold mb-4">Tạo tài khoản mới</h3>
                    <div className="mb-4">
                        <label className="block text-gray-700 mb-2">Tên đăng nhập</label>
                        <input
                            type="text"
                            name="username"
                            value={newAccount.username}
                            onChange={handleChange}
                            className="w-full p-2 border rounded"
                        />
                    </div>
                    <div className="mb-4">
                        <label className="block text-gray-700 mb-2">Mật khẩu</label>
                        <input
                            type="password"
                            name="password"
                            value={newAccount.password}
                            onChange={handleChange}
                            className="w-full p-2 border rounded"
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
                        className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600"
                    >
                        Tạo tài khoản
                    </button>
                </div>
            )}

            <div className="overflow-x-auto bg-white shadow-md rounded-lg">
                <table className="min-w-full table-auto">
                    <thead className="bg-blue-500 text-white">
                        <tr>
                            <th className="py-2 px-4 text-left">Tên tài khoản</th>
                            <th className="py-2 px-4 text-left">Quyền hạn</th>
                            <th className="py-2 px-4 text-left">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        {accounts.map(account => (
                            <tr key={account.id} className="border-b hover:bg-gray-100">
                                <td className="py-2 px-4">{account.username}</td>
                                <td className="py-2 px-4">{account.username === 'admin' ? 'Admin' : (account.is_staff ? 'Nhân viên' : 'Không')}
                                </td>
                                <td className="py-2 px-4 text-red-500">
                                    {
                                        account.username === 'admin' ? '' : (
                                            <button
                                                onClick={() => handleDelete(account.id)}
                                                className="hover:text-red-700"
                                            >
                                                Xóa
                                            </button>
                                        )
                                    }

                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
            {/* Phần quản lý bộ nhớ */}
            <div className="bg-white shadow-md rounded-lg p-6 mb-6 mt-10">
                <h3 className="text-xl font-semibold mb-4">Quản lý bộ nhớ</h3>
                <div className="mb-4">
                    {/* <p className="text-lg">Dung lượng bộ nhớ: {usedMemory} GB / {totalMemory} GB</p>
                    <div className="relative pt-1">
                        <div className="flex mb-2 items-center justify-between">
                            <div>
                                <span className="text-xs font-semibold inline-block py-1 px-2 uppercase rounded-full text-blue-600 bg-blue-200">
                                    {Math.round((usedMemory / totalMemory) * 100)}% đã sử dụng
                                </span>
                            </div>
                        </div>
                        <div className="flex mb-2">
                            <div className="w-full bg-gray-200 rounded-full h-2.5">
                                <div className="bg-blue-600 h-2.5 rounded-full" style={{ width: `${(usedMemory / totalMemory) * 100}%` }}></div>
                            </div>
                        </div>
                    </div>
                    <p className="text-sm text-gray-500">Bộ nhớ còn lại: {remainingMemory} GB</p> */}
                    <button
                        onClick={handleDeleteMemory}
                        className="mt-4 bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
                    >
                        Xóa bộ nhớ đã sử dụng
                    </button>
                    <button
                        onClick={handleUpdateMemory}
                        className="mt-4 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 ml-1"
                    >
                        Cập nhật thêm file
                    </button>
                </div>
            </div>



        </div>
    );
}

export default ManageAccount;












