package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.JoinCustomerProductDTO
import com.pwy.spring5.model.dto.ProductDTO
import org.mybatis.spring.SqlSessionTemplate
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

@Repository("productDAO")
class ProductDAOImpl : ProductDAO {
    @Autowired
    lateinit var mybatis: SqlSessionTemplate

    override fun insert(dto: ProductDTO) {
        mybatis.insert("com.pwy.spring5.model.dao.ProductDAO.insert", dto)
    }

    override fun selectAll(): List<ProductDTO> {
        return mybatis.selectList("com.pwy.spring5.model.dao.ProductDAO.selectAll")
    }

    override fun selectAllForList(): List<JoinCustomerProductDTO> {
        return mybatis.selectList("com.pwy.spring5.model.dao.ProductDAO.selectAllForList")
    }

    override fun selectByCode(productCode: Long): JoinCustomerProductDTO? {
        return mybatis.selectOne("com.pwy.spring5.model.dao.ProductDAO.selectByCode", productCode)
    }

    override fun deleteByCode(productCode: Long) {
        mybatis.delete("com.pwy.spring5.model.dao.ProductDAO.selectByCode", productCode)
    }

    override fun update(dto: ProductDTO) {
        mybatis.update("com.pwy.spring5.model.dao.ProductDAO.update", dto)
    }

    override fun findByCustomerName(keyword: String): List<JoinCustomerProductDTO> {
        return mybatis.selectList("com.pwy.spring5.model.dao.ProductDAO.findByCustomerName", "$keyword%")
    }

    override fun findByProductName(keyword: String): List<JoinCustomerProductDTO> {
        return mybatis.selectList("com.pwy.spring5.model.dao.ProductDAO.findByProductName", "$keyword%")
    }
}