package pl.coderslab.doctoroffice.user.entity;

import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ApplicationUserService implements UserDetailsService {

    private final ApplicationUserDAO applicationUserDAO;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return applicationUserDAO.selectApplicationUserByUsername(s)
                .orElseThrow(() -> new UsernameNotFoundException(String.format("Użytkowni %s not found",s)));
    }
}
