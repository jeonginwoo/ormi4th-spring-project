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