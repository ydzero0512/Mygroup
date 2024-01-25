<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../common/header.html"%>
	    <!-- TUI 에디터 CSS CDN -->
	    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/theme/toastui-editor-dark.min.css" />
<%@include file="../common/topnav.html"%>
<%@include file="../common/sidenav.html"%>
	    <!-- <h2 style="text-align: center;">TOAST UI Editor 글쓰기 페이지</h2> -->
	    
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <form class="form-inline mr-auto text-muted" style="padding:7px;">
		    <input type="text" id="title" placeholder="Title" class="form-control mr-sm-2 bg-transparent border-0 pl-4">
        </form>
	    <div id="content" style="padding:5px;">
	    </div>
	
	    <div id="btnDiv" style="text-align: center;">
	        <button type="button" class="btn mb-2 btn-primary" onclick="savePost();">저장하기</button>
	        <a href="/board/${category }/list" class="btn mb-2 btn-outline-primary">뒤로 가기</a>
	    </div>
	    <!-- TUI 에디터 JS CDN -->
	    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	    <script>
 	    	const params = localStorage.getItem("mode") == 'dark' ? {
	            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	            initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	            initialValue: '',                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	            previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	            placeholder: '내용을 입력해 주세요.',
	            theme: 'dark'
	        } :
   			{
	            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	            initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	            initialValue: '',                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	            previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	            placeholder: '내용을 입력해 주세요.'
	        };

	        const toastEditor = new toastui.Editor(params);
	        document.querySelector('#title').focus();
	        // 게시글 저장
	        async function savePost() {
	            // 1. 콘텐츠 입력 유효성 검사
	            const title = document.querySelector('#title');
	            if (title.value.length < 1) {
	            	document.querySelector('#title').focus();
	                alert('제목을 입력해 주세요.');
	                return;
	            }
	            if (toastEditor.getMarkdown().length < 1) {
	                alert('내용을 입력해 주세요.');
	                toastEditor.focus();
	                //throw new Error('editor content is required!');
	                return;
	            }
	
	            // 2. url, parameter 세팅
	            const url = '/board/posts/';
	            
	            const writer = "dummyWriter";
	            const params = {
	                title: title.value,
	                content: toastEditor.getMarkdown(),
	                category: '${category}',
	                writer: 1
	            }
	            //alert("title = " + title.value + " / content = " + editor.getHTML());
	            console.log(JSON.stringify(params));
	            // 3. API 호출
	            try {
	                const response = await fetch(url, {
	                    method: 'POST',
	                    headers: {
	                        'Content-Type': 'application/json',
	                    },
	                    body: JSON.stringify(params)
	                });
	                console.log(response);
	                alert('게시글이 저장되었습니다.');
	                location.href = 'list';
	
	            } catch (error) {
	                console.error('저장 실패 : ', error)
	            }
	        }
	    </script>
<%@include file="../common/footer.html"%>