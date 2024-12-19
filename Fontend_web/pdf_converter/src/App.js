





import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import './index.css';
import Home from './home/home';
import Header from './header/header';
import Login from './login/login';
import Sidebar from './sidebar/Sidebar';
import Search from './search/Search';
import UpdateFile from './update_file/UpdateFile';
import ManageFile from './manage_file/ManageFile';
import ManageAccount from './manage_account/ManageAccount';
import BacktoLogin from './login/backtologin/BacktoLogin';
import FileInfo from './manage_file/fileInfo/FileInfo';
import 'font-awesome/css/font-awesome.min.css';
import 'react-datepicker/dist/react-datepicker.css';

function App() {
  const [userFiles, setUserFiles] = useState([]);
  const [guestFiles, setGuestFiles] = useState([]);
  const [convertedFiles, setConvertedFiles] = useState([]);
  const [fileManage, setFileManage] = useState([]);
  const [authStatus, setAuthStatus] = useState(null); // null, 'user', or 'guest'
  const [premiumStatus, setPremiumStatus] = useState(null); // 'have_permiss' or 'no_permiss'
  const [accessToken, setAccessToken] = useState(null);
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(true);

  const handleSidebarToggle = () => {
    setIsSidebarCollapsed(prevState => !prevState);
  };

  const handleFileConvert = (file) => {
    if (authStatus === 'user') {
      setUserFiles([...userFiles, file]);
    } else if (authStatus === 'guest') {
      setGuestFiles([...guestFiles, file]);
    }
  };

  const handleLogin = () => {
    const d = localStorage.getItem('premium')
    setAuthStatus('user');
    setPremiumStatus(d);
    localStorage.setItem('authStatus', 'user');
    localStorage.setItem('premiumStatus', d);
  };

  const handleGuestLogin = () => {
    setAuthStatus('guest');
    localStorage.setItem('authStatus', 'guest');
  };

  const handleLogout = () => {
    setAuthStatus(null);
    setPremiumStatus(null);
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    localStorage.removeItem('authStatus');
    localStorage.removeItem('premiumStatus');
    localStorage.removeItem('id');
    localStorage.removeItem('role');
    setConvertedFiles([]);
  };

  const updateFiles = (newFiles) => {
    setFileManage(newFiles);
  };

  useEffect(() => {
    setConvertedFiles(authStatus === 'user' ? userFiles : authStatus === 'guest' ? guestFiles : []);
  }, [authStatus, userFiles, guestFiles]);

  useEffect(() => {
    const savedAuthStatus = localStorage.getItem('authStatus');
    const savedPremiumStatus = localStorage.getItem('premiumStatus');
    const savedToken = localStorage.getItem('access_token');
    if (savedAuthStatus) {
      setAuthStatus(savedAuthStatus);
      setPremiumStatus(savedPremiumStatus);
      setAccessToken(savedToken);
    }
  }, []);

  return (
    <Router>
      <Routes>
        <Route path="/login" element={<Login onLogin={handleLogin} onGuestLogin={handleGuestLogin} />} />
      </Routes>

      {(authStatus === 'user' || authStatus === 'guest') && <Header onSidebarToggle={handleSidebarToggle} onLogout={handleLogout} />}
      <div style={{ display: 'flex', overflow: 'hidden' }}>
        {(authStatus === 'user' || authStatus === 'guest') && <Sidebar isCollapsed={isSidebarCollapsed} />}
        <div className="scrollable-container" style={{ flex: 1, borderLeft: '0.1px solid #61D6A9', position: 'relative' }}>
          <Routes>
            <Route path="/home" element={<Home onFileConvert={handleFileConvert} />} />
            <Route path="/search" element={<Search convertedFiles={convertedFiles} authStatus={authStatus} />} />
            {authStatus === 'user' && premiumStatus === 'have_permiss' && (
              <>
                <Route path="/update-file" element={<UpdateFile accessToken={accessToken} updateFiles={updateFiles} fileManage={fileManage} />} />
                <Route path="/manage-file" element={<ManageFile fileManage={fileManage} />} />
                <Route path="/manage-file/info/:id" element={<FileInfo />} />
                <Route path="/manage-account" element={<ManageAccount />} />
              </>
            )}
            {authStatus === 'user' && premiumStatus === 'no_permiss' && (
              <>
                <Route path="/update-file" element={<BacktoLogin onBackToLogin={handleLogout} />} />
                <Route path="/manage-file" element={<BacktoLogin onBackToLogin={handleLogout} />} />
                <Route path="/manage-account" element={<BacktoLogin onBackToLogin={handleLogout} />} />
              </>
            )}
            {authStatus === 'guest' && (
              <>
                <Route path="/update-file" element={<BacktoLogin onBackToLogin={handleLogout} />} />
                <Route path="/manage-file" element={<BacktoLogin onBackToLogin={handleLogout} />} />
                <Route path="/manage-account" element={<BacktoLogin onBackToLogin={handleLogout} />} />
              </>
            )}
            <Route path="*" element={authStatus ? <Navigate to="/home" /> : <Navigate to="/login" />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;


