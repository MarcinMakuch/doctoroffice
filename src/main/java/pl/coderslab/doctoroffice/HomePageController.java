package pl.coderslab.doctoroffice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.service.JpaTaskService;

import java.util.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomePageController {

    private final JpaTaskService jpaTaskService;

    @ModelAttribute("tasks")
    public List<Task> getClients() {
        return jpaTaskService.getTasks();
    }

    @RequestMapping("/")
    public String home() {
         return "/home";
    }

}
