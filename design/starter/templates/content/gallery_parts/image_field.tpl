{* An image field as v2's ezimage field template draws it (lazy loading on): src the tiny cjw_i30 placeholder,
   data-src the alias asked for ("original" for the original), class ezimage-field after any extra class, and
   optionally a second data-src (v2's lazy swiper slides print one; the browser uses the first).
   Input: $gp_image (ezimage attribute content), $gp_alias, $gp_alt; optional $gp_class, $gp_data_src_alias. *}
<img
                                            src="{$gp_image['cjw_i30'].url|ezroot( 'no' )}"
                data-src="{cond( $gp_alias|eq( 'original' ), $gp_image.original.url, $gp_image[$gp_alias].url )|ezroot( 'no' )}"
                                                            alt="{$gp_alt|wash}"
            class="{if first_set( $gp_class, '' )|ne( '' )}{$gp_class|wash} {/if}ezimage-field"{if first_set( $gp_data_src_alias, '' )|ne( '' )} data-src="{$gp_image[$gp_data_src_alias].url|ezroot( 'no' )}"{/if} />
