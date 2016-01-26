{extends file="submenu-layout.tpl"}
{block name="content"}
    {div class="title"}
        {h3}{lang}资料下载{/lang}{/h3}
    {/div}
    {div class="downloadcontent"}
        {foreach $downloadFiles as $key => $row}
            {div class="item"}
                {div class="top"}
                    {resimg data-image="{$row->thumbnail}"}
                {/div}
                {div class="bottom"}
                    {span}{$row->name}{/span}
                    {a uri="service/download_file?file_url={$row->path}" name="{$row->path}"}
                        {resimg data-image="/service/iconfont-xiazai.png"}
                    {/a}
                {/div}
            {/div}
        {/foreach}
    {/div}
{/block}