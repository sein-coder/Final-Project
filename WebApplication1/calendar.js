$(document).ready(function () {
    var currentUpdateEvent;
    var addid;
    var classname;
    $('#addeventbtn').on('click', function (event) { //근태 입력 버튼
        if ($('#addname').val().trim() == "") {
            alert("이름 필수 입력");
            return;
        }
        if ($('#addtitle').val().trim() == "") {
            alert("제목 필수 입력");
            return;
        }
        $.ajax({
            type: "POST",
            url: "Calendar.aspx/InsertData",
            data: '{ name: "' + $('#addname').val() +
                '", title: "' + $('#addtitle').val() +
                '", description: "' + $('#adddesc').val() +
                '", startdate: "' + $('#addstart').text() +
                '", enddate: "' + $('#addend').text() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                addid = response.d;
            },
            failure: function (response) {
                alert("error");
            }
        });

        if ($("#addtitle").val() == "출장") classname = "important";
        else if ($("#addtitle").val() == "교육") classname = "success";
        else classname = "info";
        
        $('#calendar').fullCalendar('renderEvent',
            {
                id: "" + addid,
                name: $("#addname").val(),
                title: $("#addtitle").val(),
                description: $("#adddesc").val(),
                start: $('#addstart').text(),
                end: $('#addend').text(),
                className: classname
            },
            true // make the event "stick"
        );
        
        $("addid").val("");
        $("#addname").val("");
        $("#addtitle").val("");
        $("#adddesc").val("");
        $('#addstart').text("");
        $('#addend').text("");
        $('#calendar').fullCalendar('unselect');
        $('#addModal').modal("hide");
    });

    $('#updateeventbtn').on('click', function (event) {//근태 수정 버튼
        if ($('#updatename').val().trim() == "") {
            alert("이름 필수 입력");
            return;
        }
        if ($('#updatetitle').val().trim() == "") {
            alert("제목 필수 입력");
            return;
        }

        $.ajax({
            type: "POST",
            url: "Calendar.aspx/UpdateData",
            data: '{ name: "' + $('#updatename').val() +
                '", title: "' + $('#updatetitle').val() +
                '", description: "' + $('#updatedesc').val() +
                '", startdate: "' + $('#updatestart').text() +
                '", enddate: "' + $('#updateend').text() +
                '", id: "' + $('#updateid').val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
            },
            failure: function (response) {
                alert("error");
            }
        });
        currentUpdateEvent.id = $("#updateid").val();
        currentUpdateEvent.name = $("#updatename").val();
        currentUpdateEvent.title = $("#updatetitle").val();
        currentUpdateEvent.description = $("#updatedesc").val();

        if ($("#updatetitle").val() == "출장") classname = "important";
        else if ($("#updatetitle").val() == "교육") classname = "success";
        else classname = "info";
        currentUpdateEvent.className = classname;
        $('#calendar').fullCalendar('updateEvent', currentUpdateEvent);

        $('#updateModal').modal("hide");
    });


    $('#deleteeventbtn').on('click', function (event) {//근태 삭제 버튼
        $.ajax({
            type: "POST",
            url: "Calendar.aspx/DeleteData",
            data: '{  id: "' + $('#updateid').val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
            },
            failure: function (response) {
                alert("error");
            }
        });

        $('#calendar').fullCalendar('removeEvents', $("#updateid").val());
        $('#updateModal').modal("hide");
    });

    $("#addModal").draggable({
        handle: ".modal-header"
    });
    $("#updateModal").draggable({
        handle: ".modal-header"
    });
    function eventdropped(event) { //근태 옮기기
        $("#updateid").val(event.id);
        $("#updatename").val(event.name);
        $("#updatetitle").val(event.title);
        $("#updatedesc").val(event.description);

        if (event.start.getMonth() < 10 & event.start.getDate() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
        }
        else if (event.start.getMonth() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
        }
        else if (event.strat.getDate() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
        }
        else {
            $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
        }


        if (event.end == null) {
            $("#updateend").text($("#updatestart").text());
        }
        else if (event.end.getMonth() < 10 & event.end.getDate() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
        }
        else if (event.end.getMonth() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
        }
        else if (event.end.getDate() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
        }
        else {
            $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
        }

        $.ajax({
            type: "POST",
            url: "Calendar.aspx/UpdateData",
            data: '{ name: "' + $('#updatename').val() +
                '", title: "' + $('#updatetitle').val() +
                '", description: "' + $('#updatedesc').val() +
                '", startdate: "' + $('#updatestart').text() +
                '", enddate: "' + $('#updateend').text() +
                '", id: "' + $('#updateid').val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
            },
            failure: function (response) {
                alert("error");
            }
        });

        $("#updateid").val("");
        $("#updatename").val("");
        $("#updatetitle").val("");
        $("#updatedesc").val("");
        $('#updatestart').text("");
        $('#updateend').text("");
    }

    function eventresized(event) { //근태 길이 수정
        $("#updateid").val(event.id);
        $("#updatename").val(event.name);
        $("#updatetitle").val(event.title);
        $("#updatedesc").val(event.description);

        if (event.start.getMonth() < 10 & event.start.getDate() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
        }
        else if (event.start.getMonth() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
        }
        else if (event.strat.getDate() < 10) {
            $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
        }
        else {
            $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
        }


        if (event.end == null) {
            $("#updateend").text($("#updatestart").text());
        }
        else if (event.end.getMonth() < 10 & event.end.getDate() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
        }
        else if (event.end.getMonth() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
        }
        else if (event.end.getDate() < 10) {
            $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
        }
        else {
            $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
        }

        $.ajax({
            type: "POST",
            url: "Calendar.aspx/UpdateData",
            data: '{ name: "' + $('#updatename').val() +
                '", title: "' + $('#updatetitle').val() +
                '", description: "' + $('#updatedesc').val() +
                '", startdate: "' + $('#updatestart').text() +
                '", enddate: "' + $('#updateend').text() +
                '", id: "' + $('#updateid').val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
            },
            failure: function (response) {
                alert("error");
            }
        });
        $("#updateid").val("");
        $("#updatename").val("");
        $("#updatetitle").val("");
        $("#updatedesc").val("");
        $('#updatestart').text("");
        $('#updateend').text("");
    }


    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var events = [];
    $.ajax({
        cache: false,
        async: false,
        type: "POST",
        dataType: "Json",
        contentType: "application/json; charset=utf-8",
        url: "Calendar.aspx/GetData",
        data: {},
        success: function (data) {
            var len = data.d.length;
            for (var i = 0; i < len; i++) {
                data.d[i].start = new Date(data.d[i].start);
                data.d[i].end = new Date(data.d[i].end);
            }
            events = data.d;
        },
        error: function (result) {
            alert(result);
        }
    });

    /*  className colors
	className: default(transparent), important(red), chill(pink), success(green), info(blue)
	*/

    /* initialize the external events
	-----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
	-----------------------------------------------------------------*/

    var calendar = $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
        editable: true,
        firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
        selectable: true,
        defaultView: 'month',
        axisFormat: 'h:mm',
        columnFormat: {
            month: 'ddd',    // Mon
            week: 'ddd d', // Mon 7
            day: 'dddd M/d',  // Monday 9/7
            agendaDay: 'dddd d'
        },
        titleFormat: {
            month: 'yyyy년 MMMM', // September 2009
            week: "yyyy MMMM", // September 2009
            day: 'yyyy MMMM'                  // Tuesday, Sep 8, 2009
        },
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        allDaySlot: false,
        selectHelper: true,
        select: function (start, end) {
            $("#addModal").modal();
            if (start.getMonth() < 10 & start.getDate() < 10) {
                $("#addstart").text("" + start.getFullYear() + "-0" + (start.getMonth() + 1) + "-0" + start.getDate());
            }
            else if (start.getMonth() < 10) {
                $("#addstart").text("" + start.getFullYear() + "-0" + (start.getMonth() + 1) + "-" + start.getDate());
            }
            else if (strat.getDate() < 10) {
                $("#addstart").text("" + start.getFullYear() + "-" + (start.getMonth() + 1) + "-0" + start.getDate());
            }
            else {
                $("#addstart").text("" + start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate());
            }

            if (end.getMonth() < 10 & end.getDate() < 10) {
                $("#addend").text("" + end.getFullYear() + "-0" + (end.getMonth() + 1) + "-0" + end.getDate());
            }
            else if (end.getMonth() < 10) {
                $("#addend").text("" + end.getFullYear() + "-0" + (end.getMonth() + 1) + "-" + end.getDate());
            }
            else if (end.getDate() < 10) {
                $("#addend").text("" + end.getFullYear() + "-" + (end.getMonth() + 1) + "-0" + end.getDate());
            }
            else {
                $("#addend").text("" + end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate());
            }
            calendar.fullCalendar('unselect');
        },
        eventClick: function (event) {
            $("#updateModal").modal();
            
            currentUpdateEvent = event;

            $("#updateid").val(event.id);
            $("#updatename").val(event.name);
            $("#updatetitle").val(event.title);
            $("#updatedesc").val(event.description);

            if (event.start.getMonth() < 10 & event.start.getDate() < 10) {
                $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
            }
            else if (event.start.getMonth() < 10) {
                $("#updatestart").text("" + event.start.getFullYear() + "-0" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
            }
            else if (event.strat.getDate() < 10) {
                $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-0" + event.start.getDate());
            }
            else {
                $("#updatestart").text("" + event.start.getFullYear() + "-" + (event.start.getMonth() + 1) + "-" + event.start.getDate());
            }


            if (event.end == null) {
                $("#updateend").text($("#updatestart").text());
            }
            else if (event.end.getMonth() < 10 & event.end.getDate() < 10) {
                $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
            }
            else if (event.end.getMonth() < 10) {
                $("#updateend").text("" + event.end.getFullYear() + "-0" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
            }
            else if (event.end.getDate() < 10) {
                $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-0" + event.end.getDate());
            }
            else {
                $("#updateend").text("" + event.end.getFullYear() + "-" + (event.end.getMonth() + 1) + "-" + event.end.getDate());
            }

            calendar.fullCalendar('unselect');
        },
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function (date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        events: events,
        eventRender: function (event, element) {
            element.find('.fc-event-title').prepend(event.name + ' ');
        },
        eventDrop: eventdropped,
        eventResize: eventresized
    });
});