package Utils;

import java.text.NumberFormat;
import java.util.Locale;

public class TextCustomizeFormat {
    public static String currency_format(long number) {
        String formatted = "";
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        formatted = nf.format(number);
//        System.out.println("chua xoa"+formatted);
        String[] split = formatted.split("\\.");
        if (split.length > 1) {
            formatted = split[0];
//            System.out.println("amount"+formatted);
        }
        // BỎ $

        return formatted.replace("$","");
    }

    public static void main(String[] args) {
        long amount = 1234567;
//        NumberFormat nf = NumberFormat.getCurrencyInstance();
        System.out.println(currency_format(amount));
//        System.out.println();
//
//        nf = NumberFormat.getCurrencyInstance(Locale.US);
//        System.out.println(nf.format(amount));
//        System.out.println();
//
//        System.out.println(nf.getClass().getName());
    }
}
