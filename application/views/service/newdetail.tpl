{extends file="submenu-layout.tpl"}
{block name="content"}
    {div class="title"}
        {h3}新闻中心{/h3}
    {/div}
    {div class="menubar"}
        {foreach $newsLists as $key => $row}
            {a id={$row->id}}{$row->name}{/a}
        {/foreach}
    {/div}
    {div class="newdetail" id={$newsDetail->id}}
        {h3 class="articletitle"}{$newsDetail->title}{/h3}
        {p class="recode"}{span class="date"}发布时间：{$newsDetail->release_date}{/span}{span class="times"}浏览：{$newsDetail->visit_volumn}次{/span}{/p}
        {div class="article"}
            {p style="text-align:left;"}
                {$newsDetail->content}
            {/p}
            {resimg style="width:500px;height:320px" data-image="{{$newsDetail->image_url}}"}
        {/div}
        {p class="pre"}{span}{lang}上一篇{/lang}{i class="asc"}{/i}{/span}{a }苏州国科综合数据中心有限公司生日{/a}{/p}
        {p class="next"}{span}{lang}下一篇{/lang}{i class="des"}{/i}{/span}{a}苏州国科综合数据中心有限公司生日{/a}{/p}
    {/div}
    {div class="articles"}
        {p}相关文章>>{/p}
        {listview class="items"}
            {li class="item listview_item_template"}
                {resimg data-image="/news/pic3.png"}
                {p}苏州国科综合数据中心有限公司主办的“招商载体开放日{/p}
            {/li}
            {li class="item listview_item_template"}
                {resimg data-image="/news/pic3.png"}
                {p}苏州国科综合数据中心有限公司主办的“招商载体开放日{/p}
            {/li}
            {li class="item listview_item_template"}
                {resimg data-image="/news/pic3.png"}
                {p}苏州国科综合数据中心有限公司主办的“招商载体开放日{/p}
            {/li}
            {li class="item listview_item_template"}
                {resimg data-image="/news/pic3.png"}
                {p}苏州国科综合数据中心有限公司主办的“招商载体开放日{/p}
            {/li}
        {/listview}
    {/div}
{/block}