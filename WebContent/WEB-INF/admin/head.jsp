<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    	body {
		    height: auto;
		    width: 100vw;
		    margin: 0 auto;
		    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}
		
		header {
		    position: sticky;
		    display: flex;
		    align-items: center;
		    padding: 10px;
		    width: 100vw;
		    background-color: #f6f5ef;
		    box-shadow: 1px 1px 1px 0 #b6b6b65a, 0 1px 1px 0 rgba(155, 155, 155, 0.337);
		    transition: 0.2s;
		    box-sizing: border-box;
		}
		
		ul.nav_menu {
		    list-style-type: none;
		    /* border: 2px solid peru; */
		    display: inline-block;
		}
		
		li {
		    display: inline-block;
		    font-weight: 500;
		    font-size: 15pt;
		    margin-right: 15px;
		}
		
		section {
		    height: 100vh;
		    background-color: rgb(245, 245, 245);
		    display: flex;
		    flex-direction: row;
		}
		
		aside {
		    height: inherit;
		    /* display: table; */
		    background-color: rgb(255, 255, 255);
		    flex: 2;
		    box-shadow: 3px 3px 3px 0 #9696965a, 0 10px 1px 0 rgba(201, 201, 201, 0.337);
		}
		
		article {
			width: 100%;
		    height: 100vh;
		    flex: 10;
			padding: 50px auto;
		}
		
		h3 {
			margin: 20px 0 0 0;
		}
		
		.navbar a {
		    font-weight: bold;
		    font-size: 18px;
		    color: #555;
		    text-decoration: none;
		}
		
		a:visited { 
			color: #555;
			text-decoration: none;
		}

		a:hover {
			text-decoration: underline;
		}
		
		a.side_menu_item {
			line-height: 3rem;
		}

        .navbar {
            display: flex;
            justify-content: center;
            align-content: space-between;
            margin: 30px 0;
        }
        
        .admin_table {
        	margin-top: 20px;
        	border-collapse: collapse;
        }
        
        #option_td {
        	border: none;
        }
		
		#member_table th {
			font-size: 14px;
		    font-weight: bold;
		    color: #222222;
		    text-align: center;
		    padding: 10px 3px;
		    border-top: 1px solid #333;
		    border-bottom: 1px solid #333;
		}
		
		#member_table td {
			font-size: 14px;
		    color: #666666;
		    text-align: center;
		    padding: 10px 0;
		    border-bottom: 1px solid #dddddd;
		    line-height: 1.8;
		}
		
		.menu_content_td {
			font-size: 14px;
		    color: #666666;
		    text-align: center;
		    padding: 17px 0;
		    border-bottom: 1px solid #dddddd;
		    line-height: 1.8;
		}
        
        #paging_container {
        	margin: 10px;
        }
        
        .pagination {
		  	display: inline-block;
		}
		
		.pagination a {
		  	color: black;
		  	float: left;
		  	padding: 4px 8px;
		 	text-decoration: none;
		}
		
		.pagination a.active {
		  	background-color: #4CAF50;
		  	color: white;
		  	border-radius: 5px;
		}
		
		.pagination a:hover:not(.active) {
		  	background-color: #ddd;
		  	border-radius: 5px;
		}
        
    </style>
</head>
<body>
    <header>
		<a href="<%= ctxPath%>/index.sb">
			<img id="logo" src="<%= ctxPath%>/images/nari/starbucslogo.png" width="75px" height="75px"/>
		</a> 
        <ul class="nav_menu">
            <li><a href="<%= ctxPath%>/index.sb">공식홈페이지</a></li>
            <li><a href="<%= ctxPath%>/login/logout.sb">로그아웃</a></li>
            <li><a></a></li>
        </ul>
    </header>
    <section>
        <aside>
            <div class="navbar">
                <table>
                    <tr>
                        <td>
                            <a class="side_menu_item" href="<%= ctxPath%>/admin/storeManagement.sb">매장관리</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="side_menu_item" href="<%= ctxPath%>/admin/menuManagement.sb">메뉴관리</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="side_menu_item" href="<%= ctxPath%>/admin/memberManagement.sb" onclick="">회원관리</a>
                        </td>
                    </tr>
                </table>
            </div>
        </aside>
