<aside class="left-side sidebar-offcanvas">
			<section class="sidebar">
				<div class="user-panel">
					<div class="pull-left image">
						<%--<img src="img/avatar3.png" class="img-circle" alt="User Image" />
						--%>
					</div>
					<div class="pull-left info">
						<p>Hello, Admin</p>
						<small><g:link controller="logout">Logout</g:link></small>
					</div>
				</div>
				<ul class="sidebar-menu">
					<li><a href="${createLink(action:'dashboard') }"  class="active"> <i class="fa fa-tachometer fa-lg fa-fw"></i> <span>Dashboard</span>
					</a></li>
					<li class="treeview"><a href="#">  <span>Projects</span> <i
							class="fa fa-angle-left fa-lg  pull-right"></i>
					</a>
						<ul class="treeview-menu" >
						<li><a href="${createLink(action:'searchindex') }"><i
									class="fa fa-search-plus"></i> Search</a></li>
							<li><a href="${createLink(action:'newproject') }"><i
									class="fa fa-plus-circle"></i> Add</a></li>
							<%--<li><a href="modifyproject"><i
									class="ion ion-edit"></i> Modify</a></li>
							<li><a href="deleteproject"><i
									class="ion ion-close"></i>Delete</a></li>
						--%></ul></li>
					<li id="liResourceRelease"><a href="${createLink(action:'resourcereleaseplan') }">
							<i class="fa fa-users"></i><span>Resource Release Plan</span>
					</a></li>
					<li id="liCurrUtil"><a href="${createLink(action:'currentutilization') }"> <i
							class="fa fa-sign-in fa-lg"></i><span>Current Utilization</span>
					</a></li>
					<li id="liReport"><a href="${createLink(action:'reports') }"> <i
							class="fa fa-line-chart fa-lg"></i><span>Reports</span>
					</a></li>
				</ul>
			</section>
		</aside>