import API from './api';

// Lấy file theo khoảng thời gian
export const getFilesByDate = async (startDate, endDate) => {
    try {
        const response = await API.post('/pdfdata/download/', { startDate, endDate });
        return response.data; // Trả về danh sách file
    } catch (error) {
        console.error('Fetch files by date failed:', error);
        throw error.response.data;
    }
};

// Convert file theo ID
export const convertFileById = async (fileId) => {
    try {
        const response = await API.put(`/pdf_convert/convert/${fileId}/`);
        return response.data; // Trả về kết quả convert
    } catch (error) {
        console.error('Convert file failed:', error);
        throw error.response.data;
    }
};

// export const getListData = async () => {
//     try {
//         // Gọi hai API song song
//         // const [response1, response2] = await Promise.all([
//         //     fetch("http://127.0.0.1:8000/database/vanban/"),
//         //     fetch("http://127.0.0.1:8000/database/data/")
//         // ]);

//         // Gọi hai API song song bằng axios
//         const [response1, response2] = await Promise.all([
//             API.get('/database/vanban/'),
//             API.get('/database/data/')
//         ]);

//         // Chuyển đổi dữ liệu thành JSON
//         const data1 = await response1.json();
//         const data2 = await response2.json();

//         // Gộp dữ liệu từ hai API
//         const mergedData = data1.map(vanBan => ({
//             ...vanBan,
//             van_ban_list: data2.filter(item => item.van_ban === vanBan.id),
//         }));

//         return mergedData; // Trả về dữ liệu đã gộp
//     } catch (error) {
//         console.error("Error fetching or merging data:", error);
//         return []; // Trả về mảng rỗng nếu có lỗi
//     }
// };
export const getListData = async () => {
    try {
        // Gọi hai API song song bằng axios
        const [response1, response2] = await Promise.all([
            API.get('/database/vanban/'),
            API.get('/database/data/')
        ]);

        // Dữ liệu đã được axios chuyển đổi sẵn sang JSON, chỉ cần lấy từ thuộc tính 'data'
        const data1 = response1.data;
        const data2 = response2.data;

        // Gộp dữ liệu từ hai API
        const mergedData = data1.map(vanBan => ({
            ...vanBan,
            van_ban_list: data2.filter(item => item.van_ban === vanBan.id),
        }));

        return mergedData; // Trả về dữ liệu đã gộp
    } catch (error) {
        console.error("Error fetching or merging data:", error);
        return []; // Trả về mảng rỗng nếu có lỗi
    }
};


//handle gửi file qua server qua homejs

export const uploadFile = async (file, format) => {
    try {
        const formData = new FormData();
        formData.append('file', file);
        formData.append('format', format);

        const response = await API.post('/upload', formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data;
    } catch (error) {
        if (error.response) {
            // Lỗi từ phía server
            console.error("Server error:", error.response.data);
            throw new Error(error.response.data.message || "Lỗi từ server!");
        } else {
            // Lỗi khác (network, cấu hình API)
            console.error("Unexpected error:", error);
            throw new Error("Không thể kết nối tới server, vui lòng thử lại!");
        }
    }
};
export const updateFileRange = async (startDate, endDate) => {
    try {
        const payload = {
            start_date: startDate,
            end_date: endDate,
        };

        // Gửi request đến API
        const response = await API.post('/update-files', payload);

        return response.data; // Trả về dữ liệu từ server
    } catch (error) {
        if (error.response) {
            // Xử lý lỗi từ server
            throw new Error(error.response.data.message || "Đã xảy ra lỗi từ server!");
        } else {
            // Xử lý lỗi kết nối hoặc lỗi khác
            throw new Error("Không thể kết nối tới server. Vui lòng thử lại.");
        }
    }
};