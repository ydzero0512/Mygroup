<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">
<head>
    <title>글쓰기 페이지</title>

    <!-- TUI 에디터 CSS CDN -->
    <!-- <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" /> -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <!-- 버튼 영역 CSS -->
    <style>
        #btnDiv { text-align: center; margin-top: 20px; }
        .btns { display: inline-block; padding: 0 10px; height: 28px; line-height: 26px; text-align: center; vertical-align: middle; border-radius: 3px; border: 1px solid transparent; font-weight: 500; }
        .btns.save { background: #139dc8; color: #fff; cursor: pointer; }
        .btns.back { background: #fff; border: 1px solid #199bc4; color: #199bc4; }
    </style>
</head>
<body>
    <!-- <h2 style="text-align: center;">TOAST UI Editor 글쓰기 페이지</h2> -->
    
    <!-- 에디터를 적용할 요소 (컨테이너) -->
    제목 : <input type="text" id="title" placeholder="Title" readonly="readonly"><br>
    작성시간 : <input type="datetime" id="wdate" readonly="readonly"><br>
    수정시간 : <input type="datetime" id="udate" readonly="readonly"><br>
    작성자 : <input type="text" id="writer" readonly="readonly"><br>
    조회수 : <span id="readcount"></span>
    
    <div id="content">
    

    </div>

    <div id="btnDiv">
        <a href = "/board/${category }/reply/${bno}"><button type="button" class="btns save">답글달기</button></a>
        <a href = "/board/${category }/update/${bno}"><button type="button" class="btns save">수정하기</button></a>
        <button type="button" class="btns save" onclick="deletePost()">삭제하기</button>
        <a href="/board/${category }/list" class="btns back">목록으로</a>
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
			        document.querySelector('#title').value = post.title;
			        document.querySelector('#wdate').value = post.wdate;
			        document.querySelector('#udate').value = post.udate;
			        document.querySelector('#writer').value = post.writer;
			        document.querySelector('#readcount').innerHTML = post.readcount;
			    	const editor = new toastui.Editor({
			            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
			            viewer: true,
			            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
//			            initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
			            initialValue: post.content,                  // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
//			            previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
//			            placeholder: '내용을 입력해 주세요.',
			        });
 		        }catch (error){
	        	alert("글을 불러올 수 없습니다");
		        	console.error('로딩 실패 : ', error)
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
</body>
</html>