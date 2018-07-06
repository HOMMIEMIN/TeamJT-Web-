package edu.job.project.websoket;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSoket extends TextWebSocketHandler{
	
	private Map<String,WebSocketSession> list = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		System.out.println("웹소켓");
		System.out.println("웹소켓 시작 사이즈 : " + list.size());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("웹소켓 : " + message.getPayload());
		List<String> items = new ArrayList<>(Arrays.asList(message.getPayload().split("\\s*,\\s*")));
		if(items.get(0).equals("login")) {
			list.put(items.get(1), session);
			System.out.println("접속자 : " + items.get(1));
		}else if(items.get(0).equals("pageOut")) {
			String user = items.remove(1);
			if(user != null) {
				list.remove(user);	
			}
			
			System.out.println("로그아웃 : " + items.get(1));
		}else if(items.get(0).equals("message")) {
			WebSocketSession you = list.get(items.get(1));
			if(you != null) {
			you.sendMessage(new TextMessage("웹소켓 전송 : "+items.get(1)));
			System.out.println("메세지 전송");
			}
		}
		System.out.println("웹소켓 유지 사이즈 : " + list.size());
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
		System.out.println("웹소켓 종료");
		System.out.println("웹소켓 종료 사이즈 : " + list.size());
	}
	
	
	
	
	
}
