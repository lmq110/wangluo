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
                    <h3 class="block-title">编辑错题表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">错题表管理</li>
                        <li class="breadcrumb-item active">编辑错题表</li>
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
                        <h3 class="widget-title">错题表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa exampaper">
                                        <label>试卷表</label>
                                        <div>
                                            <select style="width: 450px" id="exampaperSelect" name="exampaperSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 exampaper">
                                        <label>试卷名称</label>
                                        <input style="width: 450px" id="exampaperName" name="exampaperName" placeholder="试卷名称" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 exampaper">
                                        <label>试卷状态</label>
                                        <input style="width: 450px" id="exampaperValue" name="exampaperValue" placeholder="试卷状态" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa examquestion">
                                        <label>试题表</label>
                                        <div>
                                            <select style="width: 450px" id="examquestionSelect" name="examquestionSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 examquestion">
                                        <label>试题名称</label>
                                        <input style="width: 450px" id="examquestionName" name="examquestionName" placeholder="试题名称" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 examquestion">
                                        <label>试题类型</label>
                                        <input style="width: 450px" id="examquestionValue" name="examquestionValue" placeholder="试题类型" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa yonghu">
                                        <label>用户</label>
                                        <div>
                                            <select style="width: 450px" id="yonghuSelect" name="yonghuSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户姓名</label>
                                        <input style="width: 450px" id="yonghuName" name="yonghuName" placeholder="用户姓名" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户手机号</label>
                                        <input style="width: 450px" id="yonghuPhone" name="yonghuPhone" placeholder="用户手机号" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yonghu">
                                        <label>用户头像</label>
                                        <img id="yonghuPhotoImg" src="" width="100" height="100">
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                <input id="exampaperId" name="exampaperId" type="hidden">
                                <input id="examquestionId" name="examquestionId" type="hidden">
                                    <div class="form-group col-md-6 examredetailsMyanswerDiv">
                                        <label>考生作答</label>
                                        <input style="width: 450px" id="examredetailsMyanswer" name="examredetailsMyanswer" class="form-control"
                                               placeholder="考生作答">
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

    var tableName = "examrewrongquestion";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
        <!-- 级联表的下拉框数组 -->
    var exampaperOptions = [];
    var examquestionOptions = [];
    var yonghuOptions = [];

    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '用户'){//当前登录用户不为这个
                if($("#yonghuId") !=null){
                    var yonghuId = $("#yonghuId").val();
                    if(yonghuId == null || yonghuId =='' || yonghuId == 'null'){
                        layui.layer.msg("用户id不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '试卷表'){//当前登录用户不为这个
                if($("#exampaperId") !=null){
                    var exampaperId = $("#exampaperId").val();
                    if(exampaperId == null || exampaperId =='' || exampaperId == 'null'){
                        layui.layer.msg("试卷（外键）不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '试题表'){//当前登录用户不为这个
                if($("#examquestionId") !=null){
                    var examquestionId = $("#examquestionId").val();
                    if(examquestionId == null || examquestionId =='' || examquestionId == 'null'){
                        layui.layer.msg("试题id（外键）不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
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
            httpJson("examrewrongquestion/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addexamrewrongquestion');
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
        <!-- 查询级联表的所有列表 -->
        function exampaperSelect() {
            //填充下拉框选项
            http("exampaper/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    exampaperOptions = res.data.list;
                }
            });
        }

        function exampaperSelectOne(id) {
            http("exampaper/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                exampaperShowImg();
                exampaperShowVideo();
                exampaperDataBind();
            }
        });
        }
        function examquestionSelect() {
            //填充下拉框选项
            http("examquestion/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    examquestionOptions = res.data.list;
                }
            });
        }

        function examquestionSelectOne(id) {
            http("examquestion/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                examquestionShowImg();
                examquestionShowVideo();
                examquestionDataBind();
            }
        });
        }
        function yonghuSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yonghuOptions = res.data.list;
                }
            });
        }

        function yonghuSelectOne(id) {
            http("yonghu/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yonghuShowImg();
                yonghuShowVideo();
                yonghuDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->

        function initializationexampaperSelect() {
            var exampaperSelect = document.getElementById('exampaperSelect');
            if(exampaperSelect != null && exampaperOptions != null  && exampaperOptions.length > 0 ) {
                for (var i = 0; i < exampaperOptions.length; i++) {
                        exampaperSelect.add(new Option(exampaperOptions[i].exampaperName, exampaperOptions[i].id));
                }

                $("#exampaperSelect").change(function(e) {
                        exampaperSelectOne(e.target.value);
                });
            }

        }

        function initializationexamquestionSelect() {
            var examquestionSelect = document.getElementById('examquestionSelect');
            if(examquestionSelect != null && examquestionOptions != null  && examquestionOptions.length > 0 ) {
                for (var i = 0; i < examquestionOptions.length; i++) {
                        examquestionSelect.add(new Option(examquestionOptions[i].examquestionName, examquestionOptions[i].id));
                }

                $("#examquestionSelect").change(function(e) {
                        examquestionSelectOne(e.target.value);
                });
            }

        }

        function initializationyonghuSelect() {
            var yonghuSelect = document.getElementById('yonghuSelect');
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                        yonghuSelect.add(new Option(yonghuOptions[i].yonghuName, yonghuOptions[i].id));
                }

                $("#yonghuSelect").change(function(e) {
                        yonghuSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->
        <!--  级联表的下拉框回显  -->
            var exampaperSelect = document.getElementById("exampaperSelect");
            if(exampaperSelect != null && exampaperOptions != null  && exampaperOptions.length > 0 ) {
                for (var i = 0; i < exampaperOptions.length; i++) {
                    if (exampaperOptions[i].id == ruleForm.exampaperId) {//下拉框value对比,如果一致就赋值汉字
                        exampaperSelect.options[i+1].selected = true;
                        $("#exampaperSelect" ).selectpicker('refresh');
                    }
                }
            }
            var examquestionSelect = document.getElementById("examquestionSelect");
            if(examquestionSelect != null && examquestionOptions != null  && examquestionOptions.length > 0 ) {
                for (var i = 0; i < examquestionOptions.length; i++) {
                    if (examquestionOptions[i].id == ruleForm.examquestionId) {//下拉框value对比,如果一致就赋值汉字
                        examquestionSelect.options[i+1].selected = true;
                        $("#examquestionSelect" ).selectpicker('refresh');
                    }
                }
            }
            var yonghuSelect = document.getElementById("yonghuSelect");
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                    if (yonghuOptions[i].id == ruleForm.yonghuId) {//下拉框value对比,如果一致就赋值汉字
                        yonghuSelect.options[i+1].selected = true;
                        $("#yonghuSelect" ).selectpicker('refresh');
                    }
                }
            }
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
        window.sessionStorage.removeItem('addexamrewrongquestion');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                yonghuId: "required",
                exampaperId: "required",
                examquestionId: "required",
                examredetailsMyanswer: "required",
            },
            messages: {
                yonghuId: "用户id不能为空",
                exampaperId: "试卷（外键）不能为空",
                examquestionId: "试题id（外键）不能为空",
                examredetailsMyanswer: "考生作答不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addexamrewrongquestion = window.sessionStorage.getItem("addexamrewrongquestion");
        if (addexamrewrongquestion != null && addexamrewrongquestion != "" && addexamrewrongquestion != "null") {
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
            http("examrewrongquestion/info/" + updateId, "GET", {}, (res) => {
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
        exampaperDataBind();
        examquestionDataBind();
        yonghuDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#exampaperId").val(ruleForm.exampaperId);
        $("#examquestionId").val(ruleForm.examquestionId);
        $("#examredetailsMyanswer").val(ruleForm.examredetailsMyanswer);

    }
    <!--  级联表的数据回显  -->
    function exampaperDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#exampaperId").val(ruleForm.id);

        $("#exampaperName").val(ruleForm.exampaperName);
        $("#exampaperDate").val(ruleForm.exampaperDate);
        $("#exampaperMyscore").val(ruleForm.exampaperMyscore);
        $("#kemuValue").val(ruleForm.kemuValue);
        $("#exampaperValue").val(ruleForm.exampaperValue);
        $("#zujuanValue").val(ruleForm.zujuanValue);
    }

    function examquestionDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#examquestionId").val(ruleForm.id);

        $("#examquestionName").val(ruleForm.examquestionName);
        $("#kemuValue").val(ruleForm.kemuValue);
        $("#examquestionOptions").val(ruleForm.examquestionOptions);
        $("#examquestionAnswer").val(ruleForm.examquestionAnswer);
        $("#examquestionAnalysis").val(ruleForm.examquestionAnalysis);
        $("#examquestionValue").val(ruleForm.examquestionValue);
        $("#examquestionSequence").val(ruleForm.examquestionSequence);
    }

    function yonghuDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yonghuId").val(ruleForm.id);

        $("#yonghuName").val(ruleForm.yonghuName);
        $("#yonghuPhone").val(ruleForm.yonghuPhone);
        $("#yonghuIdNumber").val(ruleForm.yonghuIdNumber);
        $("#yonghuEmail").val(ruleForm.yonghuEmail);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        exampaperShowImg();
        examquestionShowImg();
        yonghuShowImg();
    }


    <!--  级联表的图片  -->

    function exampaperShowImg() {
    }


    function examquestionShowImg() {
    }


    function yonghuShowImg() {
        $("#yonghuPhotoImg").attr("src",ruleForm.yonghuPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        exampaperShowVideo();
        examquestionShowVideo();
        yonghuShowVideo();
    }


    <!--  级联表的视频  -->

    function exampaperShowVideo() {
    }

    function examquestionShowVideo() {
    }

    function yonghuShowVideo() {
        $("#yonghuPhotoV").attr("src",ruleForm.yonghuPhoto);
    }



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
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            exampaperSelect();
            examquestionSelect();
            yonghuSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            <!--  初始化级联表的下拉框  -->
            initializationexampaperSelect();
            initializationexamquestionSelect();
            initializationyonghuSelect();

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
        window.sessionStorage.removeItem('addexamrewrongquestion');
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

        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
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
