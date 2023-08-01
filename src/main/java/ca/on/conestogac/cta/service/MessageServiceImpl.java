package ca.on.conestogac.cta.service;

import ca.on.conestogac.cta.entity.Message;
import ca.on.conestogac.cta.repository.MessageRepository;
import ca.on.conestogac.cta.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MessageServiceImpl implements MessageService{

    private MessageRepository messageRepository;

    @Autowired
    public MessageServiceImpl(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @Override
    public List<Message> findMessagesByRideId(Integer rideId) {
        return messageRepository.findAllByRideId(rideId);
    }

    @Override
    public Message save(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public Optional<Message> findMessageById(Integer messageId) {
        return messageRepository.findById(messageId);
    }

    @Override
    public void deleteMessageById(Integer messageId) {
         messageRepository.deleteById(messageId);
    }

    @Override
    public Message updateMessage(Integer messageId, Integer rideStatus) {
        Optional<Message> messageOptional = messageRepository.findById(messageId);
        if (messageOptional.isPresent()) {
            Message tempMessage = messageOptional.get();
            tempMessage.setRideConfirm(rideStatus);
            return messageRepository.save(tempMessage);
        }
        return null;
    }

    @Override
    public String findRideConfirmedMessage(String messageFrom, String messageTo) {
        Optional<List<Message>> messages = messageRepository.findByMessageFromAndMessageToAndMessageTypeAndRideConfirm(messageFrom, messageTo, Constants.MESSAGE_TYPE_RIDE_REQUEST, 1);
        if(messages.isPresent() && !messages.get().isEmpty()){
            return Constants.RIDE_EXIST_WITH_DRIVER;
        } else{
            return Constants.RIDE_NOT_EXIST_WITH_DRIVER;
        }
    }
}
