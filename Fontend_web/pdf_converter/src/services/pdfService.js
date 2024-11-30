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

export const getListData = async () => {
    try {
        // Gọi hai API song song
        const [response1, response2] = await Promise.all([
            fetch("http://127.0.0.1:8000/database/vanban/"),
            fetch("http://127.0.0.1:8000/database/data/")
        ]);

        // Chuyển đổi dữ liệu thành JSON
        const data1 = await response1.json();
        const data2 = await response2.json();

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
