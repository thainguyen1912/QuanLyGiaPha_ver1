package Filter;

import Enity.Account;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "All", urlPatterns = {
    "/AddIndividual",
    "/CreateParentage",
    "/DeleteIndividual",
    "/EditIndividual",
    "/ListAvatar",
    "/ListIndividual",
    "/ParentageInfo",
    "/ParentageViewTree",
    "/ParentageViewTreeExtend",
    "/UpdateParentageInfo",
    "/UserAction",
    "/AdminControl",
    "/PostControl"
})
public class All implements Filter {

    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public All() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("All:DoBeforeProcessing");
        }

    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("All:DoAfterProcessing");
        }

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
//        String requestURI = req.getRequestURI();
//        System.out.println(requestURI);// -> /QuanLyGiaPha/ParentageInfo

//        boolean check = false;
//        for (int i = 0; i < listURI.size(); i++) {
//            if (listURI.get(i).equals(requestURI)) {
//                check = true;
//                break;
//            }
//        }
//
//        if (check == true) {
//            if (requestURI.equals("/QuanLyGiaPha/") == true) {
//                RequestDispatcher rd = req.getRequestDispatcher("views/home_page/index.jsp");
//                rd.forward(request, response);
//            } else {
                HttpSession session = req.getSession();
                Account acc = (Account) session.getAttribute("Account");
                if (acc == null) {
                    req.setAttribute("filter_mess", "Bạn Phải Đăng Nhập Để Có Thể Truy Cập Trang Này");
                    RequestDispatcher rd = req.getRequestDispatcher("views/login_register_page/login.jsp");
                    rd.forward(request, response);
                } else {
                    chain.doFilter(request, response);
                }
            }
//        } else {
//            RequestDispatcher rd = req.getRequestDispatcher("views/error_page/404-page.jsp");
//            rd.forward(request, response);
//        }
    

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("All:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("All()");
        }
        StringBuffer sb = new StringBuffer("All(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
