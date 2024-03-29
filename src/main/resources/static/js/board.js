
// 게시글 삭제
const deleteButton = document.getElementById('board-delete-btn');
if (deleteButton) {
    deleteButton.addEventListener('click', event => {
        let id = document.getElementById('board-id').value;
        fetch(`/boards/${id}`, {
            method: 'DELETE'
        }).then(() => {
            alert('삭제가 완료되었습니다');
            location.replace('/boards');
        });
    });
}



/*********************************************************************************************/
// 댓글 수정, 삭제, 등록

document.addEventListener("DOMContentLoaded", function () {
    const editButtons = document.querySelectorAll(".edit-comment-button");
    editButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            const commentArea = button.closest(".area");
            const commentContent = commentArea.querySelector(".content").innerText;
            const commentId = commentArea.querySelector("input[name='commentId']").value;
            const boardId = commentArea.querySelector("input[name='boardId']").value;

            // 다이얼로그에 댓글 내용과 댓글 ID를 채웁니다.
            document.getElementById("dialogBoardId").value = boardId;
            document.getElementById("dialogCommentId").value = commentId;
            document.getElementById("dialogCommentContent").value = commentContent;

            const editDialog = document.getElementById("editDialog");
            editDialog.showModal();
        });
    });
});

function closeEDialog() {
    const editDialog = document.getElementById("editDialog");
    editDialog.close();
}

function updateComment() {
    const editedContent = document.getElementById("dialogCommentContent").value;
    const commentId = document.getElementById("dialogCommentId").value;
    const boardId = document.getElementById("dialogBoardId").value;

    const xhr = new XMLHttpRequest();
    xhr.open("PUT", "/boards/" + boardId + "/comments/" + commentId, true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onload = function () {
        if (xhr.status === 200) {
            closeEDialog();
            location.reload();
        } else {
            console.error(xhr.responseText);
        }
    };
    xhr.send(JSON.stringify({ content: editedContent }));
}

function deleteComment() {
    const commentArea = event.target.closest(".area");
    const commentId = commentArea.querySelector("input[name='commentId']").value;
    const boardId = commentArea.querySelector("input[name='boardId']").value;

    const xhr = new XMLHttpRequest();
    xhr.open("DELETE", "/boards/" + boardId + "/comments/" + commentId, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            location.reload();
        } else {
            console.error(xhr.responseText);
        }
    };
    xhr.send();
}

const commentCreateButton = document.getElementById('comment-create-btn');
if (commentCreateButton) {
    commentCreateButton.addEventListener('click', event => {
        const boardId = window.location.pathname.split('/').pop();
        const content = document.getElementById('content').value;
        fetch(`/boards/${boardId}/comments`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                content: content
            }),
        }).then(() => {
            location.reload();
        });
    });
}
