{* Full view of ng_frontpage (v2: cjw_app/content/full/ng_frontpage.html.twig).
   part = 'content' (the whole view) or one of the Twig block names content_header, title, intro;
   other names draw nothing. The page content itself comes from the layout's blocks.
   Input: node, part. *}
{def $ff_part = first_set( $part, 'content' )
     $ff_map = $node.data_map}
{def $ff_all = $ff_part|eq( 'content' )
     $ff_head = or( $ff_part|eq( 'content' ), $ff_part|eq( 'content_header' ) )}
{if $ff_all}
    <div class="view-type view-type-full ng_frontpage clearfix">
{/if}
{if $ff_head}
            <header class="full-page-header full-form-header">
            <div class="container">
{/if}
{if or( $ff_head, $ff_part|eq( 'title' ) )}
                    <div class="landing-page-title-container landing-page-home-title">
                        <h1 class="title landing-page-title">
                            <span class="ezstring-field">{$ff_map.title.content|wash}</span>

                            {if is_set( $ff_map.subtitle )}
                                <small><span class="ezstring-field">{$ff_map.subtitle.content|wash}</span></small>
                            {/if}

                        </h1>

                    </div>
{/if}
{if or( $ff_head, $ff_part|eq( 'intro' ) )}
                    {if and( is_set( $ff_map.teaser_intro ), $ff_map.teaser_intro.has_content )}
                        <div class="teaser_intro">
                                <div class="ezxmltext-field">{$ff_map.teaser_intro.content.output.output_text}</div>
                        </div>
                    {/if}
{/if}
{if $ff_head}
            </div>
            </header>
{/if}
{if $ff_all}
    </div>
{/if}
{undef $ff_part $ff_map $ff_all $ff_head}
