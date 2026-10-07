{* Item view "line_30_70_il" (v2 content_view.yml: line_x_y/ng_article for articles, line_x_y otherwise). *}
{include uri=cond( $node.class_identifier|eq( 'ng_article' ), 'design:content/views/line_x_y/ng_article.tpl', 'design:content/views/line_x_y.tpl' ) node=$node view_type=first_set( $view_type, 'line_30_70_il' )}
