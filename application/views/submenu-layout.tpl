{extends file="bootstrap-layout.tpl"}
{block name="main"}
    {div class="workbench"}
        {div class="submenu-content"}
            {div class="submenu"}
                {div class="title"}
                    {h3}{lang}服务中心{/lang}{/h3}
                {/div}
                {if $type == 'news'}
                    {a uri="service/index" class="active"}{lang}新闻中心{/lang}{/a}
                    {a }{lang}备案服务{/lang}{/a}
                    {a uri="service/download"}{lang}资料下载{/lang}{/a}
                {elseif $type == 'download'}
                    {a uri="service/index"}{lang}新闻中心{/lang}{/a}
                    {a }{lang}备案服务{/lang}{/a}
                    {a uri="service/download" class="active"}{lang}资料下载{/lang}{/a}
                {/if}
            {/div}
            {div class="submenu-maincontent"}
            {block name="content"}
            {/block}
            {/div}
                {div class="clear"}
            {/div}
        {/div}
    {/div}
{/block}