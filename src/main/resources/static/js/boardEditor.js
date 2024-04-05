const boardContent = document.getElementById('boardContent').value;
const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '500px',
    initialValue: boardContent,
    placeholder: '내용 입력',
    hooks: {
        async addImageBlobHook(blob, callback) { // 이미지 업로드 로직 커스텀
            try {
                /*
                 * 1. 에디터에 업로드한 이미지를 FormData 객체에 저장
                 *    (이때, 컨트롤러 uploadEditorImage 메서드의 파라미터인 'image'와 formData에 append 하는 key('image')값은 동일해야 함)
                 */
                const formData = new FormData();
                formData.append('image', blob);

                // 2. FileApiController - uploadEditorImage 메서드 호출
                const response = await fetch('/tui-editor/image-upload', {
                    method : 'POST',
                    body : formData,
                });

                // 3. 컨트롤러에서 전달받은 디스크에 저장된 파일명
                const filename = await response.text();
                console.log('서버에 저장된 파일명 : ', filename);

                // 4. addImageBlobHook의 callback 함수를 통해, 디스크에 저장된 이미지를 에디터에 렌더링
                const imageUrl = `/tui-editor/image-print?filename=${filename}`;
                callback(imageUrl, 'image alt attribute');

            } catch (error) {
                console.error('업로드 실패 : ', error);
            }
        }
    }
});

// 게시글 수정
function updateBoard() {
    const formData = new FormData();
    const boardId = document.getElementById("board-id").value;
    const title = document.getElementById('title').value
    const team = document.getElementById('team').value;
    const content = editor.getMarkdown()
    formData.append('title', title);
    formData.append('content', content);
    // 수정할 데이터를 URL 매개변수에 포함하여 PUT 요청 보내기
    fetch(`/boards/${boardId}`, {
        method: 'PUT',
        body: formData,
    }).then(() => {
        alert('수정이 완료되었습니다');
        location.replace(`/boards/` + boardId + '?team=' +team);
    });
}

const updateButton = document.getElementById('board-update-btn');
if (updateButton) {
    // 클릭 이벤트가 감지되면 수정 API 요청
    updateButton.addEventListener('click', event => {
        const formData = new FormData();
        const boardId = document.getElementById("board-id").value;
        const title = document.getElementById('title').value
        const team = document.getElementById('team').value;
        const content = editor.getMarkdown()
        formData.append('title', title);
        formData.append('content', content);
        // 수정할 데이터를 URL 매개변수에 포함하여 PUT 요청 보내기
        fetch(`/boards/${boardId}`, {
            method: 'PUT',
            body: formData,
        }).then((data) => {
            alert('수정이 완료되었습니다');
            location.replace(`/boards/` + boardId + '?team=' +team);
        });
    });
}

// 게시글 등록
const createButton = document.getElementById('board-create-btn');
if (createButton) {
    createButton.addEventListener('click', event => {
        let formData = new FormData();
        let title = document.getElementById('title').value
        const team = document.getElementById('team').value;
        const content = editor.getMarkdown()

        formData.append('title', title);
        formData.append('content', content);
        formData.append('team',team);

        if (title === "" && content === "") {
            alert('제목과 내용을 적어주세요.');
        } else if (title === "") {
            alert('제목이 비었습니다.');
        } else if (content === "") {
            alert('내용이 비었습니다.');
        } else {
            fetch(`/boards`, {
                method: 'POST',
                body: formData,
            }).then(response => response.json()
            ).then((data) => {
                alert('등록 완료되었습니다');
                location.replace(`/boards/` + data.id + '?team=' + team);
            });
        }
    });
}
