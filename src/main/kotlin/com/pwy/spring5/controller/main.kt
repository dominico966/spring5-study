package com.pwy.spring5.controller

import com.pwy.spring5.service.MyService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.SessionAttribute
import org.springframework.web.servlet.ModelAndView
import java.math.BigDecimal
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class main {

    val log : Logger = LoggerFactory.getLogger(main::class.java)

    @Autowired
    lateinit var myService: MyService

    @RequestMapping("/")
    fun goToHome(): ModelAndView {
        log.info("경로요청 : [/] -> /WEB-INF/view/home.jsp")
        return ModelAndView("home")
    }

    @RequestMapping("/{pathName:[a-zA-Z]+}")
    fun goToPage(@PathVariable pathName: String): ModelAndView {
        return ModelAndView(pathName)
    }

    @RequestMapping("/customerView")
    fun goToCustomerView(): ModelAndView {
        return ModelAndView("customerView").also {
            val list = myService.customerList()
            it.addObject("list", list)
        }
    }

    @RequestMapping("/productInsert")
    fun goToProductInsert(): ModelAndView {
        return ModelAndView("productInsert").also {
            it.addObject("list", myService.customerList())
        }
    }

    @RequestMapping("/productView")
    fun goToProductView(): ModelAndView {
        return ModelAndView("productView").also {
            it.addObject("list", myService.productList())
        }
    }

    @RequestMapping("/customerInsert.do")
    fun customerInsert(@RequestParam code: BigDecimal, @RequestParam customerName: String): ModelAndView {
        myService.customerInsert(code, customerName)
        return ModelAndView("redirect:customerView.do")
    }

    @RequestMapping("/customerView.do")
    fun customerView(): ModelAndView {
        return ModelAndView("redirect:customerView")
    }

    @RequestMapping("/login.do")
    fun login(req: HttpServletRequest, @RequestParam id: String, @RequestParam password: String): ModelAndView {
        val isLoginSuccess = myService.login(id, password)

        if (isLoginSuccess) {
            if ("admin" == id) {
                req.session.setAttribute("admin", true)
            }
        }

        return ModelAndView("home")
    }

    @RequestMapping("/productInsert.do")
    fun productInsert(req: HttpServletRequest, resp: HttpServletResponse): ModelAndView {
        myService.productInsert(req)

        return ModelAndView("redirect:productView")
    }

    @RequestMapping("/productView.do")
    fun productView(): ModelAndView {
        return ModelAndView("redirect:productView")
    }

    @RequestMapping("/productDelete.do/{productCode}")
    fun productDelete(resp: HttpServletResponse, @SessionAttribute admin: Boolean, @PathVariable productCode: Long): ModelAndView {
        if (!admin) resp.sendError(500)
        myService.productDelete(productCode)

        return ModelAndView("redirect:../productView")
    }

    @RequestMapping("/productUpdate/{productCode}")
    fun goToProductUpdate(@PathVariable productCode: String): ModelAndView {
        return ModelAndView("productUpdate").also {
            val item = myService.selectProductByCode(productCode.toLong())
            it.addObject("dto", item)
        }
    }

    @RequestMapping("/productUpdate.do")
    fun productUpdate(req: HttpServletRequest): ModelAndView {
        myService.productUpdate(req)
        return ModelAndView("redirect:productView")
    }

    @RequestMapping("/productFind")
    fun goToProductFind(): ModelAndView {
        return ModelAndView("productFind")
    }

    @RequestMapping("/productFind.do")
    fun productFind(req: HttpServletRequest): ModelAndView {
        val type = req.getParameter("type")
        val keyword = req.getParameter("keyword")

        return ModelAndView("productFind").also {
            val list = myService.productFind(type, keyword)
            it.addObject("list", list)
        }
    }
}