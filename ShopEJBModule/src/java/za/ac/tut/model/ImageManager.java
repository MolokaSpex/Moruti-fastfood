/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.model;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author thema
 */
public class ImageManager implements ImageInterface{

    @Override
    public byte[] getByteImage(String img) {
        try {
            InputStream inputStream = new FileInputStream(img); // Use FileInputStream
            return getPhotoByte(inputStream);
        } catch (FileNotFoundException e) {
            System.err.println("File not found: " + img);
            return null;
        }
    }
    public byte[] getPhotoByte(InputStream photoInputStream) {
    ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    byte[] data = new byte[1024]; // Use a buffer size that's efficient for your needs
    int bytesRead;

    try {
        if (photoInputStream == null) {
            return null; // Handle the null case
        }
        while ((bytesRead = photoInputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray(); // Get the complete byte array
    } catch (IOException e) {
        System.err.println("Error reading from InputStream: " + e.getMessage());
        return null; // Or throw the exception, depending on your error handling policy
    } finally {
        try {
            if (photoInputStream != null) {
                photoInputStream.close(); // Close the stream in a finally block
            }
        } catch (IOException e) {
            System.err.println("Error closing InputStream: " + e.getMessage());
            // Log this error;  closing errors are important too.
        }
    }
}
    
}
