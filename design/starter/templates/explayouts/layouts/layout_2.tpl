{* v2: templates/nglayouts/themes/app/layout/layout_2.html.twig *}
    <div class="zone-layout-layout2">
        <section class="zone zone-header">
{if is_set( $zones.header )}{include uri='design:explayouts/zone.tpl' zone=$zones.header}{/if}
        </section>

        <main class="main-content-block">
            <section class="zone zone-post_header">
{if is_set( $zones.post_header )}{include uri='design:explayouts/zone.tpl' zone=$zones.post_header}{/if}
            </section>

            <section class="zone zone-main">
{if is_set( $zones.main )}{include uri='design:explayouts/zone.tpl' zone=$zones.main}{/if}
            </section>

            <section class="zone zone-pre_footer">
{if is_set( $zones.pre_footer )}{include uri='design:explayouts/zone.tpl' zone=$zones.pre_footer}{/if}
            </section>
        </main>

        <section class="zone zone-footer">
{if is_set( $zones.footer )}{include uri='design:explayouts/zone.tpl' zone=$zones.footer}{/if}
        </section>
    </div>
