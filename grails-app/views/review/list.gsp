
<%@ page import="review.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-review" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-review" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="category" title="${message(code: 'review.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="hash" title="${message(code: 'review.hash.label', default: 'Hash')}" />
					
						<g:sortableColumn property="negative" title="${message(code: 'review.negative.label', default: 'Negative')}" />
					
						<g:sortableColumn property="positive" title="${message(code: 'review.positive.label', default: 'Positive')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'review.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'review.url.label', default: 'Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reviewInstance.id}">${fieldValue(bean: reviewInstance, field: "category")}</g:link></td>
					
						<td>${fieldValue(bean: reviewInstance, field: "hash")}</td>
					
						<td>${fieldValue(bean: reviewInstance, field: "negative")}</td>
					
						<td>${fieldValue(bean: reviewInstance, field: "positive")}</td>
					
						<td>${fieldValue(bean: reviewInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: reviewInstance, field: "url")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reviewInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
