<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>考试</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../../css/paper.css" rel="stylesheet">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div id="app">


    <div class="content content-bgcolor papermain" style="display: block;">
        <div class="container" style="">
            <div class="row">
                <div class="col-xs-12 title-content-style workontop" style="display: flex;flex-direction: row;
    align-items: center;
    justify-content: space-between;">
                    <div class="col-xs-10" style="width: 50%;
							margin-left: 20px;">
                        <!--试卷标题-->
                        <div class="worktitle">{{exampaperName}}</div>
                        <p class="score">
                            <!--试卷有多少道题                                          试卷总分-->
                            共{{dataList.length}}题，总分：
                            <span class="jobscore">{{exampaperMyscore}}</span>分</span>
                        </p>
                        <!--
                        试卷编号
                        {{paperUUID}}
                        -->
                    </div>
                    <div class="col-xs-2 stunews-right" style="width: 50%;
							text-align: right;margin-right: 20px;">
                        <!--计时器-->
                        考试倒计时
                        <span>{{SecondToDate}}</span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-9 user-config-left padding-right" style="width: 74%; ">
                    <div class="left-content padd topicwrap">
                        <!--循环题目数据-->
                        <div v-for="(item,index) in dataList" :key="index" class="question question-radio">
                            <div class="question-cont">
                                <div class="question-cont-left">
                                    <!--题目-->
                                    <span :id="'id'+item.id" class="question-num">{{index+1}}</span>
                                    <!-- 分值 -->
                                    <span class="question-score">{{item.exampapertopicNumber}}分</span>
                                    <!-- 题型 -->
                                    <span class="question-score">{{item.examquestionValue}}</span>
                                </div>
                                <div class="question-cont-right">
                                    <div class="question-text">
                                        <div class="qes-title"></div>
                                        <table class="blank-title">
                                            <tbody>
                                            <tr>
                                                <td class="qestitle" style="width:96%">
                                                    <!--试题名称-->
                                                    {{item.examquestionName}}
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <!-- 判断题答题区 -->
                                        <ul class="question-options" v-if="item.examquestionTypes != 4">
                                            <li :class="answerList[index].answer.indexOf(io.code)!== -1?'blue':''"
                                                v-for="(io) in item.examquestionOptions" :key="io.code"
                                                @click="selectQuestions(item.examquestionId,io.code)">
                                                <i class="options">{{ io.code }}</i>
                                                <span class="qesitem">{{ io.text }}</span>
                                            </li>
                                        </ul>
                                        <!-- 填空题答题区 -->
                                        <ul v-else class="question-options">
                                            <li>
                                                <textarea v-model="answerList[index].answer"
                                                          style="width: 720px;height: 150px;resize:none"></textarea>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
                <div id="dong" style="width: 300px;
						height: 300px;
						top: 0px;  padding-left: 20px;
						position:sticky;" class="col-xs-3 user-config-center content-style">
                    <div class="resultshow">
                        <div id="answerguide" class="chioce-btn answerguide">
                            <dl class="question-result-item clearfix">
                                <dt class="question-resul-title ">试卷题目</dt>
                                <dd class="question-resul-tab">

                                    <a @click="goTo(item.id)" v-for="(item,index) in dataList" :key="index"
                                       :class="item.examquestionId == answerList[index].examquestionId && answerList[index].answer!=null && answerList[index].answer != ''?'done':''"><span>{{index+1}}</span></a>
                                </dd>
                            </dl>
                        </div>
                        <ul class="question-result-explain">
                            <li><i class="icon-explain donei"></i>已做</li>
                            <li><i class="icon-explain undo"></i>未做</li>
                        </ul>
                        <div class="right-bottom">
                            <button class="hm_btn_orange marginr20 submitwrok"
                                    @click="submitQuestions">提交试卷</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- layui -->
<script src="../../layui/layui.js"></script>
<!-- vue -->
<script src="../../js/vue.js"></script>
<!-- elementui -->
<script src="../../elementui/elementui.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<script type="text/javascript">
    var app = new Vue({
        el: "#app",
        data() {
            return {
                //考试题目
                dataList: [],
                // 倒计时定时器
                inter: null,
                // 倒计时时间
                count: 0,
                //用户选择答案
                answerList: [],
                //试卷名称
                exampaperName:null,
                //试卷总分数
                exampaperMyscore:null,
                //用户信息
                user: {},
            };
        },
        computed: {
            SecondToDate: function () {
                var time = this.count;
                if (null != time && "" != time) {
                    if (time > 60 && time < 60 * 60) {
                        time =
                                parseInt(time / 60.0) +
                                "分钟" +
                                parseInt((parseFloat(time / 60.0) - parseInt(time / 60.0)) * 60) +
                                "秒";
                    } else if (time >= 60 * 60 && time < 60 * 60 * 24) {
                        time =
                                parseInt(time / 3600.0) +
                                "小时" +
                                parseInt(
                                        (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                ) +
                                "分钟" +
                                parseInt(
                                        (parseFloat(
                                                (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                                ) -
                                                parseInt(
                                                        (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                                )) *
                                        60
                                ) +
                                "秒";
                    } else if (time >= 60 * 60 * 24) {
                        time =
                                parseInt(time / 3600.0 / 24) +
                                "天" +
                                parseInt(
                                        (parseFloat(time / 3600.0 / 24) - parseInt(time / 3600.0 / 24)) *
                                        24
                                ) +
                                "小时" +
                                parseInt(
                                        (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                ) +
                                "分钟" +
                                parseInt(
                                        (parseFloat(
                                                (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                                ) -
                                                parseInt(
                                                        (parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
                                                )) *
                                        60
                                ) +
                                "秒";
                    } else {
                        time = parseInt(time) + "秒";
                    }
                }
                return time;
            }
        },
        destroyed: function () {
            window.clearInterval(this.inter);
        },
        mounted() {

        },
        methods: {
            //跳转
            goTo(id) {
                document.querySelector('#id' + id).scrollIntoView()
            },
            //用户选择题答案
            selectQuestions(examquestionId, code) {
                this.answerList.forEach(function (item, index) {
                    if(item.examquestionId === examquestionId){
                        if(item.examquestionTypes == 2){
                            if(item.answer == ""){//空的
                                item.answer =code;
                            }else if(item.answer == code){//删除最后一个
                                item.answer ="";
                            }else{
                                let answerList = item.answer.split(",");//切割数组
                                if(answerList.indexOf(code) != -1){//存在
                                    answerList.splice(answerList.indexOf(code),1)
                                    item.answer = answerList.join(",")
                                }else{//不存在
                                    answerList.push(code)
                                    item.answer = answerList.join(",")
                                }
                            }
                        }else{
                            item.answer = code
                        }
                    }
                })
            },
            init() {
                let _this = this;
                let exampaperId = layui.http.getParam("exampaperId");
                let table = localStorage.getItem("userTable");
                layui.http.request(`${table}/session`, 'get', {}, function (data) {
                    _this.user = data.data;
                });

                // 获取选题表试题信息
                layui.http.request(`exampapertopic/questionAcquisition?exampaperId=`+exampaperId, 'get', {}, function (data) {
                    _this.dataList = data.data;
                    _this.exampaperName = _this.dataList[0].exampaperName
                    _this.exampaperMyscore = _this.dataList[0].exampaperMyscore
                    if (_this.dataList[0].exampaperDate) {
                        _this.count = _this.dataList[0].exampaperDate*60;
                        if (_this.count > 0) {
                            _this.inter = window.setInterval(function() {
                                _this.count = _this.count - 1;
                                if (_this.count < 0) {
                                    window.clearInterval(_this.inter);
                                    if(_this.count<= 0){
                                        _this.submitQuestions()
                                    }
                                }
                            }, 1000);
                        }
                    }
                    //转换 单多选 判断题的选项
                    _this.dataList.forEach(function (item, index) {
                        if (item.examquestionTypes != 4) {
                            item.examquestionOptions = JSON.parse(item.examquestionOptions);
                        }
                        let examquestionId = item.examquestionId
                        let examquestionTypes = item.examquestionTypes
                        _this.answerList.push({
                            examquestionId: examquestionId,
                            examquestionTypes: examquestionTypes,
                            answer: ""
                        })
                    })
                });
            },
            //提交试卷
            submitQuestions() {
                let _this =this
                let notDone = []
                let params = {
                    yonghuId:_this.user.id,
                    answerList:JSON.stringify(_this.answerList),
                    exampaperId:layui.http.getParam("exampaperId")
                }
                _this.dataList.forEach(function (item,index) {
                    if(item.examquestionId == _this.answerList[index].examquestionId && (_this.answerList[index].answer==null || _this.answerList[index].answer == '')){
                        notDone.push(index+1)
                    }
                })
                if(_this.count > 0){
                    if (confirm("您有’"+notDone.length+"‘道题未作，分别为："+notDone+"确定要提交吗?")) { //if语句内部判断确认框

                    } else {
                        return false
                    }
                }else{
                    if(notDone.length>0){
                        window.alert("您有’"+notDone.length+"‘道题未作，分别为："+notDone+";未做题目为0分！");

                    }else {
                        window.alert("答题时间已到即将提交试卷!!!");

                    }
                }
                layui.http.request(`exampapertopic/submitQuestions`, 'post', params, function (data) {
                    // 跳转
                    window.history.back();
                })

            },
        }
    })

    layui.use(['layer', 'element', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var http = layui.http;
        var jquery = layui.jquery;
        app.init();
    });

</script>

</body>
</html>