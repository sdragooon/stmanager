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
            <div style="margin-top:20px;">
                <h1>
                    회원등록
                    <small>Member</small>
                </h1>
            </div>
        </section>

        <section class="content">
            <div class="well" style="width:100%;background-color:#fff;margin-left:auto;margin-right:auto;">
                <form name="insert" onSubmit="insert_action();return false;">
                    <div class="form-group">
                        <label for="studentname">회원이름</label>
                        <input type="input" class="form-control" id="studentname" name="studentname" placeholder="회원이름"/>
                    </div>

                    <div class="form-group" style="margin-top:20px;">
                        <label>성별</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="gender" id="gender1" value="option1" checked="checked"/>
                                남
                            </label>
                            <label style="margin-left:10px;">
                                <input type="radio" name="gender" id="gender2" value="option2"/>
                                여
                            </label>
                        </div>
                    </div>

                    <div></div>

                    <div class="form-group" style="margin-top:20px;">
                        <label>학부모 연락처</label>
                        <div class="input-group">
                            <select class="form-control">
                                <option>010</option>
                                <option>011</option>
                                <option>011</option>
                            </select>
                            <div class="input-group-addon" style="border:0px;">-</div>
                            <input type="text" style="text-align:center;" class="form-control" id="exampleInputAmount" placeholder="0000"/>
                            <div class="input-group-addon" style="border:0px;">-</div>
                            <input type="text" style="text-align:center;" class="form-control" id="exampleInputAmount" placeholder="0000"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>학생 연락처</label>
                        <div class="input-group">
                            <input type="text" style="text-align:center;" class="form-control" id="exampleInputAmount" placeholder="010"/>
                            <div class="input-group-addon" style="border:0px;">-</div>
                            <input type="text" style="text-align:center;" class="form-control" id="exampleInputAmount" placeholder="1234"/>
                            <div class="input-group-addon" style="border:0px;">-</div>
                            <input type="text" style="text-align:center;" class="form-control" id="exampleInputAmount" placeholder="1234"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="since">가입일</label>
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right" id="since" name="since"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="hidden" class="form-control" id="studentstatus" name="studentstatus" value="재원"/>
                    </div>

                    <div class="form-group" style="margin-top:40px;text-align:right;">
                        <button type="submit" class="btn btn-primary btn-lg">등록하기</button>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
    </footer>
</div>

<script src="/js/jQuery-2.2.0.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/js/app.min.js"></script>
<script src="/js/select2.full.min.js"></script>
<script src="/js/datepicker.js"></script>

<script>
    $('#since').datepicker({
        autoclose: true,
        format:'yyyy.mm.dd'
    });
</script>
</body>
</html>
