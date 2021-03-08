package pl.coderslab.doctoroffice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.service.JpaTaskService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomePageController {

    private final JpaTaskService jpaTaskService;

    @ModelAttribute("tasks")
    public List<Task> getSortedTasks() {
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        ft.format(date);
        return jpaTaskService.getTodaySortedTasks(date);
    }

    @RequestMapping("/")
    public String home() {
         return "/home";
    }

}
