package pl.coderslab.doctoroffice.files.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.doctoroffice.client.entity.Client;
import pl.coderslab.doctoroffice.client.service.JpaClientService;
import pl.coderslab.doctoroffice.files.entity.File;
import pl.coderslab.doctoroffice.files.service.JpaFileService;

import javax.transaction.Transactional;
import java.io.IOException;

@Controller
@Transactional
@RequiredArgsConstructor
@RequestMapping("/file")
public class FileController {

    private final JpaFileService jpaFileService;
    private final JpaClientService jpaClientService;


    @GetMapping("/upload/{clientId}")
    public String chooseFile(@PathVariable Long clientId, Model model) {
        File file = new File();
        model.addAttribute("file", file);
        model.addAttribute("files", jpaFileService.getManualFilesByClientId(clientId));
        return "/file/form";
    }

    @PostMapping("/upload/{clientId}")
    public String uploadFile(@RequestParam("file") MultipartFile doc, @PathVariable Long clientId, File file) throws IOException {
        Client client = jpaClientService.findClient(clientId);
        file.setClient(client);
        file.setFileName(doc.getOriginalFilename());
        file.setFileType(doc.getContentType());
        file.setData(doc.getBytes());
        jpaFileService.addFile(file);
        return "redirect:/client";
    }
    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        File file = jpaFileService.findFile(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(file.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+file.getFileName()+"\"")
                .body(file.getData());
    }
}
