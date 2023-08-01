package ca.on.conestogac.cta.repository;

import ca.on.conestogac.cta.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {
    public List<Message> findAllByRideId(Integer rideId);

    public Optional<Message> findById(Integer id);

    public Optional<List<Message>> findByMessageFromAndMessageToAndMessageTypeAndRideConfirm(String messageFrom, String messageTop, String messagType, int rideConfirmed);
}
