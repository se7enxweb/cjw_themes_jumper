{* Item view "line" for classes without their own line template, and the base of the line_* variants (v2:
   cjw_app/content/line.html.twig): image beside the text, on the right (default), the left (ln_position
   'left') or both sides ('chess', the CSS shows one); ln_size 'half' (the line_h variants) makes it 50/50.
   No link when the content has an empty body. Parameters: node, view_type, ln_position, ln_size. *}
{def $lg_vt = first_set( $view_type, 'line' )
     $lg_pos = first_set( $ln_position, 'right' )
     $lg_dm = $node.data_map
     $lg_link = true()
     $lg_col_content = 'col-12 col-sm-12 col-md-6 col-lg-8'
     $lg_col_image = 'col-12 col-sm-12 col-md-6 col-lg-4'}
{if and( is_set( $lg_dm.body ), $lg_dm.body.has_content|not )}{set $lg_link = false()}{/if}
{if or( first_set( $ln_size, '' )|eq( 'half' ), $lg_vt|contains( 'line_h' ) )}
    {set $lg_col_content = 'col-12 col-sm-12 col-md-6 col-lg-6' $lg_col_image = 'col-12 col-sm-12 col-md-6 col-lg-6'}
{/if}
<article class="view-type view-type-{$lg_vt|wash} {$node.class_identifier|explode( '_' )|implode( '-' )} vl4">
    <div class="container">
        <div class="row">
            {if $lg_pos|ne( 'right' )}
                <div class="{$lg_col_image} article-image image-left">
                    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=cond( $lg_link, $node.url_alias|ezurl( 'no' ), '' )}
                </div>
            {/if}

            <div class="{$lg_col_content} article-content">
                <header class="article-header">
                    <h2 class="title">
                        {if $lg_link}<a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a>{else}{include uri='design:content/item_parts/title.tpl' it_node=$node}{/if}
                    </h2>
                </header>
                <div class="short">
                    {if and( is_set( $lg_dm.full_intro ), $lg_dm.full_intro.has_content )}
                        {include uri='design:content/item_parts/xml.tpl' ix_attr=$lg_dm.full_intro}
                    {elseif and( is_set( $lg_dm.teaser_intro ), $lg_dm.teaser_intro.has_content )}
                        {include uri='design:content/item_parts/xml.tpl' ix_attr=$lg_dm.teaser_intro}
                    {/if}
                </div>
            </div>

            {if $lg_pos|ne( 'left' )}
                <div class="{$lg_col_image} article-image image-right">
                    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=cond( $lg_link, $node.url_alias|ezurl( 'no' ), '' )}
                </div>
            {/if}
        </div>
    </div>
</article>
{undef $lg_vt $lg_pos $lg_dm $lg_link $lg_col_content $lg_col_image}
