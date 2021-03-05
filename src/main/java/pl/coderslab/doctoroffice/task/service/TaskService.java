package pl.coderslab.doctoroffice.task.service;

import pl.coderslab.doctoroffice.task.entity.Task;

import java.util.List;

public interface TaskService {
    List<Task> getTasks();
    Task findTask(Long id);
    void addTask(Task task);
    void updateTask(Task task);
    void deleteTask(Long id);
}
