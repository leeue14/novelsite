/**
 * Created by leeue on 2018/1/27.
 */

$(function () {

/*我的书架js*/
    $("#myreader").mousemove(function () {
        $("#myreader").addClass("long_hover");
        $("#bookrack").css("display","block");
    });
    $("#bookrack").mouseleave(function () {
        $("#myreader").removeClass("long_hover");
        $("#bookrack").css("display","none");
    });
    $("#bookrack").mousemove(function () {
        $("#myreader").addClass("long_hover");
        $("#bookrack").css("display","block");
    });
    $("#myreader").mouseleave(function () {
        $("#myreader").removeClass("long_hover");
       $("#bookrack").css("display","none");
    });

    /*end*/
    /*个人中心*/
    $("#user_center").mousemove(function () {
        $("#user_center").addClass("long_hover2");
        $("#user_menu").css("display","block");
    });
    $("#user_menu").mousemove(function () {
        $("#user_center").addClass("long_hover2");
        $("#user_menu").css("display","block");
    });
    $("#user_menu").mouseleave(function () {
        $("#user_center").removeClass("long_hover2");
        $("#user_menu").css("display","none");
    });
    $("#user_center").mouseleave(function () {
        $("#user_center").removeClass("long_hover2");
        $("#user_menu").css("display","none");
    });
    /*导航*/
    $("#more_nav").mousemove(function () {
        $("#more_nav").addClass("nav_hover");
        $("#more_box").css("display","block");
    });
    $("#more_box").mousemove(function () {
        $("#more_nav").addClass("nav_hover");
        $("#more_box").css("display","block");
    });
    $("#more_nav").mouseleave(function () {
        $("#more_nav").removeClass("nav_hover");
        $("#more_box").css("display","none");
    });
    $("#more_box").mouseleave(function () {
        $("#more_nav").removeClass("nav_hover");
        $("#more_box").css("display","none");
    });
});