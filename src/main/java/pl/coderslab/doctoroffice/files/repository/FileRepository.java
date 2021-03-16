package pl.coderslab.doctoroffice.files.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.files.entity.File;

@Repository
public interface FileRepository extends JpaRepository<File, Long> {

}
