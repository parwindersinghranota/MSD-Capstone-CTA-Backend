package ca.on.conestogac.cta.entity;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "user")
public class User {
    @Id
    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "college_name")
    private String college;

    @Column(name = "campus")
    private String campus;

    @Column(name = "program")
    private String program;

    @Column(name = "security_question")
    private String securityQuestion;

    @Column(name = "security_answer")
    private String securityAnswer;

    @Column(name = "active")
    private boolean active;

    @Column(name = "mobile_no")
    private String mobileNo;
}
