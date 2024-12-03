import React, { useState, useEffect } from "react";
import mammoth from "mammoth";

const WordViewer = ({ fileUrl }) => {
    const [content, setContent] = useState("");

    useEffect(() => {
        const loadWordFile = async () => {
            if (!fileUrl) return;

            try {
                const response = await fetch(fileUrl);
                const arrayBuffer = await response.arrayBuffer();
                const { value } = await mammoth.extractRawText({ arrayBuffer });
                setContent(value);
            } catch (err) {
                console.error("Lỗi khi tải file Word:", err);
                setContent("Không thể hiển thị nội dung file Word.");
            }
        };

        loadWordFile();
    }, [fileUrl]);

    return (
        <div>
            <h2>Hiển thị Word:</h2>
            <div style={{ whiteSpace: "pre-wrap" }}>
                {content || "Không tìm thấy tệp Word."}
            </div>
        </div>
    );
};

export default WordViewer;
