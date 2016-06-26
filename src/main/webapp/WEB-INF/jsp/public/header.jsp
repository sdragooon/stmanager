<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="main-header">
  <a href="/" class="logo">
    <span class="logo-mini"><b>덕소</b></span>
    <span class="logo-lg"><b>덕소영어숲</b></span>
  </a>
  <nav class="navbar navbar--top" role="navigation">
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <li class="dropdown messages-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-envelope-o"></i>
            <span class="label label-success">4</span>
          </a>
          <ul class="dropdown-menu">
            <li class="header">You have 4 messages</li>
            <li>
              <ul class="menu">
                <li>
                  <a href="#">
                    <div class="pull-left">
                      <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
                    </div>
                    <h4>
                      Support Team
                      <small><i class="fa fa-clock-o"></i> 5 mins</small>
                    </h4>
                    <p>Why not buy a new awesome theme?</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="footer"><a href="#">See All Messages</a></li>
          </ul>
        </li>
        <li class="dropdown notifications-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-bell-o"></i>
            <span class="label label-warning">10</span>
          </a>
          <ul class="dropdown-menu">
            <li class="header">You have 10 notifications</li>
            <li>
              <ul class="menu">
                <li>
                  <a href="#">
                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                  </a>
                </li>
              </ul>
            </li>
            <li class="footer"><a href="#">View all</a></li>
          </ul>
        </li>
        <li class="dropdown tasks-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-flag-o"></i>
            <span class="label label-danger">9</span>
          </a>
          <ul class="dropdown-menu">
            <li class="header">You have 9 tasks</li>
            <li>
              <ul class="menu">
                <li>
                  <a href="#">
                    <h3>
                      Design some buttons
                      <small class="pull-right">20%</small>
                    </h3>
                    <div class="progress xs">
                      <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                        <span class="sr-only">20% Complete</span>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="footer">
              <a href="#">View all tasks</a>
            </li>
          </ul>
        </li>
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="img/user2-160x160.jpg" class="user-image" alt="User Image"/>
            <span class="hidden-xs">Alexander Pierce</span>
          </a>
          <ul class="dropdown-menu">
            <li class="user-header">
              <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
              <p>
                Alexander Pierce - Web Developer
                <small>Member since Nov. 2012</small>
              </p>
            </li>
            <li class="user-body">
              <div class="row">
                <div class="col-xs-4 text-center">
                  <a href="#">Followers</a>
                </div>
                <div class="col-xs-4 text-center">
                  <a href="#">Sales</a>
                </div>
                <div class="col-xs-4 text-center">
                  <a href="#">Friends</a>
                </div>
              </div>
            </li>
            <li class="user-footer">
              <div class="pull-left">
                <a href="#" class="btn btn-default btn-flat">Profile</a>
              </div>
              <div class="pull-right">
                <a href="#" class="btn btn-default btn-flat">Sign out</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>
<aside class="main-sidebar">
  <section class="sidebar">
    <ul class="sidebar-menu">
      <li class="header">MENU</li>
      <%--<li class="treeview">--%>
        <%--<a href="#"><i class="fa fa-book"></i> <span>등록</span> <i class="fa fa-angle-left pull-right"></i></a>--%>
        <%--<ul class="treeview-menu">--%>
          <%--<li><a href="/cj">수업등록</a></li>--%>
          <%--<li><a href="/sj">회원등록</a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
      <li><a href="/cj"><i class="fa fa-book"></i> <span>수업등록</span></a></li>
      <li><a href="/sj"><i class="fa fa-child"></i> <span>회원등록</span></a></li>
      <li><a href="#"><i class="fa fa-file-text-o"></i> <span>회원관리</span></a></li>
      <li><a href="#"><i class="fa fa-credit-card"></i> <span>원비관리</span></a></li>
    </ul>
  </section>
</aside>