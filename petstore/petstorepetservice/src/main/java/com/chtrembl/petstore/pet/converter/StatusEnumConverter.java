package com.chtrembl.petstore.pet.converter;

import com.chtrembl.petstore.pet.model.Pet;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class StatusEnumConverter implements AttributeConverter<Pet.StatusEnum, String> {

    @Override
    public String convertToDatabaseColumn(Pet.StatusEnum attribute) {
        if (attribute == null) {
            return null;
        }
        return attribute.getValue();
    }

    @Override
    public Pet.StatusEnum convertToEntityAttribute(String dbData) {
        if (dbData == null) {
            return null;
        }
        return Pet.StatusEnum.fromValue(dbData);
    }
}