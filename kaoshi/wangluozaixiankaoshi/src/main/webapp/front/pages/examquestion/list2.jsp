    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>试题表</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <script type="text/javascript" src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/theme.css"/>
</head>
<style>
    .center-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        display: flex;
        margin-bottom: 20px;
    }
    .proleft {
        width: 280px;
        background: #fff;
        padding-top: 30px;
    }

    .proleft .lefttit-bg {
        background: var(--publicMainColor);
        width: 90%;
        padding-left: 20px;
        padding-bottom: 10px;
    }

    .proleft .p1 {
        font-size: 25px;
        font-weight: bold;
        color: var(--publicMainColor);
        padding-left: 40px;
        line-height: 1;
        padding-bottom: 10px;
    }

    .proleft .p2 {
        font-size: 26px;
        font-weight: bold;
        color: #fff;
    }

    .proleft .p3 {
        font-size: 18px;
        font-weight: bold;
        color: #fff;
    }

    .fl {
        float: left;
    }

    .fr {
        float: right;
    }

    .ul1 {
        padding-left: 27px;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .ul1 li {
        position: relative;
    }

    .ul1 li {
        font-size: 15px;
        color: #000;
        padding: 10px 0px 10px 35px;
        display: block;
        transition: all 0.6s;
    }

    .ul1 li b {
        display: block;
        position: absolute;
        left: 0;
        width: 10px;
        height: 1px;
        background: #aaaaaa;
        top: 50%;
        transform: translateY(-50%);
        transition: all 0.6s;
    }

    .ul1 li.on b, .ul1 li:hover b {
        width: 31px;
        background: var(--publicMainColor);
        margin-right: 20px;
    }

    .ul1 li.on, .ul1 li:hover {
        color: var(--publicMainColor);
        margin-left: 20px;
    }</style>
<body class='bodyClass'>
<div id="app">
    <el-dialog title="弹出内容" :visible.sync="showContentModal" :modal-append-to-body="false">
        <div class="content" style="word-break: break-all;" v-html="showContent">
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showContentModal = false">关 闭</el-button>
        </div>
    </el-dialog>
<!-- 标题 -->


    <!-- 标题 -->
    <div class="center-container">
        <!-- 个人中心菜单 config.js-->
 <div class="proleft fl" style="width: 20%;">
     <div class="lefttit">
         <div class="lefttit-bg">
             <p class="p2">USER / CENTER</p>
             <p class="p3">试题表</p>
         </div>
     </div>
     <ul class="ul1">
         <li v-for="(item,index) in centerMenu" v-bind:key="index" :class="item.url=='../examquestion/list.jsp'?'on':''" @click="jump(item.url)">
             <b></b>{{item.name}}
         </li>
     </ul>
 </div>        <!-- 个人中心菜单 -->
        <div class="right-container sub_borderColor" style="overflow: auto" :style='{"padding":"20px","boxShadow":"0px rgba(255,0,0,.8)","margin":"0","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid","width":"80%"}'>
            <div style="display: flex;height: 60px;align-items: center;margin-left: 15px;justify-content: space-between">
                <div style="display: flex;height: 60px;align-items: center;margin-left: 15px;">
                    <div class="thisTableType-search" style="margin-left: 15px;"
                         :style='searchForm.examquestionTypes=="" || searchForm.examquestionTypes==null?{"color":"red","borderBottom":"1px solid red"}:{"color":"#000"}'>
                        全部
                    </div>
                    <div style="margin-left: 15px;" v-for="item in examquestionTypesList" :index="item.codeIndex" class="thisTableType-search"
                         :style='searchForm.examquestionTypes==item.codeIndex?{"color":"red","borderBottom":"1px solid red"}:{"color":"#000"}'>
                        {{item.indexName}}
                    </div>
                </div>
<!--                <button @click="jump('../examquestion/add.jsp')" class="layui-btn layui-btn-lg btn-theme sub_backgroundColor" :style='{"padding":"0 15px","boxShadow":"0 0 8px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#409EFF","color":"#333","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}'>
                    <i v-if="true" class="layui-icon">&#xe654;</i> 添加试题表信息
                </button>-->
            </div>
            <table class="layui-table" lay-skin="nob">
                <thead>
                    <tr>
                        <!-- 当前表 -->
                        <th>试题名称</th>
                        <th>科目</th>
                        <th>选项，json字符串</th>
                        <th>正确答案</th>
                        <th>答案解析</th>
                        <th>试题类型</th>
                        <th>试题排序，值越大排越前面</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item,index) in dataList" v-bind:key="index">
                        <td>{{item.examquestionName}}</td>
                        <td>{{item.kemuValue}}</td>
                        <td>{{item.examquestionOptions}}</td>
                        <td>{{item.examquestionAnswer}}</td>
                        <td>{{item.examquestionAnalysis}}</td>
                        <td>{{item.examquestionValue}}</td>
                        <td>{{item.examquestionSequence}}</td>
                        <td style="width: 100px;">
                        <!--
                            <button @click="jump('../examquestion/add.jsp?examquestionId='+item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                 修改
                            </button>
                        -->
                            <button @click="deleteData(item)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                <i class="layui-icon">&#xe640;</i> 删除
                            </button>
                            <button v-if="item.examquestionTypes==1 && false" @click="wuyong(item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                无用按钮
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pager" id="pager" :style="{textAlign:'center'}"></div>
        </div>
    </div></div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script type="text/javascript">
    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,30)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            userId: localStorage.getItem("userid"),//当前登录人的id
            sessionTable: localStorage.getItem("userTable"),//登录账户所在表名
            role: localStorage.getItem("role"),//权限
            //小菜单
            centerMenu: centerMenu,
            //项目路径
            baseUrl:"",
            //弹出内容模态框
            showContentModal:false,
            showContent:"",
            kemuTypesList: [],
            examquestionTypesList: [],

            //查询条件
            searchForm: {
                page: 1
                ,limit: 8
                ,sort: "id"//字段
                ,order: "desc"//asc desc
                ,yonghuId: localStorage.getItem('userid')//只能查询自己
                    ,examquestionName: ""
                ,kemuTypes: ""
                ,examquestionOptions: ""
                ,examquestionAnswer: ""
                ,examquestionAnalysis: ""
                ,examquestionTypes: ""
            },

            dataList: [],
        },
        filters: {
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }
                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            isAuth(tablename, button) {
                return isFrontAuth(tablename, button);
            },
            jump(url) {
                jump(url);
            },
            jumpCheck(url,check1,check2) {
                if(check1 == "2" || check1 == 2){//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if(check2 == "2"  || check2 == 2){//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            },
            showContentFunction(content) {
                this.showContentModal=true;
                this.showContent=content.replaceAll("src=\"upload/","src=\""+this.baseUrl+"upload/");
            },
            wuyong(id) {
                var mymessage = confirm("确定要    吗？");if(!mymessage){return false;}
                layui.http.requestJson(`examquestion/update`, 'post', {
                    id:id,
//                    examquestionTypes:1,
                }, function (res) {
                    if(res.code == 0){
                        layui.layer.msg('操作成功', {time: 2000, icon: 6 }, function () {window.location.reload();});
                    }else{
                        layui.layer.msg(res.msg, {time: 5000,icon: 5});
                    }
                });
            },
            deleteData(data){
                var mymessage = confirm("确定要删除这条数据吗？");
                if(!mymessage){
                    return false;
                }
                // 删除信息
                layui.http.requestJson(`examquestion/delete`, 'post', [data.id], (res) => {
                    if(res.code==0){
                        layer.msg('删除成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            },

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;
        vue.baseUrl = http.baseurl

        localStorage.setItem("goUtl","./pages/examquestion/list2.jsp")

        // var id = http.getParam('id');

        //试题类型的动态搜素
        $(document).on("click", ".thisTableType-search", function (e) {
            vue.searchForm.examquestionTypes = $(this).attr('index');
            pageList();
        });


            //当前表的 科目 字段 字典表查询
            kemuTypesSelect();
            //当前表的 试题类型 字段 字典表查询
            examquestionTypesSelect();
           //当前表的 科目 字段 字典表查询方法
           function kemuTypesSelect() {
               http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kemu_types", 'get', {}, function (res) {
                   if(res.code == 0){
                       vue.kemuTypesList = res.data.list;
                   }
               });
           }
           //当前表的 试题类型 字段 字典表查询方法
           function examquestionTypesSelect() {
               http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=examquestion_types", 'get', {}, function (res) {
                   if(res.code == 0){
                       vue.examquestionTypesList = res.data.list;
                   }
               });
           }
            // 分页列表
            pageList();

            // 搜索按钮
            jquery('#btn-search').click(function (e) {
                pageList();
            });

            function pageList() {
                // 获取列表数据
                http.request('examquestion/list', 'get', vue.searchForm, function (res) {
                    vue.dataList = res.data.list;
                    // 分页
                    laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: vue.searchForm.limit,
                        groups: 3,
                        layout: ["prev", "page", "next"],
                        jump: function (obj, first) {
                            vue.searchForm.page = obj.curr;//翻页
                            //首次不执行
                            if (!first) {
                                http.request('examquestion/list', 'get', vue.searchForm, function (res1) {
                                    vue.dataList = res1.data.list;
                                })
                            }
                        }
                    });
                });
            }
    });

    window.xznSlide = function () {
        jQuery(".banner").slide({mainCell: ".bd ul", autoPlay: true, interTime: 5000});
        jQuery("#ifocus").slide({
            titCell: "#ifocus_btn li",
            mainCell: "#ifocus_piclist ul",
            effect: "leftLoop",
            delayTime: 200,
            autoPlay: true,
            triggerTime: 0
        });
        jQuery("#ifocus").slide({titCell: "#ifocus_btn li", mainCell: "#ifocus_tx ul", delayTime: 0, autoPlay: true});
        jQuery(".product_list").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "leftLoop",
            autoPlay: true,
            vis: 5,
            trigger: "click",
            interTime: 4000
        });
    };
</script>
</body>
</html>
