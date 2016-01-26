$(function() {

    $('#permission input').bind('click',function() {
        var str = $(this).attr('name');

        //if(str.indexOf('index') < 0){
        //   $(this).parent().find('input').eq(0).val(1);
        //}
        var checked=$(this).is(':checked');
        if(checked){
            var v = $(this).parent().find('input').eq(0).val();

            $(this).val(1);
        }else{
            $(this).val(0);
        }
    });


});