<aside class="left-side sidebar-offcanvas">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <%--<img src="img/avatar3.png" class="img-circle" alt="User Image" />
                --%>
            </div>

            <div class="pull-left info">
                <p>Hello, User</p>
                <small><g:link controller="logout">Logout</g:link></small>
            </div>
        </div>
        <ul class="sidebar-menu">

            <li class="treeview"><a href="${createLink(action: 'newrequest')}"><span>Request</span> <i
                    class="fa fa-angle-left fa-lg  pull-right"></i>
            </a>
                <ul class="treeview-menu">
                    <li><a href="${createLink(action: 'search')}"><i
                            class="fa fa-search-plus"></i> Search Request</a></li>
                    <li><a href="${createLink(action: 'newrequest')}"><i
                            class="fa fa-plus-circle"></i> New Request</a></li>
                    </ul></li>
            <li id="liResourceRelease"><a href="${createLink(action: 'mapresource')}">
                <i class="fa fa-users"></i><span>Map Resources</span>
            </a></li>
            <li id="liCurrUtil"><a href="${createLink(action: 'reports')}"><i
                    class="fa fa-sign-in fa-lg"></i><span>Reports</span>
            </a></li>
            <li id="liReport"><a href="${createLink(action: 'history')}"><i
                    class="fa fa-line-chart fa-lg"></i><span>History</span>
            </a></li>
        </ul>
    </section>
</aside>