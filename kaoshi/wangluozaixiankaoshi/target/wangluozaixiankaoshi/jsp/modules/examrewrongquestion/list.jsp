<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
</head>
<style>

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
                        <h3 class="block-title">错题表管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">错题表管理</li>
                            <li class="breadcrumb-item active">错题表列表</li>
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
                            <h3 class="widget-title">错题表列表</h3>
                            <div class="table-responsive mb-3" id="tableDiv">
                                <div class="col-sm-12">
                                                                                                                                                                                                                                                            
                                                                                                         
                                        <label>试卷名称</label>
                                        <input type="text" id="exampaperNameSearch" placeholder="请输入试卷名称" aria-controls="tableId" class="form-control form-control-sm">
                                                                                                                                                             
                                                     
                                        <label>试题名称</label>
                                        <input type="text" id="examquestionNameSearch" placeholder="请输入试题名称" aria-controls="tableId" class="form-control form-control-sm">
                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                        <label>用户姓名</label>
                                        <input type="text" id="yonghuNameSearch" placeholder="请输入用户姓名" aria-controls="tableId" class="form-control form-control-sm">
                                                                                                                                                                                                                                                                                                            <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
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
                                        <th>正确答案<i id=" examquestionAnswerIcon" class="fa fa-sort"></i></th>
                                        <th>试题类型<i id="examquestionTypesIcon" class="fa fa-sort"></i></th>
                                        <th>用户姓名<i id="yonghuNameIcon" class="fa fa-sort"></i></th>
<!--                                        <th>用户手机号<i id="yonghuPhoneIcon" class="fa fa-sort"></i></th>-->
<!--                                        <th>用户头像<i id="yonghuPhotoIcon" class="fa fa-sort"></i></th>-->
                                        <th onclick="sort('examredetails_myanswer')">考生作答<i id="examredetailsMyanswerIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('insert_time')">记录时间<i id="insertTimeIcon" class="fa fa-sort"></i></th>
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
        var tableName = "examrewrongquestion";
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

        <!-- 级联表的级联字典表 -->
        var kemuTypesOptions = [];
        var exampaperTypesOptions = [];
        var kemuTypesOptions = [];

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
                                                                                                                                                                 
                            //用户姓名
            var yonghuNameSearchInput = $('#yonghuNameSearch');
            if( yonghuNameSearchInput != null){
                if (yonghuNameSearchInput.val() != null && yonghuNameSearchInput.val() != '') {
                    searchForm.yonghuName = $('#yonghuNameSearch').val();
                }
            }
                                                                                                        <!-- 本表的查询条件 -->

                                        getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("examrewrongquestion/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,//字段
                order: sortOrder,//asc desc
                examrewrongquestionDelete: 1,
                //本表的
            //级联表的
                exampaperName: searchForm.exampaperName,
                kemuTypes: searchForm.kemuTypes,
                exampaperTypes: searchForm.exampaperTypes,

                examquestionName: searchForm.examquestionName,
                kemuTypes: searchForm.kemuTypes,

                yonghuName: searchForm.yonghuName,

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
            /*var exampaperTypesCell = document.createElement('td');
            exampaperTypesCell.innerHTML = item.exampaperValue;
            row.appendChild(exampaperTypesCell);*/


                    //试题名称
            var examquestionNameCell = document.createElement('td');
            if(item.examquestionName.length>10){
                examquestionNameCell.innerHTML = item.examquestionName.substring(0,10)+"...";
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

                        //试题类型
            var examquestionTypesCell = document.createElement('td');
            examquestionTypesCell.innerHTML = item.examquestionValue;
            row.appendChild(examquestionTypesCell);


                    //用户姓名
            var yonghuNameCell = document.createElement('td');
            yonghuNameCell.innerHTML = item.yonghuName;
            row.appendChild(yonghuNameCell);


                    //用户手机号
            /*var yonghuPhoneCell = document.createElement('td');
            yonghuPhoneCell.innerHTML = item.yonghuPhone;
            row.appendChild(yonghuPhoneCell);*/


                //用户头像
           /* var yonghuPhotoCell = document.createElement('td');
            var yonghuPhotoImg = document.createElement('img');
            var yonghuPhotoImgValue = item.yonghuPhoto;
            if(yonghuPhotoImgValue !=null && yonghuPhotoImgValue !='' && yonghuPhotoImgValue !='null'){
                    yonghuPhotoImg.setAttribute('src', yonghuPhotoImgValue);
                    yonghuPhotoImg.setAttribute('height', 100);
                    yonghuPhotoImg.setAttribute('width', 100);
                    yonghuPhotoCell.appendChild(yonghuPhotoImg);
            }else{
                    yonghuPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(yonghuPhotoCell);*/


            //考生作答
            var examredetailsMyanswerCell = document.createElement('td');
            if(item.examredetailsMyanswer.length>10){
                examredetailsMyanswerCell.innerHTML = item.examredetailsMyanswer.substring(0,10)+"...";
            }else{
                examredetailsMyanswerCell.innerHTML = item.examredetailsMyanswer;
            }
            examredetailsMyanswerCell.innerHTML = item.examredetailsMyanswer;
            row.appendChild(examredetailsMyanswerCell);


            //记录时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);


            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
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
                httpJson("examrewrongquestion/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg(res.msg, {time: 2000,icon: 6});
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
            window.sessionStorage.setItem('updateId', id)
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
            window.sessionStorage.setItem("addexamrewrongquestion", "addexamrewrongquestion");
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
                "file_name": 'examrewrongquestion.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
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

    //查询当前表搜索条件所有列表












        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

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
            kemuTypesSelect();
            exampaperTypesSelect();
            kemuTypesSelect();

            //查询当前表的搜索下拉框
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                         
            kemuTypesSelectSearch();
                         
            exampaperTypesSelectSearch();
                                                                                                                         
                         
            kemuTypesSelectSearch();
                                                                                                                                                                                                 
                                                                                                                        
        //当前表的下拉框赋值
                                                                                    
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
