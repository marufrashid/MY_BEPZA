<g:if test="${allLookupInstanceList}">
    <g:each in="${allLookupInstanceList}" status="i" var="allLookupInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: allLookupInstance, field: "keyword")}</td>

            <td>${fieldValue(bean: allLookupInstance, field: "title")}</td>

            <td>${fieldValue(bean: allLookupInstance, field: "sortBy")}</td>

            <td><g:formatBoolean boolean="${allLookupInstance.isActive}" true="Yes" false="No"/></td>

        </tr>
    </g:each>
</g:if>
<g:else>
    <tr><td colspan="4" align="center">No parent selected!</td></tr>
</g:else>

