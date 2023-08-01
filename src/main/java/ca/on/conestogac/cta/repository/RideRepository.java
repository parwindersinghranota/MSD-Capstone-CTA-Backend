package ca.on.conestogac.cta.repository;

import ca.on.conestogac.cta.entity.RidePost;
import ca.on.conestogac.cta.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface RideRepository extends JpaRepository<RidePost, Integer> {

    Optional<List<RidePost>> findByProviderOrderByDateDesc(String email);

    List<RidePost> findAllByActiveIsTrueOrderByDateDesc();

}
