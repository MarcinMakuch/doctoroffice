package pl.coderslab.doctoroffice.task.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.doctoroffice.client.entity.Client;
import pl.coderslab.doctoroffice.client.service.JpaClientService;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.service.JpaTaskService;
import pl.coderslab.doctoroffice.user.entity.User;
import pl.coderslab.doctoroffice.user.service.JpaUserService;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;

@Controller
@Transactional
@RequiredArgsConstructor
@RequestMapping("/task")
public class TaskController {

    private final JpaTaskService jpaTaskService;
    private final JpaClientService jpaClientService;
    private final JpaUserService jpaUserService;

    @ModelAttribute("users")
    public List<User> getUsers() {
        return jpaUserService.getUsers();
    }

    @ModelAttribute("clients")
    public List<Client> getClients() {
        return jpaClientService.getClients();
    }


    @GetMapping("")
    public String getTasks(Model model) {
        model.addAttribute("tasks", jpaTaskService.getTasks());
        return "task/list";
    }

    @GetMapping("/add")
    public String formTask(Model model) {
        Task task = new Task();
        model.addAttribute("task", task);
        return "/task/form";
    }

    @PostMapping("/add")
    public String addTask(@Valid Task task, BindingResult result) {
        if (result.hasErrors()) {
            return "/task/form";
        }
        jpaTaskService.addTask(task);
        return "redirect:/task";
    }
}
