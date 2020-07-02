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
		    border: 1px solid pink;
		}
		
		header {
		    position: sticky;
		    display: flex;
		    align-items: center;
		    padding: 10px;
		    width: 100vw;
		    background-color: white;
		    box-shadow: 1px 1px 1px 0 #b6b6b65a, 0 1px 1px 0 rgba(155, 155, 155, 0.337);
		    transition: 0.2s;
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
		    height: 100vh;
		    flex: 10;
			padding: 50px auto;
		}
		
		a {
		    font-weight: bold;
		    line-height: 3rem;
		    font-size: 18px;
		}
        .navbar {
            display: flex;
            justify-content: center;
            align-content: space-between;
        }
        
        #member_table, #member_table tr, #member_table td {
        	border: 1px solid black;
        	border-collapse: collapse;
        }
        
        #paging_container {
        	margin: 10px;
        }
        
    </style>
</head>
<body>
    <header>
		<img id="logo" src="<%= ctxPath%>/images/nari/starbucslogo.png" width="75px" height="75px"/> 
        <ul class="nav_menu">
            <li><a href="<%= ctxPath%>/index.sb">공식홈페이지</a></li>
            <li><a>로그아웃</a></li>
            <li><a></a></li>
        </ul>
    </header>
    <section>
        <aside>
            <h2>관리자 페이지</h2>
            <div class="navbar">
                <table>
                    <tr>
                        <td>
                            <a class="side_menu_item" href="<%= ctxPath%>/admin/storeManagement.sb">매장관리</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="side_menu_item" onclick="">메뉴관리</a>
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
