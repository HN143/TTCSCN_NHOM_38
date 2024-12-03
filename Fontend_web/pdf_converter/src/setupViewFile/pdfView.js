import React from 'react';
import PDF from 'react-pdf-js';

const PdfViewer = ({ fileUrl }) => {
    return (
        <div>
            <h2>Hiển thị PDF:</h2>
            {fileUrl ? (
                <PDF file={fileUrl} />
            ) : (
                <p>Không tìm thấy tệp PDF.</p>
            )}
        </div>
    );
};

export default PdfViewer;
