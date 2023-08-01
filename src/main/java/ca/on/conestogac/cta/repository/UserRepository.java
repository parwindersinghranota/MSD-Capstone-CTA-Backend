package ca.on.conestogac.cta.repository;

import ca.on.conestogac.cta.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByEmail(String email);

    void deleteByEmail(String email);
}
