<g:set var="activeLink" value="${pageProperty(name: 'meta.nav').toString()}"/>
<div class="navbar navbar-material-blue-grey-700">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-material-blue-grey-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <g:link class="navbar-brand" controller="home" action="index">
            <i class="glyphicon glyphicon-play"></i>
            NonSchool
            <i class="glyphicon glyphicon-forward"></i>
        </g:link>
    </div>

    <div class="navbar-collapse collapse navbar-material-blue-grey-collapse">
        <ul class="nav navbar-nav">
            <li class="${activeLink.equals('allCourses') ? 'active' : null}">
                <g:link controller="course" action="index">
                    <g:message code="course.list.public.label"/>
                </g:link>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <sec:ifNotLoggedIn>
                <li class="${activeLink.equals('login') ? 'active' : null}">
                    <g:link controller="login" action="auth">
                        <g:message code="layouts.menu.login.label"/>
                    </g:link>
                </li>
                <li class="label-material-deep-purple-A200 ${activeLink.equals('signup') ? 'active' : null}">
                    <g:link controller="register" action="signup">
                        <strong>
                            <g:message code="layouts.menu.signup.label"/>
                        </strong>
                    </g:link>
                </li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li class="dropdown">
                    <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">
                        <sec:username/>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="${activeLink.equals('myProfile') ? 'active' : null}">
                            <g:link controller="user" action="showProfile">
                                <g:message code="layouts.menu.user.profile.label"/>
                            </g:link>
                        </li>
                        <li><a href="javascript:void(0)">#Settings</a></li>
                        <li class="divider"></li>
                        <li>
                            <g:remoteLink controller="logout" method="post" asynchronous="false"
                                          onSuccess="location.reload()">
                                <g:message code="layouts.menu.logout.label"/>
                            </g:remoteLink>
                        </li>
                    </ul>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>
</div>
