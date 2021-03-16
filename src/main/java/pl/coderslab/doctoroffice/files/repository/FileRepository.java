package pl.coderslab.doctoroffice.files.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.doctoroffice.files.entity.File;

public interface FileRepository extends JpaRepository<File, Long> {
}
