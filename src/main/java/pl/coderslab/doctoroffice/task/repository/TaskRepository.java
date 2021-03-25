package pl.coderslab.doctoroffice.task.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.task.entity.Task;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;


@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    @Query("select t from Task t where t.date=?1 and t.time=?2")
    Optional<Task> manualFindDateAndTimeFromTasks(@Param("date") Date date, @Param("time") LocalTime time);

    @Query("select t from Task t order by t.date asc, t.time asc")
    List<Task> getTasksOrderByDateAsc();

    @Query("select t from Task t where t.date=?1 order by t.time asc")
    List<Task> getTodayTasksOrderByDateAsc(@Param("date") Date date);

    @Query("select t from Task t where t.client.lastName =?1 order by t.date asc, t.time asc")
    List<Task> getTasksByClientLastName(@Param ("lastname") String lastname);

    @Query("select t from Task t where t.client.Id=?1")
    List<Task> getTasksByClientId(@Param ("id") Long id);

    @Query("select t from Task t where t.user.id=?1")
    List<Task> getTaskByUserId(@Param ("id") Long id);

    @Query("select t from Task t where t.client.pesel=?1 order by t.date asc, t.time asc")
    List<Task> getTasksByClientPesel(@Param ("pesel") String pesel);

}
