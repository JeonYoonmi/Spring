package com.devmg.app;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
 * 어노테이션을 명시함으로서 WEB 소켓으로 접속 가능한 URL 정보를 명시하여 소켓 서버를 생성해주며
 * 프로퍼티를 통해 decoder나 encoder를 명시할 수 있다. 
 * 
 * RemoteEndpoint 인스턴스는 메시지를 보내는데 사용할 수 있다.(session.getBasicRemote.sendText())
 */

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체 생성");
    }
    
    /*
     * 웹 소켓이 연결되면 호출되는 이벤트
    */
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
        	// session.getBasicRemote() : 초반에 설정해두었던 endPoint의 value값인 아이디에 텍스트메세지를 전송한다.
            final Basic basic=session.getBasicRemote();
            // 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다.
            basic.sendText("대화방에 연결 되었습니다.");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /**
     * 웹 소켓으로부터 메시지가 오면 호출되는 이벤트
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    /**
     * 모든 사용자에게 메시지를 전달한다
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
    	try {
    		for(Session session : WebSocketChat.sessionList) {
    			if(!self.getId().equals(session.getId())) {
    				session.getBasicRemote().sendText(sender+" : "+message);
    			}
    		}
    	}catch (Exception e) {
    		// TODO: handle exception
    		System.out.println(e.getMessage());
    	}
    }
    
    /**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param e
     * @param session
     */
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    /**
     * 웹 소켓이 닫히면 호출되는 이벤트
     * @param session
     */
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}
