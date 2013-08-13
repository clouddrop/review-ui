<%@ page import="review.Review" %>



<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="review.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${reviewInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'hash', 'error')} ">
	<label for="hash">
		<g:message code="review.hash.label" default="Hash" />
		
	</label>
	<g:textField name="hash" value="${reviewInstance?.hash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'negative', 'error')} required">
	<label for="negative">
		<g:message code="review.negative.label" default="Negative" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="negative" type="number" value="${reviewInstance.negative}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'positive', 'error')} required">
	<label for="positive">
		<g:message code="review.positive.label" default="Positive" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="positive" type="number" value="${reviewInstance.positive}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="review.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" type="number" value="${reviewInstance.total}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="review.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${reviewInstance?.url}"/>
</div>

