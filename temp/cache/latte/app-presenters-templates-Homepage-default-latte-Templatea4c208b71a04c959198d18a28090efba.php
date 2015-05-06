<?php
// source: C:\xampp\htdocs\zpravodaj\app\presenters/templates/Homepage/default.latte

class Templatea4c208b71a04c959198d18a28090efba extends Latte\Template {
function render() {
foreach ($this->params as $__k => $__v) $$__k = $__v; unset($__k, $__v);
// prolog Latte\Macros\CoreMacros
list($_b, $_g, $_l) = $template->initialize('6fe5fda58f', 'html')
;
// prolog Latte\Macros\BlockMacros
//
// block content
//
if (!function_exists($_b->blocks['content'][] = '_lb95aa49fda8_content')) { function _lb95aa49fda8_content($_b, $_args) { foreach ($_args as $__k => $__v) $$__k = $__v
?><div id="content">
    <h2>Aktuality</h2>
    <section id="aktuality">
<?php $iterations = 0; foreach ($news as $novina) { ?>        <article>
            <header>
                <h3><?php echo Latte\Runtime\Filters::escapeHtml($template->upper($novina->title), ENT_NOQUOTES) ?></h3>
                <p class="date"><?php echo Latte\Runtime\Filters::escapeHtml($template->date($novina->created_at, 'j. n. Y'), ENT_NOQUOTES) ?>
, <?php echo Latte\Runtime\Filters::escapeHtml($novina->category, ENT_NOQUOTES) ?></p>
            </header>
            <div><?php echo Latte\Runtime\Filters::escapeHtml($template->truncate($novina->content, 500), ENT_NOQUOTES) ?></div>
                <p class="autor"><a href="<?php echo Latte\Runtime\Filters::escapeHtml($_control->link("News:show", array($novina->id)), ENT_COMPAT) ?>
">čtěte dále...</a></p>
                <footer>Autor: </footer>
        </article>    
<?php $iterations++; } ?>
    </section>

    <hr>
    <footer>&copy; VIS - Varys Information Service 2015</footer>
</div>
<?php
}}

//
// block scripts
//
if (!function_exists($_b->blocks['scripts'][] = '_lbee1ed31716_scripts')) { function _lbee1ed31716_scripts($_b, $_args) { foreach ($_args as $__k => $__v) $$__k = $__v
;Latte\Macros\BlockMacrosRuntime::callBlockParent($_b, 'scripts', get_defined_vars()) ;
}}

//
// block head
//
if (!function_exists($_b->blocks['head'][] = '_lb786204e864_head')) { function _lb786204e864_head($_b, $_args) { foreach ($_args as $__k => $__v) $$__k = $__v
?><style>
</style>
<?php
}}

//
// end of blocks
//

// template extending

$_l->extends = empty($_g->extended) && isset($_control) && $_control instanceof Nette\Application\UI\Presenter ? $_control->findLayoutTemplateFile() : NULL; $_g->extended = TRUE;

if ($_l->extends) { ob_start();}

// prolog Nette\Bridges\ApplicationLatte\UIMacros

// snippets support
if (empty($_l->extends) && !empty($_control->snippetMode)) {
	return Nette\Bridges\ApplicationLatte\UIMacros::renderSnippets($_control, $_b, get_defined_vars());
}

//
// main template
//
?>

<?php if ($_l->extends) { ob_end_clean(); return $template->renderChildTemplate($_l->extends, get_defined_vars()); }
call_user_func(reset($_b->blocks['content']), $_b, get_defined_vars())  ?>

<?php call_user_func(reset($_b->blocks['scripts']), $_b, get_defined_vars())  ?>


<?php call_user_func(reset($_b->blocks['head']), $_b, get_defined_vars()) ; 
}}