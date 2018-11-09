package com.pwy.spring5.service

import com.oreilly.servlet.MultipartRequest
import com.pwy.spring5.model.dao.CustomerDAO
import com.pwy.spring5.model.dao.LoginDAO
import com.pwy.spring5.model.dao.ProductDAO
import com.pwy.spring5.model.dto.CustomerDTO
import com.pwy.spring5.model.dto.JoinCustomerProductDTO
import com.pwy.spring5.model.dto.LoginDTO
import com.pwy.spring5.model.dto.ProductDTO
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.math.BigDecimal
import javax.servlet.http.HttpServletRequest

@Service("myService")
class ServiceImpl : MyService {
    @Autowired
    lateinit var customerDAO: CustomerDAO

    @Autowired
    lateinit var productDAO: ProductDAO

    @Autowired
    lateinit var loginDAO: LoginDAO

    override fun customerInsert(code : BigDecimal , customerName : String) {
        customerDAO.insert(CustomerDTO(code, customerName))
    }

    override fun customerList(): List<CustomerDTO> {
        return customerDAO.selectAll()
    }

    override fun productInsert(req: HttpServletRequest) {
        productDAO.insert(productRequestMapper(req))
    }

    override fun login(id: String, password: String): Boolean {
//        return loginDAO.login(id, password)
        return loginDAO.login(LoginDTO(id, password)) != null
    }

    override fun productList(): List<JoinCustomerProductDTO> {
        return productDAO.selectAllForList()
    }

    override fun productDelete(productCode: Long) {
        return productDAO.deleteByCode(productCode)
    }

    override fun selectProductByCode(productCode: Long): JoinCustomerProductDTO? {
        return productDAO.selectByCode(productCode)
    }

    override fun productUpdate(req: HttpServletRequest) {
        productDAO.update(productRequestMapper(req))
    }

    override fun productFind(type: String, keyword: String): List<JoinCustomerProductDTO>? {
        return when (type) {
            "customer" -> productDAO.findByCustomerName(keyword)
            "product" -> productDAO.findByProductName(keyword)
            else -> null
        }
    }

    private fun productRequestMapper(req: HttpServletRequest): ProductDTO {
        val mr = MultipartRequest(req, req.servletContext.getRealPath("/img"))

        val customerCode = mr.getParameter("customerCode").toBigDecimal()
        val productName = mr.getParameter("productName")
        val productCode = mr.getParameter("productCode").toBigDecimal()
        val imagePath = "/img/${mr.getOriginalFileName("imagePath") ?: "no_item.png"}"
        val quantity = mr.getParameter("quantity").toBigDecimal()
        val standard = mr.getParameter("standard")

        return ProductDTO(customerCode, productName, productCode, imagePath, quantity, standard)
    }
}