<%--
  Created by IntelliJ IDEA.
  User: CDS
  Date: 10/06/2022
  Time: 02:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String context = request.getContextPath();%>

<header>
    <nav class="navbar navbar-white navbar-expand-lg sticky-top bg-white">
        <div class="container-fluid">
            <img class="navbar-brand" src="<%=context%>/assets/img/Struts2logo.png" alt="Logo no encontado"
                 style="width: 120px;height: 45px;"/>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link active" aria-current="page" href="<%=context%>/user">Gestíon de Usuarios</a>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link active" aria-current="page" href="#">Gestíon de Roles</a>
                </div>
            </div>
        </div>
    </nav>
</header>

