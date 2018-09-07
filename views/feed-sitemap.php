<?php
/**
 * XML Sitemap Index Feed Template
 *
 * @package XML Sitemap Feed plugin for WordPress
 */

if ( ! defined( 'WPINC' ) ) die;

?>
<?xml version="1.0" encoding="<?php echo get_bloginfo('charset'); ?>"?>
<?xml-stylesheet type="text/xsl" href="<?php echo plugins_url('views/styles/sitemap-index.xsl',XMLSF_BASENAME); ?>?ver=<?php echo XMLSF_VERSION; ?>"?>
<?php xmlsf_get_generator(); ?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
		http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd">
	<sitemap>
		<loc><?php echo xmlsf_get_index_url('home'); ?></loc>
		<lastmod><?php echo mysql2date('Y-m-d\TH:i:s+00:00', get_lastpostdate( 'gmt' ), false); ?></lastmod>
	</sitemap>
<?php
// add rules for public post types
$post_types = apply_filters( 'xmlsf_post_types', get_option( 'xmlsf_post_types' ) );
if ( is_array($post_types) ) :
foreach ( $post_types as $post_type => $settings ) {
	if ( empty($settings['active']) )
		continue;

	$archive = isset($settings['archive']) ? $settings['archive'] : '';

	foreach ( xmlsf_get_archives($post_type,$archive) as $m => $url ) {
?>
	<sitemap>
		<loc><?php echo $url; ?></loc>
		<lastmod><?php echo mysql2date('Y-m-d\TH:i:s+00:00', get_lastmodified( 'gmt', $post_type, $m ), false); ?></lastmod>
	</sitemap>
<?php
	}
};
endif;

// add rules for public taxonomies
$taxonomies = get_option( 'xmlsf_taxonomies' );
if ( is_array( $taxonomies ) ) :
foreach ( $taxonomies as $taxonomy ) {
	$count = wp_count_terms( $taxonomy, array('hide_empty'=>true) );
	if ( !is_wp_error($count) && $count > 0 ) {
?>
	<sitemap>
		<loc><?php echo xmlsf_get_index_url('taxonomy',$taxonomy); ?></loc>
		<?php xmlsf_the_lastmod('taxonomy',$taxonomy); ?></sitemap>
<?php
	}
};
endif;

// custom URLs sitemap
if ( !empty( apply_filters( 'xmlsf_custom_urls', get_option('xmlsf_urls') ) ) ) {
?>
	<sitemap>
		<loc><?php echo xmlsf_get_index_url('custom'); ?></loc>
	</sitemap>
<?php
}

// custom sitemaps
$custom_sitemaps = apply_filters( 'xmlsf_custom_sitemaps', get_option('xmlsf_custom_sitemaps', array()) );
if ( is_array($custom_sitemaps) ) :
foreach ( $custom_sitemaps as $url ) {
	if (empty($url))
		continue;
?>
	<sitemap>
		<loc><?php echo esc_url($url); ?></loc>
	</sitemap>
<?php
}
endif;
?></sitemapindex>
<?php xmlsf_get_usage(); ?>
