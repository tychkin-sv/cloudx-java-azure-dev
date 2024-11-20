package com.chtrembl.orderitemsreserver.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private Long id;
    private Category category;
    private String name;
    private String photoURL;
    private List<Tag> tags;
    private Integer quantity;
}
