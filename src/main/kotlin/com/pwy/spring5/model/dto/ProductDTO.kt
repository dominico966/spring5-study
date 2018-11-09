package com.pwy.spring5.model.dto

import java.math.BigDecimal

data class ProductDTO(
        val customerCode: BigDecimal,
        val productName: String,
        val productCode: BigDecimal,
        val imagePath: String,
        val quantity: BigDecimal,
        val standard: String
)
