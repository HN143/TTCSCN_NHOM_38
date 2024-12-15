import { icon } from '@fortawesome/fontawesome-svg-core'
import icons from './icon'
import React from 'react'

export const SidebarData = [
    {
        title: 'Trang chủ',
        icon: icons.home,
        link: '/home'
    },
    {
        title: 'Tìm kiếm nội dung',
        icon: icons.search,
        link: '/search'
    },
    {
        title: 'Cập nhật file',
        icon: icons.update,
        link: '/update-file'
    },
    {
        title: 'Quản lý file',
        icon: icons.manage,
        link: '/manage-file'
    },
    {
        title: 'Tài khoản & bộ nhớ',
        icon: icons.setting,
        link: '/manage-account'
    },
]

