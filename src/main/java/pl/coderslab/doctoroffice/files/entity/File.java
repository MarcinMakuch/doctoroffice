package pl.coderslab.doctoroffice.files.entity;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = File.TABLE_NAME)
public class File {

    public static final String TABLE_NAME = "files";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fileName;
    private String fileType;

    @Lob
    private byte [] file;
}
