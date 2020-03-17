package servlet.Ajax;

import Language.LanguageControl;
import servlet.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxChangeLanguage extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {

        try {
            String lang=request.getParameter("lang")!=null?(String)request.getParameter("lang"): LanguageControl.VN_LAN;
            session.removeAttribute("language");
            LanguageControl languageControl=null;
            if(lang.equals(LanguageControl.VN_LAN)){
                session.setAttribute("language",LanguageControl.VN_LAN);
                languageControl=new LanguageControl(LanguageControl.VN_LAN);
            }else{
                session.setAttribute("language",LanguageControl.EN_LAN);
                languageControl=new LanguageControl(LanguageControl.EN_LAN);
            }
            session.setAttribute("LanguageControl",languageControl);
            response.getWriter().print("{\"success\":true}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
