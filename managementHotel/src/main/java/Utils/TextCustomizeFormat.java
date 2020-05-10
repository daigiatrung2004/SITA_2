package Utils;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class TextCustomizeFormat {
    public static String currency_format(long number) {
        String formatted = "";
        NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);
        formatted = nf.format(number);
//       System.out.println("chua xoa"+formatted);
        String[] split = formatted.split("\\.");
        if (split.length > 1) {
            formatted = split[0];
//          System.out.println("amount"+formatted);
        }
        // BỎ $

        return formatted.replace("$", "");
    }

    public static ArrayList<String> getDateAllOfMonthNow() {
        ArrayList<String> listDate = new ArrayList<String>();
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        int month = date.getMonth();
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        System.out.println(df.format(cal.getTime()));
        for (int i = 1; i < maxDay; i++) {
            cal.set(Calendar.DAY_OF_MONTH, i + 1);
            listDate.add(df.format(cal.getTime()));
//         System.out.println(df.format(cal.getTime()));
        }
        return listDate;
    }

    public static ArrayList<String> getDateAllOfMonth(int month, int year) {
        ArrayList<String> listDate = new ArrayList<String>();
        Calendar cal = Calendar.getInstance();
        Date date = new Date();

        cal.set(Calendar.MONTH, month-1);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.YEAR, year);
        int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        System.out.println(df.format(cal.getTime()));
        for (int i = 1; i < maxDay; i++) {
            cal.set(Calendar.DAY_OF_MONTH, i + 1);
            listDate.add(df.format(cal.getTime()));
//         System.out.println(df.format(cal.getTime()));
        }
        return listDate;
    }
    public static String convertTextToString(String text){
        text=text.trim();
        text=text.replaceAll(" ","-");
        return text;
    }

    public static void main(String[] args) {
        long amount = 1000;
//        getDateAllOfMonthNow();
//        NumberFormat nf = NumberFormat.getCurrencyInstance();

    }
}
