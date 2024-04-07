const columns = document.querySelectorAll(".column");
columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
        animation: 150,
        ghostClass: "blue-background-class"
    });
});

const submitBtn = document.querySelector('.submit-btn');

submitBtn.addEventListener( 'click', () => {

});


$(document).ready(function() {

    $('#lineupForm').submit(function(e) {

        e.preventDefault();
        let lineup = [];
        let type = $('.type').val();
        let team = $('.team').val();
        let gameCode = $('.game-code').val();

        let url = '/lineup/submit?type='+type+'&team='+team;

        $('.lineup-column .list-group-item').each(function(index) {
            let player = {
                id: $(this).find('.id').val(),
                playerId: $(this).find('.player-id').val(),
                teamId: $(this).find('.team-id').val(),
                matchInfoId: $(this).find('.match-info-id').val(),
                order: $(this).find('.order option:selected').val(),
                positionId: $(this).find('.position option:selected').val(),
                name: $(this).find('.player-name').text()
            };

            lineup.push(player);
        });

        $.ajax({

            url: url,
            type: 'POST',
            data: JSON.stringify(lineup),
            contentType: 'application/json',

            success: function(response) {
                alert(response);
                location.replace('/gameresult?gameCode='+gameCode);
            },
            error: function(xhr, status, error) {

            }
        });
    });
});
