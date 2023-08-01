package ca.on.conestogac.cta.service;
import ca.on.conestogac.cta.entity.Message;
import java.util.List;
import java.util.Optional;

public interface MessageService {
    List<Message> findMessagesByRideId(Integer rideId);

    Message save(Message message);

    Optional<Message> findMessageById(Integer messageId);

    void deleteMessageById(Integer rideId);

    Message updateMessage(Integer messageId, Integer rideStatus);

    String findRideConfirmedMessage(String messageFrom, String messageTo);
}
