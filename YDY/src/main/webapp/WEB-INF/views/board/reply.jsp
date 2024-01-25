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
    <div id="content">
    

    </div>

    <div id="btnDiv" style="text-align: center;">
        <button type="button" class="btn mb-2 btn-primary" onclick="replyPost();">저장하기</button>
        <a href="/board/${category }/read/${bno}" class="btn mb-2 btn-outline-primary">뒤로 가기</a>
    </div>

    <!-- TUI 에디터 JS CDN -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
    	let done = false;
    	let vo = {};
    	const editorParams = localStorage.getItem("mode") == 'dark' ? {
	        el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	        height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	        initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	        initialValue: "",                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	        previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	        placeholder: '내용을 입력해 주세요.',
	        theme: 'dark'
    	} : {
	        el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	        height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	        initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	        initialValue: "",                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	        previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	        placeholder: '내용을 입력해 주세요.'
    	};
	    const toastEditor = new toastui.Editor(editorParams);
        findPost();
        console.log(toastEditor.getMarkdown());
	
	    // 게시글 상세정보 조회
	    async function findPost() {
	
	        // 1. URL 쿼리 스트링에서 게시글 번호 조회
//	        const searchParams = new URLSearchParams(location.search);
//	        const postId = Number(searchParams.get('id'));
	
	        // 2. API 호출
	        const url = '/board/posts/${bno}';
	        try {
		        const response = await fetch(url);
		        vo = await response.json();
//		        toastEditor.setMarkdown(vo.content + "\n***\n");
		        document.querySelector('#title').value = "re:" + vo.title;
// 		        document.querySelector('#wdate').value = vo.wdate;
//		        document.querySelector('#udate').value = vo.udate;
//		        document.querySelector('#writer').value = vo.writer;
		        done = true;
		        console.log(vo);
	        } catch(error) {
                console.error('로딩 실패 : ', error)
            }
	    }
        // 게시글 저장
        async function replyPost() {
        	if(!done) alert("아직은 작성할 수 없습니다.");
            // 1. 콘텐츠 입력 유효성 검사
            const title = document.querySelector('#title');
            if (title.value.length < 1) {
            	document.querySelector('#title').focus();
                alert('제목을 입력해 주세요.');
                return;
            }
            if (editor.getMarkdown().length < 1) {
                alert('에디터 내용을 입력해 주세요.');
                toastEditor.focus();
                //throw new Error('editor content is required!');
                return;
            }
            // 2. url, parameter 세팅
            const url = '/board/reply';
            vo.title = document.querySelector('#title').value;
            vo.content = toastEditor.getMarkdown();
            vo.writer = 2;
            // 3. API 호출
            try {
                const response = await fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(vo)
                });
                console.log(vo);
//                const postId = await response.json();
                alert('게시글이 저장되었습니다.');
                location.href = '/board/${category}/list';

            } catch (error) {
                console.error('저장 실패 : ', error)
            }
        }
    </script>
<%@include file="../common/footer.html"%>