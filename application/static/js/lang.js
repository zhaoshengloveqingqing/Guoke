$(function() {
    $('.language-downdrop li').bind('click', function () {
        var lang = $(this).attr('id');
        //location.href = Clips.siteUrl('home/doLang?lang=' + lang);

        $.ajax({
            type: "POST",
            url: Clips.siteUrl('home/doLang'),
            dataType: "",
            data: {lang:lang},
            success : function(data){
                if(data == 'true'){
                    history.go(0);
                }else{
                    alert('error');
                }
            }
        });
    });
});