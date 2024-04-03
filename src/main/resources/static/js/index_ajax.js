function getDailySchedule(date){

    $.ajax({

        url: "schedule/daily",
        type : "GET",
        dataType: "html",
        data : {
            date: date
        },
        success: function (data) {

            $('.schedule-table').html(data);
        },
        error: function (error) {
            console.log(error)
        }
    });
}

function getPlayerRanking(query, type) {

    $.ajax({

        url: "record/ranking",
        type: "GET",
        dataType: "html",
        data: {
            query: query,
            type: type
        },
        success: function (data) {
            $('.player-ranking-table').html(data);
        },
        error: function (error) {
            console.log(error);
        }
    });
}