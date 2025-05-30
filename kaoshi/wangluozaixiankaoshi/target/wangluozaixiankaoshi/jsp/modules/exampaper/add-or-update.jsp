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
                    <h3 class="block-title">编辑试卷表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">试卷表管理</li>
                        <li class="breadcrumb-item active">编辑试卷表</li>
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
                        <h3 class="widget-title">试卷表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 exampaperNameDiv">
                                        <label>试卷名称</label>
                                        <input style="width: 450px" id="exampaperName" name="exampaperName" class="form-control"
                                               placeholder="试卷名称">
                                    </div>
                                    <div class="form-group col-md-6 exampaperDateDiv">
                                        <label>考试时长(分钟)</label>
                                        <input style="width: 450px" id="exampaperDate" name="exampaperDate" class="form-control"
                                               onchange="integerChickValue(this)"  placeholder="考试时长(分钟)">
                                    </div>

                                    <div class="form-group col-md-6 exampaperMyscoreDiv">
                                        <label>试卷总分数</label>
                                        <input value="0" disabled style="width: 450px" id="exampaperMyscore" name="exampaperMyscore" class="form-control"
                                               onchange="integerChickValue(this)"  placeholder="试卷总分数">
                                    </div>
                                    <div class="form-group col-md-6 kemuTypesDiv">
                                        <label>科目</label>
                                        <select style="width: 450px" id="kemuTypesSelect" name="kemuTypes" class="form-control"></select>
                                    </div>
                                    <div class="form-group col-md-6 exampaperTypesDiv">
                                        <label>试卷状态</label>
                                        <select style="width: 450px" id="exampaperTypesSelect" name="exampaperTypes" class="form-control"></select>
                                    </div>
                                    <div class="form-group col-md-6 zujuanTypesDiv">
                                        <label>组卷方式</label>
                                        <select style="width: 450px" id="zujuanTypesSelect" name="zujuanTypes" class="form-control"></select>
                                    </div>
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

    var tableName = "exampaper";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var kemuTypesOptions = [];
    var exampaperTypesOptions = [];
    var zujuanTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("exampaper/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addexampaper');
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
        function exampaperTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=exampaper_types", "GET", {}, (res) => {
                if(res.code == 0){
                    exampaperTypesOptions = res.data.list;
                }
            });
        }
        function zujuanTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zujuan_types", "GET", {}, (res) => {
                if(res.code == 0){
                    zujuanTypesOptions = res.data.list;
                }
            });
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
        function initializationExampapertypesSelect(){
            var exampaperTypesSelect = document.getElementById('exampaperTypesSelect');
            if(exampaperTypesSelect != null && exampaperTypesOptions != null  && exampaperTypesOptions.length > 0 ){
                for (var i = 0; i < exampaperTypesOptions.length; i++) {
                    exampaperTypesSelect.add(new Option(exampaperTypesOptions[i].indexName,exampaperTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationZujuantypesSelect(){
            var zujuanTypesSelect = document.getElementById('zujuanTypesSelect');
            if(zujuanTypesSelect != null && zujuanTypesOptions != null  && zujuanTypesOptions.length > 0 ){
                for (var i = 0; i < zujuanTypesOptions.length; i++) {
                    zujuanTypesSelect.add(new Option(zujuanTypesOptions[i].indexName,zujuanTypesOptions[i].codeIndex));
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

        var exampaperTypesSelect = document.getElementById("exampaperTypesSelect");
        if(exampaperTypesSelect != null && exampaperTypesOptions != null  && exampaperTypesOptions.length > 0 ) {
            for (var i = 0; i < exampaperTypesOptions.length; i++) {
                if (exampaperTypesOptions[i].codeIndex == ruleForm.exampaperTypes) {//下拉框value对比,如果一致就赋值汉字
                        exampaperTypesSelect.options[i].selected = true;
                }
            }
        }

        var zujuanTypesSelect = document.getElementById("zujuanTypesSelect");
        if(zujuanTypesSelect != null && zujuanTypesOptions != null  && zujuanTypesOptions.length > 0 ) {
            for (var i = 0; i < zujuanTypesOptions.length; i++) {
                if (zujuanTypesOptions[i].codeIndex == ruleForm.zujuanTypes) {//下拉框value对比,如果一致就赋值汉字
                        zujuanTypesSelect.options[i].selected = true;
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
        window.sessionStorage.removeItem('addexampaper');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                exampaperName: "required",
                exampaperDate: "required",
                exampaperMyscore: "required",
                kemuTypes: "required",
                exampaperTypes: "required",
                zujuanTypes: "required",
            },
            messages: {
                exampaperName: "试卷名称不能为空",
                exampaperDate: "考试时长(分钟)不能为空",
                exampaperMyscore: "试卷总分数不能为空",
                kemuTypes: "科目不能为空",
                exampaperTypes: "试卷状态不能为空",
                zujuanTypes: "组卷方式不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addexampaper = window.sessionStorage.getItem("addexampaper");
        if (addexampaper != null && addexampaper != "" && addexampaper != "null") {
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
            http("exampaper/info/" + updateId, "GET", {}, (res) => {
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


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#exampaperName").val(ruleForm.exampaperName);
        $("#exampaperDate").val(ruleForm.exampaperDate);
        $("#exampaperMyscore").val(ruleForm.exampaperMyscore);

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
            exampaperTypesSelect();
            zujuanTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationKemutypesSelect();
            initializationExampapertypesSelect();
            initializationZujuantypesSelect();
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
        window.sessionStorage.removeItem('addexampaper');
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
