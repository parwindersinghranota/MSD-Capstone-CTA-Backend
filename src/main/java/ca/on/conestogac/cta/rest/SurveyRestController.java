package ca.on.conestogac.cta.rest;

import ca.on.conestogac.cta.entity.RidePost;
import ca.on.conestogac.cta.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import ca.on.conestogac.cta.entity.Survey;

import static ca.on.conestogac.cta.utility.Constants.*;

@RestController
@RequestMapping("/api/survey")
public class SurveyRestController {

    SurveyService surveyService;

    @Autowired
    public SurveyRestController(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    @GetMapping("email")
    public Survey findSurveyByEmail(String email){
        List<Survey> surveyList = surveyService.findAllByEmail(email);

        if(surveyList!=null && !surveyList.isEmpty()){
            return surveyList.get(0);
        } else {
            System.out.println("hello..... in else");
            Survey survey = new Survey();
            survey.setVersion(-1);
            return survey;
        }
    }

    @PostMapping
    public ResponseEntity<String> addSurvey(@RequestBody List<Survey> surveyList){
        boolean flag = surveyService.save(surveyList);
        if(flag){
            return new ResponseEntity(SURVEY_SAVED_SUCCESSFULLY, HttpStatus.OK);
        }else{
            return new ResponseEntity(SURVEY_NOT_SAVED,HttpStatus.OK);
        }
    }

    @DeleteMapping("email")
    public ResponseEntity<String> deleteSurveyByEmail(String email){
        List<Survey> surveyList = surveyService.findAllByEmail(email);
        if(surveyList!=null && !surveyList.isEmpty()){
            surveyService.deleteSurveyByEmail(email);
            return new ResponseEntity(SURVEY_DELETED,HttpStatus.OK);
        } else{
            return new ResponseEntity(SURVEY_DATA_NOT_FOUND,HttpStatus.OK);
        }
    }
}
