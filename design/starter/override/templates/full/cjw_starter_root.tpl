{* The starter root page, wave 0: a placeholder until the port of the Nexus v2 starter design replaces it. *}
<div class="cjw-starter-root">
    <h1>{$node.name|wash}</h1>
    {if eq( ezini( 'RegionalSettings', 'ContentObjectLocale' ), 'ger-DE' )}
        <p class="cjw-starter-placeholder">CJW Starter: die Portierung landet hier in Wellen.</p>
    {else}
        <p class="cjw-starter-placeholder">CJW Starter: the port lands here in waves.</p>
    {/if}
</div>
