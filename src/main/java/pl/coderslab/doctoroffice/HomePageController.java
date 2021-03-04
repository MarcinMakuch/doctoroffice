package pl.coderslab.doctoroffice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomePageController {

    @RequestMapping("/")
    public String home() {
         return "/home";
    }

}
