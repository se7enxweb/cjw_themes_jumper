{* v2: templates/nglayouts/themes/app/layout/layout_4.html.twig *}
    <div class="zone-layout-layout4">
        <div class="top-content-block">
            <section class="zone zone-header">
{if is_set( $zones.header )}{include uri='design:explayouts/zone.tpl' zone=$zones.header}{/if}
            </section>
        </div>

        <main class="main-content-block">
            <section class="zone zone-post_header">
{if is_set( $zones.post_header )}{include uri='design:explayouts/zone.tpl' zone=$zones.post_header}{/if}
            </section>

            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <section class="zone zone-left">
{if is_set( $zones.left )}{include uri='design:explayouts/zone.tpl' zone=$zones.left}{/if}
                        </section>
                    </div>
                    <div class="col-lg-4">
                        <section class="zone zone-right">
{if is_set( $zones.right )}{include uri='design:explayouts/zone.tpl' zone=$zones.right}{/if}
                        </section>
                    </div>
                </div>
            </div>

            <section class="zone zone-pre_footer">
{if is_set( $zones.pre_footer )}{include uri='design:explayouts/zone.tpl' zone=$zones.pre_footer}{/if}
            </section>
        </main>

        <div class="bottom-content-block">
            <section class="zone zone-footer">
{if is_set( $zones.footer )}{include uri='design:explayouts/zone.tpl' zone=$zones.footer}{/if}
            </section>
        </div>
    </div>
