<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<jsp:include page="public/head.jsp" flush="true"/>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="public/header.jsp" flush="true"/>

    <div class="content-wrapper">
        <section class="content-header">
            <div style="margin:20px 0 0 18px;">
                <h1>
                    회원등록
                </h1>
            </div>
        </section>

        <section class="content">
            <div class="well" style="width:100%;background-color:#fff;margin-left:auto;margin-right:auto;">
                <form name="insert" onSubmit="insert_action();return false;">
                    <div class="form-group">
                        <label for="studentname" style="margin-bottom:15px;">회원이름</label>
                        <input type="input" class="form-control" id="studentname" name="studentname" placeholder="회원이름"/>
                    </div>

                    <div class="form-group">
                        <label>성별</label>
                        <div class="radio">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1" value="option1" checked="checked"/> <p>남</p>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2" value="option2"/> <p>여</p>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label style="margin-bottom:15px;">학부모연락처</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <input type="text" class="form-control" data-inputmask='"mask": "999-9999-9999"' data-mask value="010">
                        </div>
                    </div>

                    <div class="form-group">
                        <label style="margin-bottom:15px;">학생연락처</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <input type="text" class="form-control" data-inputmask='"mask": "999-9999-9999"' data-mask value="010">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="since" style="margin-bottom:15px;">가입일</label>
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right" id="since" name="since" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>상태</label>
                        <div class="radio">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="option1" checked="checked"/> <p>재원</p>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="option2"/> <p>휴원</p>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status3" value="option2"/> <p>퇴원</p>
                            </label>
                        </div>
                    </div>

                    <div>
                        <label style="margin-bottom:15px;">수업</label>
                    </div>
                    <%--<div id="classlist">--%>
                    <%--<div class="[ form-group ]">--%>
                        <%--<input type="checkbox" name="fancy-checkbox-primary" id="fancy-checkbox-primary" autocomplete="off" />--%>
                        <%--<div class="[ btn-group ]">--%>
                            <%--<label for="fancy-checkbox-primary" class="[ btn btn-primary ]">--%>
                                <%--<span class="[ glyphicon glyphicon-ok ]"></span>--%>
                                <%--<span> </span>--%>
                            <%--</label>--%>
                            <%--<label for="fancy-checkbox-primary" class="[ btn btn-default active ]" style="width:200px;text-align:left;">--%>
                                <%--영재반 / 120,000원--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="[ form-group ]">--%>
                        <%--<input type="checkbox" id="화상영어" autocomplete="off"/>--%>
                        <%--<div class="[ btn-group ]">--%>
                            <%--<label for="화상영어" class="[ btn btn-primary ]">--%>
                                <%--<span class="[ glyphicon glyphicon-ok ]"></span>--%>
                                <%--<span> </span>--%>
                            <%--</label>--%>
                            <%--<label for="화상영어" class="[ btn btn-default active ]" style="width:200px;text-align:left;">--%>
                                <%--화상 / 20,000원--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div id="listDiv"></div>

                    <div class="form-group" style="margin-top:40px;text-align:right;">
                        <button type="submit" class="btn btn-primary" id="getCheckedAll">등록하기</button>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <jsp:include page="public/footer.jsp" flush="true"/>

</div>

<script src="/js/jQuery-2.2.0.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/js/app.min.js"></script>
<script src="/js/select2.full.min.js"></script>
<script src="/js/datepicker.js"></script>
<script src="/js/jquery.inputmask.js"></script>
<script src="/js/jquery.inputmask.date.extensions.js"></script>
<script src="/js/jquery.inputmask.extensions.js"></script>
<script src="/js/jquery.inputmask.phone.extensions.js"></script>

<script>
    $('#since').datepicker({
        autoclose: true,
        format:'yyyy.mm.dd'
    });

    $("[data-mask]").inputmask();

    $(document).ready(function() {
        $.ajax({
            url: '/subject',
            type: "GET",
            dataType: "json",
            success: function (data) {
                var html = '';
                $.each(data.content, function(key, value){
                    var classnum = value.classnum;
                    var classname = value.classname;
                    var price = value.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

                    html += '<p><input type="checkbox" onclick="" name="classprice" id=' +classnum+ ' value= ' +classnum+ ' >&nbsp;' + classname + ' / ' + price + '</input></p>';
                    html += '<div style="border-bottom:0px solid;margin-bottom:1.3em;"></div>';
                });
                $("#listDiv").html(html);
            }
        });
    });

    $("#getCheckedAll").click(function() {
        $("input[name=classprice]:checked").each(function() {
            var arr1 = new Array;
            arr1 = $(this).val();
//            var test = $(this).val() + ",";
            alert(arr1);
        });
    });
</script>
</body>
</html>