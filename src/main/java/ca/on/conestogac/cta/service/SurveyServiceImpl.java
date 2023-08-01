package ca.on.conestogac.cta.service;

import ca.on.conestogac.cta.entity.Survey;
import ca.on.conestogac.cta.repository.SurveyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class SurveyServiceImpl implements SurveyService{
    SurveyRepository surveyRepository;

    @Autowired
    public SurveyServiceImpl(SurveyRepository surveyRepository) {
        this.surveyRepository = surveyRepository;
    }

    @Override
    public boolean save(List<Survey> surveyList) {
        boolean flag = true;
        for(Survey survey : surveyList){
            Survey dbSurvey = this.surveyRepository.save(survey);
            if(dbSurvey == null){
                return false;
            }
        }
        return flag;
    }

    @Transactional
    @Override
    public void deleteSurveyByEmail(String email) {
        //surveyRepository.deleteSurveyByUser(email);
        surveyRepository.deleteAll(surveyRepository.findAllByUserOrderByIdDesc(email));
    }

    @Override
    public Optional<Survey> findByEmail(String email) {
        return surveyRepository.findSurveyByUser(email);
    }

    @Override
    public List<Survey> findAllByEmail(String email) {
        return surveyRepository.findAllByUserOrderByIdDesc(email);
    }
}
