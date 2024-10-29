package com.chtrembl.petstore.product.converter;


import com.chtrembl.petstore.product.model.Product;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class StatusEnumConverter implements AttributeConverter<Product.StatusEnum, String> {

    @Override
    public String convertToDatabaseColumn(Product.StatusEnum attribute) {
        if (attribute == null) {
            return null;
        }
        return attribute.getValue();
    }

    @Override
    public Product.StatusEnum convertToEntityAttribute(String dbData) {
        if (dbData == null) {
            return null;
        }
        return Product.StatusEnum.fromValue(dbData);
    }
}