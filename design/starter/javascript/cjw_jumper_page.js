/*
 * The starter design's page script (v2: themes/cjw_app/page_head_script.html.twig), moved out of the inline script
 * of pagelayout/head/script_inline.tpl so the pages work under a Content Security Policy without 'unsafe-inline':
 * toggle blocks, the chess teaser hover, fancybox PDF links, the jQuery UI datepicker (its button image from
 * <meta name="cjw-jumper-datepicker-button">), the speech bubble of the header (links with data-cjw-bubble="close" /
 * "open"; closeBubble() and showBubble() stay global) and the Leaflet map of a location field
 * (content/parts/leaflet_map_single.tpl, data-cjw-leaflet). Loaded in the page head by pagelayout/head/script.tpl.
 */
    jQuery(document).ready(function(){

        jQuery( '.toggle-block.hide-me.state-opened' ).removeClass( 'state-opened' ).addClass( 'state-closed' );

        //jQuery( '.hide-me' ).hide();

      jQuery( '.toggle-block .control' ).on( 'click', function() {
          block = jQuery( this ).parent();

          isOpen      = false;
          closeOthers = false;

          if ( block.hasClass( 'close-others' ) ) {
              closeOthers = true;
          }

          if ( block.hasClass( 'state-opened' ) ) {
              isOpen = true;
          }

          if ( isOpen ) {
              block.removeClass( 'state-opened' );
              block.addClass( 'state-closed' );
          } else {
              if ( closeOthers ) {
                  jQuery( '.toggle-block' ).removeClass( 'state-opened' ).addClass( 'state-closed' );
                  // jQuery( '.toggle-block' ).addClass( 'state-closed' );
              }

              block.removeClass( 'state-closed' );
              block.addClass( 'state-opened' );
          }
      });

      jQuery( '.toggle-block .control-section' ).on( 'click', function() {
            block = jQuery( this ).parent();

            isOpen      = false;
            closeOthers = false;

            if ( block.hasClass( 'close-others' ) ) {
                closeOthers = true;
            }

            if ( block.hasClass( 'state-opened' ) ) {
                isOpen = true;
            }

            if ( isOpen ) {
                block.removeClass( 'state-opened' );
                block.addClass( 'state-closed' );
            } else {
                if ( closeOthers ) {
                    jQuery( '.toggle-block' ).removeClass( 'state-opened' ).addClass( 'state-closed' );
                    // jQuery( '.toggle-block' ).addClass( 'state-closed' );
                }

                block.removeClass( 'state-closed' );
                block.addClass( 'state-opened' );
            }
        });

      jQuery( '.view-type-teaser_bg_matrix.chess .bottom, .view-type-teaser_bg_white.chess .bottom' ).each( function() {
            jQuery( this ).css( 'height', '10rem' );
        });

      jQuery( '.view-type-teaser_bg_matrix.chess, .view-type-teaser_bg_white.chess' ).on( 'mouseenter', function() {
            if ( !jQuery( this ).hasClass( 'ng-author' ) ) {
                jQuery( this ).find( '.bottom' ).addClass( 'full-size' );
            }
        });

      jQuery('.view-type-teaser_bg_matrix.chess, .view-type-teaser_bg_white.chess').on('mouseleave', function() {
            jQuery(this).find('.bottom').removeClass('full-size');
        });

      if ( jQuery().fancybox ) {
          jQuery( "a.fancybox-pdf" ).fancybox( { iframe : {
                                                        preload : false
                                                    }
                                             }
          );
      }

      if ( jQuery().datepicker ) {
            var dateDisplayFormat = 'dd.mm.yy';
            var today = new Date();
            var travelDate = new Date( today.getFullYear(), today.getMonth(), today.getDate());

            // Standard "Bis"-Zeit
            var nextWeek = new Date( travelDate.getFullYear(), travelDate.getMonth(), travelDate.getDate()+7);

            // datepicker Sprache setzen
            jQuery.datepicker.setDefaults( jQuery.datepicker.regional[ "de" ] );

            formatedDateToday    = jQuery.datepicker.formatDate( dateDisplayFormat, today );
            formatedDateNextWeek = jQuery.datepicker.formatDate( dateDisplayFormat, nextWeek );

            lastOpenDatePicker         = 'from';
            showOtherDatepickerCounter = 0;

            jQuery('.datepicker').datepicker({
                dateFormat:        dateDisplayFormat,
                showOn:            'both',
                buttonImage:       jQuery( 'meta[name="cjw-jumper-datepicker-button"]' ).attr( 'content' ),
                buttonImageOnly:   true,
                minDate:           0,
                showWeek:          true,
                showOtherMonths:   true,
                selectOtherMonths: true,
                beforeShow:        function( input, obj ) {
                                        //jQuery( input ).addClass( 'datepicker-open' );
                                   },
                onClose:           function( value, obj ) {
                                        showOtherDatepickerCounter = showOtherDatepickerCounter + 1;

                                        id   = obj.id;
                                        jObj = jQuery( '#' + id );
                                        form = jQuery( jObj.parents( 'form' ).get( 0 ) );

                                        jObj.removeClass( 'datepicker-open' );

                                        if ( showOtherDatepickerCounter < 2 ) {
                                            selectedDate = new Date( value.split( '.' ).reverse().join( '-' ) );

                                            if ( jObj.hasClass( 'from' ) ) {
                                                jObjTo = jQuery( form.find( '.to' ).get( 0 ) );
                                                to     = jObjTo.val();

                                                selectedToDate = new Date( to.split( '.' ).reverse().join( '-' ) );

                                                if ( selectedToDate.getTime() <= selectedDate.getTime() ) {
                                                    newTo = selectedDate.addDays( 1 );
                                                    newTo = jQuery.datepicker.formatDate( dateDisplayFormat, newTo );

                                                    jObjTo.datepicker( 'setDate', newTo );
                                                }

                                                jObjTo.datepicker( 'option', 'minDate', selectedDate.addDays( 1 ) );
                                                jObjTo.datepicker( 'show' );

                                                lastOpenDatePicker = 'from';
                                            } else if ( jObj.hasClass( 'to' ) ) {
                                                jObjFrom = jQuery( form.find( '.from' ).get( 0 ) );
                                                from     = jObjFrom.val();

                                                selectedFromDate = new Date( from.split( '.' ).reverse().join( '-' ) );

                                                if ( selectedFromDate.getTime() >= selectedDate.getTime() ) {
                                                    newFrom = selectedDate.subDays( 1 );
                                                    newFrom = jQuery.datepicker.formatDate( dateDisplayFormat, newFrom );

                                                    jObjFrom.datepicker( 'setDate', newFrom );
                                                }

                                                jObjFrom.datepicker( 'option', 'maxDate', selectedDate.subDays( 1 ) );
                                                jObjFrom.datepicker( 'show' );

                                                lastOpenDatePicker = 'to';
                                            }
                                        } else {
                                            showOtherDatepickerCounter = 0;

                                            jQuery( '.datepicker.from' ).datepicker( 'option', 'minDate', 0 );
                                            jQuery( '.datepicker.from' ).datepicker( 'option', 'maxDate', null );
                                            jQuery( '.datepicker.to' ).datepicker( 'option', 'maxDate', null );
                                        }
                                   }
            });

            jQuery('.datepicker.from' ).each( function( key, obj ) {
                if ( jQuery( obj ).val() == '' ) {
                    jQuery( obj ).attr( 'value', formatedDateToday );
                    jQuery( obj ).change();
                }
            });

            jQuery('.datepicker.to' ).each( function( key, obj ) {
                if ( jQuery( obj ).val() == '' ) {
                    jQuery( obj ).attr( 'value', formatedDateNextWeek );
                    jQuery( obj ).change();
                } else if ( jQuery( obj ).val() == '00.00.0000' ) {
                    jQuery( obj ).attr('value', '~');
                    jQuery( obj ).change();
                }
            });

            jQuery('.datepicker.from' ).on( 'click', function() {
                jQuery( this ).datepicker( 'show' );
            });

            jQuery('.datepicker.to' ).on( 'click', function() {
                jQuery( this ).datepicker( 'show' );
            });
        }
    });

    function closeBubble() {
        jQuery( '.speechbubble' ).fadeOut();
    }

    function showBubble() {
        jQuery( '.speechbubble-icon' ).fadeOut();
        jQuery( '.speechbubble' ).fadeIn();
    }

    // The speech bubble's close link and the icon that opens it again (they were javascript: links)
    jQuery( document ).on( 'click', '[data-cjw-bubble]', function( e ) {
        e.preventDefault();
        if ( jQuery( this ).attr( 'data-cjw-bubble' ) === 'close' ) {
            closeBubble();
        } else {
            showBubble();
        }
    });

    // The Leaflet map of a location field (content/parts/leaflet_map_single.tpl): one marker with a popup of the
    // title and the address (data-popup, escaped for HTML by the template); zoom levels, marker icon and the tile
    // layer from the map's data attributes. The map and its element stay reachable as window['map_<id>'] and
    // window['obj_<id>'].
    jQuery( function() {
        jQuery( '.leaflet-map[data-cjw-leaflet]' ).each( function() {
            var obj = jQuery( this ), id = this.id, map, markerIcon, markerPopup, marker;

            if ( obj.attr( 'data-cjw-leaflet-ready' ) || typeof L === 'undefined' ) {
                return;
            }
            obj.attr( 'data-cjw-leaflet-ready', '1' );

            map = L.map( this, { 'zoom': parseInt( obj.attr( 'data-zoom' ), 10 ),
                                 'center': [ obj.attr( 'data-latitude' ), obj.attr( 'data-longitude' ) ] } );

            markerIcon = L.icon({ iconUrl: obj.attr( 'data-icon-url' ),
                                  iconSize: [38, 58],
                                  iconAnchor: [22, 54],
                                  popupAnchor: [0, -56]
            });

            markerPopup = L.popup().setContent( obj.attr( 'data-popup' ) );

            L.tileLayer( obj.attr( 'data-tile-url' ) + '?x={x}{and}y={y}{and}z={z}', {
                and: '&',
                attribution: '&copy; <a href="http://openstreetmap.org/copyright" target="_blank">OpenStreetMap</a> contributors',
                minZoom: parseInt( obj.attr( 'data-min-zoom' ), 10 ),
                maxZoom: parseInt( obj.attr( 'data-max-zoom' ), 10 )
            } ).addTo( map );

            marker = L.marker( [
                obj.attr( 'data-latitude' ),
                obj.attr( 'data-longitude' )
            ], { 'icon': markerIcon } ).addTo( map );

            marker.bindPopup( markerPopup );

            window['obj_' + id] = obj;
            window['map_' + id] = map;
        });
    });
