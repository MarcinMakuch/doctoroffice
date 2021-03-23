package pl.coderslab.doctoroffice.client.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.doctoroffice.client.entity.Client;
import pl.coderslab.doctoroffice.client.service.JpaClientService;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.service.JpaTaskService;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;


@Controller
@Transactional
@RequiredArgsConstructor
@RequestMapping("/client")
public class ClientController {

    private final JpaClientService jpaClientService;
    private final JpaTaskService jpaTaskService;

    @GetMapping("")
    public String getClients(Model model) {
        model.addAttribute("clients", jpaClientService.getClients());
        return "/client/list";
    }

    @GetMapping("/add")
    public String formClient(Model model) {
        Client client = new Client();
        model.addAttribute("client", client);
        return "/client/form";
    }

    @PostMapping("/add")
    public String addClient(@Valid Client client, BindingResult result) {
        if (result.hasErrors()) {
            return "/client/form";
        }
        jpaClientService.addClient(client);
        return "redirect:/client";
    }

    @GetMapping("/edit/{id}")
    public String editClient(@PathVariable Long id, Model model) {
        model.addAttribute("client", jpaClientService.findClient(id));
        return "client/form";
    }

    @PostMapping("/edit/{id}")
    public String saveClient(@Valid Client client, BindingResult result) {
        if (result.hasErrors()) {
            return "/client/form";
        }
        jpaClientService.updateClient(client);
        return "redirect:/client";
    }

    @GetMapping("/confirm/{id}")
    public String deleteClient(Model model, @PathVariable Long id, RedirectAttributes redirectAttributes) {
        Client client = jpaClientService.findClient(id);
        model.addAttribute("client", client);
        List <Task> deleteIfClientEmpty = jpaTaskService.getTasksByClientId(id);
        if (deleteIfClientEmpty.isEmpty()) {
            return "client/confirm";
        } else redirectAttributes.addFlashAttribute("message", "klient ma aktywne wizyty, sprawdź kalendarz");
        return "redirect:/client";
    }

    @GetMapping("/remove/{id}")
    public String deleteUser(@PathVariable Long id) {
        jpaClientService.deleteClient(id);
        return "redirect:/client";
    }
}
