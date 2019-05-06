<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <title>Insert title here</title>
</head>
<body>
<div class="h_bg">
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <h1><a href="index"><img src="images/logo.png" alt=""></a></h1>
            </div>
        </div>
    </div>
</div>
<div class="nav_bg">
    <div class="wrap">
        <ul class="nav">
            <li><a href="index">主页</a></li>
            <li class="active"><a href="About">相关信息</a></li>
            <li><a href="staff">医务人员</a></li>
            <li><a href="project">问卷调查</a></li>
            <li><a href="contact">查看结果</a></li>
            <c:if test="${empty userName}">
                <li><a href="LoginAndRegister">登陆 | 注册</a></li>
            </c:if>
            <c:if test="${not empty userName}">
                <li><a href="${basePath}userDetail">欢迎${userName}登陆</a></li>
                <li><a href="${basePath}userLogin">注销</a></li>
            </c:if>
        </ul>
    </div>
</div>
<div class="s_bg">
    <div class="wrap">
        <div class="cont_main">
            <div class="content">
                <h2>中医体质分类与判定自测表</h2>
                <p><a href="details.html"><img src="images/pic1.jpg"></a> 1、判定方法
                    回答《中医体质分类与判定表》中的全部问题，每一问题按5级评分，计算原始分及转化分，依标准判定体质类型。 原始分=各个条目的分会相加。 转化分数=[（原始分-条目数）/（条目数×4）] ×100</p>
                <p class="top">2、判定标准 平和质为正常体质，其他8种体质为偏颇体质。判定标准见下表。 平和质与偏颇体质判定标准表 体质类型 条件 判定结果 平和质 转化分≧60分 是
                    其他8种体质转化分均﹤30分 转化分≧60分 基本是 其他8种体质转化分均﹤40分 不满足上述条件者 否 偏颇体质 转化分≧40分 是 转化分30~39分 倾向是 转化分﹤30分 否 </p>
                <p class="top"> 3、示例

                    示例1：某人各体质类型转化分如一：平和质75分，气虚质56分，阳虚质27分，阴虚质25分，痰湿质12分，湿热质15分，血瘀质20分，气郁质 18分，特禀质10分。

                    根据判定标准，虽然平和质转化分≧60分，但其他8种体质转化分并未全部﹤40分，其中气虚质转化分≧40分，故此人不能判定为平和质，应判定为是气虚质。

                    示例2：某人各体质类型转化分如一：平和质75分，气虚质16分，阳虚质27分，阴虚质25分，痰湿质32分，湿热质25分，血瘀质10分，气郁质 18分，特禀质10分。

                    根据判定标准，平质转化分≧60分，同时，痰湿质转化分在30~39之间，可判定为痰湿质倾向，故此人最终体质判定结果基本是平和质，有痰湿质倾向。</p>
                <p class="top">4.请根据近一年的体验和感觉，回答以下问题

                    用数字代表： 1没有 （根本不） 2很少 （有一点） 3有时 （有些） 4经常 （相当） 5总是 （非常）</p>
            </div>
            <div class="sidebar">
                <h2>中医小知识</h2>
                <div class="blog_posts">
                    <div class="blog_date">
                        <img src="images/blog1.jpg">
                    </div>
                    <div class="blog_desc">
                        <p>痱子是盛夏常见的皮肤病。中医认为，痱子是由于暑热挟湿，蕴结肌肤，导致毛窍郁寒所致，防治痱子首先是要想办法祛除暑湿之毒。
                            俗话说，常饮“三豆汤”，消暑祛痱保健康。三种豆子，即绿豆、赤豆、黑豆。将它们煮熬成汤，中医称为“三豆汤”。
                            方中绿豆性寒，味甘，具有清热解毒、消暑利尿的功效，是夏季防治中暑、热痱、疮痈的理想食物；赤小豆性平，
                            味甘酸，能清热利水、散血消肿，对疮疡肿疖有较好的清解作用；黑豆性平味甘（生的性平，炒的性热，煮的性寒）
                            有补脾益肾、祛湿利水、补血活血的功效。三豆合用，有清热解毒、健脾利湿之功，因而消暑祛痱有效果，是夏季防暑降温佳品。
                            具体制法：用绿豆、赤豆、黑豆各10克，加水600毫升，小火煎熬成300毫升，连豆带汤喝下即可。
                        </p>
                    </div>

                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <div class="blog_date">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="images/blog1.jpg">
                    </div>
                    <div class="blog_desc">
                        <p>西瓜皮中医称作西瓜翠衣，在清暑涤热、利尿生津方面的作用，远胜于瓜瓤，既是解暑佳品，更是清凉解渴利尿的佳品，对高血压、心脏及肾脏性水肿者，均有保健功效。
                            临床体会，本方对夏季高血压患者，因天气闷热而致头晕心烦、血压升高者用之即有效果。
                            西瓜皮可清热除烦，食醋味酸入肝，能敛肝平阳，二味共奏平肝、敛肝之功，故对夏季阳亢高血压有最佳治疗效果。
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="ftr-bg">
    <div class="wrap">
        <div class="footer">
            <div class="f_nav">
                <ul>
                    <li class="active"><a href="index">主页</a></li>
                    <li><a href="About">相关信息</a></li>
                    <li><a href="staff">医务人员</a></li>
                    <li><a href="project">问卷调查</a></li>
                    <li><a href="contact">查看结果</a></li>
                </ul>
            </div>
            <div class="copy">
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>


</body>
</html>