package pl.coderslab.doctoroffice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
public class LoginController {
    public String login() {
        return "user/login";
    }
}
