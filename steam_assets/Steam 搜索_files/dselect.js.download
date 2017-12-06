
var g_ActiveDropLists = {};
var g_LastSelectHideTime = 0;

$J(function() {
	$J(document).on( 'mousedown', HandleMouseClick );
	$J(document).on( 'keydown', HandleKeyDown );
});

function HandleMouseClick( e )
{
		for ( var key in g_ActiveDropLists )
	{
				if ( !g_ActiveDropLists[key] )
			continue;
			
		var ulAboveEvent = $J(e.target).closest( 'ul' )[0];
		
				if ( ulAboveEvent && ulAboveEvent.id == key+'_droplist' )
			continue;
		
				DSelectHide( key );
	}
}

var TYPEAHEAD_TIMEOUT_MS = 750;
var g_timeLastCharEvent = 0;
var g_strTypeahead = '';

function HandleKeyDown( e )
{
	var bSwallowEvent = false;
	var keynum = 0;

	if ( e.altKey || e.ctrlKey )
	{
		// bail out now so the browser can do it's thing
		return;
	}

	if( e.keyCode ) // IE
  	{
		keynum = e.keyCode;
	}
	else if( e.which ) // Old Netscape/Firefox/Opera
	{
		keynum = e.which;
	}
	
	var bCharEvent = false;
	switch ( keynum )
	{
				case Event.KEY_DOWN: 		case Event.KEY_UP: 		case Event.KEY_RETURN: 		case Event.KEY_TAB:   
		case Event.KEY_PAGEDOWN: 		case Event.KEY_PAGEUP: 		case Event.KEY_HOME:
		case Event.KEY_END:
		case Event.KEY_ESC:
			break;
				case 16: 			return !bSwallowEvent;
				default:
			bCharEvent = true;
			break;
	}
	
		for ( var id in g_ActiveDropLists )
	{
	
				if ( !g_ActiveDropLists[id] )
			continue;
			 
		var droplist = $(id+'_droplist');
		var trigger = $(id+'_trigger');
		var rgItems = droplist.getElementsByTagName('a');
		var curIndex = trigger.highlightedItem == undefined ? -1 : trigger.highlightedItem;
		
				if ( keynum != Event.KEY_TAB )
			bSwallowEvent = true;
		
				if ( keynum == Event.KEY_RETURN || keynum == Event.KEY_TAB )
		{
			DHighlightItem( id, curIndex, true );
			continue;
		}
		else if ( keynum == Event.KEY_ESC )
		{
			DSelectHide( id );
			continue;
		}
		
								if ( bCharEvent )
		{
			var c = String.fromCharCode( keynum );
			var bExpandingMatch = false;
			var time = new Date().getTime();
			if ( time - g_timeLastCharEvent < TYPEAHEAD_TIMEOUT_MS )
			{
				c = g_strTypeahead + c;
				bExpandingMatch = true;
			}
			
			g_timeLastCharEvent = time;
			g_strTypeahead = c;
			
			var firstIndex = curIndex;
			var nextIndex = curIndex;
			var regExp = new RegExp( '^' + c, 'i' );
						if ( !bExpandingMatch || !rgItems[curIndex].innerHTML.match( regExp ) )
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
				
			DHighlightItem( id, curIndex, false );
				
						if ( !DSelectClassCheck( $( id+'_trigger' ), 'activetrigger' ) )
			{
				DSelectShow( id );
			}
		}
		else
		{
			g_timeLastCharEvent = 0; 						 
			if ( keynum == Event.KEY_DOWN )
				curIndex++;
			else if ( keynum == Event.KEY_UP )
				curIndex--;
			else if ( keynum == Event.KEY_HOME )
				curIndex = 0;
			else if ( keynum == Event.KEY_END )
				curIndex = rgItems.length - 1;
				
						var nPageItemCount = rgItems.length < 1 ? 0 : Math.floor((droplist.clientHeight / rgItems[0].clientHeight))
			if ( keynum == Event.KEY_PAGEDOWN )
				curIndex += Math.min( nPageItemCount, (rgItems.length - curIndex - 1) );
			else if ( keynum == Event.KEY_PAGEUP )
				curIndex -= Math.min( nPageItemCount, curIndex );
			
			if( curIndex >= 0 && curIndex < rgItems.length )
			{
				DHighlightItem( id, curIndex, false );
				
								if ( !DSelectClassCheck( $( id+'_trigger' ), 'activetrigger' ) )
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
	
function DHighlightItem( id, index, bSetSelected )
{
	var droplist = $(id+'_droplist');
	var trigger = $(id+'_trigger');
	var rgItems = droplist.getElementsByTagName('a');
	if ( index >= 0 && index < rgItems.length )
	{
		var item = rgItems[index];
				
				if ( trigger.highlightedItem != undefined && trigger.highlightedItem != index )
			rgItems[trigger.highlightedItem].className = 'inactive_selection';
			
		trigger.highlightedItem = index;
		rgItems[index].className = 'highlighted_selection';
		
				var yOffset = rgItems[index].offsetTop+rgItems[index].clientHeight;
		var curVisibleOffset = droplist.scrollTop+droplist.clientHeight;
		var bScrolledDown = false;
				var nMaxLoopIterations = rgItems.length;
		var nLoopCounter = 0;
		while ( curVisibleOffset < yOffset && nLoopCounter < nMaxLoopIterations )
		{
			droplist.scrollTop = droplist.scrollTop + rgItems[index].clientHeight;
			curVisibleOffset = droplist.scrollTop+droplist.clientHeight;
			bScrolledDown = true;
			nLoopCounter++;
		}
		
				if ( !bScrolledDown )
		{
						nLoopCounter = 0;
			yOffset = rgItems[index].offsetTop;
			curVisibleOffset = droplist.scrollTop;
			while( curVisibleOffset > yOffset && nLoopCounter < nMaxLoopIterations )
			{
				droplist.scrollTop = droplist.scrollTop - rgItems[index].clientHeight;
				curVisibleOffset = droplist.scrollTop;
				nLoopCounter++;
			}
		}
		
		if ( bSetSelected )
		{
						trigger.innerHTML = item.innerHTML;
			$(id).value = item.id;
			if ( $(id).onchange )
				$(id).onchange();
			
			DSelectHide( id );
		}
	}
}

function DHighlightItemByValue( id, value, bSetSelected )
{
	var droplist = $(id+'_droplist');
	var rgItems = droplist.getElementsByTagName('a');
	
	for ( var index = 0; index < rgItems.length; index++ )
	{
		var item = rgItems[index];
		if ( item.id == value )
		{
			DHighlightItem( id, index, bSetSelected );
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
		if ( !DSelectClassCheck( $( id+'_trigger' ), 'activetrigger' ) )
	{
		g_ActiveDropLists[id] = false;
	}
}

function DSelectHide( id )
{
	var trigger = $(id+'_trigger');
	var droplist = $(id+'_droplist');
	
		var d = new Date()
	g_LastSelectHideTime = d.valueOf();
	
	trigger.className = 'trigger';
	droplist.className = 'dropdownhidden';
	g_ActiveDropLists[id] = false;
		trigger.focus();
}

function DSelectShow( id )
{
		var d = new Date()
	if ( d - g_LastSelectHideTime < 50 )
		return;
		
	var trigger = $(id+'_trigger');
	var droplist = $(id+'_droplist');
	
	trigger.className = 'activetrigger';
	droplist.className = 'dropdownvisible';
	g_ActiveDropLists[id] = true;
		trigger.focus();
}

function DSelectOnTriggerClick( id )
{
	var trigger = $( id+'_trigger' );
	if ( !DSelectClassCheck( $( id+'_trigger' ), 'activetrigger' ) )
	{
		DSelectShow( id );
	}
}


function DSelectClassCheck( element, class_name )
{
	return new RegExp('\\b'+class_name+'\\b').test(element.className);
}

function DSelectSwapClass( element, class1, class2 )
{
	var class_name = element.className;
	if ( DSelectClassCheck( element, class1 ) )
	{
		element.className = class2;
	}
	else
	{	
		element.className = class1;
	}
}
