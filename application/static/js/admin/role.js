$(function() {
    $("#role_form").keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });

    $('#field_role').blur(function(){
        var role = $("#field_role").val();
        $.ajax({
            type: "POST",
            url: Clips.siteUrl('admin/role/hasRole'),
            dataType: "",
            data: {role:role},
            success : function(data){
                if(data == 'true'){
                    $('#notes').css('display','block');
                    $('#field_role').css('color','#f00;');
                    $('.content a').attr('disabled','disabled');
                }
            }
        });

    });

    $('#field_role').focus(function() {
        $("#notes").css('display','none');
        $('.content a').removeAttr('disabled');
    });

});