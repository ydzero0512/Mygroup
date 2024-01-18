<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">
<head>
    <title>글쓰기 페이지</title>

    <!-- TUI 에디터 CSS CDN -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

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
    <div id="content">
    

    </div>

    <div id="btnDiv">
        <button type="button" class="btns save" onclick="updatePost();">수정하기</button>
        <a href="/board/${category }/read/${bno}" class="btns back">뒤로 가기</a>
    </div>

    <!-- TUI 에디터 JS CDN -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
	    const editor = new toastui.Editor({
	        el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	        height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	        initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	        initialValue: "",                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	        previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	        placeholder: '내용을 입력해 주세요.'
	    });
        findPost();
	
	    // 게시글 상세정보 조회
	    async function findPost() {
	
	        // 1. URL 쿼리 스트링에서 게시글 번호 조회
//	        const searchParams = new URLSearchParams(location.search);
//	        const postId = Number(searchParams.get('id'));
	
	        // 2. API 호출
	        const url = '/board/posts/${bno}';
	        try {
		        const response = await fetch(url);
		        const post = await response.json();
		        editor.setMarkdown(post.content);
		        document.querySelector('#title').value = post.title;
		        document.querySelector('#wdate').value = post.wdate;
		        document.querySelector('#udate').value = post.udate;
		        document.querySelector('#writer').value = post.writer;
	        } catch(error) {
                console.error('로딩 실패 : ', error)
            }
	    }
        // 게시글 저장
        async function updatePost() {
            // 1. 콘텐츠 입력 유효성 검사
            const title = document.querySelector('#title');
            if (title.value.length < 1) {
                alert('제목을 입력해 주세요.');
                return;
            }
            if (editor.getMarkdown().length < 1) {
                alert('에디터 내용을 입력해 주세요.');
                throw new Error('editor content is required!');
                return;
            }
            // 2. url, parameter 세팅
            const url = '/board/posts';
            const params = {
            	bno: ${bno},
                title: title.value,
                content: editor.getMarkdown()
            }
 //           alert("title = " + title.value + " / content = " + editor.getHTML());
            console.log(JSON.stringify(params));
            // 3. API 호출
            try {
                const response = await fetch(url, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(params)
                });
                console.log(response);
//                const postId = await response.json();
                alert('게시글이 수정되었습니다.');
                location.href = '/board/${category}/list';

            } catch (error) {
                console.error('저장 실패 : ', error)
            }
        }
    </script>
</body>
</html>