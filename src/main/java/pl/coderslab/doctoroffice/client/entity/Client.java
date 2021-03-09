package pl.coderslab.doctoroffice.client.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.pl.PESEL;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
@Data
@NoArgsConstructor
@Table(name = Client.TABLE_NAME)
public class Client {

    public static final String TABLE_NAME = "clients";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    @NotBlank
    @Length(min = 3, max = 20)
    private String firstName;

    @NotBlank
    @Length(min = 3, max = 30)
    private String lastName;

    @PESEL
    private String pesel;

    @Email
    @NotBlank
    private String email;

    @NotBlank
    @Pattern(regexp="\\d{9}",message = "Numer telefonu musi mieć 9 cyfr")
    private String phoneNumber;


    @Length(max = 500)
    private String comments;

}
