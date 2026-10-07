{* v2: templates/nglayouts/themes/app/layout/layout_1.html.twig *}
    <div class="zone-layout-layout1">
        <main class="main-content-block">
            <section class="zone zone-main">
{if is_set( $zones.main )}{include uri='design:explayouts/zone.tpl' zone=$zones.main}{/if}
            </section>
        </main>
    </div>
