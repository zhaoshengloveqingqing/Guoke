$(function() {
    $("#user_form").keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });

    $('#field_username').blur(function(){
        var username = $("#field_username").val();
        $.ajax({
            type: "POST",
            url: Clips.siteUrl('admin/user/hasUser'),
            dataType: "",
            data: {username:username},
            success : function(data){
                if(data == 'true'){
                    $('#notes').css('display','block');
                    $('#field_username').css('color','#f00;');
                    $('.content a').attr('disabled','disabled');
                }
            }
        });

    });

    $('#field_username').focus(function() {
        $("#notes").css('display','none');
        $('.content a').removeAttr('disabled');
    });

});