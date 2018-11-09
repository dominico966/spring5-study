package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.CustomerDTO
import org.mybatis.spring.SqlSessionTemplate
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

@Repository("customerDAO")
class CustomerDAOImpl : CustomerDAO {
    @Autowired
    lateinit var mybatis: SqlSessionTemplate

    override fun insert(dto: CustomerDTO) {
        mybatis.insert("com.pwy.spring5.model.dao.CustomerDAO.insert", dto)
    }

    override fun selectAll(): List<CustomerDTO> {
        return mybatis.selectList("com.pwy.spring5.model.dao.CustomerDAO.selectAll")
    }

}