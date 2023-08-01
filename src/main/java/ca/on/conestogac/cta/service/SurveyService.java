package ca.on.conestogac.cta.service;


import ca.on.conestogac.cta.entity.Survey;

import java.util.List;
import java.util.Optional;

public interface SurveyService {
    boolean save(List<Survey> survey);

    void deleteSurveyByEmail(String email);

    Optional<Survey> findByEmail(String email);

    List<Survey> findAllByEmail(String email);
}
