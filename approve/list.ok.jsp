<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${isModerator}">
			
<c:set var="title">Artigos pendentes para aprova��o</c:set>

<%@ include file="../header.jsp" %>

<div id="content">

<div class="articles box">
	<b class="spiffy"><b class="spiffy1"><b></b></b><b class="spiffy2"><b></b></b><b class="spiffy3"></b><b class="spiffy4"></b><b class="spiffy5"></b></b>
	<div class="spiffyfg inner-content">
		<h2><a href="#">Aprova��o de artigos</a></h2>

		<br/><br/>

	<c:choose>
		<c:when test="${articles.size$0 eq 0}">Nenhum artigo pendente!</c:when>
	
		<c:otherwise>
		
			Categoria:
			 <select name="categories" id="categorySel">
		
		       <c:forEach var="category" items="${categories}">
		
		          <option value="${category.id}">${category.name}</option>
		
		       </c:forEach>
		
		     </select>		     
		     
		     <br/><br/>
		     
		     N�vel:
			 <select name="levels" id="levelSel">
			 
		          <option value="BASIC">B�sico</option>
		          <option value="INTERMEDIATE">Intermedi�rio</option>
		          <option value="ADVANCED">Avan�ado</option>
		          
		     </select>		     
		     <br/><br/>
		     

			<c:forEach items="${articles}" var="article">
				<ul>
					<li><a href="<c:url value="/article.show.logic?id=${article.id}"/>">${article.title}</a>
							| <fmt:formatDate pattern="dd/MM/yyyy" value="${article.date}"/>
							|<a href="#" onclick="approve(${article.id});"><img src="<c:url value="/images/guj/thumb_up.gif" />" border="0" name="approveUp" title="Aprovar"/></a>	
							<a href="<c:url value="/approve.delete.logic?id=${article.id}"/>"><img src="<c:url value="/images/guj/delete.gif" />" border="0" name="approveDown" title="Apagar" /></a>
					</li>
				</ul>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		
	<script type="text/javascript">

		    function approve(articleId) {

				var categorySel = document.getElementById("categorySel");
				var levelSel = document.getElementById("levelSel");						
		
				$.get('<c:url value="/approve.save.logic"/>',
						{ articleId: articleId, categoryId: categorySel.value, articleLevel: levelSel.value },
						function() {
							
						}
					);
			}
			
	</script>
	</div>
	<b class="spiffy"><b class="spiffy5"></b><b class="spiffy4"></b><b class="spiffy3"></b><b class="spiffy2"><b></b></b><b class="spiffy1"><b></b></b></b>

</div>
	
	<div style="float: left; width: 12%; margin-left: 8px;">
		<!-- OAS AD 'x04' begin -->
		<SCRIPT LANGUAGE="JavaScript">
		<!--
		OAS_AD('x04');
		//-->
		</SCRIPT>
		<!-- OAS AD 'x04' end -->
	</div>

</div>

<%@ include file="../footer.jsp" %>

</c:if>
