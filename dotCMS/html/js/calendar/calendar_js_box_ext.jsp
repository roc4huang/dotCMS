<%@ include file="/html/common/init.jsp" %>
<%
Calendar curCal = new GregorianCalendar(timeZone, locale);
int curMonth = curCal.get(Calendar.MONTH);
int curDay = curCal.get(Calendar.DATE);
int curYear = curCal.get(Calendar.YEAR);

String calendar_num = request.getParameter("calendar_num");
int cal_num = Integer.parseInt(calendar_num);

	for (int i=0;i<cal_num;i++) {
%>
	// Calendar Stuff
	var <portlet:namespace />calObj_<%=i%> = new Calendar(false, null, <portlet:namespace />calendarOnSelect_<%=i%>, <portlet:namespace />calendarOnClose);
	<portlet:namespace />calObj_<%=i%>.weekNumbers = false;
	<portlet:namespace />calObj_<%=i%>.firstDayOfWeek = <%= curCal.getFirstDayOfWeek() - 1 %>;
	<portlet:namespace />calObj_<%=i%>.setTtDateFormat("%A, %B %e, %Y");
	<portlet:namespace />calObj_<%=i%>.setRange(<%= curYear - 90 %>, <%= curYear + 10 %>);

	//This function set the date in the calendar popup, accept dates object or null value.
	//if you need display the date show in dateStr input field in the calendar popup. Call
	//this methods pasing to the calendar function a date object generated by the parse
	//function for example calendarOnClick_1(parseText('dateStr')), and the parseText function 
	//return a date or just use calendarOnClick_1() in this case it show the actual date

	function <portlet:namespace />calendarOnClick_<%=i%>(date) {
  		<portlet:namespace />calObj_<%=i%>.create();
  		//date is the type new Date(...)
  		if(date != null){
     	 	<portlet:namespace />calObj_<%=i%>.setDate(date);
     	 }
  		<portlet:namespace />calObj_<%=i%>.showAtElement(document.getElementById('<portlet:namespace />calendar_input_<%=i%>_button'), 'br');
 	};
 	
	function <portlet:namespace />calendarOnClose(cal) {
		cal.hide();
	};

	function <portlet:namespace />calendarOnSelect_<%=i%>(cal) {
		if (cal.dateClicked) {
			var month = cal.date.getMonth() + 1;
			var day = cal.date.getDate();
			var year = cal.date.getFullYear();
			<portlet:namespace />setCalendarDate_<%=i%>(year, month, day);
			cal.callCloseHandler();
		}
	};
<% } %>
