{* Full view of ng_audio (v2: app/content/full/ng_audio.html.twig): title, teaser intro, the browser's audio
   player on the file (served by content/download, as v2's ngsite_download route), description.
   part = 'content' (the whole view) or 'content_body'.
   Input: node, part *}
{def $na_part = first_set( $part, 'content' )}
{if or( $na_part|eq( 'content' ), $na_part|eq( 'content_body' ) )}
{def $na_map = $node.data_map}
    <div class="view-type view-type-full ng-audio clearfix">

        <h1 class="page-header"><span class="ezstring-field">{$na_map.title.content|wash}</span></h1>

        {if $na_map.teaser_intro.has_content}
            <div class="short">
                <div class="ezxmltext-field">{$na_map.teaser_intro.content.output.output_text}</div>
            </div>
        {/if}

        {if $na_map.file.has_content}
            <audio controls>
                <source type="audio/mpeg" src={concat( 'content/download/', $node.contentobject_id, '/', $na_map.file.id )|ezurl} />
                {'Your browser does not support the audio element.'|i18n( 'design/starter/media' )}
            </audio>
        {/if}

        {if $na_map.description.has_content}
            <div class="body">
                <div class="ezxmltext-field">{$na_map.description.content.output.output_text}</div>
            </div>
        {/if}

    </div>
{undef $na_map}
{/if}
{undef $na_part}
