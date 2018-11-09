package com.pwy.spring5.service

import com.pwy.spring5.model.dto.CustomerDTO
import com.pwy.spring5.model.dto.JoinCustomerProductDTO
import java.math.BigDecimal
import javax.servlet.http.HttpServletRequest

interface MyService {
    fun productInsert(req: HttpServletRequest)
    fun customerList(): List<CustomerDTO>
    fun login(id: String, password: String): Boolean
    fun productList(): List<JoinCustomerProductDTO>
    fun productDelete(productCode: Long)
    fun selectProductByCode(productCode: Long): JoinCustomerProductDTO?
    fun productUpdate(req: HttpServletRequest)
    fun productFind(type: String, keyword: String): List<JoinCustomerProductDTO>?
    fun customerInsert(code: BigDecimal, customerName: String)
}