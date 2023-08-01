package ca.on.conestogac.cta.repository;

import ca.on.conestogac.cta.entity.Feedback;
import ca.on.conestogac.cta.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

    Optional<List<Feedback>> findAllByDriver(String email);

    Optional<Feedback> findFeedbackByDriverAndUserOrderByDateTimeDesc(String driver, String user);

}
