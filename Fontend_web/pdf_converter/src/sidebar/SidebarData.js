import { icon } from '@fortawesome/fontawesome-svg-core'
import icons from './icon'
import React from 'react'

export const SidebarData = [
    {
        title: 'Home',
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
        title: 'Quản lý tài khoản',
        icon: icons.setting,
        link: '/manage-account'
    },
]

