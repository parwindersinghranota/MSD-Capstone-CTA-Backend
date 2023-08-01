package ca.on.conestogac.cta.service;

import ca.on.conestogac.cta.entity.RidePost;
import ca.on.conestogac.cta.repository.RideRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RideServiceImpl implements RideService{

    private RideRepository rideRepository;

    @Autowired
    public RideServiceImpl(RideRepository rideRepository) {
        this.rideRepository = rideRepository;
    }

    @Override
    public List<RidePost> findAllRides() {
        return rideRepository.findAll();
    }

    @Override
    public List<RidePost> findLatestRides() {
        return rideRepository.findAllByActiveIsTrueOrderByDateDesc();
    }


    @Override
    public Optional<RidePost> findRideById(Integer rideId) {
        return rideRepository.findById(rideId);
    }

    @Override
    public List<RidePost> findRideByEmail(String email) {
        Optional<List<RidePost>> listOptional =  rideRepository.findByProviderOrderByDateDesc(email);

        if(listOptional.isPresent()){
            return listOptional.get();
        }
        else {
            return new ArrayList<RidePost>();
        }
    }

    @Override
    public RidePost saveRide(RidePost ridePost) {
        return rideRepository.save(ridePost);
    }

    @Override
    @Transactional
    public void deleteRidePostById(Integer rideId) {
         rideRepository.deleteById(rideId);
    }

}
