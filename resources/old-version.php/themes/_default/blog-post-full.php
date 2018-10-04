
<article class="post">

	<header>
		<h2><a href="<?php printBlogPostLink(); ?>"><?php printBlogPostTitle(); ?></a></h2>
		<a href="<?php printBlogPostAuthorWebsite(); ?>" title="<?php printBlogPostAuthor(); ?>"><img src="<?php printBlogPostAuthorImage(64); ?>" alt="" /></a>
		<a href="<?php printBlogPostAuthorWebsite(); ?>" title="<?php printBlogPostAuthor(); ?>"><?php printBlogPostAuthor(); ?></a>
		,
		<time datetime="<?php printBlogPostDateForHtmlTimeTag(); ?>"><?php printBlogPostDate(); ?></time>
	</header>

<?php printBlogPostContent(); ?>

	<?php if (hasBlogPostResources()) { ?>
		<?php echo '<hr>'; ?>
		<?php printBlogPostResources(); ?>
	<?php } ?>

	<hr>
	<p>
		<a target="_blank" href="<?php printBlogPostShareOnTwiterLink(); ?>">Share on Twitter</a>
	</p>

</article>
