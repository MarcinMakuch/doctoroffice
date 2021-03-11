package pl.coderslab.doctoroffice.user.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.doctoroffice.user.entity.User;
import pl.coderslab.doctoroffice.user.service.JpaUserService;
import javax.validation.Valid;

@Controller
@Transactional
@RequestMapping("/user")
public class UserController {

    private final JpaUserService jpaUserService;

    public UserController(JpaUserService jpaDoctorService) {
        this.jpaUserService = jpaDoctorService;
    }

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
    public String deleteUser(Model model, @PathVariable Long id) {
        User user = jpaUserService.findUser(id);
        model.addAttribute("user", user);
        return "user/confirm";
    }
    @GetMapping("/remove/{id}")
    public String deleteUser(@PathVariable Long id) {
        jpaUserService.deleteUser(id);
        return "redirect:/user";
    }
}
