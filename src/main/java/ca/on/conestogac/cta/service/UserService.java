package ca.on.conestogac.cta.service;

import java.util.List;
import ca.on.conestogac.cta.entity.*;

public interface UserService {

    List<User> findAll();

    User findByEmail(String email);

    User save(User user);

    void deleteByEmail(String email);
}
