
/* <script type="text/javascript"> */

(function( $ ){
	var settings = {};


	$.fn.tableFilter = function( options )
	{
		settings = $.extend( {
			'control': false,
			'clearButton' : false,
			'defaultText': false,
			'onfilter' : false,
			'maxvisible' : false,
			'dataattribute' : 'filter-meta'
		}, options);

		return this.each(function()
		{
			var container = this;
			var $container = $(this);

			var $control = $(settings.control); // jQuery wrapped version.

			function setup()
			{
				$control.bind( 'keyup', function( event ) { updateFilter( event ) } );
				$control.bind( 'change', function( event ) { updateFilter( event ) } );
				$control.bind( 'focus', function( event ) { focus( event ) } );
				$control.bind( 'blur', function( event ) { blur( event ) } );
				$control.change();

				$control.val(settings.defaultText);
				$control.addClass('blur');

				$container.on( 'tablefilter_update', function( event ) { updateFilter( event ); } );

				if ( settings.clearButton )
				{
					$(settings.clearButton).bind( 'click', function( event ) { clearInput( event ) } );
					$(settings.clearButton).hide();
				}
			}

			function focus()
			{
				var strFilterText = $control.val();
				if( settings.defaultText && strFilterText == settings.defaultText  )
					$control.val("");

				$control.removeClass('blur');
			}

			function blur()
			{
				var strFilterText = $control.val();
				if( strFilterText.length == 0 )
				{
					if( settings.defaultText )
						$control.val(settings.defaultText);
					$control.addClass('blur');
				}
			}

			function clearInput( event )
			{
				$control.val("");
				$control.focus();
				updateFilter( event );
			}

			function updateFilter( event )
			{
				var strFilterText = String($control.val()).toLowerCase();
				if ( strFilterText == settings.defaultText.toLowerCase() )
					strFilterText = '';

				if ( settings.clearButton )
				{
					if( strFilterText.length == 0 )
					{
						$(settings.clearButton).hide();
					}
					else
					{
						$(settings.clearButton).show();
					}
				}

				var nVisible = 0;
				$.each($container.children(), function() {
					$item = $( this );
					var strHaystack = $item.data( settings.dataattribute );
					if( strHaystack == undefined )
						return true;
					strHaystack = String(strHaystack).toLowerCase();

					if( ( strFilterText.length > 0 && strHaystack.indexOf(strFilterText) === -1 ) ||
						( settings.maxvisible != false && nVisible > settings.maxvisible ) )
					{
						$item.hide();
					}
					else
					{
						$item.show();
						nVisible++;
					}

				});
				if ( settings.onfilter )
				{
					settings.onfilter();
				}
			}

			setup();
		});

	};

})( jQuery );


