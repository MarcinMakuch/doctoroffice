package pl.coderslab.doctoroffice.task.repository;

import org.apache.tomcat.jni.Local;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.task.entity.Task;

import java.time.LocalTime;
import java.util.Date;
import java.util.Optional;


@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    @Query("select t from Task t where t.date=?1 and t.time=?2")
    Optional <Task> manualFindDateAndTimeFromTasks(@Param("date") Date date, @Param("time") LocalTime time);

/*    @Query(value = "select * from tasks", nativeQuery = true)
    Optional <Task> manualFindDateAndTime(Date date, LocalTime time);*/

/*    @Query("select b from Book b where b.rating between :rating1 and :rating2")
    List<Book> manualFindBooksWithRatingBetween(@Param("rating1") int rating1, @Param("rating2") int rating2);*/

}
