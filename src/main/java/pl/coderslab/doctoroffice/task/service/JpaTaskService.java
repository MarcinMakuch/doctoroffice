package pl.coderslab.doctoroffice.task.service;

import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.task.entity.Task;
import pl.coderslab.doctoroffice.task.repository.TaskRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class JpaTaskService implements TaskService {

    private final TaskRepository taskRepository;

    public JpaTaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }


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
     if (taskRepository.findTaskByDate(task.getDate()).equals(task.getDate())) {
         System.out.println("data");
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
}

/*    Optional<Task> dateOptional = taskRepository.findTaskByDate(task.getDate());
    Optional<Task> timeOptional = taskRepository.findTaskByTime(task.getTime());
      if (dateOptional.isPresent() && timeOptional.isPresent()) {
              throw new IllegalStateException("podany termin jest zajęty");
              }*/
