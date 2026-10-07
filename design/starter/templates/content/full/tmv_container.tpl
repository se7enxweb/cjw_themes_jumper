{* Full view of tmv_container, the event feed container (v2 draws it with the article view: its title and an
   empty article body; the event list itself is the tmv_events block, section 8.1 of the plan).
   part = 'content' or the Twig block names content_header, title, content_body; others draw nothing.
   Input: node, part. *}
{def $ft_part = first_set( $part, 'content' )}
{if $ft_part|eq( 'content' )}
    <article class="view-type view-type-full ng-article vf1">
{/if}
{if array( 'content', 'content_header', 'title' )|contains( $ft_part )}
                <h1 class="title"><span class="ezstring-field">{$node.data_map.title.content|wash}</span></h1>
{/if}
{if array( 'content', 'content_body' )|contains( $ft_part )}
            <div class="container">
                <div class="full-article-content">
{* the events of the container, from the extension cjw_tmv when it is active (owner decision Q28) *}
{if ezini_hasvariable( 'ContainerView', 'ShowEventList', 'cjw_tmv.ini' )}{include uri='design:cjw_tmv/container.tpl' node=$node}{/if}
                </div>
            </div>
            <div style="clear: both"></div>
{/if}
{if $ft_part|eq( 'content' )}
    </article>
{/if}
{undef $ft_part}
