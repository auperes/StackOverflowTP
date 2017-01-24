<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user_temp.label', default: 'User_temp')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-user_temp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-user_temp" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <tr>
                    <td>Username</td>
                    <td><f:display bean="user_temp" property="username" /></td>
                </tr>
                <tr>
                    <td>Role</td>
                    <td><f:display bean="user_temp" property="role" /></td>
                </tr>
                <tr>
                    <td>Comments</td>
                    <td>${user_temp.questions.size()}</td>
                </tr>
                <tr>
                    <td>Answers</td>
                    <td>${user_temp.questions.size()}</td>
                </tr>
                <tr>
                    <td>Questions</td>
                    <td>
                        ${user_temp.questions.size()}
                        <g:each var="question" in="${user_temp.questions}">
                            <span>${question.titleQuestion}</span><br />
                        </g:each>
                    </td>
                </tr>
                <tr>
                    <td>Votes</td>
                    <td><f:display bean="user_temp" property="nbVotes" /></td>
                </tr>
                <tr>
                    <td>Creation date</td>
                    <td><f:display bean="user_temp" property="creation" /></td>
                </tr>

            </table>

            <g:form resource="${this.user_temp}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user_temp}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
