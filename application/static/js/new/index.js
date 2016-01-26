$(function(){

    $('.search-bar .right a').bind('click',function(){
        var i = $(this).find('i');
        if(i.hasClass("asc")){
            i.removeClass("asc").addClass("des");
        }
        else{
            i.removeClass("des").addClass("asc");
        }
    });

    $('.menubar  a').bind('click',function(){
        $('.menubar  a').removeClass("active");
        $(this).addClass("active");
        var index=$(this).attr("data");
        $('.data-control .data').removeClass("on");
        $('.data-control .'+index).addClass("on");

        var categoryId = $(this).attr('id');
        location.href = Clips.siteUrl('service/index/'+categoryId);
    });

    $('.clips-form .right a').bind('click',function() {
        var categoryId = $('.menubar a[class="active"]').attr('id');
        var orderBy;
        if($(this).attr('id') == 'release_date'){
            orderBy = 'release_date';
        }else if($(this).attr('id') == 'visit_volumn'){
            orderBy = 'visit_volumn';
        }
        location.href = Clips.siteUrl('service/index/'+categoryId+'/'+orderBy);
    });

    $('.clips-form .right #search-submit').bind('click',function() {
        var categoryId = $('.menubar a[class="active"]').attr('id');
        var searchColumn = $('#field_search').val();
        location.href = Clips.siteUrl('service/index/'+categoryId+'/'+searchColumn);
    });

});