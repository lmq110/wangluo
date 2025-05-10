<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <style>

    </style>
</head>
<style>

</style>
<body>

    <div class="modal fade" id="shitiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" style="margin-left: 18%;">
            <div class="modal-content" style="width:1000px;overflow: auto;max-height:800px;">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" >手动添加试题</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <label class="col-sm-4">
                            试题名称:<input type="text" id="examquestionNameSearchModal" class="form-control" placeholder="试题名称">
                        </label>
                        <label class="col-sm-4">
                            试题类型:
                            <select name="examquestionTypesSelectSearchModal" id="examquestionTypesSelectSearchModal" aria-controls="tableId" class="form-control form-control-sm"></select>
                        </label>
                        <label class="col-sm-1">
                            <button onclick="selectQuestions()" type="button" class="btn btn-success">查询试题</button>
                        </label>
                        <label class="col-sm-1"></label>
                        <label class="col-sm-1">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="guanbiShitiModal()">关 闭 模 态 框</button>
                        </label>
                    </div>
                    <%-- 详情列表 --%>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>试题名称</th>
                            <th>正确答案</th>
                            <th>答案解析</th>
                            <th>试题类型</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="thisModalTbody" >
                        </tbody>
                    </table>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
<!--                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="guanbiShitiModal()">关 闭</button>-->
                </div>
            </div>
        </div>
    </div>



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
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">试卷选题管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">试卷选题管理</li>
                            <li class="breadcrumb-item active">试卷选题列表</li>
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
                            <h3 class="widget-title">试卷选题列表</h3>
                            <div class="table-responsive mb-3" id="tableDiv">
                                <div class="col-sm-12">
                                        <label>试题名称</label>
                                        <input type="text" id="examquestionNameSearch" placeholder="请输入试题名称" aria-controls="tableId" class="form-control form-control-sm">

                                        <label>试题类型</label>
                                        <select name="examquestionTypesSelectSearch" id="examquestionTypesSelectSearch" aria-controls="tableId" class="form-control form-control-sm"></select>

                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
<!--                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>-->
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                </div>
                                <div id="zidongzujuanTypesDiv" style="width: 1000px;margin: 0 auto;">
                                    <span>单选题数量:
                                        <input type="number" id="danNum" min="1" placeholder="数量" class="form-control-sm" style="width: 65px;">
                                        现:<span id="danXisting" style="font-size: 25px;color:var(--publicMainColor,orange)"></span>题;
                                    </span>
                                    <span>
                                        分数:<input type="number" id="danFen" max="100" min="1" placeholder="分数" class="form-control-sm" style="width: 65px;">
                                    </span>
                                    <span>多选题数量:
                                        <input type="number" id="duoNum" min="1" placeholder="数量" class="form-control-sm" style="width: 65px;">
                                        现:<span id="duoXisting" style="font-size: 25px;color:var(--publicMainColor,orange)"></span>题;
                                    </span>
                                    <span>
                                        分数:<input type="number" id="duoFen" max="100" min="1" placeholder="分数" class="form-control-sm" style="width: 65px;">
                                    </span>
                                    <br>
                                    <span>判断题数量:
                                        <input type="number" id="panNum" min="1" placeholder="数量" class="form-control-sm" style="width: 65px;">
                                        现:<span id="panXisting" style="font-size: 25px;color:var(--publicMainColor,orange)"></span>题;
                                    </span>
                                    <span>
                                        分数:<input type="number" id="panFen" max="100" min="1" placeholder="分数" class="form-control-sm" style="width: 65px;">
                                    </span>
                                    <span>填空题数量:
                                        <input type="number" id="tianNum" min="1" placeholder="数量" class="form-control-sm" style="width: 65px;">
                                        现:<span id="tianXisting" style="font-size: 25px;color:var(--publicMainColor,orange)"></span>题;
                                    </span>
                                    <span>
                                        分数:<input type="number" id="tianFen" max="100" min="1" placeholder="分数" class="form-control-sm" style="width: 65px;">
                                    </span>
                                    <span>
                                        <button onclick="addzidongzujuan()" style="margin:0 30px;" type="button" class="btn btn-success">开始组卷</button>
                                    </span>
                                    <span style="color:green;">
                                         总分数:<span style="font-size: 20px;" name="exampapertopicNumber"></span>
                                    </span>
                                </div>
                                <div id="shoudongzujuanTypesDiv" style="width: 1000px;margin: 0 auto;display: flex">
                                    <div style="width: 50%">
                                        <button onclick="addshoudongzujuan()" type="button" class="btn btn-success">添加考题</button>
                                    </div>
                                    <div style="color: green;text-align: right;width: 50%;">
                                        总分数:<span style="font-size: 20px;" name="exampapertopicNumber"></span>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>
                                        <th>试卷名称<i id="exampaperNameIcon" class="fa fa-sort"></i></th>
<!--                                        <th>试卷状态<i id="exampaperTypesIcon" class="fa fa-sort"></i></th>-->
                                        <th>试题名称<i id="examquestionNameIcon" class="fa fa-sort"></i></th>
                                        <th>试题类型<i id="examquestionTypesIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('exampapertopic_number')">试题分数<i id="exampapertopicNumberIcon" class="fa fa-sort"></i></th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3" style="flex:none;max-width:inherit;display:flex;">
                                    <div class="dataTables_length" id="tableId_length">
                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize" onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                       <span class="text">条每页</span>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')"> <a class="page-link" href="#" tabindex="-1">上一页</a></li>
                                            <li class="page-item" id="tableId_next" onclick="pageNumChange('next')"> <a class="page-link" href="#">下一页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
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
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file = "../../static/utils.js" %>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "exampapertopic";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = 'id';
        var sortOrder = 'desc';
        var ids = [];
        var checkAll = false;

        // 考试相关参数
        var exampaperId = "";//试卷id
        var zujuanTypes = "";//组卷类型 1:自动组卷 2:手动组卷
        var kemuTypes   = "";//科目

        //自动选题设置题目数量 题目分数
        var danNum = 1; //单选数量
        var danFen = 1; //单选分数
        var danXisting = 0; //现有数量
        var duoNum = 1; //多选数量
        var duoFen = 1; //多选分数
        var duoXisting = 0; //现有数量
        var panNum = 1; //判断数量
        var panFen = 1; //判断分数
        var panXisting = 0; //现有数量
        var tianNum = 1; //填空数量
        var tianFen = 1; //填空分数
        var tianXisting = 0; //现有数量

        var questionsTableVisible = false; //手动添加试题弹框
        var questionsList = []; //试题数据集合
             //试题数据集合分页信息
        // var questionsPageIndex = 1;
        // var questionsPageSize = 10;
        // var questionsPageTotalPage = 0;
             //总分数
        var exampapertopicNumber = 0;


        <!-- 级联表的级联字典表 -->
        var kemuTypesOptions = [];
        var exampaperTypesOptions = [];
        var kemuTypesOptions = [];
        var examquestionTypesOptions = [];

        <!-- 本表的级联字段表 -->

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }

        //排序
        function sort(columnName) {
            var iconId = '#' + columnName + 'Icon'
            $('th i').attr('class', 'fa fa-sort');
            if (sortColumn == '' || sortColumn != columnName) {
                sortColumn = columnName;
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
            if (sortColumn == columnName) {
                if (sortOrder == 'asc') {
                    sortOrder = 'desc';
                    $(iconId).attr('class', 'fa fa-sort-desc');
                } else {
                    sortOrder = 'asc';
                    $(iconId).attr('class', 'fa fa-sort-asc');
                }
            }
            pageIndex = 1;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //试卷名称
            var exampaperNameSearchInput = $('#exampaperNameSearch');
            if( exampaperNameSearchInput != null){
                if (exampaperNameSearchInput.val() != null && exampaperNameSearchInput.val() != '') {
                    searchForm.exampaperName = $('#exampaperNameSearch').val();
                }
            }
                                                             
            var kemuTypesSelectSearchInput = document.getElementById("kemuTypesSelectSearch");
            if(kemuTypesSelectSearchInput != null){
                var kemuTypesIndex = kemuTypesSelectSearchInput.selectedIndex;
                if( kemuTypesIndex  != 0){
                    searchForm.kemuTypes = document.getElementById("kemuTypesSelectSearch").options[kemuTypesIndex].value;
                }
            }
                     
            var exampaperTypesSelectSearchInput = document.getElementById("exampaperTypesSelectSearch");
            if(exampaperTypesSelectSearchInput != null){
                var exampaperTypesIndex = exampaperTypesSelectSearchInput.selectedIndex;
                if( exampaperTypesIndex  != 0){
                    searchForm.exampaperTypes = document.getElementById("exampaperTypesSelectSearch").options[exampaperTypesIndex].value;
                }
            }
                                                                                                     
                            //试题名称
            var examquestionNameSearchInput = $('#examquestionNameSearch');
            if( examquestionNameSearchInput != null){
                if (examquestionNameSearchInput.val() != null && examquestionNameSearchInput.val() != '') {
                    searchForm.examquestionName = $('#examquestionNameSearch').val();
                }
            }
                     
            var kemuTypesSelectSearchInput = document.getElementById("kemuTypesSelectSearch");
            if(kemuTypesSelectSearchInput != null){
                var kemuTypesIndex = kemuTypesSelectSearchInput.selectedIndex;
                if( kemuTypesIndex  != 0){
                    searchForm.kemuTypes = document.getElementById("kemuTypesSelectSearch").options[kemuTypesIndex].value;
                }
            }

            var examquestionTypesSelectSearchInput = document.getElementById("examquestionTypesSelectSearch");
            if(examquestionTypesSelectSearchInput != null){
                var examquestionTypesIndex = examquestionTypesSelectSearchInput.selectedIndex;
                if( examquestionTypesIndex  != 0){
                    searchForm.examquestionTypes = document.getElementById("examquestionTypesSelectSearch").options[examquestionTypesIndex].value;
                }
            }
            getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("exampapertopic/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,//字段
                order: sortOrder,//asc desc
                exampapertopicDelete: 1,
                //本表的
            //级联表的
                exampaperId: exampaperId,
                exampaperName: searchForm.exampaperName,
                kemuTypes: searchForm.kemuTypes,
                exampaperTypes: searchForm.exampaperTypes,

                examquestionName: searchForm.examquestionName,
                kemuTypes: searchForm.kemuTypes,

            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据
                        $('#thisTbody').append(trow);
                    }
                    http("exampapertopic/sumExampapertopicNumber", "GET", {exampaperId:exampaperId}, (res) => {
                        if(res.code == 0) {
                            exampapertopicNumber=res.exampapertopicNumber;
                            $("[name='exampapertopicNumber']").text(exampapertopicNumber);//设置总分
                        }else{
                            layui.layer.msg(res.msg, {time: 2000,icon: 5});
                        }
                    });
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //试卷名称
            var exampaperNameCell = document.createElement('td');
            exampaperNameCell.innerHTML = item.exampaperName;
            row.appendChild(exampaperNameCell);

                        //试卷状态
         /*   var exampaperTypesCell = document.createElement('td');
            exampaperTypesCell.innerHTML = item.exampaperValue;
            row.appendChild(exampaperTypesCell);*/


                    //试题名称
            var examquestionNameCell = document.createElement('td');
            if(item.examquestionName.length>20){
                examquestionNameCell.innerHTML = item.examquestionName.substring(0,20)+"...";
            }else{
                examquestionNameCell.innerHTML = item.examquestionName;
            }
            row.appendChild(examquestionNameCell);

                        //试题类型
            var examquestionTypesCell = document.createElement('td');
            examquestionTypesCell.innerHTML = item.examquestionValue;
            row.appendChild(examquestionTypesCell);


            //试题分数
            var exampapertopicNumberCell = document.createElement('td');
            exampapertopicNumberCell.innerHTML = item.exampapertopicNumber;
            row.appendChild(exampapertopicNumberCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);


            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改分数";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }




        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                layui.layer.msg('请输入正确的页码', {time: 2000,icon: 5});
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        function questionsSearch() {
            selectQuestions();
        }
        function addzidongzujuan() {
            if(dataList.length>0){
                layui.layer.msg('请不要重复组卷！！！！(清空组卷信息后可再次重新组卷)', {time: 2000,icon: 5});
                return;
            }
            danNum=  $("#danNum").val();    danFen= $("#danFen").val();
            duoNum=  $("#duoNum").val();    duoFen= $("#duoFen").val();
            panNum=  $("#panNum").val();    panFen= $("#panFen").val();
            tianNum= $("#tianNum").val();   tianFen= $("#tianFen").val();
            //自动组卷
            if ((danNum == 0 || danNum == null || danFen == 0 || danFen == null)
                &&(duoNum == 0 || duoNum == null || duoFen == 0 || duoFen == null)
                &&(panNum == 0 || panNum == null || panFen == 0 || panFen == null)
                &&(tianNum == 0 || tianNum == null || tianFen == 0 || tianFen == null)
            ) {
                layui.layer.msg('题数量、题分数不可全部为空或为0', {time: 2000,icon: 5});
                return;
            }

            let params = {
                kemuTypes   : kemuTypes,
                exampaperId : exampaperId,
                danNum      : danNum,
                danFen      : danFen,
                duoNum      : duoNum,
                duoFen      : duoFen,
                panNum      : panNum,
                panFen      : panFen,
                tianNum     : tianNum,
                tianFen     : tianFen,
            }

            http("exampapertopic/zidongzujuan", "GET", params, (res) => {
                debugger
                if(res.code == 0) {
                    layui.layer.msg("自动组卷完成", {time: 4000,icon: 6});
                    getDataList();//查询当前试卷所组的试题
                    selectQuestions();//查询一下
                }else{
                    layui.layer.msg(res.msg, {time: 2000,icon: 5});
                }
            });
        }
        function addshoudongzujuan() {
            selectQuestions();
            $('#shitiModal').modal('show');
        }
        // 试题模态框打开
        $('#shitiModal').on('show.bs.modal', function () {
        });

        //关闭弹出的手动选题模态框
        function guanbiShitiModal(){
            $('#shitiModal').modal('hide');
        }
        function selectQuestions(){
            danNum=1;duoNum=1;panNum=1;tianNum=1;danXisting=0;duoXisting=0;panXisting=0;tianXisting=0;
            let params = {}
            params['page'] = 1;
            params['limit'] = 999999;
            if (kemuTypes != null && kemuTypes != "") {
                params['kemuTypes'] = kemuTypes
            }
            //试题名称
            var examquestionNameSearchModalInput = $('#examquestionNameSearchModal');
            if( examquestionNameSearchModalInput != null){
                if (examquestionNameSearchModalInput.val() != null && examquestionNameSearchModalInput.val() != '') {
                    params['examquestionName'] = $('#examquestionNameSearchModal').val();
                }
            }
            // 试题类型
            var examquestionTypesSelectSearchModalInput = document.getElementById("examquestionTypesSelectSearchModal");
            if(examquestionTypesSelectSearchModalInput != null){
                var examquestionTypesIndex = examquestionTypesSelectSearchModalInput.selectedIndex;
                if( examquestionTypesIndex  != 0){
                    params['examquestionTypes'] = document.getElementById("examquestionTypesSelectSearchModal").options[examquestionTypesIndex].value;
                }
            }
            http("examquestion/page", "GET", params, (res) => {
                $("#thisModalTbody").html("");//删除模态框中的试题列表
                if(res.code == 0) {
                    questionsList = res.data.list;
                    questionsList.forEach(function(item, index){
                        if(item.examquestionTypes==1){
                            danXisting = danXisting+1
                        }
                        if(item.examquestionTypes==2){
                            duoXisting = duoXisting+1
                        }
                        if(item.examquestionTypes==3){
                            panXisting = panXisting+1
                        }
                        if(item.examquestionTypes==4){
                            tianXisting = tianXisting+1
                        }
                        var trow = setQuestionsDataRow(item, index); //定义一个方法,返回tr数据
                        $('#thisModalTbody').append(trow);
                    });
                    $("#danNum").val(danNum);   $("#danNum").attr("max",danXisting);   $("#danFen").val(danFen);   $("#danXisting").text(danXisting);
                    $("#duoNum").val(duoNum);   $("#duoNum").attr("max",duoXisting);   $("#duoFen").val(duoFen);   $("#duoXisting").text(duoXisting);
                    $("#panNum").val(panNum);   $("#panNum").attr("max",panXisting);   $("#panFen").val(panFen);   $("#panXisting").text(panXisting);
                    $("#tianNum").val(tianNum); $("#tianNum").attr("max",tianXisting); $("#tianFen").val(tianFen); $("#tianXisting").text(tianXisting);
                    // pagination(); //渲染翻页组件
                }else{
                    questionsList = [];

                }
            });
        }

        // 渲染 添加试题 表格数据
        function setQuestionsDataRow(item, number) {
            //创建行
            var row = document.createElement('tr');


            //试卷名称
            /*var exampaperNameCell = document.createElement('td');
            exampaperNameCell.innerHTML = item.exampaperName;
            row.appendChild(exampaperNameCell);
*/
            //试卷状态
            /*   var exampaperTypesCell = document.createElement('td');
               exampaperTypesCell.innerHTML = item.exampaperValue;
               row.appendChild(exampaperTypesCell);*/


            //试题名称
            var examquestionNameCell = document.createElement('td');
            if(item.examquestionName.length>20){
                examquestionNameCell.innerHTML = item.examquestionName.substring(0,20)+"...";
            }else{
                examquestionNameCell.innerHTML = item.examquestionName;
            }
            row.appendChild(examquestionNameCell);
            //正确答案
            var examquestionAnswerCell = document.createElement('td');
            if(item.examquestionAnswer.length>10){
                examquestionAnswerCell.innerHTML = item.examquestionAnswer.substring(0,10)+"...";
            }else{
                examquestionAnswerCell.innerHTML = item.examquestionAnswer;
            }
            row.appendChild(examquestionAnswerCell);
            //答案解析
            var examquestionAnalysisCell = document.createElement('td');
            if(item.examquestionAnalysis.length>10){
                examquestionAnalysisCell.innerHTML = item.examquestionAnalysis.substring(0,10)+"...";
            }else{
                examquestionAnalysisCell.innerHTML = item.examquestionAnalysis;
            }
            row.appendChild(examquestionAnalysisCell);
            //试题类型
            var examquestionTypesCell = document.createElement('td');
            examquestionTypesCell.innerHTML = item.examquestionValue;
            row.appendChild(examquestionTypesCell);




            //每行按钮
            var btnGroup = document.createElement('td');
                //修改按钮
                var addQuestionsBtn = document.createElement('button');
                var addQuestionsAttr = 'addQuestions(' + item.id + ')';
                addQuestionsBtn.setAttribute("type", "button");
                addQuestionsBtn.setAttribute("class", "btn btn-warning btn-sm");
                addQuestionsBtn.setAttribute("onclick", addQuestionsAttr);
                addQuestionsBtn.innerHTML = "添加此试题";
                btnGroup.appendChild(addQuestionsBtn);
            row.appendChild(btnGroup);

            return row;
        }

        //手动组卷添加试题
        function addQuestions(id) {
            let data = {
                exampaperId: exampaperId,
                examquestionId: id,
                exampapertopicNumber: 0
            }
            httpJson("exampapertopic/save", "POST", data, (res) => {
                if(res.code == 0){
                    layui.layer.msg("添加试题成功", {time: 2000,icon: 6});
                    getDataList();//查询此试卷已绑定的试题
                }else{
                    layui.layer.msg(res.msg, {time: 2000,icon: 5});
                }
            });
        }



        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                layui.layer.msg('请勾选要删除的记录', {time: 2000,icon: 5});
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("exampapertopic/examinationDelete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg("删除成功", {time: 2000,icon: 6});
                    }
                });
            } else {
                layui.layer.msg('已取消操作', {time: 2000,icon: 5});
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id);

            //塞下面这些是为了调回来后不报错
            window.sessionStorage.setItem("exampaperId",exampaperId);
            window.sessionStorage.setItem("zujuanTypes",zujuanTypes);
            window.sessionStorage.setItem("kemuTypes",kemuTypes);
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addexampapertopic", "addexampapertopic");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'exampapertopic.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            //塞下面这些是为了调回来后不报错
            window.sessionStorage.setItem("exampaperId",exampaperId);
            window.sessionStorage.setItem("zujuanTypes",zujuanTypes);
            window.sessionStorage.setItem("kemuTypes",kemuTypes);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                             
        function kemuTypesSelectSearch() {
            var kemuTypesSelectSearch = document.getElementById('kemuTypesSelectSearch');
            if(kemuTypesSelectSearch != null) {
                kemuTypesSelectSearch.add(new Option('-请选择-',''));
                if (kemuTypesOptions != null && kemuTypesOptions.length > 0){
                    for (var i = 0; i < kemuTypesOptions.length; i++) {
                            kemuTypesSelectSearch.add(new Option(kemuTypesOptions[i].indexName, kemuTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function exampaperTypesSelectSearch() {
            var exampaperTypesSelectSearch = document.getElementById('exampaperTypesSelectSearch');
            if(exampaperTypesSelectSearch != null) {
                exampaperTypesSelectSearch.add(new Option('-请选择-',''));
                if (exampaperTypesOptions != null && exampaperTypesOptions.length > 0){
                    for (var i = 0; i < exampaperTypesOptions.length; i++) {
                            exampaperTypesSelectSearch.add(new Option(exampaperTypesOptions[i].indexName, exampaperTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                                     
                     
        function kemuTypesSelectSearch() {
            var kemuTypesSelectSearch = document.getElementById('kemuTypesSelectSearch');
            if(kemuTypesSelectSearch != null) {
                kemuTypesSelectSearch.add(new Option('-请选择-',''));
                if (kemuTypesOptions != null && kemuTypesOptions.length > 0){
                    for (var i = 0; i < kemuTypesOptions.length; i++) {
                            kemuTypesSelectSearch.add(new Option(kemuTypesOptions[i].indexName, kemuTypesOptions[i].codeIndex));
                    }
                }
            }
        }

        function examquestionTypesSelectSearch() {
            //本身
            var examquestionTypesSelectSearch = document.getElementById('examquestionTypesSelectSearch');
            if(examquestionTypesSelectSearch != null) {
                examquestionTypesSelectSearch.add(new Option('-请选择-',''));
                if (examquestionTypesOptions != null && examquestionTypesOptions.length > 0){
                    for (var i = 0; i < examquestionTypesOptions.length; i++) {
                        examquestionTypesSelectSearch.add(new Option(examquestionTypesOptions[i].indexName, examquestionTypesOptions[i].codeIndex));
                    }
                }
            }
            //模态框的
            var examquestionTypesSelectSearchModal = document.getElementById('examquestionTypesSelectSearchModal');
            if(examquestionTypesSelectSearchModal != null) {
                examquestionTypesSelectSearchModal.add(new Option('-请选择-',''));
                if (examquestionTypesOptions != null && examquestionTypesOptions.length > 0){
                    for (var i = 0; i < examquestionTypesOptions.length; i++) {
                        examquestionTypesSelectSearchModal.add(new Option(examquestionTypesOptions[i].indexName, examquestionTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                                                        
    //填充本表搜索下拉框
                    
    //查询级联表搜索条件所有列表
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

    //查询当前表搜索条件所有列表












        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;


            //取出相关参数,并删除无用
            exampaperId = window.sessionStorage.getItem("exampaperId");
            zujuanTypes =window.sessionStorage.getItem("zujuanTypes");
            kemuTypes =window.sessionStorage.getItem("kemuTypes");
            window.sessionStorage.removeItem("exampaperId");
            window.sessionStorage.removeItem("zujuanTypes");
            window.sessionStorage.removeItem("kemuTypes");
            if(zujuanTypes ==1){//自动组卷
                $("#shoudongzujuanTypesDiv").remove();
            }else if(zujuanTypes ==2){//手动组卷
                $("#zidongzujuanTypesDiv").remove();
            }else{
                layui.layer.msg("组卷类型未知,请核实", {time: 3000,icon: 5},function(){
                    window.location.href = "../exampaper/list.jsp";
                });
            }
            selectQuestions();//查询一下试卷列表,无论是自动还是手动,都要获取到题目的数量
            //查询当前表的搜索下拉框
            getDataList();
        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框
            exampaperTypesSelect();
            kemuTypesSelect();
            examquestionTypesSelect();

        //级联表的下拉框赋值
                                                 
                                                                         

            exampaperTypesSelectSearch();
                                                                                                                         
                         
            kemuTypesSelectSearch();

            examquestionTypesSelectSearch();
                                                                                                                                                
        //当前表的下拉框赋值
                                                            
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
