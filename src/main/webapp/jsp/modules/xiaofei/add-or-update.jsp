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
                    <h3 class="block-title">编辑消费</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">消费管理</li>
                        <li class="breadcrumb-item active">编辑消费</li>
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
                        <h3 class="widget-title">消费信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa yufukuan">
                                        <label>预付款账户</label>
                                        <div>
                                            <select id="yufukuanSelect" name="yufukuanSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 yufukuan">
                                        <label>预付款账户</label>
                                        <input id="yufukuanDanhaoNumber" name="yufukuanDanhaoNumber" class="form-control"
                                               placeholder="预付款账户" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yufukuan">
                                        <label>预付款金额</label>
                                        <input id="yufukuanMoney" name="yufukuanMoney" class="form-control"
                                               placeholder="预付款金额" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="yufukuanId" name="yufukuanId" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>消费名目</label>
                                        <input id="xiaofeiName" name="xiaofeiName" class="form-control"
                                               placeholder="消费名目">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>消费类型</label>
                                        <select id="xiaofeiTypesSelect" name="xiaofeiTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>消费金额</label>
                                        <input id="xiaofeiMoney" name="xiaofeiMoney" class="form-control"
                                               onchange="xiaofeiMoneyChickValue(this)" placeholder="消费金额">
                                    </div>
                                    <div class="form-group  col-md-6">
                                        <label>备注</label>
                                        <input id="xiaofeiContentupload" name="file" type="file">
                                        <script id="xiaofeiContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var xiaofeiContentUe = UE.getEditor('xiaofeiContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="xiaofeiContent" id="xiaofeiContent-input">
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
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
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "xiaofei";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var xiaofeiTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var yufukuanOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#xiaofeiContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('xiaofeiContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '预付款账户'){//当前登录用户不为这个
                if($("#yufukuanId") !=null){
                    var yufukuanId = $("#yufukuanId").val();
                    if(yufukuanId == null || yufukuanId =='' || yufukuanId == 'null'){
                        alert("预付款账户不能为空");
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("xiaofei/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addxiaofei');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
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
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function xiaofeiTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=xiaofei_types", "GET", {}, (res) => {
                if(res.code == 0){
                    xiaofeiTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function yufukuanSelect() {
            //填充下拉框选项
            http("yufukuan/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yufukuanOptions = res.data.list;
                }
            });
        }

        function yufukuanSelectOne(id) {
            http("yufukuan/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yufukuanShowImg();
                yufukuanShowVideo();
                yufukuanDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationXiaofeitypesSelect(){
            var xiaofeiTypesSelect = document.getElementById('xiaofeiTypesSelect');
            if(xiaofeiTypesSelect != null && xiaofeiTypesOptions != null  && xiaofeiTypesOptions.length > 0 ){
                for (var i = 0; i < xiaofeiTypesOptions.length; i++) {
                    xiaofeiTypesSelect.add(new Option(xiaofeiTypesOptions[i].indexName,xiaofeiTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationyufukuanSelect() {
            var yufukuanSelect = document.getElementById('yufukuanSelect');
            if(yufukuanSelect != null && yufukuanOptions != null  && yufukuanOptions.length > 0 ) {
                for (var i = 0; i < yufukuanOptions.length; i++) {
                        yufukuanSelect.add(new Option("患者名字:"+yufukuanOptions[i].huanzheName+" 预付款账户:"+yufukuanOptions[i].yufukuanDanhaoNumber, yufukuanOptions[i].id));
                }

                $("#yufukuanSelect").change(function(e) {
                        yufukuanSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var xiaofeiTypesSelect = document.getElementById("xiaofeiTypesSelect");
        if(xiaofeiTypesSelect != null && xiaofeiTypesOptions != null  && xiaofeiTypesOptions.length > 0 ) {
            for (var i = 0; i < xiaofeiTypesOptions.length; i++) {
                if (xiaofeiTypesOptions[i].codeIndex == ruleForm.xiaofeiTypes) {//下拉框value对比,如果一致就赋值汉字
                        xiaofeiTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var yufukuanSelect = document.getElementById("yufukuanSelect");
            if(yufukuanSelect != null && yufukuanOptions != null  && yufukuanOptions.length > 0 ) {
                for (var i = 0; i < yufukuanOptions.length; i++) {
                    if (yufukuanOptions[i].id == ruleForm.yufukuanId) {//下拉框value对比,如果一致就赋值汉字
                        yufukuanSelect.options[i+1].selected = true;
                        $("#yufukuanSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.xiaofeiContent != null && ruleForm.xiaofeiContent != 'null' && ruleForm.xiaofeiContent != '' && $("#xiaofeiContentupload").length>0) {

            var xiaofeiContentUeditor = UE.getEditor('xiaofeiContentEditor');
            xiaofeiContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.xiaofeiContent != null){
                    mes = ''+ ruleForm.xiaofeiContent;
                    mes = mes.replace(/\n/g, "<br>");
                }
                xiaofeiContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#xiaofeiContentupload").length>0) {
            var xiaofeiContentEditor = UE.getEditor('xiaofeiContentEditor');
            if (xiaofeiContentEditor.hasContents()) {
                $('#xiaofeiContent-input').attr('value', xiaofeiContentEditor.getPlainTxt());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function xiaofeiMoneyChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addxiaofei');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                yufukuanId: "required",
                xiaofeiName: "required",
                xiaofeiTypes: "required",
                xiaofeiMoney: "required",
                xiaofeiContent: "required",
                insertTime: "required",
            },
            messages: {
                yufukuanId: "预付款账户不能为空",
                xiaofeiName: "消费名目不能为空",
                xiaofeiTypes: "消费类型不能为空",
                xiaofeiMoney: "消费金额不能为空",
                xiaofeiContent: "备注不能为空",
                insertTime: "消费时间不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addxiaofei = window.sessionStorage.getItem("addxiaofei");
        if (addxiaofei != null && addxiaofei != "" && addxiaofei != "null") {
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
            http("xiaofei/info/" + updateId, "GET", {}, (res) => {
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
            laydate.render({
                elem: '#insertTime-input'
                ,type: 'datetime'
            });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        yufukuanDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#yufukuanId").val(ruleForm.yufukuanId);
        $("#xiaofeiName").val(ruleForm.xiaofeiName);
        $("#xiaofeiMoney").val(ruleForm.xiaofeiMoney);
        $("#xiaofeiContent").val(ruleForm.xiaofeiContent);
        $("#insertTime-input").val(ruleForm.insertTime);

    }
    <!--  级联表的数据回显  -->
    function yufukuanDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yufukuanId").val(ruleForm.id);

        $("#bingliId").val(ruleForm.bingliId);
        $("#yufukuanDanhaoNumber").val(ruleForm.yufukuanDanhaoNumber);
        $("#yufukuanMoney").val(ruleForm.yufukuanMoney);
        $("#insertTime").val(ruleForm.insertTime);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        yufukuanShowImg();
    }


    <!--  级联表的图片  -->

    function yufukuanShowImg() {
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        yufukuanShowVideo();
    }


    <!--  级联表的视频  -->

    function yufukuanShowVideo() {
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
            xiaofeiTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            yufukuanSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationXiaofeitypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationyufukuanSelect();

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
        window.sessionStorage.removeItem('addxiaofei');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events: none;');
        }
		else if (window.sessionStorage.getItem('role') == '医生') {
            // $(".aaaaaa").remove();
            $(".yisheng").remove();//删除当前用户的信息
            // 消费金额设置不可选
            // $('#xiaofeiMoney').attr('readonly', 'readonly');
        }
		else if (window.sessionStorage.getItem('role') == '护士') {
            // $(".aaaaaa").remove();
            $(".hushi").remove();//删除当前用户的信息
            // 消费金额设置不可选
            // $('#xiaofeiMoney').attr('readonly', 'readonly');
        }
        else{
            // alert("未知情况.......");
            // var replyContentUeditor = UE.getEditor('replyContentEditor');
            // replyContentUeditor.ready(function () {
            //     replyContentUeditor.setDisabled('fullscreen');
            // });
        }
    }

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