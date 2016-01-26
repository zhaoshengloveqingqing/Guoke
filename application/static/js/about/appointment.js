$(function(){
    var count=2;
    $('#field_visit_number').bind('focusout',function(){
        var num=$('#field_visit_number').val();
        if(num=="") {
            num=30;
        }
        $('.bottom span i').html(num * 50 + "元");
        $('.bottom #total').val(num * 50);
        $("#visitors .visitor").each(function () {
            if ($(this).index() > num-1) {
                $(this).remove();
            }
        });
        var length = $('#visitors .visitor').length;
        $('.add span i').html(num - length);
    });

    $('.add a').bind('click',function(){
        var length=$('#visitors .visitor').length;
        var num=$('#field_visit_number').val();
        count++;
        if(num==""){
            num=30;
        }
        var total=$('.add span i').html();
        if(total<=0){
            return false;
        }
        var par=$('#visitors');
        var html='<div class="visitor">'+
                    '<div class="row1">'+
                        '<div class="form-group">'+
                            '<label class="col-lg-5 control-label">*用户名</label>'+
                            '<div class="col-lg-4">'+
                                '<input type="text"  name="name'+count+'"  placeholder="与证件名一致" />'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group">'+
                            '<label class="col-lg-5 control-label">*身份证号码</label>'+
                            '<div class="col-lg-4">'+
                                '<input type="text"  name="identity_card'+count+'"  placeholder="请准确填写以确保参观" />'+
                            '</div>'+
                        '</div>'+
                        '<a class="plus" onclick="plus(this)"> <i> </i></a>'+
                    '</div>'+
                    '<div class="row2">'+
                        '<div class="form-group">'+
                        '<label class="col-lg-5 control-label">*公司名称</label>'+
                            '<div class="col-lg-4">'+
                                '<input type="text"  name="company_name'+count+'" placeholder="请输入公司名称" />'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group">'+
                            '<label class="col-lg-5 control-label">*职位信息</label>'+
                            '<div class="col-lg-4">'+
                                '<input type="text"  name="position'+count+'" placeholder="请输入公司名称" />'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>';
        par.append(html);
        $('.add span i').html(num-length-1);
    });


    function getCheckcode(){
        $.ajax({
            type: "POST",
            url: Clips.siteUrl('about/get_checkcode'),
            dataType: "",
            data: {},
            success : function(data){
                if(data){
                    $('.other img').attr('src',data);
                }else{
                    alert('error');
                }
            }
        });
    }
    $('.other a').bind('click',function(){
        getCheckcode();
    });
    getCheckcode();

    $('#checkforaccount').bind('click',function() {
        var checked=$(this).is(':checked');
        if(checked){
            $('#checkforaccount').val(1);
        }else{
            $('#checkforaccount').val(0);
        }
    });


    $('.bottom input').bind('click',function() {

        visit_date = $(':input[name=visit_date]').val();
        visit_number = $(':input[name=visit_number]').val();
        price = $(':input[name=price]').val();
        total_price = $(':input[name=total_price]').val();
        contact = $(':input[name=contact]').val();
        phone = $(':input[name=phone]').val();
        email = $(':input[name=email]').val();
        has_voucher = $('#checkforaccount').val();
        invoice_title = $(':input[name=invoice_title]').val();
        invoice_content = $(':input[name=invoice_content]').val();
        visit_describe = $(':input[name=visit_describe]').val();
        check_code = $(':input[name=check_code]').val();

        var form_check = true;
        if(visit_date == ''){
            $('input[name="visit_date"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(visit_number == '' || visit_number.length != 18){
            $('input[name="visit_number"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(contact == '' || !(/^\d{11}$/.exec(contact))){
            $('input[name="contact"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(phone == ''){
            $('input[name="phone"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(email == '' || !(/^(\W+)(\W|\d)+@(\W|\d)+.\W+$/.exec(email)) ){
            $('input[name="email"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(invoice_title == '' ){
            $('input[name="invoice_title"]').css('border','1px solid #ff0000');
            form_check = false;
        }
        if(check_code == ''){
            $('input[name="check_code"]').css('border','1px solid #ff0000');
            form_check = false;
        }

        $.each($('#visitors .visitor'),function(){
            name = $(this).find(':input[name="name"]').val();
            identity_card = $(this).find(':input[name="identity_card"]').val();
            company_name = $(this).find(':input[name="company_name"]').val();
            position = $(this).find(':input[name="position"]').val();
            if(name == ''){
                $(this).find(':input[name="name"]').css('border','1px solid #ff0000');
                form_check = false;
            }
            if(identity_card == '' || !(/^\d{15}|\d{18}$/.exec(identity_card))){
                $(this).find(':input[name="identity_card"]').css('border','1px solid #ff0000');
                form_check = false;
            }
            if(company_name == ''){
                $(this).find(':input[name="company_name"]').css('border','1px solid #ff0000');
                form_check = false;
            }
            if(position == ''){
                $(this).find(':input[name="position"]').css('border','1px solid #ff0000');
                form_check = false;
            }
        });

        if(form_check){
            var dataAppoint = new Object();
            dataAppoint.visit_date = $(':input[name=visit_date]').val();
            dataAppoint.visit_number = $(':input[name=visit_number]').val();
            dataAppoint.price = $(':input[name=price]').val();
            dataAppoint.total_price = $(':input[name=total_price]').val();
            dataAppoint.contact = $(':input[name=contact]').val();
            dataAppoint.phone = $(':input[name=phone]').val();
            dataAppoint.email = $(':input[name=email]').val();
            dataAppoint.has_voucher = $('#checkforaccount').val();
            dataAppoint.invoice_title = $(':input[name=invoice_title]').val();
            dataAppoint.invoice_content = $(':input[name=invoice_content]').val();
            dataAppoint.visit_describe = $(':input[name=visit_describe]').val();
            dataAppoint.check_code = $(':input[name=check_code]').val();

            var dataAppointRelated = new Array();
            var count = 0;
            $.each($('#visitors .visitor'),function(){
                var dataObj = new Object();
                dataObj.name = $(this).find(':input[name="name"]').val();
                dataObj.identity_card = $(this).find(':input[name="identity_card"]').val();
                dataObj.company_name = $(this).find(':input[name="company_name"]').val();
                dataObj.position = $(this).find(':input[name="position"]').val();
                dataAppointRelated[count] = dataObj;
                count++;
            });

            $.ajax({
                type: "POST",
                url: Clips.siteUrl('about/submit_appointment'),
                dataType: "",
                data: {dataAppoint:dataAppoint,dataAppointRelated:dataAppointRelated},
                success : function(data){
                    if(data){
                        location.href = Clips.siteUrl('about/success');
                    }else{
                        alert('error');
                    }
                }
            });
        }else{
            return false;
        }

    });

});

function plus(obj){
    var par=$(obj).parent().parent('div.visitor');
    par.remove();
    var num=$('#field_visit_number').val();
    if(num==""){
        num=30;
    }
    var length=$('#visitors .visitor').length;
    $('.add span i').html(num-length);
}