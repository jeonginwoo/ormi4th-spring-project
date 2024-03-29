const updateButton = document.getElementById('board-update-btn');

if (updateButton) {
    // 클릭 이벤트가 감지되면 수정 API 요청
    updateButton.addEventListener('click', event => {
        let params = new URLSearchParams(location.search);
        let id = params.get('id');
        console.log(id);

        let title = document.getElementById('title').value;
        let content = document.getElementById('content').value;

        // 수정할 데이터를 URL 매개변수에 포함하여 PUT 요청 보내기
        fetch(`/boards/${id}?title=${title}&content=${content}`, {
            method: 'PUT',
            headers: {
                "Content-Type": "application/json",
            },
        }).then(() => {
            alert('수정이 완료되었습니다');
            location.replace(`/boards/${id}`);
        });
    });
}