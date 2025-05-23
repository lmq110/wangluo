<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>考试详情</title>
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
                        <div class="worktitle">{{headDate.exampaperName}}</div>
                        <p class="score">
                            <!--试卷有多少道题                                          试卷总分-->
                            共{{dataList.length}}题，总分：
                            <span class="jobscore">{{headDate.exampaperMyscore}}</span>分</span>
                        </p>
                        <!--
                试卷编号
                {{paperUUID}}
                -->
                    </div>
                    <div class="col-xs-2 stunews-right" style="width: 50%;
							text-align: right;margin-right: 20px;">
                        <!--计时器-->
                        <span>{{headDate.totalScore}}分</span>
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
                                            <!--正确 blue
                                                错误 wrong
                                                .indexOf

                                                用户作答 examredetailsMyanswer
                                                答案 examquestionAnswer
                                            -->
                                            <li :class="verificationAnswer(item.examquestionAnswer,item.examredetailsMyanswer,item.examquestionTypes)
											?item.examredetailsMyanswer.indexOf(io.code) != -1?'blue':'':
											 item.examredetailsMyanswer.indexOf(io.code) != -1?'wrong':''"
                                                v-for="(io) in item.examquestionOptions" :key="io.code">
                                                <i class="options">{{ io.code }}</i>
                                                <span class="qesitem">{{ io.text }}</span>
                                            </li>
                                        </ul>
                                        <!-- 填空题答题区 -->
                                        <ul v-else class="question-options">
                                            <li>
												<textarea readonly v-model="item.examredetailsMyanswer"
                                                          style="width: 720px;height: 150px;resize:none"></textarea>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="Answer-Box">
                                        <!--<h3 style="margin: 7px 0;font-size: 15px;">我的答案：-->
                                        <!--<span class="">{{ item.examredetailsMyanswer }}</span></h3>-->
                                        <div class="Teacher-Answer"><h3 style="margin: 7px 0;font-size: 15px;">正确答案：
                                            <span class="answer-right-special">{{ item.examquestionAnswer }}</span></h3></div>
                                    </div>

                                    <div class="Analysis-Box">
                                        <button class="release">解析：</button>
                                        <div class="Analysis-Content">{{ item.examquestionAnalysis }}</div>
                                    </div>

                                </div>
                            </div>

                        </div>


                    </div>
                </div>
                <div id="dong" style="width: 300px;
						height: 300px;
						z-index: 100;
						top: 0px;  padding-left: 20px;
						position:absolute;" class="col-xs-3 user-config-center content-style">
                    <div class="resultshow">
                        <div id="answerguide" class="chioce-btn answerguide">
                            <dl class="question-result-item clearfix">
                                <dt class="question-resul-title ">试卷题目</dt>
                                <dd class="question-resul-tab">

                                    <a @click="goTo(item.id)" v-for="(item,index) in dataList" :key="index"
                                       :class="verificationAnswer(item.examquestionAnswer,item.examredetailsMyanswer,item.examquestionTypes)?'done':'mark'"><span>{{index+1}}</span></a>
                                </dd>
                            </dl>
                        </div>
                        <ul class="question-result-explain">
                            <li><i class="icon-explain donei"></i>正确</li>
                            <!--<li><i class="icon-explain undo"></i>未做</li>-->
                            <li><i class="icon-explain marki"></i>错误</li>
                        </ul>
                        <div class="right-bottom">
                            <button class="hm_btn_orange marginr20 submitwrok"
                                    @click="previousPage">返回</button>
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

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            dataList: [],
            headDate: {},
        },
        methods: {
            //跳转
            goTo(id) {
                document.querySelector('#id' + id).scrollIntoView()
            },
            verificationAnswer(examquestionAnswer,examredetailsMyanswer,type) {
                if(type == 2){
                    if(examquestionAnswer.split(",").sort().toString() == examredetailsMyanswer.split(",").sort().toString()){
                        return true;
                    }
                }else{
                    if(examquestionAnswer == examredetailsMyanswer){
                        return true;
                    }
                }
                return false;
            },
            previousPage(){
                window.history.back();
            },
        }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var jquery = layui.jquery;
        jquery(window).scroll(function() {
            var scrollHeight = document.documentElement.scrollTop;
            //WaitList 是 div ID（id="WaitLst"）
            //top: scrollHeight + 150 + "px"   150为距离顶部高度
            jquery("#dong").css({
                top: scrollHeight + 0 + "px"
            }).show();
        });

        var limit = 10;

        //获取考卷信息
        http.request('examrecord/info/' + http.getParam("id"), 'get', {}, function(res) {
            vue.headDate = res.data
        })

        // 获取考题数据
        http.request('examredetails/page', 'get', {
            page: 1,
            limit: limit,
            examredetailsUuidNumber: http.getParam("examrecordUuidNumber"),
            yonghuId: http.getParam("yonghuId"),
        }, function(res) {
            vue.dataList = res.data.list
            vue.dataList.forEach(function(item, index) {
                if (item.examquestionTypes != 4) {
                    vue.dataList[index].examquestionOptions = JSON.parse(item
                            .examquestionOptions)
                }
            });
        })
    });
</script>

</body>
</html>
