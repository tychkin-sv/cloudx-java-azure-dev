package com.chtrembl.orderitemsreserver.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private String id;
    private String email;
    private List<Product> products;
    private String shipDate;
    private List<String> tags;
    private String status;
    private boolean complete;
}
