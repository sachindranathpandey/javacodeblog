<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="java.util.*"%>


<body>
<div class="row ">

	<%
	
	 User user=(User)session.getAttribute("currentUser");
	Thread.sleep(600);
	List<Post> posts = null;
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	
	
	int cid = Integer.parseInt(request.getParameter("cid"));
	
	
	if (cid == 0) {
		posts = dao.getAllPosts();
	} else {
		posts=dao.getAllPostsByCategoryId(cid);
	}
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
		return;
	}
	for (Post p : posts) {
	%>

	<div class="col-md-6 mt-2">
		<div class="card mt-2">
			<img src="pics/defaultpost.png" class="card-img-top" alt="...">
			<div class="card-body">
				<b><%=p.getPtitle()%> </b>
				<p><%=p.getPcontent()%></p>
				
			</div>
			
			<%
			LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
			int totalLikes=likeDao.countLikeOnPost(p.getPid());
			%>
			
			<div class="card-footer primary-background text-center ">
				<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more...</a>
				<a  class="btn btn-outline-light btn-sm" onclick="doLIke(<%=p.getPid() %>,<%=user.getId() %>)"><i class="fa fa-thumbs-o-up"> <span class="like-counter"><%=totalLikes %></span> </i>  </a>
				<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"> <span>23</span> </i>  </a>
			</div>
		</div>
	</div>



	<%
	}
	%>


</div>
<script type="text/javascript" src="js/myjs.js"></script>

</body>