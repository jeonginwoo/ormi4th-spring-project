
const boardContent = document.getElementById('boardContent').value;
const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '500px',
    initialValue: boardContent
});

// 게시글 수정
const updateButton = document.getElementById('board-update-btn');
if (updateButton) {
    // 클릭 이벤트가 감지되면 수정 API 요청
    updateButton.addEventListener('click', event => {
        let params = new URLSearchParams(location.search);
        let id = params.get('id');
        let formData = new FormData();
        formData.append('title', document.getElementById('title').value);
        formData.append('content', editor.getMarkdown());

        // 수정할 데이터를 URL 매개변수에 포함하여 PUT 요청 보내기
        fetch(`/boards/${id}`, {
            method: 'PUT',
            body: formData,
        }).then(() => {
            alert('수정이 완료되었습니다');
            location.replace(`/boards/`+id);
        });
    });
}

// 게시글 등록
const createButton = document.getElementById('board-create-btn');
if (createButton) {
    createButton.addEventListener('click', event => {
        let formData = new FormData();
        formData.append('title', document.getElementById('title').value);
        formData.append('content', editor.getMarkdown());

        fetch(`/boards`, {
            method: 'POST',
            body: formData,
        }).then(response => response.json()
        ).then((data) => {
            alert('등록 완료되었습니다');
            location.replace(`/boards/`+data.id);
        });
    });
}
