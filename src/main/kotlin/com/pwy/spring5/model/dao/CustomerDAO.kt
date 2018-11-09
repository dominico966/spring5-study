package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.CustomerDTO

interface CustomerDAO {
    fun insert(dto : CustomerDTO)
    fun selectAll(): List<CustomerDTO>
}