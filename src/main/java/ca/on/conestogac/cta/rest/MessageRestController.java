package ca.on.conestogac.cta.rest;

import ca.on.conestogac.cta.entity.Message;
import ca.on.conestogac.cta.service.MessageService;
import ca.on.conestogac.cta.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/messages")
public class MessageRestController {
    private MessageService messageService;

    @Autowired
    public MessageRestController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping("/{rideId}")
    public List<Message> findAllMessagesByRideId(@PathVariable Integer rideId){
        return messageService.findMessagesByRideId(rideId);
    }

    @GetMapping("/driver/{driver}/user/{user}")
    public String findRideWithDriver(@PathVariable String driver, @PathVariable String user){
        return messageService.findRideConfirmedMessage(user, driver);
    }

    @PostMapping
    public Message addMessage(@RequestBody Message message){
        Message dbMessage = messageService.save(message);
        return dbMessage;
    }

    @PutMapping("/messageId/{messageId}/status/{statusId}")
    public Message updateMessage(@PathVariable Integer messageId, @PathVariable Integer statusId){
        Message dbMessage = messageService.updateMessage(messageId, statusId);
        return dbMessage;
    }

    @DeleteMapping("messageId")
    public ResponseEntity<String> deleteMessageById(Integer messageId){
        Optional<Message> message = messageService.findMessageById(messageId);
        if(message.isPresent()){
            messageService.deleteMessageById(messageId);
            return new ResponseEntity(Constants.MESSAGE_DELETED, HttpStatus.OK);
        } else{
            return new ResponseEntity(Constants.MESSAGE_NOT_FOUND,HttpStatus.OK);
        }
    }
}
