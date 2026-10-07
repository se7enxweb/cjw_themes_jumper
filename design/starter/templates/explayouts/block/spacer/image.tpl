{* v2: NetgenLayoutsExtendedBundle/Resources/blocks/spacer/image.html.twig: one of the configured vignettes
   (v2 stored the asset path, e.g. bundles/app/images/grafiken/vignette-zeesboot-blau.png; the design image of the
   same name is used), aligned by the block's "align". Nothing without an image. *}
{def $si_parts = first_set( $block.parameters.image, '' )|explode( 'grafiken/' )}
{if $si_parts|count|gt( 1 )}
        <div class="spacer {first_set( $block.parameters.align, '' )|wash} image">
            <img src={concat( 'grafiken/', $si_parts[$si_parts|count|dec] )|ezimage} alt="" />
        </div>
{/if}
{undef $si_parts}
