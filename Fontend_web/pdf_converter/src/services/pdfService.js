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

// Convert file theo ID (hiện tại trong data của thầy chưa sử dụng vì trong giao diện là convert all)
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





// hàm xử lý gọi api lấy theo ngày và lọc (nhưng hiện tại đã có logic khác nên hàm này k cần nữa( có thể sẽ dùng nên k xóa :> ) )
export const getMergedDataByDate = async (startDate, endDate) => {
    try {
        // Lấy dữ liệu đầy đủ từ getListData
        const listData = await getListData();

        // Lấy dữ liệu lọc theo ngày
        const response = await API.get('/database/databydate/', {
            params: { startDate, endDate } // Truyền tham số qua query params
        });
        const dataByDate = response.data;
        //console.log('>>>.', dataByDate)
        // Gộp dữ liệu theo ngày với dữ liệu đầy đủ từ getListData
        const mergedData = listData.map(vanBan => {
            // Tìm các mục trong dataByDate có id tương ứng với vanBan
            const filteredData = dataByDate.filter(item => item.van_ban === vanBan.id);

            // Trả về dữ liệu gộp đầy đủ
            return {
                id: vanBan.id, // Giữ lại id từ vanBan
                ngay_tao: vanBan.ngay_tao, // Thêm các thuộc tính khác từ vanBan
                ngay_ban_hanh: vanBan.ngay_ban_hanh,
                id_api: vanBan.id_api,
                so_ky_hieu: vanBan.so_ky_hieu,
                loai_van_ban: vanBan.loai_van_ban,
                nguoi_tao: vanBan.nguoi_tao,
                trich_yeu: vanBan.trich_yeu,
                don_vi_soan_thao: vanBan.don_vi_soan_thao,
                so_van_ban: vanBan.so_van_ban,
                do_mat: vanBan.do_mat,
                do_khan: vanBan.do_khan,
                nguoi_ky: vanBan.nguoi_ky,
                so_luong_data: vanBan.so_luong_data,
                active: vanBan.active,
                // Dữ liệu lọc theo ngày
                van_ban_list: filteredData.length > 0 ? filteredData : vanBan.van_ban_list,
            };
        });

        return mergedData; // Trả về dữ liệu đã gộp

    } catch (error) {
        console.error("Error fetching and merging data by date:", error);
        return []; // Trả về mảng rỗng nếu có lỗi
    }
};

// lấy data theo date kết quả trả về 1json chứa data(của file) và id để móc nối
export const getDataByDate = async (startDate, endDate) => {
    try {
        // Gọi API với các tham số startDate và endDate trong query params
        const response = await API.get('/database/databydate/', {
            params: {
                startDate: startDate, // Truyền startDate
                endDate: endDate      // Truyền endDate
            }
        });

        // Lấy dữ liệu từ response
        const data = response.data;

        return data; // Trả về dữ liệu nhận được

    } catch (error) {
        console.error("Error fetching data by date:", error.response.data);
        return []; // Trả về mảng rỗng nếu có lỗi
    }
};



export const getAllUser = async () => {

    try {
        const res = await API.get("/user/users/");
        return res.data

    } catch (e) {
        console.error(e);
        throw e.response.data
    }
}


export const createUser = async (userData) => {
    try {
        const res = await API.post('/user/users/', userData);
        return res.data;
    } catch (e) {
        console.error(e);
        throw e.response?.data || e.message;
    }
};


export const deleteUserById = async (id) => {
    try {
        // Thêm dấu `/` ở cuối URL
        const res = await API.delete(`/user/users/${id}/`);
        return res.data;
    } catch (e) {
        console.error(e);
        throw e.response?.data || e.message; // Xử lý lỗi nếu không có response
    }
};




//xóa tất cả file trong database

export const deleteAllFile = async (id) => {
    try {
        // Thêm dấu `/` ở cuối URL
        const res = await API.delete(`/database/datas/delete-all/`);
        return res.data;
    } catch (e) {
        console.error(e);
        throw e.response?.data || e.message; // Xử lý lỗi nếu không có response
    }
};









//người dùng bình thường
export const uploadFilePDF = async (file, format) => {
    try {
        const formData = new FormData();
        formData.append('file', file);
        formData.append('format', format);

        const response = await API.post('/nguoi_dung/upload_and_get_pdf/', formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data;
    } catch (error) {
        if (error.response) {
            // Lỗi từ phía server
            console.error("Server error:", error.response.data.error);
            throw new Error(error.response.data.message || "Lỗi từ server!");
        } else {
            // Lỗi khác (network, cấu hình API)
            console.error("Unexpected error:", error);
            throw new Error("Không thể kết nối tới server, vui lòng thử lại!");
        }
    }
};

// người dùng bình thường
export const uploadFileDOC = async (file, format) => {
    try {
        const formData = new FormData();
        formData.append('file', file);
        formData.append('format', format);

        const response = await API.post('/nguoi_dung/upload_and_get_docx/', formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data;
    } catch (error) {
        if (error.response) {
            // Lỗi từ phía server
            console.error("Server error:", error.response.data.error);
            throw new Error(error.response.data.message || "Lỗi từ server!");
        } else {
            // Lỗi khác (network, cấu hình API)
            console.error("Unexpected error:", error);
            throw new Error("Không thể kết nối tới server, vui lòng thử lại!");
        }
    }
};


// người dùng bình thường (xóa file theo id)
export const deleteUserFileByID = async (id) => {
    try {
        const res = await API.delete(`/nguoi_dung/files/${id}/`)
        console.log('xóa file thành công:', res.data);
        return res.data

    } catch (e) {
        console.error('error>>', e);
        throw e
    }
}


// người dùng  bình thường ( lấy tất cả file của người dùng trong db)
export const getAllUserFile = async () => {
    try {
        const res = await API.get('/nguoi_dung/files/');
        //console.log('list data', res.data);
        return res.data
    } catch (e) {
        console.error(e)
        throw e
    }


}
// người dùng bình thường ( xóa tất cả file trong db (khi logout))
export const deleteAllUserFile = async () => {
    try {
        const res = await API.delete('/nguoi_dung/files/delete-all/');
        console.log('đã xóa all file', res.data);
        return res.data
    } catch (e) {
        console.error(e);
        throw e
    }
}




// Gửi yêu cầu tải file trên backend
export const updateFileRange = async (startDate, endDate) => {
    const payload = { startDate, endDate };
    try {
        const response = await API.post('/pdfdata/download/', payload); // Không cần responseType: 'blob'
        return response.data; // Trả về thông tin phản hồi từ server
    } catch (error) {
        console.error('Error updating file:', error);
        throw new Error(error.response?.data?.error || 'Không thể cập nhật file.');
    }
};

// Gọi API chuyển đổi tất cả file
export const convertAllFiles = async () => {
    try {
        const response = await API.get('/pdf_convert/convert/all/'); // API dạng GET
        return response.data; // Trả về phản hồi từ server
    } catch (error) {
        console.error('Error converting all files:', error);
        throw new Error(error.response?.data?.message || 'Không thể chuyển đổi file.');
    }
};


// lấy danh sách ngày đã up lên db của dự án 
export const getAllDateHaveUpdated = async () => {

    try {
        const res = await API.get('/database/dieukientai/');
        return res.data;

    } catch (e) {
        console.error('Cannot get Date had download');
        throw new Error(e.response?.data?.message)
    }

}

//xóa bên data của thầy trong db
export const deleteFileById = async (id) => {
    try {
        const res = await API.delete(`/database/data/${id}/`)
        console.log('xóa file thành công', res.data)
        return res.data
    } catch (e) {
        console.log('lỗi khi xóa file:', e);
        throw e
    }


}

export const changeAttribute = async (id, name, type, text_content, van_ban) => {
    try {
        if (!id) {
            console.log("ID is undefined or null");
            return;
        }
        // Dữ liệu gửi lên API
        const dataToUpdate = {
            name: name,
            type: type,
            text_content: text_content,
            van_ban: van_ban,
            clean: true, // Cập nhật thuộc tính clean thành true
        };

        // Gửi yêu cầu PUT đến API
        const res = await API.put(`/database/data/${id}/`, dataToUpdate);
        console.log('Cập nhật thuộc tính thành công:', res.data);
        return res.data;
    } catch (e) {
        console.log('Lỗi khi cập nhật thuộc tính:', e);
        throw e;
    }
};


