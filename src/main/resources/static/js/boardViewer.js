const boardContent = document.getElementById('boardContent').value;
const viewer = toastui.Editor.factory({
    el: document.querySelector('#viewer'),
    viewer: true,
    initialValue: boardContent
});