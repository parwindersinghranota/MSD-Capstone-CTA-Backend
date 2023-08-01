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
@Table(name = "message")
public class Message {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name = "message_from")
    private String messageFrom;
    @Column(name = "message_to")
    private String messageTo;
    @Column(name = "ride_id")
    private int rideId;
    @Column(name = "date_time", insertable = false)
    private Timestamp timeStamp;
    @Column(name = "message")
    private String message;
    @Column(name = "message_type")
    private String messageType;
    @Column(name = "ride_confirm")
    private int rideConfirm;
}
