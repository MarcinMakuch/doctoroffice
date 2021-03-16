package pl.coderslab.doctoroffice.files.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.files.entity.File;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class JpaFileService implements FileService {

    private final FileService fileService;

    @Override
    public List<File> getFiles() {
        return fileService.getFiles();
    }

    @Override
    public File findFile(Long id) {
        return fileService.findFile(id);
    }

    @Override
    public void addFile(File file) {
        fileService.addFile(file);
    }

    @Override
    public void updateFile(File file) {
        fileService.updateFile(file);
    }

    @Override
    public void deleteFile(Long id) {
        fileService.deleteFile(id);
    }
}
