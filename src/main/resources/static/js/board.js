
// 게시글 삭제
const deleteButton = document.getElementById('board-delete-btn');
if (deleteButton) {
    deleteButton.addEventListener('click', event => {
        let id = document.getElementById('board-id').value;
        let team = document.getElementById('team').value;
        fetch(`/boards/${id}`, {
            method: 'DELETE'
        }).then(() => {
            alert('삭제가 완료되었습니다');
            location.replace('/boards?team='+team);
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
            const likeArea = commentContainer.querySelector(".like-area");
            const editContent = document.createElement('textarea');
            editContent.classList.add('update-content');
            editContent.value = content.innerText;
            content.style.display = 'none';
            likeArea.style.display = 'none';

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
                    likeArea.style.display = 'block';
                    commentContainer.removeChild(editContent);
                    commentContainer.removeChild(updateBtnAlign);
                }
            });

            const cancelBtn = document.createElement('button');
            cancelBtn.innerText = '취소';
            cancelBtn.addEventListener('click', function() {
                content.style.display = 'block';
                likeArea.style.display = 'block';
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
        const likeArea = commentContainer.querySelector(".like-area");
        originalContent.style.display = 'block';
        likeArea.style.display = 'block';
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
            reloadWithScrollPositionFixed();
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
            reloadWithScrollPositionFixed();
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
    const likeArea = event.target.closest(".like-area"); // 좋아요 영역
    const boardId = document.getElementById("board-id").value;
    const contentId = likeArea.querySelector("input[name='contentId']").value;
    const contentType = likeArea.querySelector("input[name='contentType']").value;

    fetch(`/boards/${boardId}/like`, {
        method: 'POST',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            contentId: contentId,
            contentType: contentType,
        }),
    }).then(() => {
        // 좋아요 버튼 모양 변경 및 좋아요 수 증가
        const likeButton = likeArea.querySelector("button");
        likeButton.innerHTML = "❤️";
        likeButton.setAttribute("onclick", "deleteLike()");
        const likeNumSpan = likeArea.querySelector("span");
        likeNumSpan.textContent = parseInt(likeNumSpan.textContent) + 1;
    }).catch(error => {
        console.error('Error adding like:', error);
    });
}

// 좋아요 삭제
function deleteLike() {
    const likeArea = event.target.closest(".like-area"); // 좋아요 영역
    const boardId = document.getElementById("board-id").value;
    const contentId = likeArea.querySelector("input[name='contentId']").value;
    const contentType = likeArea.querySelector("input[name='contentType']").value;

    fetch(`/boards/${boardId}/like`, {
        method: 'DELETE',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            contentId: contentId,
            contentType: contentType,
        }),
    }).then(() => {
        // 좋아요 버튼 모양 변경 및 좋아요 수 감소
        const likeButton = likeArea.querySelector("button");
        likeButton.innerHTML = "🖤";
        likeButton.setAttribute("onclick", "addLike()");
        const likeNumSpan = likeArea.querySelector("span");
        likeNumSpan.textContent = parseInt(likeNumSpan.textContent) - 1;
    }).catch(error => {
        console.error('Error deleting like:', error);
    });
}


function reloadWithScrollPositionFixed() {
    // 페이지를 떠날 때 스크롤 위치를 세션 스토리지에 저장
    window.addEventListener('beforeunload', function() {
        sessionStorage.setItem('scrollPosition', window.scrollY);
    });

    location.reload();

    // 페이지를 로드할 때 세션 스토리지에서 스크롤 위치를 가져와 설정
    window.addEventListener('load', function() {
        var scrollPosition = sessionStorage.getItem('scrollPosition');
        if (scrollPosition !== null) {
            window.scrollTo(0, parseInt(scrollPosition));
        }
    });
}