package com.pwy.spring5.model.dto

import java.math.BigDecimal

data class CustomerDTO (
        val code : BigDecimal,
        val customerName : String
)