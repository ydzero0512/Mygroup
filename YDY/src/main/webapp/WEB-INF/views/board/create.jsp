<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">
	<head>
	    <title>글쓰기</title>
	
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
	   	<select id="category">
			<option value="0">Category</option>
			<option value="notice">공지사항</option>
			<option value="free">자유게시판</option>
			<option value="secret">대나무숲</option>
			<option value="fnq">F&Q</option>
			<option value="qna">Q&A</option>		
		</select>
	    <input type="text" id="title" placeholder="Title">
	    <div id="content">
	    
	
	    </div>
	
	    <div id="btnDiv">
	        <button type="button" class="btns save" onclick="savePost();">저장하기</button>
	        <a href="/board/list" class="btns back">뒤로 가기</a>
	    </div>
	
	    <!-- TUI 에디터 JS CDN -->
	    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	    <script>
	        const editor = new toastui.Editor({
	            el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
	            height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
	            initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	            initialValue: '',                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	            previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
	            placeholder: '내용을 입력해 주세요.'
	        });
	        
	        document.querySelector('#category').value = '${category}';
	        // 게시글 저장
	        async function savePost() {
	            // 1. 콘텐츠 입력 유효성 검사
	            const category = document.querySelector('#category');
	            if (category.value == 0) {
	                alert('카테고리를 선택하세요');
	                return;
	            }
	            const title = document.querySelector('#title');
	            if (title.value.length < 1) {
	                alert('제목을 입력해 주세요.');
	                return;
	            }
	            if (editor.getMarkdown().length < 1) {
	                alert('내용을 입력해 주세요.');
	                throw new Error('editor content is required!');
	                return;
	            }
	
	            // 2. url, parameter 세팅
	            const url = '/board/posts/';
	            
	            const writer = "dummyWriter";
	            const params = {
	                title: title.value,
	                content: editor.getMarkdown(),
	                category: category.value,
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
	</body>
</html>