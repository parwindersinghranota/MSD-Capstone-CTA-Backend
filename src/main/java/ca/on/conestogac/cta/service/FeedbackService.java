package ca.on.conestogac.cta.service;

import ca.on.conestogac.cta.entity.Feedback;
import java.util.*;

public interface FeedbackService {

    Feedback findFeedback(String driver, String user);

    List<Feedback> findAllFeedbackByEmail(String email);

    Feedback saveFeedback(Feedback feedback);

    Feedback updateFeedback(Feedback feedback);
}
