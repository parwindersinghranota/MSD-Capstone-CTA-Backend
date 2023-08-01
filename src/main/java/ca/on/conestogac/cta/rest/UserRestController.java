package ca.on.conestogac.cta.rest;

import ca.on.conestogac.cta.entity.LoginStatus;
import ca.on.conestogac.cta.entity.User;
import ca.on.conestogac.cta.service.UserService;
import ca.on.conestogac.cta.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserRestController {
    private UserService userService;

    @Autowired
    public UserRestController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> findAll(){
        return userService.findAll();
    }

    @GetMapping("/{userEmail}")
    public User getUser(@PathVariable String userEmail){
        User theUser = userService.findByEmail(userEmail);
        if(theUser == null){
            throw new RuntimeException("User not found with email - "+userEmail);
        }
        return theUser;
    }

    @GetMapping("/userprofile/{userEmail}")
    public User getUserProfile(@PathVariable String userEmail){
        User theUser = userService.findByEmail(userEmail);
        if(theUser == null){
            throw new RuntimeException("User not found with email - "+userEmail);
        }
        theUser.setPassword(null);
        theUser.setSecurityQuestion(null);
        theUser.setSecurityAnswer(null);

        return theUser;
    }

    @PostMapping
    public User addUser(@RequestBody User theUser){
        User dbUser = userService.save(theUser);
        return dbUser;
    }

    @PutMapping
    public User updateUser(@RequestBody User theUser){
        User dbUser = userService.save(theUser);
        return dbUser;
    }

    @DeleteMapping("/{userEmail}")
    public String deleteUser(@PathVariable String userEmail){
        User tempUser = userService.findByEmail(userEmail);
        if(tempUser == null)
            throw new RuntimeException("User not found with email - "+userEmail);
        userService.deleteByEmail(userEmail);
        return "User deleted with id: "+userEmail;
    }

    @PostMapping("/login")
    public LoginStatus login(@RequestBody User user){
        System.out.println("Control in login method : "+user);

        LoginStatus loginStatus = new LoginStatus();

        try{
            User tempUser = userService.findByEmail(user.getEmail());
            System.out.println("tempUser: "+tempUser);

            if(tempUser.getPassword().equals(user.getPassword())){
                loginStatus.setStatus(Constants.LOGIN_SUCCESSFUL);
                loginStatus.setMessage("Login Successful");
                loginStatus.setEmail(tempUser.getEmail());
                loginStatus.setFullName(tempUser.getFirstName()+" "+tempUser.getLastName());
            }
            else {
                loginStatus.setStatus(Constants.LOGIN_FAILED);
                loginStatus.setMessage("Login failed !! Invalid Password");
            }

        } catch (Exception ex){
            loginStatus.setStatus(Constants.LOGIN_FAILED);
            loginStatus.setMessage("This email is not registered, please register before login.");
        }
        return loginStatus;
    }

}
