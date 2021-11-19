<?php
/**
* Plugin Name: cristian.sulea.net
* XPlugin URI: https://cristian.sulea.net/
* Description: Custom functionality for my personal site.
* Author: Cristian Sulea
* Author URI: https://cristian.sulea.net/
* Version: 2.1
**/

add_filter('get_the_archive_title', function ($title) {
    if (is_category()) {
        $title = single_cat_title( '', false );
    }
    return $title;
});

/*
    add_filter( 'get_the_archive_title', function ($title) {    
        if ( is_category() ) {    
                $title = single_cat_title( '', false );    
            } elseif ( is_tag() ) {    
                $title = single_tag_title( '', false );    
            } elseif ( is_author() ) {    
                $title = '<span class="vcard">' . get_the_author() . '</span>' ;    
            } elseif ( is_tax() ) { //for custom post types
                $title = sprintf( __( '%1$s' ), single_term_title( '', false ) );
            } elseif (is_post_type_archive()) {
                $title = post_type_archive_title( '', false );
            }
        return $title;    
    });
**/


// function my_custom_css() {
//     echo '<style id="my-custom-css">' . "\r\n" . file_get_contents( plugins_url( 'cristian.sulea.net.css' , __FILE__ ) ) . "\r\n" . '</style>' . "\r\n";
// }
// add_action( 'wp_head', 'my_custom_css' );


function custom_head_content() {
    //if (is_front_page()) {
    echo file_get_contents(plugin_dir_path( __FILE__ ) . 'ld-json.txt');
    //}
}
add_action('wp_head', 'custom_head_content');
