package pl.coderslab.doctoroffice.files.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.doctoroffice.files.entity.File;
import pl.coderslab.doctoroffice.files.service.JpaFileService;

import javax.transaction.Transactional;

@Controller
@Transactional
@RequiredArgsConstructor
@RequestMapping("/file")
public class FileController {

    private final JpaFileService jpaFileService;

    @GetMapping("/upload")
    public String chooseFile(Model model) {
        File file = new File();
        model.addAttribute("file", file);
        return "/file/form";
    }

    @PostMapping("/upload")
    public String uploadFile(File file) {
        jpaFileService.addFile(file);
        return "redirect:/upload";
    }
}
