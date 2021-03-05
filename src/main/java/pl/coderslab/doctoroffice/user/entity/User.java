package pl.coderslab.doctoroffice.user.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import javax.persistence.*;
import javax.validation.constraints.*;



@Entity
@Table(name = User.TABLE_NAME)
@NoArgsConstructor
@Data
public class User {

    public static final String TABLE_NAME = "users";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    @Length(min = 3, max = 20)
    private String firstName;

    @NotBlank
    @Length(min = 3, max = 30)
    private String lastName;

}
