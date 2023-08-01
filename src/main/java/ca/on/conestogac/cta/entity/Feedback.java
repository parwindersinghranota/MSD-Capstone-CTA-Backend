package ca.on.conestogac.cta.entity;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "feedback")
public class Feedback {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @Column(name = "user")
    private String user;

    @Column(name = "driver")
    private String driver;

    @Column(name = "message")
    private String message;

    @Column(name = "rating")
    private double rating;

    @Column(name = "datetime", insertable = false)
    private Timestamp dateTime;
}
