package com.qst.websocket;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;

@ServerEndpoint("/im/{userId}")
@Component
public class ImController {

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //旧：concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    //private static CopyOnWriteArraySet<ImController> webSocketSet = new CopyOnWriteArraySet<ImController>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    //新：使用map对象，便于根据userId来获取对应的WebSocket
    private static ConcurrentHashMap<String,ImController> websocketList = new ConcurrentHashMap<>();
    private static ConcurrentHashMap<String,ImController> noticeWebsocketList = new ConcurrentHashMap<>();
    private static HashMap<String, List<String>> messageMap = new HashMap<>();
    //接收sid
    private String userId="";
    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(Session session,@PathParam("userId") String userId) throws IOException {
        this.session = session;
        if(userId.contains("notice")){
            noticeWebsocketList.put(userId,this);
        }else{
            websocketList.put(userId,this);
            List<String> result = messageMap.get(userId);
            if(result != null && result.size() > 0){
                for (String msg:result){
                    this.sendMessage(msg);
                }
                result.clear();
            }
        }
        //webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        this.userId=userId;
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        if(websocketList.get(this.userId)!=null){
            websocketList.remove(this.userId);
            //webSocketSet.remove(this);  //从set中删除
            subOnlineCount();           //在线数减1
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session) {
        JSONObject jsonObject = JSONObject.parseObject(message);
        String doctorId = jsonObject.get("to").toString();
        ImController websocket = websocketList.get(doctorId);
        if(websocket != null){
            try {
                websocket.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            ImController noticWwebsocket = noticeWebsocketList.get("notice_"+doctorId);
            if(noticWwebsocket!= null){
                try {
                    noticWwebsocket.sendMessage("您有新的消息，请及时查收！");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(messageMap.containsKey(doctorId)){
                List<String> messageList = messageMap.get(doctorId);
                messageList.add(message);
                messageMap.put(doctorId,messageList);
            }else{
                List<String> messageList = new ArrayList<>();
                messageList.add(message);
                messageMap.put(doctorId,messageList);
            }
        }
    }

    /**
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }
    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        ImController.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        ImController.onlineCount--;
    }
}
