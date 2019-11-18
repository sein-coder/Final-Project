<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="WebApplication1.Calendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
<link href='fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar.print.css' rel='stylesheet' media='print' />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<!-- Optional theme -->
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<script src='jquery/jquery-1.10.2.js'></script>
<script src='jquery/jquery-ui.js'></script>
<script src='fullcalendar.js'></script>
<script src='calendar.js'></script>
<!-- Latest compiled and minified JavaScript -->
<script src='bootstrap/js/bootstrap.min.js'></script>
    

<style>
    .fc-sun {
  color: #FF0000;
}
    .fc-sat {
  color: #0000FF;
}
	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Helvetica Nueue",Arial,Verdana,sans-serif;
		background-color: #DDDDDD;
		}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}

    #updateModal{
        top:10%;  

    }
    #addModal{
        top:10%;  

    }
    .fc-header-title, .fc-day-header, .fc-event-title {
        font-family: 'Nanum Gothic', sans-serif;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id='wrap'>
                <div id='calendar'></div>
                <div style='clear:both'></div>
            </div>
        </div>



 <!-- Modal -->
  <div class="modal fade" id="addModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>근태 입력</b></h4>
        </div>

        <div class="modal-body">
          <form>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="addname"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="addtitle"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">내용:</label>
            <input type="text" class="form-control" id="adddesc"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">시작일:</label>
            <span class="form-control" id="addstart"></span>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">종료일:</label>
            <span class="form-control" id="addend"></span>
            <input type="hidden" id="addid" />
          </div>
        </form>
        </div>
          
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="addeventbtn">저장</button>
          <button type="button" class="btn btn-success" data-dismiss="modal">종료</button>
        </div>
      </div>
      
    </div>
  </div>

    <div class="modal fade" id="updateModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>근태 입력</b></h4>
        </div>

        <div class="modal-body">
          <form>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="updatename"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="updatetitle"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">내용:</label>
            <input type="text" class="form-control" id="updatedesc"/>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">시작일:</label>
            <span class="form-control" id="updatestart"></span>
          </div>
          <div class="form-group" style="text-align:left">
            <label for="text" class="col-form-label">종료일:</label>
            <span class="form-control" id="updateend"></span>
            <input type="hidden" id="updateid" />
          </div>
        </form>
        </div>
          
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" id="updateeventbtn">수정</button>
          <button type="button" class="btn btn-danger" id="deleteeventbtn">삭제</button>
          <button type="button" class="btn btn-success" data-dismiss="modal">종료</button>
        </div>
      </div>
      
    </div>
  </div>
  

    </form>
</body>
</html>
