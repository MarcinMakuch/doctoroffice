package pl.coderslab.doctoroffice.task.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
        return jpaUserService.getUsersByRoleUser();
    }

    @ModelAttribute("clients")
    public List<Client> getClients() {
        return jpaClientService.getClients();
    }


    @GetMapping("")
    public String getTasks(Model model) {
        model.addAttribute("tasks", jpaTaskService.getSortedTasks());
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
    @GetMapping("/edit/{id}")
    public String editTask(@PathVariable Long id, Model model){
        model.addAttribute("task", jpaTaskService.findTask(id));
        return "task/form";
    }

    @PostMapping("/edit/{id}")
    public String saveTask (@Valid Task task, BindingResult result){
        if(result.hasErrors()){
            return "/task/form";
        }
        jpaTaskService.updateTask(task);
        return "redirect:/task";
    }


    @GetMapping("/confirm/{id}")
    public String deleteTask(Model model, @PathVariable Long id) {
        Task task = jpaTaskService.findTask(id);
        model.addAttribute("task", task);
        return "task/confirm";
    }

    @GetMapping("/remove/{id}")
    public String deleteTask(@PathVariable Long id) {
        jpaTaskService.deleteTask(id);
        return "redirect:/task";
    }

    @PostMapping("/search")
    public String searchTasks (@RequestParam String lastname, Model model) {
        model.addAttribute("searchname", jpaTaskService.getClientTasksByHisLastName(lastname));
        return "task/search";
    }
}
