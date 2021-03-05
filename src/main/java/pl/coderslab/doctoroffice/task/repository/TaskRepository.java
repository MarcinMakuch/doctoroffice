package pl.coderslab.doctoroffice.task.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.task.entity.Task;

import java.time.LocalTime;
import java.util.Date;
import java.util.Optional;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

}
