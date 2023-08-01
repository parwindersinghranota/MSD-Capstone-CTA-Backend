package ca.on.conestogac.cta.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import ca.on.conestogac.cta.repository.*;
import ca.on.conestogac.cta.entity.*;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findByEmail(String email) {
        Optional<User> result = userRepository.findByEmail(email);
        User theUser = null;
        if (result.isPresent()) {
            theUser = result.get();
        } else {
            throw new RuntimeException("User with email: " + email + " not found");
        }
        return theUser;
    }

    @Override
    public User save(User user) {
        try{
            findByEmail(user.getEmail());
            return new User();
        }
        catch(Exception ex){
            return userRepository.save(user);
        }
    }

    @Transactional
    @Override
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }
}
