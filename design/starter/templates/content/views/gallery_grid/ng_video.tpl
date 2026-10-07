{* v2: themes/app/content/gallery_grid/ng_video.html.twig - the poster as a link that opens the video. Only for a
   video with a file or an identifier. Input: $node, $view_type. *}
{def $gv_dm = $node.data_map
     $gv_title = cond( and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )}
{if or( and( is_set( $gv_dm.video_file ), $gv_dm.video_file.has_content ), and( is_set( $gv_dm.video_file_hd ), $gv_dm.video_file_hd.has_content ), and( is_set( $gv_dm.video_identifier ), $gv_dm.video_identifier.has_content ) )}
    <div class="view-type view-type-{$view_type|wash} ng-video vl3">
        <a href="#" class="js-mfp-item js-video-poster" title="{$gv_title|wash}">
            {include uri='design:content/gallery_parts/video_poster.tpl' gp_dm=$gv_dm gp_lazy=false() gp_alt=$gv_title}
        </a>
    </div>
{/if}
{undef $gv_dm $gv_title}
