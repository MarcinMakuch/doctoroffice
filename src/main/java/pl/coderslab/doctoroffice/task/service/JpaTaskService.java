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

    public List<Task> getSortedTasks() {
        return taskRepository.getTasksOrderByDateAsc();
    }

    @Override
    public Task findTask(Long id) {
        return taskRepository.getOne(id);
    }

    @Override
    public void addTask(Task task) {
        Optional <Task> freeDate = taskRepository.manualFindDateAndTimeFromTasks(task.getDate(), task.getTime());
        if (freeDate.isPresent()){
            throw new IllegalStateException("Niestety wybrana data jest zajęta, wybierz inną datę.");
        }
        taskRepository.save(task);
    }

/*    @Override
    public void addTask(Task task) throws IllegalArgumentException {
        Optional <Task> freeDate = taskRepository.manualFindDateAndTimeFromTasks(task.getDate(), task.getTime());
        if (!freeDate.isPresent())
            taskRepository.save(task);
    }*/

    @Override
    public void updateTask(Task task) {
        taskRepository.save(task);
    }

    @Override
    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

    public List<Task> getTodaySortedTasks(Date date) {
        return taskRepository.getTodayTasksOrderByDateAsc(date);
    }


}


