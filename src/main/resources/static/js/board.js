
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

// 댓글 수정
document.addEventListener("DOMContentLoaded", function () {
    const editButtons = document.querySelectorAll(".edit-comment-button");
    editButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            // 다른 수정 창 닫기
            closeAllEditDialogs();
            const boardId = document.getElementById("board-id").value;
            const commentContainer = button.closest(".comment-container");
            const commentId = commentContainer.querySelector("input[name='commentId']").value;
            const content = commentContainer.querySelector(".content");
            const editContent = document.createElement('textarea');
            editContent.classList.add('update-content');
            editContent.value = content.innerText;
            content.style.display = 'none';

            const updateBtnAlign = document.createElement('div');
            updateBtnAlign.classList.add('btn-align');

            const updateBtn = document.createElement('button');
            updateBtn.innerText = '저장';
            updateBtn.addEventListener('click', function() {
                const editedContent = editContent.value;
                if (editedContent == "") {
                    alert("내용이 비었습니다.")
                } else {
                    fetch(`/boards/${boardId}/comments/${commentId}`, {
                        method: 'PUT',
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            content: editedContent,
                        }),
                    });

                    // 원래 내용으로 대체
                    content.innerText = editedContent;
                    content.style.display = 'block';
                    commentContainer.removeChild(editContent);
                    commentContainer.removeChild(updateBtnAlign);
                }
            });

            const cancelBtn = document.createElement('button');
            cancelBtn.innerText = '취소';
            cancelBtn.addEventListener('click', function() {
                content.style.display = 'block';
                commentContainer.removeChild(editContent);
                commentContainer.removeChild(updateBtnAlign);
            });

            // 수정할 내용 추가
            updateBtnAlign.appendChild(cancelBtn);
            updateBtnAlign.appendChild(updateBtn);
            commentContainer.insertBefore(updateBtnAlign, content.nextSibling);
            commentContainer.insertBefore(editContent, content.nextSibling);
        });
    });
});

// 모든 수정 창 닫기
function closeAllEditDialogs() {
    const editContents = document.querySelectorAll('.update-content');
    editContents.forEach(function(content) {
        const commentContainer = content.closest('.comment-container');
        const originalContent = commentContainer.querySelector('.content');
        originalContent.style.display = 'block';
        commentContainer.removeChild(content.nextSibling);
        commentContainer.removeChild(content);
    });
}


// 댓글 삭제
function deleteComment() {
    const commentArea = event.target.closest(".comment-container");
    const boardId = document.getElementById("board-id").value;
    const commentId = commentArea.querySelector("input[name='commentId']").value;

    const xhr = new XMLHttpRequest();
    xhr.open("DELETE", "/boards/" + boardId + "/comments/" + commentId, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            commentArea.classList.add("display-none");
        } else {
            console.error(xhr.responseText);
        }
    };
    xhr.send();
}

// 댓글 등록
const commentCreateButton = document.getElementById('comment-create-btn');
if (commentCreateButton) {
    commentCreateButton.addEventListener('click', event => {
        const boardId = document.getElementById("board-id").value;
        const content = document.getElementById('content').value;
        const parentId = null;

        fetch(`/boards/${boardId}/comments`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                content: content,
                parentId: parentId,
            }),
        }).then(() => {
            location.reload();
        });
    });
}

// 답글 등록
function createChildComment() {
    const childArea = event.target.closest(".child-container");
    const boardId = document.getElementById("board-id").value;
    const content = childArea.querySelector(".child-content").value;
    const parentId = childArea.querySelector("input[name='parentId']").value;

    if (content == "") {
        alert("내용이 비었습니다.")
    } else {
        fetch(`/boards/${boardId}/comments`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                content: content,
                parentId: parentId,
            }),
        }).then(() => {
            location.reload();
        });
    }
}

function toggleChildComment() {
    const commentArea = event.target.closest(".comment-container");
    const childInput = commentArea.querySelector(".child-input");
    if (childInput.classList.contains("display-none")) {
        childInput.classList.remove("display-none");
        childInput.classList.add("display-flex");
    } else {
        childInput.classList.add("display-none");
        childInput.classList.remove("display-flex");
    }
}


/*********************************************************************************************/


// 좋아요 등록
function addLike() {
    const boardId = document.getElementById("board-id").value;
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/boards/" + boardId + "/like", true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            location.reload();
        } else {
            console.error(xhr.responseText);
        }
    };
    xhr.send();
}

// 좋아요 삭제
function deleteLike() {
    const boardId = document.getElementById("board-id").value;
    const xhr = new XMLHttpRequest();
    xhr.open("DELETE", "/boards/" + boardId + "/like", true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            location.reload();
        } else {
            console.error(xhr.responseText);
        }
    };
    xhr.send();
}