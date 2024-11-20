package io.swagger.service;

import com.chtrembl.petstore.product.model.Product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

import io.swagger.repository.ProductRepository;

@Service
public class ProductService {
    static final Logger log = LoggerFactory.getLogger(ProductService.class);

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getProducts() {
        List<Product> products = productRepository.findAll();
        log.info("products : " + products);
        return products;
    }
}