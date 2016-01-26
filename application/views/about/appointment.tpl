{extends file="bootstrap-layout.tpl"}
{block name="main"}
    {div class="appointment"}
        {h3}{lang}请填写参观预约信息{/lang}{/h3}
        {form name="about/appointment" method="post" action=""}
            {div class="top"}
                <div class="form-group control-group">
                    <label for="field_visit_date" class="col-lg-5 timelable control-label ">
                        *{lang}预约时间{/lang}
                    </label>
                    <div class="col-lg-4 timeinput">
                        <input class="form-input form-control" id="field_visit_date" name="visit_date" placeholder="请输入此次预约参观时间，例：20150910" aria-invalid="false">
                    </div>
                    <p class="help-block"></p>
                </div>
                <div class="form-group control-group" >
                    <label for="field_visit_number" class="col-lg-5 countlable control-label ">
                        *{lang}参观总人数{/lang}
                    </label>
                    <div class="col-lg-4 countinput">
                        <input class="form-input form-control" id="field_visit_number" name="visit_number" placeholder="请输入此次参观人员总数" type="num" required="" data-validation-required-message="参观人数为整数">
                    </div>
                    <p class="help-block"></p>
                </div>
                {div class="price"}
                    {span class="pricelable"}*{lang}票价{/lang}:{/span}
                    {span class="pricetext"}50{lang}元{/lang}/{lang}位{/lang}{/span}
                    <input name="price" id="price" type="hidden"  value="50"/>
                {/div}
            {/div}
            {div class="message"}
                {h3}{lang}参观人信息{/lang}{/h3}
                {div id="template"}
                    <div class="visitor">
                        <div class="row1">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">*{lang}用户名{/lang}</label>
                                <div class="col-lg-4">
                                    <input type="text"  name="name"  placeholder="与证件名一致" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-5 control-label">*{lang}身份证号码{/lang}</label>
                                <div class="col-lg-4">
                                    <input type="text"  name="identity_card"  placeholder="请准确填写以确保参观" />
                                </div>
                            </div>
                            <a class="plus" onclick="plus(this)"> <i> </i></a>
                        </div>
                        <div class="row2">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">*{lang}公司名称{/lang}</label>
                                <div class="col-lg-4">
                                    <input type="text"  name="company_name" placeholder="请输入公司名称" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-5 control-label">*{lang}职位信息{/lang}</label>
                                <div class="col-lg-4">
                                    <input type="text"  name="position" placeholder="请输入公司名称" />
                                </div>
                            </div>
                        </div>
                    </div>
                {/div}
                {div id="visitors"}
                    {div class="visitor"}
                        {div class="row1"}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}用户名{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="name"  placeholder="与证件名一致" />
                                {/div}
                            {/div}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}身份证号码{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="identity_card"  placeholder="请准确填写以确保参观" />
                                {/div}
                            {/div}
                            {a class="plus" onclick="plus(this)"}{i}{/i}{/a}
                        {/div}
                        {div class="row2"}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}公司名称{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="company_name" placeholder="请输入公司名称" />
                                {/div}
                            {/div}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}职位信息{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="position" placeholder="请输入职位信息" />
                                {/div}
                            {/div}
                        {/div}
                    {/div}
                    {div class="visitor"}
                        {div class="row1"}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}用户名{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="name"  placeholder="与证件名一致" />
                                {/div}
                            {/div}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}身份证号码{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="identity_card"  placeholder="请准确填写以确保参观" />
                                {/div}
                            {/div}
                            {a class="plus" onclick="plus(this)"}{i}{/i}{/a}
                        {/div}
                        {div class="row2"}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}公司名称{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="company_name" placeholder="请输入公司名称" />
                                {/div}
                            {/div}
                            {div class="form-group"}
                                <label class="col-lg-5 control-label">*{lang}职位信息{/lang}</label>
                                {div class="col-lg-4"}
                                    <input type="text"  name="position" placeholder="请输入职位信息" />
                                {/div}
                            {/div}
                        {/div}
                    {/div}
                {/div}
                {div class="add"}
                    {a}{b}+{/b}&nbsp;{lang}添加一位参观人{/lang}{/a}{span}{lang}还能添加{/lang} {i}28{/i} {lang}位参观人{/lang}{/span}
                {/div}
                {h3}{lang}联系人信息{/lang}{span}{lang}请填写有效联系电话{/lang}，{lang}以便后续与您联系{/lang}。{/span}{/h3}
                {div class="contact"}
                    {div class="row1"}
                        <div class="form-group control-group">
                            <label for="field_contact" class="col-lg-5 nicknamelable control-label ">
                                *{lang}联系姓名{/lang}
                            </label>
                            <div class="col-lg-4 nicknameinput">
                                <input class="form-input form-control" id="field_contact" name="contact" placeholder="请输入联系姓名">
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group control-group">
                            <label for="field_phone" class="col-lg-5 phonelable control-label ">
                                *{lang}手机号码{/lang}
                            </label>
                            <div class="col-lg-4 phoneinput">
                                <input class="form-input form-control" id="field_phone" name="phone" placeholder="请准确填写以确保接收反馈信息">
                            </div>
                            <p class="help-block"></p>
                        </div>
                        {a}{lang}验证{/lang}{/a}
                    {/div}
                    {div class="row3"}
                        <div class="form-group control-group">
                            <label for="field_validate" class="col-lg-5 validatelable control-label ">
                                ggg
                            </label>
                            <div class="col-lg-4 validateinput">
                                <input class="form-input form-control" id="field_validate" name="validate" placeholder="请输入收到的验证码" aria-invalid="false">
                            </div>
                            <p class="help-block"></p>
                        </div>
                    {/div}
                    {div class="row2"}
                        <div class="form-group control-group">
                            <label for="field_email" class="col-lg-5 maillable control-label ">
                                *{lang}电子邮箱{/lang}
                            </label>
                            <div class="col-lg-4 mailinput">
                                <input class="form-input form-control" id="field_email" name="email" placeholder="请准确填写以确保接收预约反馈信息">
                            </div>
                            <p class="help-block"></p>
                        </div>
                    {/div}
                {/div}
                {h3}{lang}报销信息{/lang}{/h3}
                {div class="accountfor"}
                    <label class="checkforaccount">
                        <input name="has_voucher" id="checkforaccount" type="checkbox" checked="checked" value="1"/>{lang}需要报销凭证{/lang}
                    </label>
                    {div class="row1"}
                        <div class="form-group control-group">
                            <label for="field_invoice_title" class="col-lg-5 invoicetitlelable control-label ">
                                *{lang}发票抬头{/lang}
                            </label>
                            <div class="col-lg-4 invoicetitleinput">
                                <input class="form-input form-control" id="field_invoice_title" name="invoice_title" placeholder="请输入发票抬头" aria-invalid="false">
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group control-group">
                            <label for="field_invoice_content" class="col-lg-5 invoicecontentlable control-label ">
                                {lang}发票内容{/lang}
                            </label>
                            <div class="col-lg-4 invoicecontentinput">
                                <input class="form-input form-control" id="field_invoice_content" name="invoice_content" placeholder="请输入发票内容">
                            </div>
                            <p class="help-block"></p>
                        </div>
                    {/div}
                {/div}
                {h3}{lang}其他信息{/lang}{/h3}
                {div class="other"}
                    {div class="row1"}
                        <div class="form-group control-group">
                            <label for="field_visit_describe" class="col-lg-5 isitinstructionlable control-label ">
                                {lang}参观说明{/lang}
                            </label>
                            <div class="col-lg-4 isitinstructioninput">
                                <textarea class="form-input form-control" id="field_visit_describe" name="visit_describe" placeholder="请输入参观说明" aria-invalid="false"></textarea>
                            </div>
                            <p class="help-block"></p>
                        </div>
                    {/div}
                    {div class="row2"}
                        <div class="form-group control-group">
                            <label for="field_check_code" class="col-lg-5 identifycodelable control-label ">
                                *{lang}验证码{/lang}
                            </label>
                            <div class="col-lg-4 identifycodeinput">
                                <input class="form-input form-control" id="field_check_code" name="check_code" placeholder="请输入验证码">
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <img style="-webkit-user-select: none" src="">
                        {a url=""}{lang}点击刷新{/lang}{/a}
                    {/div}
                {/div}
            {/div}
            {div class="bottom"}
                {span}{lang}此次参观总费用{/lang}：{i}100{lang}元{/lang}{/i}{/span}
                <input name="total_price" id="total" type="hidden"  value=""/>
                <input type="submit" value="{lang}马上预约{/lang}" />
            {/div}
        {/form}
    {/div}
{/block}