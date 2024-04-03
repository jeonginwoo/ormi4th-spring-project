
const boardContent = document.getElementById('boardContent').value;
const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '500px',
    initialValue: boardContent,
    placeholder: '내용 입력'
});

// 게시글 수정
const updateButton = document.getElementById('board-update-btn');
if (updateButton) {
    // 클릭 이벤트가 감지되면 수정 API 요청
    updateButton.addEventListener('click', event => {
        const formData = new FormData();
        const boardId = document.getElementById("board-id").value;
        const title = document.getElementById('title').value
        const content = editor.getMarkdown()
        formData.append('title', title);
        formData.append('content', content);

        // 수정할 데이터를 URL 매개변수에 포함하여 PUT 요청 보내기
        fetch(`/boards/${boardId}`, {
            method: 'PUT',
            body: formData,
        }).then(() => {
            alert('수정이 완료되었습니다');
            location.replace(`/boards/`+boardId);
        });
    });
}

// 게시글 등록
const createButton = document.getElementById('board-create-btn');
if (createButton) {
    createButton.addEventListener('click', event => {
        let formData = new FormData();
        let title = document.getElementById('title').value
        let content = editor.getMarkdown();
        formData.append('title', title);
        formData.append('content', content);

        if (title == "" && content == "") {
            alert('제목과 내용을 적어주세요.');
        } else if (title == "") {
            alert('제목이 비었습니다.');
        } else if (content == "") {
            alert('내용이 비었습니다.');
        } else {
            fetch(`/boards`, {
                method: 'POST',
                body: formData,
            }).then(response => response.json()
            ).then((data) => {
                alert('등록 완료되었습니다');
                location.replace(`/boards/`+data.id);
            });
        }
    });
}
