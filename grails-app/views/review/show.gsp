
<%@ page import="review.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-review" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-review" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list review">
			
				<g:if test="${reviewInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="review.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${reviewInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.hash}">
				<li class="fieldcontain">
					<span id="hash-label" class="property-label"><g:message code="review.hash.label" default="Hash" /></span>
					
						<span class="property-value" aria-labelledby="hash-label"><g:fieldValue bean="${reviewInstance}" field="hash"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.negative}">
				<li class="fieldcontain">
					<span id="negative-label" class="property-label"><g:message code="review.negative.label" default="Negative" /></span>
					
						<span class="property-value" aria-labelledby="negative-label"><g:fieldValue bean="${reviewInstance}" field="negative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.positive}">
				<li class="fieldcontain">
					<span id="positive-label" class="property-label"><g:message code="review.positive.label" default="Positive" /></span>
					
						<span class="property-value" aria-labelledby="positive-label"><g:fieldValue bean="${reviewInstance}" field="positive"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="review.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${reviewInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="review.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${reviewInstance}" field="url"/></span>
					
				</li>
				</g:if>
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reviewInstance?.id}" />
					<g:link class="cached" action="cache" id="${reviewInstance?.id}">Cache</g:link>
					<g:link class="edit" action="edit" id="${reviewInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
