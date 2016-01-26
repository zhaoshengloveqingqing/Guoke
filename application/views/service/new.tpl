{extends file="submenu-layout.tpl"}
{block name="content"}
    {div class="title"}
        {h3}{lang}新闻中心{/lang}{/h3}
    {/div}
    {div class="banner"}
        {div class="swiper-container swiper-banner"}
            {div class="swiper-wrapper res-row"}
                {*{div class="swiper-slide  swiper-content"}*}
                    {*{resimg data-image="support_banner.png"}*}
                {*{/div}*}
                {foreach $banners as $key => $row}
                    {foreach $row->path as $val}
                        {div class="swiper-slide  swiper-content"}
                            {resimg data-image="$val"}
                        {/div}
                    {/foreach}
                {/foreach}
            {/div}
            {div class="swiper-pagination"}{/div}
            {div class="swiper-button-prev span"}{span}{/span}{/div}
            {div class="swiper-button-next span"}{span}{/span}{/div}
        {/div}
    {/div}
    {div class="search-bar"}
        {form name="new/new" action='service/index' methos="post"}
            {div class="left"}
                {h3}NEWS{/h3}
            {/div}
            {div class="right"}
                {a id="release_date" class="orderbydate"}{lang}按日期{/lang}{/a}
                {a id="visit_volumn" class="orderbyread"}{lang}按浏览次数{/lang}{/a}
                {field field="search" label-class="searchlable" input-class="searchinput"}{/field}
                {submit id="search-submit" value="" class="search"}
            {/div}
            {div class="clear"}
            {/div}
        {/form}
    {/div}
    {div class="menubar" }
        {foreach $categoryLists as $key => $row}
            {if $categoryId == 0 && $key == 0}
                {a id="{$row->id}" class="active"}{$row->name}{/a}
            {elseif $key == 0 && $row->id == $categoryId}
                {a id="{$row->id}" class="active"}{$row->name}{/a}
            {elseif $row->id == $categoryId}
                {a id="{$row->id}" class="active"}{$row->name}{/a}
            {else}
                {a id="{$row->id}"}{$row->name}{/a}
            {/if}
        {/foreach}
    {/div}
    {div class="newslists"}
        {listview class="items" id='new' name='new'}
            {li class="item listview_item_template" id="_(article_id)"}
                {resimg data-image="_(image_image_url)"}
                {a uri="service/news_detail/_(article_id)"}{span class="articletitle"}_(article_title){/span}{/a}
                {span class="articledate"}_(article_release_date){/span}
                {span class="readnum"}浏览：_(article_visit_volumn)次{/span}
            {/li}
        {/listview}
    {/div}
{/block}