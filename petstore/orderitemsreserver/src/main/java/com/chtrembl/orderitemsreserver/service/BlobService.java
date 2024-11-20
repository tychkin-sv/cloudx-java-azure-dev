package com.chtrembl.orderitemsreserver.service;

import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobContainerClientBuilder;
import com.azure.storage.blob.models.BlobHttpHeaders;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.logging.Logger;

public class BlobService {

    private final String BLOB_CONNECTION_STRING =
            System.getenv("BLOB_CONNECTION_STRING") != null ? System.getenv("BLOB_CONNECTION_STRING") :
                    "not set";

    private final String blobConnectionString;

    public BlobService() {
        this.blobConnectionString = BLOB_CONNECTION_STRING;
    }

    public void createOrReplaceFileInBlobStorage(String fileNamePrefix, String fileContent, Logger logger) {

        logger.info("File prefix : " + fileNamePrefix);
        BlobContainerClient blobContainerClient = createBlobContainerIfNotExist("orderitems");
        BlobClient client = blobContainerClient.getBlobClient(fileNamePrefix + "_products");

        logger.info("Will process content : " + fileContent);
        ByteArrayInputStream dataStream = new ByteArrayInputStream(fileContent.getBytes(StandardCharsets.UTF_8));

        client.upload(dataStream, fileContent.length(), true);

        BlobHttpHeaders headers = new BlobHttpHeaders();
        headers.setContentType("application/json");
        client.setHttpHeaders(headers);
    }

    private BlobContainerClient createBlobContainerIfNotExist(String containerName) {
        BlobContainerClient blobContainerClient = new BlobContainerClientBuilder()
                .connectionString(this.blobConnectionString)
                .containerName(containerName)
                .buildClient();

        if (!blobContainerClient.exists()) {
            blobContainerClient.create();
        }

        return blobContainerClient;
    }
}
