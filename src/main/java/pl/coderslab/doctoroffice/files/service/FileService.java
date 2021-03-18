package pl.coderslab.doctoroffice.files.service;


import pl.coderslab.doctoroffice.files.entity.File;

import java.util.List;

public interface FileService {
    List<File> getFiles();
    File findFile(Long id);
    void addFile(File file);
    void updateFile(File file);
    void deleteFile(Long id);
}
