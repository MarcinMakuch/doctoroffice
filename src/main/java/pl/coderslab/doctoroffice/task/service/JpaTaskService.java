package pl.coderslab.doctoroffice.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.repository.TaskRepository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class JpaTaskService implements TaskService {

    private final TaskRepository taskRepository;


    @Override
    public List<Task> getTasks() {
        return taskRepository.findAll();
    }

    @Override
    public Task findTask(Long id) {
        return taskRepository.getOne(id);
    }

    @Override
    public void addTask(Task task) {
        Optional <Task> freeDate = taskRepository.manualFindDateAndTimeFromTasks(task.getDate(), task.getTime());
        if (freeDate.isPresent()){
            throw new IllegalStateException("data zajeta");
        }
        taskRepository.save(task);
    }

    @Override
    public void updateTask(Task task) {
        taskRepository.save(task);
    }

    @Override
    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
    public List<Task> getAllByToday() {
        Date date = new Date();
        return taskRepository.findTasksByDateDay(date);
    }

}

/*    Optional<Task> dateOptional = taskRepository.findTaskByDate(task.getDate());
    Optional<Task> timeOptional = taskRepository.findTaskByTime(task.getTime());
      if (dateOptional.isPresent() && timeOptional.isPresent()) {
              throw new IllegalStateException("podany termin jest zajęty");
              }*/
