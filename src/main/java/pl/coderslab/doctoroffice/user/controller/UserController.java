package pl.coderslab.doctoroffice.user.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.service.JpaTaskService;
import pl.coderslab.doctoroffice.user.entity.User;
import pl.coderslab.doctoroffice.user.service.JpaUserService;
import javax.validation.Valid;
import java.util.List;

@Controller
@Transactional
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final JpaUserService jpaUserService;
    private final JpaTaskService jpaTaskService;


    @GetMapping("")
    public String getUser(Model model) {
        model.addAttribute("users", jpaUserService.getUsers());
        return "/user/list";
    }

    @GetMapping("/add")
    public String formUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "/user/form";
    }

    @PostMapping("/add")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/user/form";
        }
        jpaUserService.addUser(user);
        return "redirect:/user";
    }


    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model){
        model.addAttribute("user", jpaUserService.findUser(id));
        return "user/form";
    }

    @PostMapping("/edit/{id}")
    public String saveUser (@Valid User user, BindingResult result){
        if(result.hasErrors()){
            return "/user/form";
        }
        jpaUserService.updateUser(user);
        return "redirect:/user";
    }

    @GetMapping("/confirm/{id}")
    public String deleteUser(Model model, @PathVariable Long id, RedirectAttributes redirectAttributes) {
        User user = jpaUserService.findUser(id);
        model.addAttribute("user", user);
        List<Task> deleteIfUserEmpty = jpaTaskService.getTasksByUserId(id);
        if (deleteIfUserEmpty.isEmpty()) {
            return "user/confirm";
        } else redirectAttributes.addFlashAttribute("message", "użytkownik ma aktywne wizyty, sprawdź kalendarz");
        return "redirect:/user";
    }

    @GetMapping("/remove/{id}")
    public String deleteUser(@PathVariable Long id) {
        jpaUserService.deleteUser(id);
        return "redirect:/user";
    }
}
