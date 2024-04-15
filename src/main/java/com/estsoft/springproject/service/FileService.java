package com.estsoft.springproject.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileService {

    private final AmazonS3 amazonS3;
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    public String fileWrite(MultipartFile file) throws IOException {

        UUID uuid = UUID.randomUUID();

        String directory = "images/base-loaded/";

        String fileName = directory + uuid + "_" + file.getOriginalFilename();

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(file.getSize());
        metadata.setContentType(file.getContentType());

        amazonS3.putObject(bucket, fileName, file.getInputStream(), metadata);

        return fileName;
    }

    public byte[] fileLoad(String fileName) throws FileNotFoundException {

        if(isNotExist(fileName)) {
            throw new FileNotFoundException();
        }

        S3Object s3Object = amazonS3.getObject(bucket, fileName);
        S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();

        try {
            return IOUtils.toByteArray(s3ObjectInputStream);
        }catch (IOException e){
            throw new FileNotFoundException();
        }
    }

    private boolean isNotExist(String fileName) {

        return !amazonS3.doesObjectExist(bucket, fileName);
    }
}
