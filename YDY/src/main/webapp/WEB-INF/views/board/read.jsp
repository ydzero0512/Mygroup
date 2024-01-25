<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../common/header.html"%>

    <!-- TUI 에디터 CSS CDN -->
    <!-- <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/theme/toastui-editor-dark.min.css" />
<%@include file="../common/topnav.html"%>
<%@include file="../common/sidenav.html"%>
    <!-- <h2 style="text-align: center;">TOAST UI Editor 글쓰기 페이지</h2> -->
    
    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div class="col-12">
	    <div class="card shadow mb-4" style="padding: 10px;">
	    <span id="title"></span>
	    </div>
	    <div class="card shadow mb-4">
		    <div id="content" style="padding: 10px;">
		    </div>
	    </div>
    </div>

    <div id="btnDiv" style="text-align: center;">
        <a href = "/board/${category }/reply/${bno}"><button type="button" class="btn mb-2 btn-outline-primary">답글달기</button></a>
        <a href = "/board/${category }/update/${bno}"><button type="button" class="btn mb-2 btn-outline-primary">수정하기</button></a>
        <button type="button" class="btn mb-2 btn-outline-danger" onclick="deletePost()">삭제하기</button>
        <a href="/board/${category }/list" class="btn mb-2 btn-primary">목록으로</a>
    </div>

    <!-- TUI 에디터 JS CDN -->
    <!-- <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script> -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
    <script>
 	    window.onload = async () => {
	        findPost();
	    } 
	
	    // 게시글 상세정보 조회
	    async function findPost() {
	
	        // 1. URL 쿼리 스트링에서 게시글 번호 조회
//	        const searchParams = new URLSearchParams(location.search);
//	        const postId = Number(searchParams.get('id'));
	
	        // 2. API 호출
	        const url = '/board/posts/${bno}';
	    	let checkViewCnt = sessionStorage.getItem('checkViewCnt');
	    	console.log(checkViewCnt);
	    	const readcount = '/board/readcount/${bno}';
	    	try {
	    		if(checkViewCnt == 'true') {
		    		fetch(readcount, {
		    			method: 'PUT'
	    			});
		    		sessionStorage.setItem('checkViewCnt', false);
	    		}

				try {
			        const response = await fetch(url);
			        const post = await response.json();
/* 			        document.querySelector('#title').value = post.title;
			        document.querySelector('#wdate').value = post.wdate;
			        document.querySelector('#writer').value = post.writer;
			        document.querySelector('#readcount').innerHTML = post.readcount; */
			       const writer = '${category}' == 'anonymous' ? '익명' : post.writer; 
			       const title = '<h1>' + post.title + '</h1>' + writer + '/' + post.wdate  + '/ 조회수 : ' + post.readcount;
			       document.querySelector('#title').innerHTML = title;
			       const editorParams = localStorage.getItem("mode") == 'dark' ? {
			            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
			            viewer: true,
			            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
			            //initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
			            initialValue: post.content,                  // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
			            //previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
			            //placeholder: '내용을 입력해 주세요.',
						theme: 'dark'
		        	} : {
			            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
			            viewer: true,
			            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
//			            initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
			            initialValue: post.content,                  // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
//			            previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
//			            placeholder: '내용을 입력해 주세요.',
			        };
			    	const toastEditor = new toastui.Editor(editorParams);
 		        }catch (error){
	        	alert("글을 불러올 수 없습니다");
		        	console.error('로딩 실패 : ', error);
		        	location.href = '/board/${category}/list';
		        }		    		
		    		
	    	}catch(error) {
	    		alert("오류가 발생했습니다.");
	    		console.error('조회수처리 오류 : ', error);
	    	}
	    }
	    
	    async function deletePost() {
	    	const url = '/board/posts/${bno}';
            try {
                const response = await fetch(url, {
                    method: 'DELETE'
                });
                console.log(response);
//                const postId = await response.json();
                alert('게시글이 삭제되었습니다.');
                location.href = '/board/${category}/list';

            } catch (error) {
            	alert("오류가 발생했습니다.");
                console.error('저장 실패 : ', error)
            }
	    }

    </script>
<%@include file="../common/footer.html"%>