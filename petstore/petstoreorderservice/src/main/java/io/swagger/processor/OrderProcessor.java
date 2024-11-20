package io.swagger.processor;

import com.azure.messaging.servicebus.ServiceBusClientBuilder;
import com.azure.messaging.servicebus.ServiceBusMessage;
import com.azure.messaging.servicebus.ServiceBusSenderClient;
import com.chtrembl.petstore.order.model.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderProcessor {

    @Value("${spring.cloud.azure.servicebus.entity-name}")
    private String queueName;

    @Value("${spring.cloud.azure.servicebus.connectionString}")
    private String connectionString;

    private final ObjectMapper objectMapper;

    public String process(Order order) throws JsonProcessingException {
        String orderDto = objectMapper.writeValueAsString(order);

        ServiceBusSenderClient senderClient = new ServiceBusClientBuilder()
                .connectionString(connectionString)
                .sender()
                .queueName(queueName)
                .buildClient();

        senderClient.sendMessage(new ServiceBusMessage(orderDto));
        return orderDto;
    }
}
