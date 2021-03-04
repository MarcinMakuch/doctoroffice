package pl.coderslab.doctoroffice.user.service;

import pl.coderslab.doctoroffice.user.entity.User;
import java.util.List;

public interface UserService {

    List<User> getUsers();
    User findUser(Long id);
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(Long id);
}
