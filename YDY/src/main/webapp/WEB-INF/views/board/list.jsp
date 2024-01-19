<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
		<title>Home</title>
	    <style>
	        #btnDiv { text-align: center; margin-top: 20px; }
	        .btns { display: inline-block; padding: 0 10px; height: 28px; line-height: 26px; text-align: center; vertical-align: middle; border-radius: 3px; border: 1px solid transparent; font-weight: 500; }
	        .btns.save { background: #139dc8; color: #fff; cursor: pointer; }
	        .btns.back { background: #fff; border: 1px solid #199bc4; color: #199bc4; }
	        #pageBlock li { list-style-type: none; float: left; margin: 2px;}
	    </style>
	</head>
	<body>
	   	<select id="category" onchange="moveToCategory()">
			<option value="0">Category</option>
			<option value="notice">공지사항</option>
			<option value="free">자유게시판</option>
			<option value="secret">대나무숲</option>
			<option value="fnq">F&Q</option>
			<option value="qna">Q&A</option>		
		</select>
		<a href="create" class="btns back">글쓰기</a>
	    <table>
	        <colgroup>
	            <col style="width: 2%;" />
	            <col style="width: 80%;" />
	            <col style="width: 4%;" />
	            <col style="width: 10%;" />
	            <col style="width: 12%;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">번호</th>
	                <th scope="col">제목</th>
	                <th scope="col">작성자</th>
	                <th scope="col">작성일</th>
	                <th scope="col">조회수</th>
	            </tr>
	        </thead>
	
	        <!--/* 리스트 데이터 렌더링 영역 */-->
	        <tbody id="posts">
	
	        </tbody>
	    </table>

	    <div id="pageBlock"></div><br>
	    <script>
	
//	        window.onload = async () => {
	            findAllPost();
//	        }
            document.querySelector('#category').value = '${category}';
	        // 전체 게시글 조회
	        async function findAllPost() {
	
	            // 1. API 호출
	            let page = new URL(location.href).searchParams.get('page');
	            if(page == null) {
	            	page = 1;
	            }
	            const url = '/board/list/${category}?page=' + page;
	            const response = await fetch(url);
	            const result = await response.json();
	            const pm = result.pm;
	            const list = result.list;
	            //console.log(list);
	            //console.log(pm);
	            // 2. 데이터가 없는 경우, 로직 종료
	            if (list.length < 1) {
	                document.querySelector('#posts').innerHTML = '<tr><td colspan="2">검색된 결과가 없습니다.</td></tr>';
	                return false;
	            }
	
	            // 3. 리스트 HTML 세팅
	            let html = '';
	            list.forEach((item, index) => {
	            	let reply = "";
	            	if(item.re_lev > 0 ) {
	            		reply += '<span style="display:inline-block; width:' + item.re_lev*10 + 'px;"></span>';
	            		reply += "ㄴ";
	            	}
	            	html += '<tr><td>'+ (item.bno)+'</td>';
	                html += '<td class="left"><a href="/board';
	                html += '/' + item.category;
	                html += '/read/' + item.bno;
	                html += '">';
	               	html += reply;
	                html += item.title;
	                html += '</a></td>';
	                html += '<td>'+ item.writer + '</td>';
	                html += '<td>'+ item.wdate + '</td>';
	                html += '<td>'+ item.readcount + '</td>';
	                html += '</tr>';
	            });
	 //           console.log(html);
	            // 4. 리스트 HTML 렌더링
	            document.querySelector('#posts').innerHTML = html;
	            
		        let block = '';
		        if(pm.prev) {
		        	const prev = pm.startPage-1;
		        	block += '<li><a href="/board/${category }/list?page=' + prev + '">«</a></li>';
		        }
				for(var i=pm.startPage; i<=pm.endPage; i++) {
					block += '<li ';
					block += pm.pageVO.page == i? 'class="active"':'';
					block += ' class="active"><a href="/board/${category }/list?page='+i+'">'+i+'</a></li>';
				}
				if(pm.next && pm.endPage > 0) {
				 	const next = pm.endPage+1;
				 	block += '<li><a href="/board/${category }/list?page=' + next + '">»</a></li>';
				 }
				document.querySelector('#pageBlock').innerHTML = block;

	        }
	        
	        function moveToCategory() {
	        	if(document.querySelector('#category').value == 0) return;
	        	location.href = "/board/" + document.querySelector('#category').value + "/list";
	        }
	
	    </script>
	
	</body>
</html>
