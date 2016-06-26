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
          수업등록
        </h1>
      </div>
    </section>

    <section class="content">
      <div class="well" style="width:100%;background-color:#fff;margin-left:auto;margin-right:auto;">

        <form name="insert" onSubmit="insert_action();return false;">
          <div class="form-group">
            <label for="classname">수업이름</label>
            <input type="input" class="form-control" id="classname" name="classname" placeholder="수업이름"/>
          </div>

          <div class="form-group">
            <label for="price">수업료</label>
            <input type="input" class="form-control" id="price" name="price" onkeyup="inputNumberFormat(this)" placeholder="수업료"/>
          </div>

          <div class="form-group" style="margin:40px 0 40px 0;text-align:right;">
            <button type="submit" class="btn btn-primary">등록하기</button>
          </div>
        </form>

        <div style="border-top:1px solid #c3c3c3;"/>
        <div class="cotainer">
          <h1 style="margin:1em 0 1em 18px;">등록된 수업</h1>
          <table class="table" style="text-align:center;">
            <thead>
            <tr style="border:1px solid #c3c3c3;">
              <th style="border:1px solid #c3c3c3;text-align:center;">수업명</th>
              <th style="border:1px solid #c3c3c3;text-align:center;">수업료</th>
              <th style="border:1px solid #c3c3c3;text-align:center;">수정</th>
              <th style="border:1px solid #c3c3c3;text-align:center;">삭제</th>
            </tr>
            </thead>
            <tbody id="listDiv"></tbody>
          </table>
        </div>
      </div>
    </section>
  </div>
  <a href="/subject/id"></a>
  <jsp:include page="public/footer.jsp" flush="true"/>

</div>

<script src="/js/jQuery-2.2.0.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/js/app.min.js"></script>
<script src="/js/select2.full.min.js"></script>
<script src="/js/datepicker.js"></script>

<script type="text/javascript">

  $(document).ready(function() {
    $.ajax({
      url: '/subject',
      type: "GET",
      dataType: "json",
      success: function (data) {
        var html = '';
        $.each(data.content, function(key, value){
          var id = value.id;
          var classname = value.classname;
          var price = value.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

          html += '<tr>'+
                  '<td style="border:1px solid #c3c3c3;"><input type="text" style="text-align:center;width:100px;" id="subjectname" value=' +classname+ '></input></td>'+
                  '<td style="border:1px solid #c3c3c3;"><input type="text" style="text-align:center;width:100px;" name="price" id="price" onkeyup="inputNumberFormat(this)" value=' +price+ '></input></td>'+
                  '<td style="border:1px solid #c3c3c3;"><i class="fa fa-fw fa-edit"/></td>'+
                  '<td style="border:1px solid #c3c3c3;"><a href="javascript:void(0);" onclick="subjectdelete('+id+')"><i class="fa fa-fw fa-trash"/></a></td>'+
                  '</tr>'
        });
        $("#listDiv").html(html);
      }
    });
  });

  function subjectdelete(id){
    if(confirm("선택한 수업을 삭제하겠습니까?")){
      if(true){
        $.ajax({
          url: "/subject/"+id,
          type: "DELETE",
          success: function () {
            alert("수업삭제에 성공했습니다.");
            location.replace("/cj");
          }
        });
      }else{
        return false;
      }
    }
  }

  //콤마찍기
  function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
  }

  //콤마풀기
  function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
  }

  //값 입력시 콤마찍기
  function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
  }

  function insert_action() {
    var mForm = document.insert; // form의 값을 가져오기 위함
    var obj = new Object(); // JSON형식으로 변환 할 오브젝트
    obj.classname = mForm.classname.value; // form의 값을 오브젝트에 저장
    obj.price = uncomma(mForm.price.value);

    var json_data = JSON.stringify(obj); // form의 값을 넣은 오브젝트를 JSON형식으로 변환

    var request = $.ajax({
      url: "/subject",
      type: "POST",
      contentType: "application/json",
      data: json_data, // {“user_id”:”입력값”, “user_password”:”입력값”} 형식으로 전달 됨
      error:function(request){
        alert("수업등록에 실패했습니다.");
        load();
      },
      success: function (response) {
        alert("수업등록에 성공했습니다.");
        location.replace("/cj");
      }
    });
  }
</script>
</body>
</html>
