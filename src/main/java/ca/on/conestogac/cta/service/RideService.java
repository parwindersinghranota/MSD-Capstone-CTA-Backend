package ca.on.conestogac.cta.service;
import java.util.List;
import java.util.Optional;

import ca.on.conestogac.cta.entity.*;
public interface RideService {
    List<RidePost> findAllRides();

    List<RidePost> findLatestRides();
    Optional<RidePost> findRideById(Integer rideId);

    List<RidePost> findRideByEmail(String email);

    RidePost saveRide(RidePost ridePost);

    void deleteRidePostById(Integer rideId);
}
