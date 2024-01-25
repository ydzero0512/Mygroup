<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../common/header.html"%>
<%@include file="../common/topnav.html"%>
<%@include file="../common/sidenav.html"%>

		<div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                      <h5 class="card-title"></h5>
                      <div class="row">
	                      <div class="col-md-8">
	                      	<a href="create" class="btn mb-2 btn-primary">글쓰기</a>
	                      </div>
	                      
	                      <div class="col-md-4">
		                      <div class="input-group">
		               		      <select class="form-control select col-md-3" id="filter">
		                            <option value="title">제목</option>
		                            <option value="content">내용 </option>
		                            <option value="writer">작성자</option>
		                          </select>
		                        <input type="text" class="form-control" id="search">
		                        <div class="input-group-append">
		                          <button class="btn btn-primary" type="button" id="search-button" onclick="search()">Search</button>
		                        </div>
		                      </div>
	                      </div>
                      </div>
                      <table class="table table-hover">
                        <thead>
                          <tr>
			                <th scope="col" class="col-md-1">번호</th>
			                <th scope="col" class="col-md-6">제목</th>
			                <th scope="col" class="col-md-2">작성자</th>
			                <th scope="col" class="col-md-2">작성일</th>
			                <th scope="col" class="col-md-1">조회수</th>
                          </tr>
                        </thead>
                        <tbody id="posts">
                        </tbody>
                      </table>
                      <nav aria-label="Table Paging" class="mb-0 text-muted" id="pageBlock">
                      </nav>
                    </div>
                  </div>
                </div>
	    <script>
	
//	        window.onload = async () => {
				let category = "";
				switch("${category}") {
				case "notice":
					category = "공지사항";
					break;
				case "free":
					category = "자유게시판";
					break;
				case "anonymous":
					category = "익명게시판";
					break;
				case "fnq":
					category = "F&Q";
					break;
				case "qna":
					category = "Q&A";
					break;
				}
				document.querySelector('.card-title').innerHTML = category;
				const urlParams = new URL(location.href).searchParams;
				if(urlParams.has('filter')) {
					document.querySelector('#filter').value = urlParams.get('filter'); 
				}
				if(urlParams.has('search')) {
					document.querySelector('#search').value = urlParams.get('search'); 
				}
				
	            const url = '/board/list/${category}' + decodeURI(location.search);
	            findPost(url);
	            sessionStorage.setItem('checkViewCnt', true);
//	        }
	        // 전체 게시글 조회
	        async function findPost(url) {
	
	            // 1. API 호출
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
	            	let reply = '';
	            	if(item.re_lev > 0) {
	 		           	reply += '<span style="display:inline-block; width:' + item.re_lev*10 + 'px;">';
	 		           	reply += '</span><span class="fe fe-24 fe-corner-down-right"></span> ';	            		
	            	}
	            	html += '<tr><td>'+ (item.bno)+'</td>';
	                html += '<td class="left"><a href="/board';
	                html += '/' + item.category;
	                html += '/read/' + item.bno;
	                html += '">';
	               	html += reply;
	                html += item.title;
	                html += '</a></td>';
	                html += '${category}' == 'anonymous' ? '<td>익명</td>' : '<td>'+ item.writer + '</td>';
	                html += '<td>'+ item.wdate + '</td>';
	                html += '<td>'+ item.readcount + '</td>';
	                html += '</tr>';
	            });
	 //           console.log(html);
	            // 4. 리스트 HTML 렌더링
	            document.querySelector('#posts').innerHTML = html;
	            let page = '';
	            if(urlParams.has('page')) {
		            page = urlParams.get('page');
		            urlParams.delete('page');
	            }
	            const params = urlParams.size >= 1 ? '&' + urlParams.toString() : '';
		        let block = '';
		        block += '<ul class="pagination justify-content-center mb-0">';
		        if(pm.prev) {
		        	const prev = pm.startPage-1;
		        	block += '<li class="page-item"><a class="page-link" href="/board/${category}/list?page=' + prev + params + '">Previous</a></li>';		        	
		        }
				for(var i=pm.startPage; i<=pm.endPage; i++) {
					block += '<li class="page-item';
					if(page == i) block += ' active';					
					block += '"><a class="page-link" href="/board/${category}/list?page=' + i + params + '">'+i+'</a></li>';
				}
				if(pm.next && pm.endPage > 0) {
				 	const next = pm.endPage+1;
				 	block += '<li class="page-item"><a class="page-link" href="/board/${category}/list?page=' + next + params + '">Next</a></li>';
				 }
				block += '</ul>';
				document.querySelector('#pageBlock').innerHTML = block;

	        }
	        async function search() {
	            const filter = document.querySelector('#filter').value;
	            const search = document.querySelector('#search').value;
	           	//if(search == null || search == '') return;
	            const url = '/board/${category}/list?page=1&filter=' + filter + '&search=' + search;
	            location.href=url;
	        }
	        //function makeUrl
	    </script>
<%@include file="../common/footer.html"%>