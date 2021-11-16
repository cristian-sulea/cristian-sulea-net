<?php

add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_styles' );
function my_theme_enqueue_styles() {
    wp_enqueue_style(
        'twenty-twenty-one-child-style',
        get_stylesheet_uri(),
        array( 'twenty-twenty-one-style' ),
        wp_get_theme()->get('Version')
    );
}

add_filter( 'get_the_archive_title', function ($title) {    
if ( is_category() ) {    
            //$title = single_cat_title( '', false );    
        }
    return $title;    
});

/**
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

/**
function my_custom_css() {
    echo '<style id="my-custom-css">' . "\r\n" . file_get_contents( plugins_url( 'cristian.sulea.net.css' , __FILE__ ) ) . "\r\n" . '</style>' . "\r\n";
}
add_action( 'wp_head', 'my_custom_css' );
**/