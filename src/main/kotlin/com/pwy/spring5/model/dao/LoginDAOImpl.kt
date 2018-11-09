package com.pwy.spring5.model.dao

import com.pwy.spring5.model.dto.LoginDTO
import org.mybatis.spring.SqlSessionTemplate
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

@Repository("loginDAO")
class LoginDAOImpl : LoginDAO {
    @Autowired
    lateinit var mybatis: SqlSessionTemplate

    override fun login(dto: LoginDTO): LoginDTO? {
        return mybatis.selectOne<LoginDTO>("com.pwy.spring5.model.dao.LoginDAO.login",dto)
    }

}