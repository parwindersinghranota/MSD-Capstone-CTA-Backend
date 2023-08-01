package ca.on.conestogac.cta.rest;
import ca.on.conestogac.cta.entity.RidePost;
import ca.on.conestogac.cta.service.RideService;
import ca.on.conestogac.cta.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

import static ca.on.conestogac.cta.utility.Constants.RIDE_DELETED;
import static ca.on.conestogac.cta.utility.Constants.RIDE_NOT_FOUND;

@RestController
@RequestMapping("/api/rides")
public class RideRestController {

    RideService rideService;

    @Autowired
    public RideRestController(RideService rideService) {
        this.rideService = rideService;
    }

    @PostMapping
    public RidePost addRide(@RequestBody RidePost theRidePost){
        RidePost dbRidePost = rideService.saveRide(theRidePost);
        return dbRidePost;
    }

    @GetMapping
    public List<RidePost> findAll(){
        return rideService.findAllRides();
    }

    @GetMapping("latest")
    public List<RidePost> findLatest(){
        return rideService.findLatestRides();
    }


    @GetMapping("email")
    public List<RidePost> findAllByEmail(String email){
        return rideService.findRideByEmail(email);
    }

    @DeleteMapping("rideId")
    public ResponseEntity<String> deleteRidePostById(Integer rideId){
        Optional<RidePost> ridePost = rideService.findRideById(rideId);
        if(ridePost.isPresent()){
            rideService.deleteRidePostById(rideId);
            return new ResponseEntity(RIDE_DELETED,HttpStatus.OK);
        } else{
            return new ResponseEntity(RIDE_NOT_FOUND,HttpStatus.OK);
        }
    }
}
