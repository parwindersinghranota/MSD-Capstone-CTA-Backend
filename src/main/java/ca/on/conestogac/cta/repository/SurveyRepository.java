package ca.on.conestogac.cta.repository;

import ca.on.conestogac.cta.entity.RidePost;
import ca.on.conestogac.cta.entity.Survey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public interface SurveyRepository extends JpaRepository<Survey, Integer> {

    void deleteSurveyByUser(String email);

    Optional<Survey> findSurveyByUser(String email);

    List<Survey> findAllByUserOrderByIdDesc(String user);


}
