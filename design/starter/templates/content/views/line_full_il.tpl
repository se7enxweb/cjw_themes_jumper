{* Item view "line_full_il" (v2 content_view.yml: line_full/ng_article for articles, the line view otherwise). *}
{include uri=cond( $node.class_identifier|eq( 'ng_article' ), 'design:content/views/line_full/ng_article.tpl', 'design:content/views/line.tpl' ) node=$node view_type=first_set( $view_type, 'line_full_il' )}
