// import React, { useState, useEffect } from "react";
// import './sidebar.scss';
// import { SidebarData } from './SidebarData.js';
// import { Link, useLocation } from 'react-router-dom';

// function Sidebar({ isCollapsed }) {
//     const location = useLocation();
//     const [activeIndex, setActiveIndex] = useState(-1);
//     const [isHaveNotify, setIsHaveNotify] = useState(true);

//     useEffect(() => {
//         // Tìm chỉ số tương ứng với đường dẫn hiện tại
//         const activeIndex = SidebarData.findIndex(val => val.link === location.pathname);
//         setActiveIndex(activeIndex);
//     }, [location.pathname]); // Thay đổi activeIndex mỗi khi đường dẫn thay đổi

//     return (
//         <div className="sidebar">
//             <ul className="sidebar-list">
//                 {SidebarData.map((val, key) => {
//                     const isActive = activeIndex === key;
//                     return (
//                         <li className="list-row" key={key}>
//                             <Link
//                                 to={val.link}
//                                 className={`sidebar-link ${isActive ? 'active' : ''}`}
//                                 onClick={() => setActiveIndex(key)}
//                             >
//                                 <div className="sidebar-icon">
//                                     <img src={val.icon} alt={val.title} />
//                                 </div>
//                                 <div className="sidebar-title">
//                                     {val.title}
//                                     {val.title === "Cập nhật file" && isHaveNotify && (
//                                         <span className="notify-dot"></span>
//                                     )}
//                                 </div>
//                             </Link>
//                         </li>
//                     );
//                 })}
//             </ul>
//         </div>
//     );
// }

// export default Sidebar;







import React, { useState, useEffect } from "react";
import './sidebar.scss';
import { SidebarData } from './SidebarData.js';
import { Link, useLocation } from 'react-router-dom';

function Sidebar({ isCollapsed, onToggle }) { // Thêm prop onToggle để nhận hành động toggle sidebar
    const location = useLocation();
    const [activeIndex, setActiveIndex] = useState(-1);
    const [isHaveNotify, setIsHaveNotify] = useState(false);

    useEffect(() => {
        // Tìm chỉ số tương ứng với đường dẫn hiện tại
        const activeIndex = SidebarData.findIndex(val => val.link === location.pathname);
        setActiveIndex(activeIndex);
    }, [location.pathname]); // Thay đổi activeIndex mỗi khi đường dẫn thay đổi

    return (
        <div className={`sidebar ${isCollapsed ? 'collapsed' : ''}`}>
            <ul className="sidebar-list">
                {SidebarData.map((val, key) => {
                    const isActive = activeIndex === key;
                    return (
                        <li className="list-row" key={key}>
                            <Link
                                to={val.link}
                                className={`sidebar-link ${isActive ? 'active' : ''}`}
                                onClick={() => setActiveIndex(key)}
                            >
                                <div className="sidebar-icon">
                                    <img src={val.icon} alt={val.title} />
                                </div>
                                <div className="sidebar-title">
                                    {val.title}
                                    {val.title === "Cập nhật file" && isHaveNotify && (
                                        <span className="notify-dot"></span>
                                    )}
                                </div>
                            </Link>
                        </li>
                    );
                })}
            </ul>
            {/* Add toggle button to toggle sidebar */}
            <button onClick={onToggle} className="toggle-btn">

            </button>
        </div>
    );
}

export default Sidebar;



















// import React, { useState, useEffect } from "react";
// import './sidebar.scss';
// import { SidebarData } from './SidebarData.js';
// import { Link, useLocation } from 'react-router-dom';

// function Sidebar() {
//     const location = useLocation();
//     const [activeIndex, setActiveIndex] = useState(-1);
//     const [isHaveNotify, setIsHaveNotify] = useState(true);
//     const [isOpen, setIsOpen] = useState(false); // Thêm state để mở/đóng sidebar

//     useEffect(() => {
//         const activeIndex = SidebarData.findIndex(val => val.link === location.pathname);
//         setActiveIndex(activeIndex);
//     }, [location.pathname]);

//     const toggleSidebar = () => {
//         setIsOpen(!isOpen);
//     };

//     return (
//         <div className={`sidebar ${isOpen ? 'open' : ''}`}>
//             {/* Nút hamburger chỉ hiển thị khi màn hình nhỏ */}
//             <div className="sidebar-toggle" onClick={toggleSidebar}>
//                 <i className="fa fa-bars"></i> {/* Hamburger icon */}
//             </div>
//             <ul className="sidebar-list">
//                 {SidebarData.map((val, key) => {
//                     const isActive = activeIndex === key;
//                     return (
//                         <li className="list-row" key={key}>
//                             <Link
//                                 to={val.link}
//                                 className={`sidebar-link ${isActive ? 'active' : ''}`}
//                                 onClick={() => setActiveIndex(key)}
//                             >
//                                 <div className="sidebar-icon">
//                                     <img src={val.icon} alt={val.title} />
//                                 </div>
//                                 {/* Tiêu đề sẽ ẩn trên màn hình nhỏ và hiển thị lại trên màn hình lớn */}
//                                 <div className="sidebar-title">
//                                     {val.title}
//                                     {val.title === "Cập nhật file" && isHaveNotify && (
//                                         <span className="notify-dot"></span>
//                                     )}
//                                 </div>
//                             </Link>
//                         </li>
//                     );
//                 })}
//             </ul>
//         </div>
//     );
// }

// export default Sidebar;

