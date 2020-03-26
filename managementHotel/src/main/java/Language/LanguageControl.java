package Language;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class LanguageControl {
    public static final String VN_LAN="vi";
    public static final String EN_LAN="en";
    public Properties properties;
    private String lang;
    public LanguageControl(String lang) {
            this.lang=lang;
    }
    public String readXMl(String key) {

        InputStream in=null;
        Properties pro=new Properties();
        try {
        if(this.lang.equals(EN_LAN)) {

                in= new FileInputStream("C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\java\\Language\\Eng_Languages.properties");



        }else{
            in= new FileInputStream("C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\java\\Language\\Vi_Languages.properties");
        }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        try (Reader reader = new InputStreamReader(in, StandardCharsets.UTF_8)) {
            pro.load(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String value=pro.getProperty(key);
        return value;
    }

    public static void main(String[] args) {
        LanguageControl lang=new LanguageControl(LanguageControl.VN_LAN);
        String test=lang.readXMl("go_aboad");
        System.out.println("test" +test);

    }

}
