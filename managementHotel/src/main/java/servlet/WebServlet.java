package servlet;

import Language.LanguageControl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public abstract class WebServlet extends HttpServlet {
    protected HttpSession session;

    protected abstract void process(HttpServletRequest request, HttpServletResponse response);

    protected void forward(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        String web_server = getServletContext().getInitParameter("WEB_SERVER");
        request.setAttribute("web_server", web_server);
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        setLanguage(request,response);
        process(request, response);
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        setLanguage(request,response);
        process(request, response);
        return;
    }
    private void setLanguage(HttpServletRequest request, HttpServletResponse response){
        session = request.getSession();
        String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;
        LanguageControl languageControl = (LanguageControl) session.getAttribute("LanguageControl");
        if (languageControl == null) {

            languageControl = new LanguageControl(LanguageControl.VN_LAN);

            session.setAttribute("LanguageControl", languageControl);
        }else{

        }
    }
}
