<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table-striped table-hover" width="100%" cellspacing="0"
	cellpadding="0" border="0">
	<tbody>
		<c:forEach items="${list}" var="v">
			<tr style="width:100%;" class="_data_tr_flag active">
				<td style="width:75%" align="left"><a
					href="/mavenfst/show?id=${v.id}">${v.title}</a></td>
					<td style="width:25%;padding-left:50px;">还有<span
								class="timer">${v.finishdate}</span></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
