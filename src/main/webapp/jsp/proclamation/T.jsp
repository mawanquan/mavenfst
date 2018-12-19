<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table-striped table-hover" width="100%" cellspacing="0"
	cellpadding="0" border="0">
	<tbody>
		<c:forEach items="${list}" var="v">
			<tr>
			<td>
			    <li><a href="${cxt }/ajaxdelbyid/${v.id}"><span
										class="glyphicon glyphicon-record" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
										style="color:#333;"> ${v.title}</span></a></li>
			   </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
