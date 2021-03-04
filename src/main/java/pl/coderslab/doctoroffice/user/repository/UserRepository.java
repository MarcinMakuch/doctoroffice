package pl.coderslab.doctoroffice.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.doctoroffice.user.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
