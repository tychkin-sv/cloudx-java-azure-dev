package io.swagger.service;

import com.chtrembl.petstore.order.model.Order;

import org.springframework.stereotype.Service;

import java.util.Optional;

import io.swagger.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public void save(Order order) {
        orderRepository.save(order);
    }

    public Order get(String orderId) {
        Optional<Order> order = Optional.of(orderRepository.findById(orderId)
                .orElse(new Order()));
        return order.get();
    }
}
