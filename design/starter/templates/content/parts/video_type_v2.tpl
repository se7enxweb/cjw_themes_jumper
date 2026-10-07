{* The provider of a video as v2's item and gallery views read it (content.fields.video_type.value.identifiers):
   youtube, vimeo, dailymotion, upload, or '' when no option is selected. Unlike the full view's player
   (parts/video_player.tpl), an identifier without a type is NOT taken as YouTube here: v2 draws no preview then.
   video_type keeps the option name or id in data_text, or the id in data_int (1 YouTube, 2 Vimeo,
   3 Dailymotion, 4 uploaded file).
   Input: $vt_dm (data map). Output: the identifier, printed (use it inside set-block). *}
{def $vt_text = cond( is_set( $vt_dm.video_type ), $vt_dm.video_type.data_text|downcase|trim, '' )
     $vt_int = cond( is_set( $vt_dm.video_type ), $vt_dm.video_type.data_int|int, 0 )}
{if $vt_text|eq( '' )}{set $vt_text = $vt_int|string}{/if}
{if or( $vt_text|eq( '1' ), $vt_text|contains( 'youtube' ) )}youtube{elseif or( $vt_text|eq( '2' ), $vt_text|contains( 'vimeo' ) )}vimeo{elseif or( $vt_text|eq( '3' ), $vt_text|contains( 'dailymotion' ) )}dailymotion{elseif or( $vt_text|eq( '4' ), $vt_text|contains( 'upload' ) )}upload{/if}
{undef $vt_text $vt_int}
