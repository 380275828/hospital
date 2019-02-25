package com.qst.websocket;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qst.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class MyWebSocketHander implements WebSocketHandler {

    private final static List<WebSocketSession> USERS = new ArrayList<>();
    private final static List<User> USER_ONLINE = new ArrayList<>();

    /*
     *在链接创建完后就在前端显示在线用户
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        USERS.add(webSocketSession);
        //每次有新的连接，就加入到user集合中
        User user = (User) webSocketSession.getAttributes().get("ws_user");
        USER_ONLINE.add(user);

        List<String> userNamelist = new ArrayList<>();
        for (User u : USER_ONLINE) {
            String userName = u.getUserName();
            userNamelist.add(userName);
        }

        //String类的format()方法用于创建格式化的字符串以及连接多个字符串对象。
        //这里传到前端的应该是JSON格式
        String messageFormat = "{onlineNum:\"%d\",userName:\"%s\" , msgTyp " +
                ":\"%s\"}";
        String msg = String.format(messageFormat, USERS.size(), userNamelist,
                "notice");

        TextMessage testMsg = new TextMessage(msg + "");
        //确保每个用户信息都能同步到
        for (WebSocketSession wss : USERS) {
            wss.sendMessage(testMsg);
        }
    }


    @Override
    public void handleMessage(WebSocketSession webSocketSession,
                              WebSocketMessage<?> webSocketMessage) throws Exception {

        String messageFormat = null;

        //发送消息的时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String sentMsgDate = dateFormat.format(new Date());

        User user = (User) webSocketSession.getAttributes().get("ws_user");

        String msgContent = webSocketMessage.getPayload() + "";

        JSONObject chat = JSON.parseObject(msgContent);
        //消息的内容
        String msgJSON = chat.get("message").toString();
        //消息的样式
        String msgJSONType = chat.get("type").toString();

        String chatMsg = "chatMsg";

    }


    @Override
    public void handleTransportError(WebSocketSession webSocketSession,
                                     Throwable throwable) throws Exception {
        USERS.remove(webSocketSession);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession,
                                      CloseStatus closeStatus) throws Exception {
        User userRemove = (User) webSocketSession.getAttributes().get(
                "ws_user");
        USER_ONLINE.remove(userRemove);
        USERS.remove(webSocketSession);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

}


