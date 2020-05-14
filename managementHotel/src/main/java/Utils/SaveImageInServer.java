package Utils;

import DTO.StaticTO;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Random;

public class SaveImageInServer {
    public static String createImageFromBase64(String base64, String filename) {
        String[] parts = base64.split(",");
        String imageString = parts[1];
        // create a buffered image
        BufferedImage image = null;
        byte[] imageByte;

        BASE64Decoder decoder = new BASE64Decoder();
        String path = "";
        try {
            imageByte = decoder.decodeBuffer(imageString);
            ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            bis.close();
            Random rn = new Random();
            String rnStr = String.valueOf(rn.nextInt(StaticTO.numOfRandom));
            System.out.println("randoom" + rnStr);
            String fileName = rnStr + filename + ".png";
            path = "C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\" + fileName;

            File outputfile = new File(path);
            ImageIO.write(image, "png", outputfile);

        } catch (IOException e) {
            e.printStackTrace();
        }


// write the image to a file
        return path;
    }
    public static void deleteFileName(String path){
        if(!path.equals("")) {
            File myObj = new File(path);
            if (myObj.delete()) {
                System.out.println("Deleted the file: " + myObj.getName());
            } else {
                System.out.println("Failed to delete the file.");
            }
        }else{
            System.out.println("Failed to delete the file.");
        }
    }
}
