package ca.on.conestogac.cta.rest;

import ca.on.conestogac.cta.entity.Feedback;
import ca.on.conestogac.cta.service.FeedbackService;
import ca.on.conestogac.cta.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/feedback")
public class FeedbackRestController {

    private FeedbackService feedbackService;

    @Autowired
    public FeedbackRestController(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @GetMapping("/driver/{driverEmail}/user/{userEmail}")
    public Feedback findFeedback(@PathVariable("driverEmail") String driver, @PathVariable("userEmail") String user){
        Feedback tempFeedback = feedbackService.findFeedback(driver, user);

        return tempFeedback!=null ? tempFeedback : new Feedback();
    }

    @GetMapping("/driver/{driverEmail}")
    public List<Feedback> findAllFeedbacks(@PathVariable("driverEmail") String driver){
        return feedbackService.findAllFeedbackByEmail(driver);
    }

    @PostMapping
    public Feedback saveFeedback(@RequestBody Feedback feedback){

        return feedbackService.saveFeedback(feedback);
    }

    @PutMapping
    public Feedback updateFeedback(@RequestBody Feedback feedback){
        return feedbackService.updateFeedback(feedback);
    }
}
