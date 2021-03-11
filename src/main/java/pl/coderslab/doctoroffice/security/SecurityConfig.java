package pl.coderslab.doctoroffice.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.util.concurrent.TimeUnit;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user1").password("{noop}user123").roles("USER")
                .and()
                .withUser("admin1").password("{noop}admin123").roles("ADMIN");
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/task/**").hasAnyRole("USER", "ADMIN")
                .antMatchers("/client/**").hasAnyRole("USER", "ADMIN")
                .antMatchers("/user/**").hasRole("ADMIN")
                .anyRequest()
                .authenticated()
                .and()
                .formLogin()
                .loginPage("/login").permitAll()
                .defaultSuccessUrl("/",true)
                .and()
                .rememberMe()
                .tokenValiditySeconds((int)TimeUnit.HOURS.toSeconds(1))
                .key("godzinka")
                .and()
                .logout().logoutUrl("/logout")
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
                .clearAuthentication(true)
                .invalidateHttpSession(true).deleteCookies("JSESSIONID", "rememberme")
                .logoutSuccessUrl("/login");
    }
}
