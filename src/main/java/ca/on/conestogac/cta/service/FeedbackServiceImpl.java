package ca.on.conestogac.cta.service;

import ca.on.conestogac.cta.entity.Feedback;
import ca.on.conestogac.cta.repository.FeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class FeedbackServiceImpl implements FeedbackService{
    private FeedbackRepository feedbackRepository;

    @Autowired
    public FeedbackServiceImpl(FeedbackRepository feedbackRepository) {
        this.feedbackRepository = feedbackRepository;
    }

    @Override
    public Feedback findFeedback(String driver, String user) {
        return feedbackRepository.findFeedbackByDriverAndUserOrderByDateTimeDesc(driver, user).orElse(null);
    }

    @Override
    public List<Feedback> findAllFeedbackByEmail(String email) {
        return feedbackRepository.findAllByDriver(email).orElse(null);
    }

    @Override
    public Feedback saveFeedback(Feedback feedback) {
        return feedbackRepository.save(feedback);
    }

    @Override
    public Feedback updateFeedback(Feedback feedback) {
        Optional<Feedback> feedbakFromDB = feedbackRepository.findById(feedback.getId());
        if(feedbakFromDB.isPresent()){
            Feedback feedback1 = feedbakFromDB.get();
            feedback1.setMessage(feedback.getMessage());
            feedback1.setRating(feedback.getRating());
            return feedbackRepository.save(feedback1);
        } else{
            return null;
        }

    }
}
