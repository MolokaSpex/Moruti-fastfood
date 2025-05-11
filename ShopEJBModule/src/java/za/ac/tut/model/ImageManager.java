/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.model;

import java.io.IOException;
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
        Path imgPath = Paths.get(img);
        byte[] imageBytes = null;
        try {
            imageBytes = Files.readAllBytes(imgPath);
        } catch (IOException e) {
            System.err.println("Error reading image file: " + e.getMessage());
        }
        return imageBytes;
    }
    
}
