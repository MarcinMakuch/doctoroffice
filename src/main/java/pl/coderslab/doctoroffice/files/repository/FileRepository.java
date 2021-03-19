package pl.coderslab.doctoroffice.files.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.files.entity.File;


import java.util.List;

@Repository
public interface FileRepository extends JpaRepository<File, Long> {

    @Query("select f from File f where f.client.Id=?1")
    List<File> findManualAllByClientId(@Param ("clientId") Long id);

}
