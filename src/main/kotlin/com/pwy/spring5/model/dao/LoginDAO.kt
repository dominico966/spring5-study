package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.LoginDTO
import org.apache.ibatis.annotations.Select

interface LoginDAO {
    fun login(dto : LoginDTO) : LoginDTO?
}