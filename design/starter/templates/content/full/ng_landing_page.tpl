{* Full view of ng_landing_page (v2: cjw_app/content/full/ng_landing_page.html.twig), also used for ng_container
   (cjw_app/content/full/ng_container.html.twig: the same markup without the .container around the header).
   part = 'content' (the whole view) or one of the Twig block names content_header, title, intro, body;
   other names draw nothing. The page content itself comes from the layout's blocks.
   Input: node, part, lp_container (true: the header in a .container, as ng_landing_page; default true). *}
{def $lp_part = first_set( $part, 'content' )
     $lp_map = $node.data_map
     $lp_wrap = first_set( $lp_container, true() )}
{def $lp_all = $lp_part|eq( 'content' )
     $lp_head = or( $lp_part|eq( 'content' ), $lp_part|eq( 'content_header' ) )}
{if and( $lp_head, $lp_wrap )}
            <div class="container">
{/if}
{if or( $lp_head, $lp_part|eq( 'title' ) )}
                    <div class="landing-page-title-container">
                        <h1 class="title landing-page-title">
                            <span class="ezstring-field">{$lp_map.title.content|wash}</span>

                            {if is_set( $lp_map.subtitle )}
                                <small><span class="ezstring-field">{$lp_map.subtitle.content|wash}</span></small>
                            {/if}

                        </h1>

                    </div>
{/if}
{if or( $lp_head, $lp_part|eq( 'intro' ) )}
                    <div class="full-page-intro">

                        {if and( is_set( $lp_map.full_intro ), $lp_map.full_intro.has_content )}
                            <div class="ezxmltext-field">{$lp_map.full_intro.content.output.output_text}</div>
                        {/if}
                    </div>
{/if}
{if and( $lp_head, $lp_wrap )}
            </div>
{/if}
{if or( $lp_all, $lp_part|eq( 'body' ) )}
        <div class="view-type view-type-full ng-landing-page clearfix">

        </div>
{/if}
{undef $lp_part $lp_map $lp_wrap $lp_all $lp_head}
