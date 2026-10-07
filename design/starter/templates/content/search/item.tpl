{* One search hit (v2: themes/app/content/search.html.twig, view type "search"). Parameter: node.
   The image is the lazy one of v2 (the cjw_i30 placeholder, cjw_i320 in data-src, loaded by the design's script).
   "Type:" and "Last updated:" stay English, as v2 shows them; the type is v2's content type name, translated in
   context design/starter/classes. The date is written with English month names, as v2 does. *}
{def $si_obj = $node.object
     $si_map = $node.data_map
     $si_url = $node.url_alias|ezurl( 'no' )
     $si_title = $node.name
     $si_image = false()
     $si_months = array( 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' )
     $si_types = hash( 'ng_article', 'Article', 'ng_news', 'News', 'ng_banner', 'Banner', 'ng_landing_page', 'Landing page',
                       'ng_gallery', 'Gallery', 'ng_container', 'Container', 'ng_shortcut', 'Shortcut', 'ng_htmlbox', 'HTML box',
                       'ng_category', 'Category', 'file', 'File', 'image', 'Image', 'ng_video', 'Video', 'ng_audio', 'Audio',
                       'ng_frontpage', 'Frontpage', 'ng_feedback_form', 'Feedback form', 'ng_blog_post', 'Blog post',
                       'cjw_feedback_form', 'Advanced feedback form', 'ng_recipe', 'Recipe' )}
{foreach array( 'teaser_title', 'title', 'name' ) as $si_id}
    {if and( is_set( $si_map[$si_id] ), $si_map[$si_id].has_content )}{set $si_title = $si_map[$si_id].content}{break}{/if}
{/foreach}
{foreach array( 'teaser_image', 'image' ) as $si_id}
    {if and( is_set( $si_map[$si_id] ), $si_map[$si_id].data_type_string|eq( 'ezimage' ), $si_map[$si_id].has_content )}{set $si_image = $si_map[$si_id]}{break}{/if}
{/foreach}
{def $si_mod = $si_obj.modified}


<article class="view-type view-type-search {$node.class_identifier|explode( '_' )|implode( '-' )} vl7">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
            <div class="article-content">
                {if $si_image}
            <figure class="image">
            <a href="{$si_url|wash}"
                                                                                aria-label="{$si_title|wash}"
            ><img
                                            src="{$si_image.content['cjw_i30'].url|ezroot( 'no' )|wash}"
                data-src="{$si_image.content['cjw_i320'].url|ezroot( 'no' )|wash}"
                                                            alt="{cond( first_set( $si_image.content.alternative_text, '' )|ne( '' ), $si_image.content.alternative_text, $si_title )|wash}"
            class="ezimage-field" /></a>
        </figure>
                {/if}

                <div class="article-content-text">
                    <header class="article-header">
                        <h2 class="title"><a href="{$si_url|wash}">{$si_title|wash}</a></h2>
                        <div class="info">
                            <time>Last updated: {$si_months[$si_mod|datetime( 'custom', '%n' )|dec]} {$si_mod|datetime( 'custom', '%j%S, %Y %H:%i' )}</time>
                        </div>
                    </header>
                    <div class="short">
                        {if and( is_set( $si_map.teaser_intro ), $si_map.teaser_intro.has_content )}
                            <div class="ezxmltext-field">{$si_map.teaser_intro.content.output.output_text}</div>
                        {elseif and( is_set( $si_map.full_intro ), $si_map.full_intro.has_content )}
                            <div class="ezxmltext-field">{$si_map.full_intro.content.output.output_text}</div>
                        {elseif and( is_set( $si_map.body ), $si_map.body.has_content )}
                            {$si_map.body.content.output.output_text|strip_tags|trim|shorten( 210 )|wash}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
            <div class="additional-info">
                <div class="type">
                    <label>
                        Type:
                    </label>
                    {first_set( $si_types[$node.class_identifier], $node.class_name )|i18n( 'design/starter/classes' )|wash}
                </div>

            </div>
        </div>
    </div>
</article>
{undef $si_obj $si_map $si_url $si_title $si_image $si_months $si_types $si_mod}
