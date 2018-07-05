<nav class="pure-menu pure-menu-horizontal">
    <ul class="pure-menu-list">
        {foreach $menu as $item}
        <li class="pure-menu-item">
            <a class="pure-menu-link" 
               href="{$item.url}">{$item.name}</a>
        </li>
        {/foreach}
    </ul>
</nav>
