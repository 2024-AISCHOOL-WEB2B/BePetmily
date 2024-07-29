<%@page import="com.model.PageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="com.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>��ǰ ����Ʈ ������</title>
<link rel="stylesheet" href="assets/css/Base_style.css?v=1.0">
<link rel="stylesheet" href="assets/css/item_list.css?v=1.0">
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.html"><img src="assets/img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        <!-- �� �׺���̼� -->
        <nav class="main-nav">
            <ul>
                <li class="dropdown products-tab"><a>��ǰ</a>
                    <div class="dropdown-content products-content">
                        <a href="item_list.jsp?cate=food&page=1">���</a>
                        <a href="item_list.jsp?cate=snack&page=1">����</a>
                        <a href="item_list.jsp?cate=etc&page=1">��ǰ</a>
                    </div>
                </li>
                <li class="dropdown facilities-tab"><a>�ü�</a>
                    <div class="dropdown-content facilities-content">
                        <a href="#">����</a>
                        <a href="#">����</a>
                        <a href="#">ī��/�Ĵ�</a>
                        <a href="#">��Ÿ�ü�</a>
                        <a href="kaomap2 ok.html">�ֺ���ġ</a>
                    </div>
                </li>
                <li class="dropdown health-tab"><a>������ ����</a>
                    <div class="dropdown-content health-content">
                        <a href="#" class="moveable">��������</a>
                    </div>
                </li>
                <li class="dropdown community-tab"><a>Ŀ�´�Ƽ</a>
                    <div class="dropdown-content community-content">
                        <a href="#">�ٹ��Խ���</a>
                    </div>
                </li>
            </ul>
        </nav>
        <hr>
        <!-- �극��ũ�� �׺���̼� -->
        <div class="nav-background"></div>
        <div class="breadcrumb-background"></div>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main.html">Ȩ</a><span>&gt;</span></li>
                <li class="breadcrumb-item"><a href="item_list.jsp?page=1">��ǰ</a><span>&gt;</span></li>
            </ol>
        </nav>
        <div class="user-options">
            <a href="#"><img src="assets/img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="assets/img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>
    <!-- Wrapper: ���� ������ �� Ǫ�͸� �߾ӿ� ��ġ -->
    <div class="wrapper">
        <main>
            <div class="container">
                <div class="product-grid">
				<%
				    String cate = request.getParameter("cate");
				    String pageS = request.getParameter("page");
				    int curPage = (pageS != null) ? Integer.parseInt(pageS) : 1;
					
				    ProductDAO dao = new ProductDAO();
				    ArrayList<ProductDTO> products = (ArrayList<ProductDTO>) request.getAttribute("products");
				    PageDTO pages = (PageDTO) request.getAttribute("pages");					
				    if (products == null) {
				        products = dao.getProductList(curPage,cate); // ���� �������� �ش��ϴ� ��ǰ ����� �����ɴϴ�.
				    }
				    if (pages == null) {
				        pages = new PageDTO(curPage, 15, dao.getTotal(cate)); // ���� �������� �������� PageDTO�� �����մϴ�.
				    }
				%>
                    <!-- ��ǰ ��� ��� -->
                    <% for (ProductDTO product : products) { %>
                        <div class="product-detail">
                            <a href="<%= product.getProductUrl() %>"><img src="<%= product.getImagepath() %>" alt="��ǰ �̹���"></a>
                            <h1><%= product.getProductName() %></h1>
                            <p>����: <%= product.getProductPrice() %></p>
                           <form action="buy.html" method="get">
                                <a href="<%= product.getProductUrl() %>">
                                    <button type="button">�����ϱ�</button>
                                </a>
                            </form>
                        </div>
                    <% } %>
                </div>
            </div>
            <div class="pagination">
                <a href="item_list.jsp?cate=<%= cate %>&page=<%= pages.getCurPage() - 1 %>" class="prev-page">&laquo;</a>
                <% for (int i = pages.getStartPage(); i <= pages.getEndPage(); i++) { %>
                	<a href="item_list.jsp?cate=<%=cate%>&page=<%= i %>" class="page-number"><%= i %></a>
                <% } %>
                <a href="item_list.jsp?cate=<%= cate %>&page=<%= pages.getCurPage() + 1 %>" class="next-page">&raquo;</a>
                
            </div>
        	</main>
        </div>
        <!-- ���: ��ü �ʺ�� ���� -->
        <section class="banner">
            <img src="assets/img/Base_banner.png" alt="Be Petmily Banner">
        </section>
        <footer class="footer-wrapper">
            <div class="footer-container">
                <div class="footer-top-bar">
                    <span class="footer-lang"> ���ѹα�/�ѱ��� </span>
                    <span class="footer-top"><a href="#" id="back-to-top1"><img src="assets/img/Base_up01.png" alt="�� ��"></a></span>
                </div>
                <hr>
                <div class="footer-top">
                    <div class="footer-links">
                        <h3>��ǰ</h3>
                        <ul>
                            <li><a href="item_list.jsp?page=1">���</a></li>
                            <li><a href="#">����</a></li>
                            <li><a href="#">��ǰ</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h3>�ְ� ���� �ü�</h3>
                        <ul>
                            <li><a href="#">����</a></li>
                            <li><a href="#">����</a></li>
                            <li><a href="#">ī��/�Ĵ�</a></li>
                            <li><a href="#">��Ÿ�ü�</a></li>
                            <li><a href="kaomap2 ok.html">�ֺ���ġ</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h3>������ ����</h3>
                        <ul>
                            <li><a href="#">��������</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                    <h3>Ŀ�´�Ƽ</h3>
                    <ul>
                        <!-- <li><a href="#">���� ���� ����</a></li> -->
                        <li><a href="#">�ٹ��Խ���</a></li>
                    </ul>   
                	</div>
                </div>
	            <hr>
	            <div class="footer-contact">
	                <p>Be Petmily�� ����ϼ���</p>
	                <p>���� 09:00 ~ 18:00 �ָ�/������ �޹�</p>
	                <p>070-123-4567</p>
	                <a href="mailto:info@bepetmily.com">�����ϱ�</a>
	            </div>
	            <div class="footer-bottom">
	                <p>�������� ��ȣ���� | �������� | �������� ó����ħ</p>
	                <p>2017 Be Petmily. All rights reserved. An Affiliate of Mars, Incorporated.</p>
	            </div>
	            <div class="back-to-top">
	                <a href="#" id="back-to-top"><img src="assets/img/Base_up02.png" alt="�� ����"></a>
	            </div>
	        </div>
	    </footer>
		<script>
		        
		
		        document.getElementById('back-to-top').addEventListener('click', function(e) {
		            e.preventDefault();
		            window.scrollTo({top: 0, behavior: 'smooth'});
		        });
		</script>
	    
    
    
</body>
</html>
