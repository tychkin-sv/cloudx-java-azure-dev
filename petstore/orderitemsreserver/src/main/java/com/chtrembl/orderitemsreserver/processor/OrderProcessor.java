package com.chtrembl.orderitemsreserver.processor;

import com.chtrembl.orderitemsreserver.model.Order;
import com.chtrembl.orderitemsreserver.service.BlobService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.logging.Logger;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class OrderProcessor {

    private final BlobService blobService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    public OrderProcessor(BlobService blobService) {
        this.blobService = blobService;
    }

    public void process(String orderDto, Logger logger) throws JsonProcessingException {


        Order order = objectMapper.readValue(orderDto, Order.class);
        logger.info("Try to process order: " +  order.getId());

        blobService.createOrReplaceFileInBlobStorage(order.getId(), order.getProducts().toString(), logger);
    }


}
