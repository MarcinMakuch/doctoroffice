package pl.coderslab.doctoroffice.files.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.files.entity.File;
import pl.coderslab.doctoroffice.files.repository.FileRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class JpaFileService implements FileService {

    private final FileRepository fileRepository;

    @Override
    public List<File> getFiles() {
        return fileRepository.findAll();
    }

    public List<File> getManualFilesByClientId(Long id) {
        return fileRepository.findManualAllByClientId(id);
    }

    @Override
    public File findFile(Long id) {
        return fileRepository.getOne(id);
    }

    @Override
    public void addFile(File file) {
        fileRepository.save(file);
    }

    @Override
    public void updateFile(File file) {
        fileRepository.save(file);
    }

    @Override
    public void deleteFile(Long id) {
        fileRepository.deleteById(id);
    }
}
