<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {

		var date1 = new Date();

		$(".timer").each(
				function() {

					var d = new Date($(this).text());
					var times = (d.getTime() - date1.getTime()) / 1000;
					var day = 0, hour = 0, minute = 0, second = 0;//时间默认值
					if (times > 0) {
						day = Math.floor(times / (60 * 60 * 24));
						hour = Math.floor(times / (60 * 60)) - (day * 24);
						minute = Math.floor(times / 60) - (day * 24 * 60)
								- (hour * 60);
					}
					if (day <= 9) {
						day = '0' + day;
					}
					if (hour <= 9) {
						hour = '0' + hour;
					}
					if (minute <= 9) {
						minute = '0' + minute;
					}
					$(this).text(day + "天" + hour + "时" + minute + "分");

				});
	});
</script>
<table class="table-striped table-hover" width="100%" cellspacing="0"
	cellpadding="0" border="0">
	<tbody>
		<c:forEach items="${list}" var="v">
			<tr style="width:100%;height: 35px;" class="_data_tr_flag active">
				<td style="width:75%" align="left"><a
					href="/mavenfst/show?id=${v.id}">${v.title}</a></td>
					<td style="width:25%;padding-left:50px;">还有<span
								class="timer">${v.finishdate}</span></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
