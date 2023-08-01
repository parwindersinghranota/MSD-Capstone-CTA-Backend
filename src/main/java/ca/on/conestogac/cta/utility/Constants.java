package ca.on.conestogac.cta.utility;

import ca.on.conestogac.cta.entity.RidePost;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;

import java.util.Optional;

public class Constants {
    public static final String LOGIN_FAILED = "LOGIN_FAILED";
    public static final String LOGIN_SUCCESSFUL = "LOGIN_SUCCESSFUL";
    public static final String RIDE_DELETED = "RIDE_DELETED";
    public static final String RIDE_NOT_FOUND = "RIDE_NOT_FOUND";
    public static final String MESSAGE_TYPE_MESSAGE = "MESSAGE";
    public static final String MESSAGE_TYPE_PROFILE = "PROFILE";
    public static final String MESSAGE_TYPE_RIDE_REQUEST = "RIDE_REQUEST";
    public static final String MESSAGE_DELETED = "MESSAGE_DELETED";
    public static final String MESSAGE_NOT_FOUND = "MESSAGE_NOT_FOUND";
    public static final String SURVEY_SAVED_SUCCESSFULLY = "SURVEY_SAVED_SUCCESSFULLY";
    public static final String SURVEY_NOT_SAVED = "SURVEY_NOT_SAVED";
    public static final String SURVEY_DELETED = "SURVEY_DELETED";
    public static final String SURVEY_NOT_DELETED = "SURVEY_NOT_DELETED";
    public static final String SURVEY_DATA_NOT_FOUND = "SURVEY_DATA_NOT_FOUND";
    public static final String SURVEY_ALREADY_SUBMITTED = "SURVEY_ALREADY_SUBMITTED";
    public static final String SURVEY_NOT_FOUND = "SURVEY_NOT_FOUND";
    public static final String RIDE_EXIST_WITH_DRIVER = "RIDE_EXIST_WITH_DRIVER";
    public static final String RIDE_NOT_EXIST_WITH_DRIVER = "RIDE_NOT_EXIST_WITH_DRIVER";

}
