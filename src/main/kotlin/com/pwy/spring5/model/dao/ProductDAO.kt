package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.JoinCustomerProductDTO
import com.pwy.spring5.model.dto.ProductDTO

interface ProductDAO {
    fun insert(dto: ProductDTO)
    fun deleteByCode(productCode: Long)
    fun update(dto: ProductDTO)
    fun selectAll(): List<ProductDTO>
    fun selectAllForList() : List<JoinCustomerProductDTO>
    fun selectByCode(productCode: Long): JoinCustomerProductDTO?
    fun findByCustomerName(keyword: String): List<JoinCustomerProductDTO>
    fun findByProductName(keyword: String): List<JoinCustomerProductDTO>
}
