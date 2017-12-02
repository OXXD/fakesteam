
var g_ActiveDropLists = {};
var g_LastSelectHideTime = 0;

$J(function() {
	$J(document).on( 'keydown', HandleKeyDown );
});

function HandleMouseClick( e, key )
{
			if ( !g_ActiveDropLists[key] )
		return;

	var $Trigger = $J('#'+key+'_trigger');
	var $Droplist = $J('#'+key+'_droplist');

	var $Target = $J( e.target);
	if ( //$Trigger.is( e.target ) || $J.contains( $Trigger[0], e.target ) ||
		$Droplist.is( e.target ) || $J.contains( $Droplist[0], e.target ) )
		return;

		DSelectHide( key );
}

var TYPEAHEAD_TIMEOUT_MS = 750;
var g_timeLastCharEvent = 0;
var g_strTypeahead = '';

function HandleKeyDown( e )
{
	var bSwallowEvent = false;
	var keynum = e.which;

	if ( e.altKey || e.ctrlKey )
	{
		// bail out now so the browser can do it's thing
		return;
	}

	var bCharEvent = false;
	switch ( keynum )
	{
				case 40: 		case 38: 		case 13: 		case 9:  		case 34: 		case 33: 		case 36: 		case 35: 		case 27: 			break;
				case 16: 			return !bSwallowEvent;
				default:
			bCharEvent = true;
			break;
	}
	
		for ( var id in g_ActiveDropLists )
	{
	
				if ( !g_ActiveDropLists[id] )
			continue;
			 
		var $Droplist = $J('#'+id+'_droplist');
		var $Trigger = $J('#'+id+'_trigger');
		var rgItems = $Droplist.find('a');
		var curIndex = $Trigger.data('highlightedItem');
		if ( typeof curIndex == 'undefined' )
			curIndex = -1;
		
				if ( keynum != 9 )
			bSwallowEvent = true;
		
				if ( keynum == 13 || keynum == 9 )
		{
			DHighlightItem( id, curIndex, true, false );
			continue;
		}
		else if ( keynum == 27 )
		{
			DSelectHide( id );
			continue;
		}
		
								if ( bCharEvent )
		{
			var c = String.fromCharCode( keynum );
			var bExpandingMatch = false;
			var time = $J.now();
			if ( time - g_timeLastCharEvent < TYPEAHEAD_TIMEOUT_MS )
			{
				c = g_strTypeahead + c;
				bExpandingMatch = true;
			}
			
			g_timeLastCharEvent = time;
			g_strTypeahead = c;
			
			var firstIndex = curIndex;
			var nextIndex = curIndex;
			var regExp = new RegExp( '^' + V_EscapeRegExp( c ), 'i' );
						if ( !bExpandingMatch || curIndex < 0 || !rgItems[curIndex].innerHTML.match( regExp ) )
			{
				for( var i = 0; i < rgItems.length; ++ i )
				{
					var s = rgItems[i].innerHTML;
					if ( s.length > 0 && s.match( regExp ) )
					{
						if ( curIndex == firstIndex )
							firstIndex = i;
							
						if ( curIndex < i )
						{
							nextIndex = i;
							break;
						}
					}
				}
			}
			
									if ( nextIndex != curIndex )
				curIndex = nextIndex;
			else if ( firstIndex != curIndex )
				curIndex = firstIndex;
				
			DHighlightItem( id, curIndex, false, true );
				
						if ( !$J( '#'+id+'_trigger').hasClass('activetrigger') )
			{
				DSelectShow( id );
			}
		}
		else
		{
			g_timeLastCharEvent = 0; 						 
			if ( keynum == 40 )	//down
				curIndex++;
			else if ( keynum == 38 )	//up
				curIndex--;
			else if ( keynum == 36 )	// home
				curIndex = 0;
			else if ( keynum == 35 )	// end
				curIndex = rgItems.length - 1;
				
						var nPageItemCount = rgItems.length < 1 ? 0 : Math.floor(($Droplist.height() / $J(rgItems[0]).height() ));
			if ( keynum == 34 )	//pagedown
				curIndex += Math.min( nPageItemCount, (rgItems.length - curIndex - 1) );
			else if ( keynum == 33 )	//pageup
				curIndex -= Math.min( nPageItemCount, curIndex );
			
			if( curIndex >= 0 && curIndex < rgItems.length )
			{
				DHighlightItem( id, curIndex, false, true );
				
								if ( !$J( '#'+id+'_trigger').hasClass('activetrigger') )
				{
					DSelectShow( id );
				}
			}
		}
	}

	if ( bSwallowEvent )
		e.preventDefault();

	return !bSwallowEvent;
}
	
function DHighlightItem( id, index, bSetSelected, bScrollToItem )
{
	var $Droplist = $J('#'+id+'_droplist');
	var $Trigger = $J('#'+id+'_trigger');
	var rgItems = $Droplist.find('a');
	if ( index >= 0 && index < rgItems.length )
	{
		var $Item = $J(rgItems[index]);
				
				if ( typeof $Trigger.data('highlightedItem') != 'undefined' && $Trigger.data('highlightedItem') != index )
			$J(rgItems[$Trigger.data('highlightedItem')]).removeClass('highlighted_selection').addClass( 'inactive_selection' );
			
		$Trigger.data( 'highlightedItem', index );
		$Item.removeClass('inactive_selection').addClass('highlighted_selection');
		
				if ( bScrollToItem )
		{
			var nItemTop = $Item.position().top;
			if ( nItemTop < 0 )
			{
				$Droplist.scrollTop( $Droplist.scrollTop() + nItemTop );
			}
			else if ( nItemTop + $Item.height() > $Droplist.height() )
			{
				$Droplist.scrollTop( $Droplist.scrollTop() + nItemTop - $Droplist.height() + $Item.height() );
			}
		}
		
		if ( bSetSelected )
		{
						$Trigger.html( $Item.html() );
			var $Input = $J('#'+id);
			$Input.val( $Item.attr('id') );
			
			DSelectHide( id );
			$Input.change();
		}
	}
}

function DHighlightItemByValue( id, value, bSetSelected )
{
	var $Droplist = $JFromIDOrElement(id+'_droplist');
	var rgItems = $Droplist.find( 'a' );
	
	for ( var index = 0; index < rgItems.length; index++ )
	{
		var item = rgItems[index];
		if ( item.id == value )
		{
			DHighlightItem( id, index, bSetSelected, true );
			return;
		}
	}
}

function DSelectNoop()
{
	return;
}

function DSelectOnFocus( id )
{
	g_ActiveDropLists[id] = true;
}

function DSelectOnBlur( id )
{
		if ( !$J( '#'+id+'_trigger').hasClass( 'activetrigger' ) )
	{
		g_ActiveDropLists[id] = false;
	}
}

function DSelectHide( id )
{
	var $Trigger = $J('#'+id+'_trigger');
	var $Droplist = $J('#'+id+'_droplist');
	
		g_LastSelectHideTime = $J.now();

	$Trigger.removeClass('activetrigger');
	$Droplist.attr( 'class', 'dropdownhidden' );
	$Droplist.find('a.highlighted_selection' ).removeClass('highlighted_selection' ).addClass('inactive_selection');
	g_ActiveDropLists[id] = false;
		$Trigger.focus();
	
	if ( $Droplist.data('originalParent' ) )
		$Droplist.data('originalParent' ).append( $Droplist.parent() );

	$J(document ).off('click.HideActiveDSelect');
}

function DSelectShow( id )
{
		var d = $J.now();
	if ( d - g_LastSelectHideTime < 50 )	//50ms
		return;

	window.setTimeout( function() { $J(document).on( 'click.HideActiveDSelect', function( e ) { HandleMouseClick( e, id ) } ); } );

	var $Trigger = $J('#'+id+'_trigger');
	var $Droplist = $J('#'+id+'_droplist');

	$Trigger.addClass( 'activetrigger' );
	$Droplist.attr( 'class', 'dropdownvisible' );

	var $BodyLevelDroplistCtn = $J(document.body ).children('.dselect_container');
	if ( !$BodyLevelDroplistCtn.length )
		$BodyLevelDroplistCtn = $J('<div/>', {'class': 'dselect_container'} ).css('position', 'static').appendTo( document.body );

	var offset = $Trigger.offset();
	$Droplist.data( 'originalParent', $Droplist.parent().parent() );
	$Droplist.parent().css( {
		'position': 'absolute',
		'top': ( offset.top + $Trigger.outerHeight() ) + 'px',
		'left': offset.left + 'px',
		'width': $Trigger.outerWidth() + 'px'
	} ).appendTo( $BodyLevelDroplistCtn );

	// does the droplist have horizontal scrolling issues?
	if ( $Droplist.length )
	{
		var nScrollWidth = $Droplist[0].scrollWidth;
		if ( nScrollWidth > $Droplist.width() )
		{
			$Droplist.width( nScrollWidth + 10 );
		}
	}

	g_ActiveDropLists[id] = true;
		$Trigger.focus();
}

function DSelectOnTriggerClick( id )
{
	var $Trigger = $J('#'+id+'_trigger');
	if ( !$Trigger.hasClass( 'activetrigger' ) )
	{
		DSelectShow( id );
	}
}

