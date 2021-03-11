package pl.coderslab.doctoroffice.user.entity;

import java.util.Optional;

public interface ApplicationUserDAO {
    Optional<ApplicationUser> selectApplicationUserByUsername(String username);
}
