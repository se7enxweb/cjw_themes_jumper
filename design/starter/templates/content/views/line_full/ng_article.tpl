{* Item view "line_full_il" of an article (v2: cjw_app/content/line_full/ng_article.html.twig): the whole
   article in a list: title, its images and videos (the full view's related multimedia part), the
   additional image, the body. Parameters: node, view_type. *}
{def $lf_dm = $node.data_map
     $lf_has_rm = and( is_set( $lf_dm.related_multimedia ), $lf_dm.related_multimedia.has_content )}
    <article class="view-type view-type-{first_set( $view_type, 'line_full_il' )|wash} ng-article vl11">

            <h1 class="title"><span class="ezstring-field">{$lf_dm.title.content|wash}</span></h1>

                <div class="col-full-article-images">
                    {if or( and( is_set( $lf_dm.image ), $lf_dm.image.has_content ), $lf_has_rm )}
                            <div class="full-article-image">
                                {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}
                            </div>
                    {/if}
                    {if and( is_set( $lf_dm.additional_image ), is_set( $lf_dm.image ), or( $lf_dm.additional_image.has_content, $lf_has_rm ) )}
                            <div class="full-article-image">
                                {include uri='design:content/parts/image_additional.tpl' ia_node=$node}
                            </div>
                    {/if}
                </div>

                <div class="full-article-content">
                    {if and( is_set( $lf_dm.body ), $lf_dm.body.has_content )}
                            <div class="article-intro">
                                {include uri='design:content/item_parts/xml.tpl' ix_attr=$lf_dm.body}
                            </div>
                    {/if}
                </div>

                <div style="clear: both"></div>

    </article>
{undef $lf_dm $lf_has_rm}
