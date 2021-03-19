package pl.coderslab.doctoroffice.user.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.user.entity.User;
import pl.coderslab.doctoroffice.user.repository.UserRepository;
import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
@RequiredArgsConstructor
public class JpaUserService implements UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public User findUser(Long id) {
        return userRepository.getOne(id);
    }

    @Override
    public void addUser(User user) {
        String pass = passwordEncoder.encode(user.getPassword());
        user.setPassword(pass);
        userRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        userRepository.save(user);
    }

    @Override
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<User> getUsersByRoleUser() {
        return userRepository.getUsersByRoleUser();
    }
}
