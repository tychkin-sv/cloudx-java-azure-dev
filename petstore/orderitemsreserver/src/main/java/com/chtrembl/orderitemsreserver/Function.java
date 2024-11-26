package com.chtrembl.orderitemsreserver;

import com.chtrembl.orderitemsreserver.service.BlobService;
import com.chtrembl.orderitemsreserver.processor.OrderProcessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.microsoft.azure.functions.ExecutionContext;
import com.microsoft.azure.functions.annotation.FixedDelayRetry;
import com.microsoft.azure.functions.annotation.FunctionName;
import com.microsoft.azure.functions.annotation.ServiceBusQueueTrigger;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Function {

    private final OrderProcessor processor = new OrderProcessor(new BlobService());

    @FunctionName("saveOrUpdateOrderItems")
    @FixedDelayRetry(maxRetryCount = 3, delayInterval = "00:00:05")
    public void run(
            @ServiceBusQueueTrigger(
                    name = "order",
                    queueName = "tsv-queue-tsv",
                    connection = "AzureWebJobsServiceBus"
            ) String order,
            final ExecutionContext context) throws JsonProcessingException {
        context.getLogger().info("Function triggered");
        context.getLogger().info("Received order: " + order);
        processor.process(order, context.getLogger());
    }
}