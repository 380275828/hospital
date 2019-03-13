<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet"
          href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <title>webSocket测试</title>
    <script type="text/javascript">
        $(function() {

            var websocket = new WebSocket("ws://localhost:8888/im/${userId}");
            websocket.onopen = function(evnt) {
            };
            websocket.onmessage = function(evnt) {
                var json = eval('(' + evnt.data + ')');
                $("#form").val(json.to);
                $("#to").val(json.form);
                $("#msg").html($("#msg").html() + "<br/><span style='float: left;'>" + json.message+"</span>");
            };
            websocket.onerror = function(evnt) {
                console.log(evnt)
                $("#tou").html("发生错误，与服务器断开了链接!")
            };
            // websocket.onclose = function(evnt) {
            //     $("#tou").html("与服务器断开了链接!")
            // }
            $('#send').bind('click', function() {
                send();
                $("#message").val("");
            });
            function send() {
                if (websocket != null) {
                    var message = document.getElementById('message').value;
                    $("#msg").html($("#msg").html() + "<br/><span style='float: right;'>" + message+"</span>");
                    var json = "{'form':"+$("#form").val()+",'to':"+$("#to").val()+",'message':'"+message+"'}";
                    websocket.send(json);
                } else {
                    alert('未与服务器链接.');
                }
            }
        });
    </script>

</head>
<body>

<div class="page-header" id="tou">webSocket及时聊天Demo程序</div>
<div class="well" id="msg"></div>
<div class="col-lg">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="发送信息..."
               id="message"> <span class="input-group-btn">
				<button class="btn btn-default" type="button" id="send">发送</button>
			</span>
    </div>
    <!-- /input-group -->
</div>
<!-- /.col-lg-6 -->
</div>
<input type="hidden" id="form" value="${userId}">
<input type="hidden" id="to" value="${doctorId}">
<!-- /.row -->
</body>
</html>

