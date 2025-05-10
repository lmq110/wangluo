<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑试题表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">试题表管理</li>
                        <li class="breadcrumb-item active">编辑试题表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">试题表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 kemuTypesDiv">
                                        <label>科目</label>
                                        <select style="width: 450px" id="kemuTypesSelect" name="kemuTypes" class="form-control"></select>
                                    </div>
                                    <div class="form-group col-md-6 examquestionNameDiv">
                                        <label>试题名称</label>
                                        <input style="width: 450px" id="examquestionName" name="examquestionName" class="form-control"
                                               placeholder="试题名称">
                                    </div>
                                    <div class="form-group col-md-6 examquestionTypesDiv">
                                        <label>试题类型</label>
                                        <select style="width: 450px" onchange="setQuestionOption(this)" id="examquestionTypesSelect" name="examquestionTypes" class="form-control"></select>
                                    </div>
                                    <div id="optionsParent" class="form-group col-md-6 examquestionOptionsDiv">
                                        <label>选项</label>
                                        <br>
                                        <button type="button" id="addBtn" onclick="addOption()" class="btn btn-success">添加</button>
                                        <button type="button" id="deleteBtn" onclick="deleteOption()" class="btn btn-warning">删除</button>
                                        <input id="options-input" name="examquestionOptions" type="hidden">
                                    </div>
                                    <div id="answerParent" class="form-group col-md-6 examquestionAnswerDiv">
                                        <label>正确答案</label>
                                        <input style="width: 450px" id="examquestionAnswer" name="examquestionAnswer" class="form-control"
                                               placeholder="正确答案" disabled>
                                    </div>
                                    <div class="form-group col-md-6 examquestionAnalysisDiv">
                                        <label>答案解析</label>
                                        <input style="width: 450px" id="examquestionAnalysis" name="examquestionAnalysis" class="form-control"
                                               placeholder="答案解析">
                                    </div>
                                    <!--<div class="form-group col-md-6 examquestionSequenceDiv">
                                        <label>试题排序，值越大排越前面</label>
                                        <label for="examquestionSequence"></label><input style="width: 450px" id="examquestionSequence" name="examquestionSequence" class="form-control"
                                                                                         onchange="integerChickValue(this)" placeholder="试题排序，值越大排越前面">
                                    </div>-->

                                    <div class="form-group-1 col-md-6 mb-3" style="display: flex;flex-wrap: wrap;">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/card.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script> -->
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file = "../../static/utils.js" %>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "examquestion";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};
    var optionCount = 4;
    var questionType = null;


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var kemuTypesOptions = [];
    var examquestionTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            if(!setOptionJson()){
                return;
            }
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            if(data["examquestionTypes"]==2){
                let examquestionAnswer="";
                let examquestionAnswerList = $('#examquestionAnswer').serializeArray();
                if(examquestionAnswerList==null || examquestionAnswerList.length==0){
                    layui.layer.msg("必须要选择一个答案", {time: 2000,icon: 5});
                    return;
                }
                examquestionAnswerList.forEach(function (item,index){
                    if(index==0){
                        examquestionAnswer=examquestionAnswer+item["value"];
                    }else{
                        examquestionAnswer=examquestionAnswer+","+item["value"];
                    }
                })
                data["examquestionAnswer"] = examquestionAnswer;
            }
            debugger
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("examquestion/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addexamquestion');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        layui.layer.msg(successMes, {time: 2000,icon: 5});
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            layui.layer.msg("表单未填完整或有错误", {time: 2000,icon: 5});
        }
    }

    // 设置选项json串
    function setOptionJson(){
        if(questionType == 1 || questionType == 2){
            var str = "["
            var options = document.getElementsByClassName('option')
            debugger
            for(var i=0;i<options.length;i++){
                var id =  'option' + String.fromCharCode(65+i);
                if($('#'+id).val() ==null || $('#'+id).val() == '' || $('#'+id).val().trim() == ''){
                    layui.layer.msg("还有选项没填!", {time: 2000,icon: 5});
                    return false
                }else{
                    str = str + "{\"text\":\"" +  $('#'+id).val() + "\",\"code\":\"" + String.fromCharCode(65+i) + "\"}"
                    debugger
                    if(i != options.length-1){
                        str = str + ","
                    }else{
                        str = str + "]"
                    }
                }
            }
            $('#options-input').val(str)
        }
        return true
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function kemuTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kemu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    kemuTypesOptions = res.data.list;
                }
            });
        }
        function examquestionTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=examquestion_types", "GET", {}, (res) => {
                if(res.code == 0){
                    examquestionTypesOptions = res.data.list;
                }
            });
        }

    function setQuestionOption(val){
        //设置题目类型
        questionType = val.value
        // 选择题至少有两项
        if(questionType == 1 || questionType == 2){
            optionCount = 0;
            //展示选项框
            $('#optionsParent').show()
            // 清除旧的选项
            $('#optionsParent').children().remove();
            $('#optionsParent').append("<label>选项</label><br>");
            //后续应该加上
            $('#optionsParent').append("<button id=\"addBtn\" onclick=\"addOption()\" class=\"btn btn-success\">添加</button>")
            $('#optionsParent').append("<button id=\"deleteBtn\" onclick=\"deleteOption()\" class=\"btn btn-warning\">删除</button>")
            $('#optionsParent').append("<input id=\"options-input\" name=\"examquestionOptions\" type=\"hidden\">")
            $('#addBtn').before("<label style='width: auto' id=\"labelA\">A. </label><input id=\"optionA\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            $('#addBtn').before("<label style='width: auto' id=\"labelB\">B. </label><input id=\"optionB\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            $('#addBtn').before("<label style='width: auto' id=\"labelC\">C. </label><input id=\"optionC\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            $('#addBtn').before("<label style='width: auto' id=\"labelD\">D. </label><input id=\"optionD\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            //重新渲染答案表单项
            $('#answerParent').children().remove()
            if(questionType==1){//单选
                $('#answerParent').append("<label>答案</label><select name=\"examquestionAnswer\" id=\"examquestionAnswer\" class=\"selectpicker\"         ><option value=\"A\" selected>A</option><option value=\"B\">B</option><option value=\"C\">C</option><option value=\"D\">D</option></select>")
                layui.layer.msg("默认选中A", {time: 2000,icon: 6});
            }else if(questionType==2){//多选
                $('#answerParent').append("<label>答案</label><select name=\"examquestionAnswer\" id=\"examquestionAnswer\" class=\"selectpicker\" multiple><option value=\"A\" selected>A</option><option value=\"B\" selected>B</option><option value=\"C\" selected>C</option><option value=\"D\" selected>D</option></select>")
                layui.layer.msg("默认选中全部", {time: 2000,icon: 6});
            }else{
                layui.layer.msg("未知类型,请核实", {time: 2000,icon: 5});
            }
            // $('#answerParent').append("<label>答案</label><input id=\"examquestionAnswer\" name=\"examquestionAnswer\" type=\"text\" class=\"form-control\" placeholder=\"多选用逗号隔开\">")
            $('#answerParent input').attr('maxlength',questionType*6+1)
            $('#answerParent').show()
            //隐藏添加按钮
            $("#addBtn").hide()
            $("#deleteBtn").hide()
        }else if(questionType == 3){//判断
            //隐藏选项框
            $('#optionsParent').hide();
            $("#options-input").val("[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]");
            // 重新渲染答案输入框
            $('#answerParent').children().remove()
            $('#answerParent').append("<label>答案</label><select id=\"examquestionAnswer\" name=\"examquestionAnswer\" class=\"selectpicker\"><option class=\"answerOption\" value=\"A\">A.对</option><option class=\"answerOption\" value=\"B\">B.错</option></select>")
            $('#answerParent').show()
        }else if(questionType == 4){//填空
            //隐藏选项框
            $('#optionsParent').hide();
            //选项留空
            $('#options-input').val("")
            // 重新渲染答案输入框
            $('#answerParent').children().remove();
            $('#answerParent').append("<label>答案</label><textarea style=\"width: 650px\"  id=\"examquestionAnswer\" name=\"examquestionAnswer\" class=\"form-control\" rows=\"3\" placeholder=\"答案\"></textarea>");
            //展示填空输入框
            $('#answerParent').show();
        }
        $(".selectpicker" ).selectpicker('refresh');//刷新,因为三个地方都要刷新,所以放在了最下方

    }
    //添加选择题选项
    function addOption(){
            debugger
        if(optionCount == 4){
            $('#addBtn').before("<label style='width: auto' id=\"labelA\">A. </label><input id=\"optionA\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            optionCount--
            $('#deleteBtn').hide()
        }else if(optionCount == 3){
            $('#addBtn').before("<label style='width: auto' id=\"labelB\">B. </label><input id=\"optionB\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            optionCount--
            $('#deleteBtn').hide()
        }else if(optionCount == 2){
            $('#addBtn').before("<label style='width: auto' id=\"labelC\">C. </label><input id=\"optionC\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            optionCount--
            $('#deleteBtn').show()
        }else if(optionCount == 1){
            $('#addBtn').before("<label style='width: auto' id=\"labelD\">D. </label><input id=\"optionD\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>")
            optionCount--
            $('#addBtn').hide()
            $('#deleteBtn').show()
        }
    }
    // 删除选择题选项
    function deleteOption(){
            debugger
        var options = document.getElementsByClassName('option')
        var inputId = '#' + options[options.length-1].getAttribute("id")
        $(inputId).prev().remove()
        $(inputId).next().remove()
        $(inputId).next().remove()
        $(inputId).remove()

        optionCount++

        if(optionCount != 0){
            $('#addBtn').show();
        }
        // 如果只剩两个选项就不给删除
        if(options.length <= 2){
            $('#deleteBtn').hide()
        }
    }

    //回显选择题选项
    function setOptions(){
        options = $.parseJSON(ruleForm.examquestionOptions);
        //展示选项框
        $('#optionsParent').show()
        if(options.length == 4){
            $('#addBtn').hide();
            optionCount =0;
        }else if(options.length==3){
            optionCount =1;
        }else if(options.length == 2){
            $('deleteBtn').hide();
            optionCount =2;
        }else if(options.length==1){
            optionCount =3;
        }else if(options.length==0){
            optionCount =4;
        }
        $("#deleteBtn").hide()
        $('#addBtn').hide();
        for(var i=0;i<options.length;i++){
            var code = options[i].code;
            var text = options[i].text;
            $('#addBtn').before("<label style='width: auto' id=\"label"+ code +"\">"+ code +". </label><input id=\"option"+ code +"\" class=\"option\" type=\"text\"></br><span>&nbsp;&nbsp;&nbsp;</span>");
            $('#option'+code).val(text)
        }
        $('#optionsParent').show()
    }

        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationKemutypesSelect(){
            var kemuTypesSelect = document.getElementById('kemuTypesSelect');
            if(kemuTypesSelect != null && kemuTypesOptions != null  && kemuTypesOptions.length > 0 ){
                for (var i = 0; i < kemuTypesOptions.length; i++) {
                    kemuTypesSelect.add(new Option(kemuTypesOptions[i].indexName,kemuTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationExamquestiontypesSelect(){
            var examquestionTypesSelect = document.getElementById('examquestionTypesSelect');
            if(examquestionTypesSelect != null && examquestionTypesOptions != null  && examquestionTypesOptions.length > 0 ){
                for (var i = 0; i < examquestionTypesOptions.length; i++) {
                    examquestionTypesSelect.add(new Option(examquestionTypesOptions[i].indexName,examquestionTypesOptions[i].codeIndex));
                }
            }
        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var kemuTypesSelect = document.getElementById("kemuTypesSelect");
        if(kemuTypesSelect != null && kemuTypesOptions != null  && kemuTypesOptions.length > 0 ) {
            for (var i = 0; i < kemuTypesOptions.length; i++) {
                if (kemuTypesOptions[i].codeIndex == ruleForm.kemuTypes) {//下拉框value对比,如果一致就赋值汉字
                        kemuTypesSelect.options[i].selected = true;
                }
            }
        }

        var examquestionTypesSelect = document.getElementById("examquestionTypesSelect");
        if(examquestionTypesSelect != null && examquestionTypesOptions != null  && examquestionTypesOptions.length > 0 ) {
            for (var i = 0; i < examquestionTypesOptions.length; i++) {
                if (examquestionTypesOptions[i].codeIndex == ruleForm.examquestionTypes) {//下拉框value对比,如果一致就赋值汉字
                        examquestionTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {
        <!-- 获取当前表的富文本框内容 -->
    }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addexamquestion');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                examquestionName: "required",
                kemuTypes: "required",
                examquestionOptions: "required",
                examquestionAnswer: "required",
                examquestionAnalysis: "required",
                examquestionTypes: "required",
                examquestionSequence: "required",
            },
            messages: {
                examquestionName: "试题名称不能为空",
                kemuTypes: "科目不能为空",
                examquestionOptions: "选项，json字符串不能为空",
                examquestionAnswer: "正确答案不能为空",
                examquestionAnalysis: "答案解析不能为空",
                examquestionTypes: "试题类型不能为空",
                examquestionSequence: "试题排序，值越大排越前面不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addexamquestion = window.sessionStorage.getItem("addexamquestion");
        if (addexamquestion != null && addexamquestion != "" && addexamquestion != "null") {
            //注册表单验证
            $(validform());

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("examquestion/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->

        // 回显选择题选项 单选和多选进
        if(ruleForm.examquestionTypes < 3){
            if(ruleForm.examquestionOptions != null && ruleForm.examquestionOptions != "" && ruleForm.examquestionOptions != "[]"){
                setOptions();
            }
        }
        if(ruleForm.examquestionTypes ==4){//填空
            // if(questionType == 4){
                // 重新渲染答案输入框
                $('#answerParent').children().remove();
                $('#answerParent').append("<label>答案</label><textarea id=\"examquestionAnswer\" name=\"examquestionAnswer\" class=\"form-control\" rows=\"2\" placeholder=\"答案\"></textarea>");
                //展示填空输入框
                $('#answerParent').show()
                $('#optionsParent').hide();//判断题隐藏
            // }
            $('#examquestionAnswer').val(ruleForm.examquestionAnswer)
        }else{//单选 多选 判断
            // 重新渲染答案输入框
            $('#answerParent').children().remove();
            // $('#answerParent').append("<label>答案</label><select id=\"examquestionAnswer\" name=\"examquestionAnswer\" class=\"form-control\"><option class=\"answerOption\" value=\"A\">A.对</option><option class=\"answerOption\" value=\"B\">B.错</option></select>")
            if(ruleForm.examquestionTypes==3){
                $('#answerParent').append("<label>答案</label><select id=\"examquestionAnswer\" name=\"examquestionAnswer\" class=\"selectpicker\"><option class=\"answerOption\" value=\"A\">A.对</option><option class=\"answerOption\" value=\"B\">B.错</option></select>")
                $('#optionsParent').hide();//判断题隐藏
            }else if(ruleForm.examquestionTypes==2){
                $('#answerParent').append("<label>答案</label><select name=\"examquestionAnswer\" id=\"examquestionAnswer\" class=\"selectpicker\" multiple><option class=\"answerOption\" value=\"A\">A</option><option class=\"answerOption\" value=\"B\">B</option><option class=\"answerOption\" value=\"C\">C</option><option class=\"answerOption\" value=\"D\">D</option></select>")
            }else if(ruleForm.examquestionTypes==1){
                $('#answerParent').append("<label>答案</label><select name=\"examquestionAnswer\" id=\"examquestionAnswer\" class=\"selectpicker\"         ><option class=\"answerOption\" value=\"A\">A</option><option class=\"answerOption\" value=\"B\">B</option><option class=\"answerOption\" value=\"C\">C</option><option class=\"answerOption\" value=\"D\">D</option></select>")
            }
            $('#answerParent').show()
            var answerOptions = document.getElementsByClassName('answerOption')
            if(ruleForm.examquestionTypes==3 || ruleForm.examquestionTypes==1){//判断或者单选
                for(var i=0;i<answerOptions.length;i++){
                    if(answerOptions[i].value == ruleForm.examquestionAnswer){
                        answerOptions[i].selected = true
                    }
                }
            }else if(ruleForm.examquestionTypes==2){
                let examquestionAnswerList = ruleForm.examquestionAnswer.split(",");
                for(var i=0;i<answerOptions.length;i++){
                    examquestionAnswerList.forEach(function (item,index){
                        if(answerOptions[i].value == item){
                            answerOptions[i].selected = true;
                        }
                    })
                }
            }else{

            }
            $(".selectpicker" ).selectpicker('refresh');//选择框刷新
        }

    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#examquestionName").val(ruleForm.examquestionName);
        $("#examquestionOptions").val(ruleForm.examquestionOptions);
        // $("#examquestionAnswer").val(ruleForm.examquestionAnswer);
        $("#examquestionAnalysis").val(ruleForm.examquestionAnalysis);
        $("#examquestionSequence").val(ruleForm.examquestionSequence);
        questionType=ruleForm.examquestionTypes;

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
    }


    <!--  级联表的视频  -->



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            kemuTypesSelect();
            examquestionTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationKemutypesSelect();
            initializationExamquestiontypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addexamquestion');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }


        layui.use(['layer' , 'jquery' , 'laydate'], function() {
            var layer = layui.layer;
            var jquery = layui.jquery;
            var laydate = layui.laydate;

			// layui.layer.msg("输入不合法", {time: 2000,icon: 5});
			//    5失败 6成功
        });


        //比较大小
        function compare() {
            var largerVal = null;
            var smallerVal = null;
            if (largerVal != null && smallerVal != null) {
                if (largerVal <= smallerVal) {
                    alert(smallerName + '不能大于等于' + largerName);
                    return false;
                }
            }
            return true;
        }
    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
