import React from 'react';
import './progressBar.scss'; // Thêm CSS để định dạng thanh tiến độ

const ProgressBar = ({ processed, total }) => {
    const progress = Math.min((processed / total) * 100, 100); // Tính phần trăm tiến độ

    return (
        <div className="progress-bar ">
            <div className="progress-bar-track">
                <div
                    className="progress-bar-fill"
                    style={{ width: `${progress}%` }}
                ></div>
            </div>
            <p className="progress-bar-text">{`Đã xử lý: ${processed}/${total}%`}</p>
        </div>
    );
};

export default ProgressBar;
