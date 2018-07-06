package edu.job.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.Message;
import edu.job.project.prisitence.MessageDao;

@Service
public class MessageServiceImple implements MessageService {

	@Autowired MessageDao messageDao;
	
	@Override
	public List<Message> getRead(String userId) {
		
		return messageDao.getSelect(userId);
	}
	
	@Override
	public List<Message> sendRead(String userId) {
		
		return messageDao.sendSelect(userId);
	}

	@Override
	public int create(Message message) {
		// TODO Auto-generated method stub
		return messageDao.insert(message);
	}
}
