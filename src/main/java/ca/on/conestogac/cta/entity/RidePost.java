package ca.on.conestogac.cta.entity;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "ride_post")
public class RidePost {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "provider")
    private String provider;
    @Column(name = "date")
    private String date;
    @Column(name = "time")
    private String time;
    @Column(name = "description")
    private String description;
    @Column(name = "active")
    private boolean active;

}
