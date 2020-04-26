package Utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ConvertHTMLToString {
    public static String htmlToString(String urlfile) {
        StringBuilder contentBuilder = new StringBuilder();
        try {
            BufferedReader in = new BufferedReader(new FileReader(urlfile));
            String str;
            while ((str = in.readLine()) != null) {
                contentBuilder.append(str);
            }
            in.close();
        } catch (IOException e) {
        }
        String content = contentBuilder.toString();
        return content;
    }
    public String setInfomationTOEmail(ArrayList infolist,String content){
        return content;
    }
    public static void main(String[] args) {
        System.out.println("html hien tai:"+htmlToString("C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\email\\confirm_booking.html"));

    }
}
