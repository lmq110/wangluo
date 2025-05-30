    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="true" %>
<!-- 考试 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>考试</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css" />
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css" />
</head>
<style>
    #swiper {
        overflow: hidden;
    }
    #swiper .layui-carousel-ind li {
        width: 10px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        border-radius: 30px;
        background-color: rgba(141, 141, 138, 1);
        box-shadow: ;
    }
    #swiper .layui-carousel-ind li.layui-this {
        width: 12px;
        height: 12px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        border-radius: 30px;
        background-color: rgba(255, 255, 255, 1);
        box-shadow: ;
    }

    .index-title {
        text-align: center;
        box-sizing: border-box;
        width: 980px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    .layui-laypage .layui-laypage-count {
        padding: 0 10px;
    }
    .layui-laypage .layui-laypage-skip {
        padding-left: 10px;
    }
</style>
<body>

<div id="app">
    <!-- 标题 -->
    <div class="index-title sub_backgroundColor" :style='{"padding":"10px","boxShadow":"0 0 2px rgba(160, 67, 26, 1)","margin":"10px auto","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
        <span>EXAM / RECORD</span><span>考试记录</span>
    </div>
    <!-- 标题 -->

    <div class="paper-container">
        <table class="layui-table" lay-skin="nob">
            <thead>
            <tr>
                <th>考试编号</th>
                <th>试卷名称</th>
                <th>用户姓名</th>
                <th>所得总分</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(item,index) in dataList" v-bind:key="index">
                <td>{{item.examrecordUuidNumber}}</td>
                <td>{{item.exampaperName}}</td>
                <td>{{item.yonghuName}}</td>
                <td>{{item.totalScore}}分</td>
                <td>
                    <button @click="detail(item)" type="button" class="layui-btn layui-btn-radius btn-theme">
                        <i class="layui-icon">&#xe679;</i> 查看
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="pager" id="pager" :style="{textAlign:2==1?'left':2==2?'center':'right'}"></div>
    </div>
</div>

<!-- layui -->
<script src="../../layui/layui.js"></script>
<!-- vue -->
<script src="../../js/vue.js"></script>
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
            dataList: []
        },
        methods: {
            jump(url) {
                jump(url)
            },
            detail(item) {
                window.location.href = `./detail.jsp?id=${item.id}&examrecordUuidNumber=${item.examrecordUuidNumber}&yonghuId=${item.yonghuId}`;
            }
        }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var jquery = layui.jquery;

        var limit = 10;

        // 获取列表数据
        http.request('examrecord/page', 'get', {
            page: 1,
            limit: limit,
            yonghuId: localStorage.getItem('userid')
        }, function(res) {
            vue.dataList = res.data.list
            // 分页
            laypage.render({
                elem: 'pager',
                count: res.data.total,
                limit: limit,
                groups: 5,
                layout: ["prev","page","next"],
                jump: function(obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request('examrecord/page', 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            yonghuId: localStorage.getItem('userid')
                        }, function(res) {
                            vue.dataList = res.data.list
                        })
                    }
                }
            });
        })

    });
</script>
</body>
</html>
