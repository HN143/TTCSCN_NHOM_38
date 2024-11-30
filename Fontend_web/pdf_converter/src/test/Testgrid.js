import React from 'react';

function TestComponent() {
    return (
        <div className="bg-blue-500 text-white p-6 rounded-lg shadow-lg">
            <h1 className="text-3xl font-bold mb-4">Hello, Tailwind CSS!</h1>
            <p className="text-lg">
                Đây là một component để kiểm tra xem Tailwind CSS có hoạt động hay không.
            </p>
            <button className="mt-4 bg-white text-blue-500 font-semibold py-2 px-4 rounded hover:bg-blue-100">
                Nhấn vào đây
            </button>
        </div>
    );
}

export default TestComponent;
