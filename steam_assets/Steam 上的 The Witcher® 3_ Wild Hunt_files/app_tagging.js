
function TagLink( tag, language )
{
	var url = 'http://store.steampowered.com/tag/';
	if ( language )
		url += language + '/';
	else
		url += 'zh-cn/';

	url += encodeURIComponent( tag ).replace( /%2F/g, '/' ) + '/';
	return url;
}


function AppTaggingMatchTags( rgTerms, rgTags, rgSuggestions )
{
	if ( rgTags && rgTags.length )
	{
		for ( var i = 0; i < rgTags.length; i++ )
		{
			var strNameNormalized = rgTags[i].name_normalized;
			if ( !strNameNormalized )
			{
				strNameNormalized = rgTags[i].name_normalized = rgTags[i].name.toLowerCase(); 	// @todo: We should use .normalize() when browsers actually support it.																			// For now just return the normal value as \W actually just removes entire tags.
			}

			var bMatch = true;
			for ( var iTerm = 0; iTerm < rgTerms.length; iTerm++ )
			{
				if ( strNameNormalized.indexOf( rgTerms[iTerm] ) == -1 )
				{
					bMatch = false;
					break;
				}
			}
			if ( bMatch )
			{
				rgSuggestions.push( rgTags[i].name );
				if ( rgSuggestions.length >= 10 )
					break;
			}
		}
	}
}

function GetTagSuggestFunc( rgTagList )
{
	return function( value, fnSetSuggestions )
	{
		var rgSuggestions = [];
		if ( value )
		{
			var rgTerms = value.toLowerCase().split( ' ' );
			AppTaggingMatchTags( rgTerms, rgTagList, rgSuggestions );

			rgSuggestions.sort();
		}

		fnSetSuggestions( rgSuggestions );
	};
}

function InitAppTagModal( appid, rgAppTags, rgUserTags, strTagLinkSNR, strYourTagSNR, bShowBanOption )
{
	var $AppTagModal = $J('#app_tagging_modal');
	var $AppTagForm = $J('#app_tag_form');
	var $AppTagInput = $AppTagForm.find('input[name=tag]');
	var $AppTagButton = $AppTagForm.find('button');
	var TextSuggest = null;

	var $PopularTags = $AppTagModal.find( '.app_tags.popular_tags' );
	var $YourTags = $AppTagModal.find( '.app_tags.your_tags' );
	var $FrequentTags = $AppTagModal.find( '.app_tags.previous_tags' );
	var $FrequentTagCtn = $AppTagModal.find( '.previous_tags_ctn' ).hide();

	var rgUserTagsByTagID = {};
	for ( var i= 0; i < rgUserTags.length; i++ )
	{
		rgUserTagsByTagID[ rgUserTags[i].tagid ] = rgUserTags[i];
	}

	var rgYourPopularTags = null;
	var rgGlobalPopularTags = [];
	var bYourPopularTagsRequested = false;
	var bBannedTag = false;

	var fnUpdateTagButtonState = function() {
		if ( $AppTagInput.val().length > 0 )
			$AppTagButton.removeClass( 'btn_disabled' );
		else
			$AppTagButton.addClass( 'btn_disabled' );
	};

	var fnSetCheckboxTooltip = function( $Checkbox )
	{
		if ( $Checkbox.hasClass('checked') )
			$Checkbox.data('store-tooltip', '您已应用此标签。点击移除。' );
		else
			$Checkbox.data('store-tooltip', '点击这里应用此标签。' );
	};

	var fnSetReportTooltip = function( $ReportFlag )
	{
		if ( $ReportFlag.hasClass('reported') )
			$ReportFlag.data('store-tooltip', '您已举报不适用该产品的标签。再次点击可以撤销举报。' );
		else
			$ReportFlag.data('store-tooltip', '请点击后举报不适用该产品的标签。' );
	};

	var fnCheckboxClick = function( checkbox, tag, bPopular, tagid )
	{
		var bWithdraw = $J(checkbox).hasClass('checked');
		fnApplyTag( tag, bWithdraw, bPopular, 0, tagid );
	};

	var fnMakeTag = function( tagid, tag, checked, bPopular, bReported, bBrowsable )
	{
		var $Tag = $J('<div/>', {'class': 'app_tag_control', 'data-tagid': tagid } );

		var $Checkbox = $J('<div/>', {'data-store-tooltip': '', 'class': 'app_tag_checkbox' + ( checked && !bReported ? ' checked' : '' ) }).click( function() { fnCheckboxClick( this, tag, bPopular, tagid ); });
		BindStoreTooltip( $Checkbox );
		fnSetCheckboxTooltip( $Checkbox );

		$Tag.append( $Checkbox );

		if ( bPopular )
		{
			$Tag.addClass( 'popular' );

			// only if logged in
			if ( $YourTags.length )
			{

				if ( bShowBanOption )
				{
					var $Ban = $J('<div/>', {'class': 'app_tag_ban'} );
					$Ban.data('store-tooltip', '点击此处从此产品中移除此标签。此选项仅限于开发者和 Steam 员工。' );
					BindStoreTooltip( $Ban );
					$Tag.append( $Ban );

					$Ban.click( function() {
						ShowConfirmDialog( '封禁标签', '您确定要从此产品中移除“%s”标签吗？'.replace( /%s/, tag )).done( function()
						{
							$Ban.trigger('mouseleave');	// to clear the tooltip
							fnApplyTag( tag, false, true, -1 );
						});
					});
				}
				else
				{
					var $Report = $J('<div/>', {'class': 'app_tag_report' + ( bReported ? ' reported' : '' )});
					BindStoreTooltip($Report);
					fnSetReportTooltip($Report);
					$Tag.append($Report);

					$Report.click(function () {
						fnApplyTag(tag, $Report.hasClass('reported'), true, 2);
					});
				}
			}
		}

		if ( bBrowsable )
		{
			var $Link = $J('<a/>', {'class': 'app_tag', 'href': TagLink(tag) + '?snr=' + strTagLinkSNR}).text(tag);
			$Link.InstrumentLinks();
			$Tag.append($Link);
		}
		else
		{
			var $Link = $J('<div/>', {'class': 'app_tag not_browseable' }).text(tag);
			$Link.data('store-tooltip', '尚未有足够的物品被标上“%s”'.replace( /%s/, $Link.html() ) );
			BindStoreTooltip( $Link );
			$Tag.append( $Link );
		}

		return $Tag;
	};

	var fnMakeFrequentTag = function( tagid, tag )
	{
		var $Tag = $J('<div/>', {'class': 'app_tag previous_tag', 'data-tagid': tagid, 'data-store-tooltip': '点击这里应用此标签。' }).text( tag ).click( function() { fnApplyTag( tag ) } );
		BindStoreTooltip( $Tag );
		return $Tag;
	};

	var fnCheckTagBox = function( $Elements, withdraw, reported )
	{
		var $Checkbox = $Elements.find( '.app_tag_checkbox' );

		if ( withdraw || reported )
		{
			$Checkbox.removeClass( 'checked' );
		}
		else
		{
			$Checkbox.addClass( 'checked' );
		}
		fnSetCheckboxTooltip( $Checkbox );

		var $ReportFlag = $Elements.find( '.app_tag_report' );
		if ( reported )
			$ReportFlag.addClass( 'reported' );
		else
			$ReportFlag.removeClass( 'reported' );
		fnSetReportTooltip( $ReportFlag );
	};

	var fnFlashTag = function( $Tag )
	{
		$Tag.addClass('tag_control_flash');
		window.setTimeout( function() { $Tag.removeClass( 'tag_control_flash' ) }, 1100 );
	};

	var fnBuildTagDisplay = function( Modal )
	{
		$PopularTags.empty();
		$YourTags.empty();
		$FrequentTags.empty();

		for ( var i = 0; i < rgAppTags.length; i++ )
		{
			var tagid = rgAppTags[i].tagid;
			var $AppTag = fnMakeTag( tagid, rgAppTags[i].name, rgUserTagsByTagID[tagid], true, rgUserTagsByTagID[tagid] && rgUserTagsByTagID[tagid].is_reported, true );

			$PopularTags.append( $AppTag );
		}

		Modal.AdjustSizing();

		if ( !$YourTags.length )
		{
			return;	//not logged in case
		}

		if ( rgYourPopularTags === null )
		{
			$YourTags.html( '<div class="yourtags_throbber"><img src="http://store.akamai.steamstatic.com/public/images/login/throbber.gif"></div>' );
			if ( !bYourPopularTagsRequested )
			{
				bYourPopularTagsRequested = true;

				var url = 'http://store.steampowered.com/tagdata/myfrequenttags';
				var mytag_version = WebStorage.GetLocal( 'mytag_version', true );
				if ( mytag_version )
					url += '?v=' + parseInt( mytag_version );

				$J.get( url ).done( function( data ) {
					rgYourPopularTags = data || [];
					fnBuildTagDisplay( Modal );
					Modal.AdjustSizing();
				}).fail( function() {
					rgYourPopularTags = [];
					fnBuildTagDisplay( Modal );
					Modal.AdjustSizing();
				});

				// also load the global popular tags, to populate the autocomplete with
				$J.get( 'http://store.steampowered.com/tagdata/populartags/schinese').done( function ( data ) {
					for ( var i = 0; i < data.length; i++ )
						rgGlobalPopularTags.push( data[i] );	// don't assign, we've got references to this guy
				});
			}
		}
		else
		{
			var rgYourTagsSeen = {};
			for ( var i = 0; i < rgUserTags.length; i++ )
			{
				var tagid = rgUserTags[i].tagid;
				rgYourTagsSeen[tagid] = true;

				if ( rgUserTagsByTagID[tagid] && rgUserTagsByTagID[tagid].is_reported )
					continue;

				var $AppTag = fnMakeTag( tagid, rgUserTags[i].name, rgUserTagsByTagID[tagid], false, false, rgUserTags[i].browseable );

				$YourTags.append( $AppTag );
			}

			if ( $YourTags.children().length == 0 )
			{
				$YourTags.append( $J('<div/>', {'class': 'app_tag_control no_tags_yet'}).text('暂未输入标签' ) );
			}

			var cPopularTagsToDisplay = 16;
			for ( var i = 0; i < rgYourPopularTags.length; i++ )
			{
				var tagid = rgYourPopularTags[i].tagid;

				if ( rgYourTagsSeen[tagid] )
					continue;

				var $AppTag = fnMakeFrequentTag( tagid, rgYourPopularTags[i].name );

				$FrequentTags.append( $AppTag );
				$FrequentTagCtn.show();

				if ( --cPopularTagsToDisplay <= 0 )
					break;
			}
		}
	};

	var fnUpdateUserTagsOnPage = function()
	{
		var $YourTagsOnPage = $J('.your_tags[data-appid=' + appid + ']');
		var $AddYourOwn = $YourTagsOnPage.children( '.app_tag.add_your_own');
		var $AddMore = $YourTagsOnPage.children( '.app_tag.add_more');
		if ( rgUserTags.length )
		{
			$AddYourOwn.hide();
			$AddMore.show();
			$YourTagsOnPage.empty();
			for ( var i = 0; i < rgUserTags.length; i++ )
			{
				if ( !rgUserTags[i].is_reported && rgUserTags[i].browseable )
				{
					var $AppTag = $J('<a/>', { 'class': 'app_tag', 'href': TagLink(rgUserTags[i].name) + '?snr=' + strYourTagSNR }).text(rgUserTags[i].name);
					$AppTag.InstrumentLinks();
					$YourTagsOnPage.append($AppTag);
				}
			}

			// always put non-browseable after all browseable tags, so they are less likely to display
			for( var i = 0; i < rgUserTags.length; i++ )
			{
				if ( !rgUserTags[i].is_reported &&  !rgUserTags[i].browseable )
				{
					var $AppTag = $J('<div/>', {'class': 'app_tag not_browseable' }).text( rgUserTags[i].name );
					$AppTag.data('store-tooltip', '尚未有足够的物品被标上“%s”'.replace( /%s/, $AppTag.html() ) );
					BindStoreTooltip( $AppTag );
					$YourTagsOnPage.append( $AppTag );
				}
			}
		}
		else
		{
			$AddYourOwn.show();
			$AddMore.hide();
			$YourTagsOnPage.empty();
		}
		$YourTagsOnPage.append( $AddYourOwn, $AddMore );
		AdjustVisibleAppTags( $YourTagsOnPage );
	};

		var fnIsTagBrowseable = function( tagid, name )
	{
		for ( var i = 0; i < rgGlobalPopularTags.length; i++ )
		{
							if ( rgGlobalPopularTags[i].name == name )
					return true;
					}
		return false;
	};

	var fnApplyTag = function( tag, withdraw, bPopularClick, eReportType, unTagID )
	{
		var rgParams = {
			appid: appid,
			sessionid: g_sessionID,
			tag: tag
		};
		if ( unTagID )
			rgParams['tagid'] = unTagID;

		if ( withdraw )
			rgParams['withdraw'] = 1;
		else if ( eReportType )
			rgParams['reporttype'] = eReportType;

		$J.post( 'http://store.steampowered.com/tagdata/tagapp', rgParams ).done( function( data ) {

			var strControlSelector = '.app_tag_control[data-tagid=' + data.tagid + ']';
			var $AppTag = $PopularTags.find( strControlSelector );
			var $YourTag = $YourTags.find( strControlSelector );

			if ( typeof data.browseable == 'undefined' )
			{
				data.browseable = fnIsTagBrowseable( data.tagid, data.name );
			}

			if ( !$YourTag.length && !data.withdraw && !data.reported )
			{
				$YourTag = fnMakeTag( data.tagid, data.name, false, false, false, data.browseable );
				$YourTags.append( $YourTag );
				$YourTags.children('.no_tags_yet').hide();
			}

			var iExistingTag;
			for ( iExistingTag = 0; iExistingTag < rgUserTags.length; iExistingTag++ )
			{
				if ( rgUserTags[iExistingTag].tagid == data.tagid )
				{
					break;
				}
			}

			if ( data.withdraw )
			{
				delete rgUserTagsByTagID[ data.tagid ];
				if ( iExistingTag < rgUserTags.length )
					rgUserTags.splice( iExistingTag, 1 );

				fnCheckTagBox( $YourTag, true );
			}
			else
			{
				rgUserTagsByTagID[ data.tagid ] = data;
				if ( iExistingTag >= rgUserTags.length )
				{
					rgUserTags.push( data );
				}

				// remove from the frequent tag box
				$FrequentTags.find( '[data-tagid=' + data.tagid + ']' ).hide();
				if ( $FrequentTags.children().length == 0 )
					$FrequentTagCtn.hide();

				// make sure it's checked
				if ( data.is_reported )
				{
					$YourTag.remove();
				}
				else
				{
					fnCheckTagBox( $YourTag );
				}
			}

			fnCheckTagBox( $AppTag, data.withdraw, data.is_reported );

			// highlight the popular tag to show it has changed
			if ( !bPopularClick && !data.withdraw && $AppTag.length )
			{
				fnFlashTag( $AppTag );
			}

			if ( !data.withdraw && $YourTag.length )
				fnFlashTag( $YourTag );

			// roll "mytag_version" variable which will force a reload of user's frequent tags
			WebStorage.SetLocal( 'mytag_version', parseInt( WebStorage.GetLocal( 'mytag_version', true ) || 0 ) + 1, true );

			if ( eReportType > 0 && !withdraw )
			{
				ShowAlertDialog( '举报一个标签', '感谢您的举报。达到一定数量的被举报标签会被从该产品中去除。');
			}
			else if ( eReportType == -1 )
			{
				$AppTag.hide( 'fast' );
				bBannedTag = true;
			}

		}).fail( function() {
			ShowAlertDialog( '查看并为该产品编辑标签', 'There was a problem adding your tag.' );
		});
	};

	var fnOnSubmit = function(event) {
		if ( event )
			event.preventDefault();

		if ( $AppTagInput.val().length == 0 )
			return;

		fnApplyTag( $AppTagInput.val(), false );
		$AppTagInput.val('').change().focus();
	};

	window.ShowAppTagModal = function( appid )
	{

		$AppTagModal.show();
		var Modal = ShowAlertDialog( '查看并为该产品编辑标签', $AppTagModal, '关闭' );
		Modal.GetContent().addClass( 'app_tag_modal_frame');
		fnBuildTagDisplay( Modal );
		Modal.AdjustSizing();

		Modal.always( function() {
			if ( TextSuggest )
			{
				TextSuggest.Destroy();
				TextSuggest = null;
			}

			fnUpdateUserTagsOnPage();

			if ( bBannedTag )
				window.location.reload();
		} );

		// in the "you need to log in" case, we don't have a form to display
		if ( $AppTagForm.length )
		{
			$AppTagInput.val('');
			$AppTagInput.change( fnUpdateTagButtonState );
			$AppTagInput.keyup( fnUpdateTagButtonState );
			fnUpdateTagButtonState();
			$AppTagInput.focus();

			$AppTagForm.submit( fnOnSubmit );
			$AppTagForm.keyup( function( event ) { if ( event.which == 13 ) event.stopPropagation() } );

			TextSuggest = new CTextInputSuggest( $AppTagInput, GetTagSuggestFunc( rgGlobalPopularTags ), function( suggestion ) { fnOnSubmit(); } );

			// hack to size the input control correctly
			$AppTagForm.find( '.gray_bevel').css( 'margin-right', ( $AppTagButton.width() + 12 ) + 'px' );
		}
	};



	var $PopularTagsOnPage = $J('.popular_tags[data-appid=' + appid + ']');
	var $YourTagsOnPage = $J('.your_tags[data-appid=' + appid + ']');
	AdjustVisibleAppTags( $PopularTagsOnPage );
	fnUpdateUserTagsOnPage();

	$J(window ).on('resize.VisibleAppTags', function() {
		AdjustVisibleAppTags( $PopularTagsOnPage );
		AdjustVisibleAppTags( $YourTagsOnPage );
	});
}

function AdjustVisibleAppTags( $TagCtn )
{
	var bPopularTags = $TagCtn.hasClass( 'popular_tags' );
	var $AddButton = $TagCtn.children('.app_tag.add_button');
	if ( !bPopularTags )
		$AddButton = $AddButton.filter(':visible');


	var k_nSpacing = 5;
	var nSpaceRemaining = $TagCtn.width() - $AddButton.outerWidth();

	var bAnyHidden = false;
	$TagCtn.children( '.app_tag:not(.add_button)').each( function() {
		var $Element = $J(this);
		var nWidth = $Element.outerWidth() + k_nSpacing;
		if ( nWidth > nSpaceRemaining )
		{
			$Element.hide();
			bAnyHidden = true;
		}
		else
		{
			nSpaceRemaining -= nWidth;
			$Element.show();
		}
	});
}

function InitTagTabs( strURL, cc, rgTabNames, rgInitialParams )
{
	var g_rgTabs = {};
	var g_strTabRequestURL = strURL;
	var g_rgTabBaseParams = {
		cc: cc,
		l: 'schinese',
		v: 4
	};
	var g_rgTabParams = {};
	var g_strActiveTab = null;


	var fnOnTabFilterChange = function()
	{
		for ( var strTab in g_rgTabs )
		{
			var Tab = g_rgTabs[strTab];
			Tab.m_iStart = 0;
			Tab.m_nLoaded = 0;
			Tab.m_$Items.css( 'top', '0px' );
		}
		UpdateTabDisplay();
	};

	var fnAddFilter = function( strParam, value, $Checkbox )
	{
		if ( !$Checkbox )
			$Checkbox = $J('.tab_filter_control[data-param=' + strParam + '][data-value=' + value + ']');

		$Checkbox.addClass( 'checked' );

		if ( !g_rgTabParams[strParam] )
			g_rgTabParams[strParam] = [];
		g_rgTabParams[strParam].push( value );

		var $Filter = $J('<div/>', {'class': 'tab_filter' } );
		$Filter.attr( 'data-param', strParam );
		$Filter.attr( 'data-value', value );
		$Filter.text( $Checkbox.text() );
		$Filter.append( $J('<div/>', {'class': 'tab_filter_remove' }).html('&nbsp;').click( function() { fnRemoveFilter( strParam, value, $Checkbox, $Filter ); } ) );
		$J('.tab_filters').append( $Filter );
		$J('.tab_filter_ctn').show( 'fast' );

		fnOnTabFilterChange();
	};

	var fnRemoveFilter = function( strParam, value, $Checkbox, $Filter )
	{
		if ( !$Checkbox )
			$Checkbox = $J('.tab_filter_control[data-param=' + strParam + '][data-value=' + value + ']');
		if ( !$Filter )
			$Filter = $J('.tab_filter[data-param=' + strParam + '][data-value=' + value + ']');

		$Checkbox.removeClass('checked');

		if ( g_rgTabParams[strParam] )
			g_rgTabParams[strParam] = g_rgTabParams[strParam].filter( function( val ) { return val != value; } );

		$Filter.remove();
		if ( !$J('.tab_filters').children().length )
			$J('.tab_filter_ctn').hide( 'fast' );

		fnOnTabFilterChange();
	};


	var InitTabEvents = function( Tab )
	{
		Tab.m_$Select.click( function() {
			UpdateTabDisplay( Tab.m_strName );
		} );

		Tab.m_$Next.css( 'visibility', 'visible' );
		Tab.m_$NextLink.attr( 'href', '#' );
		Tab.m_$NextLink.click( function( event ) {
			event.preventDefault();
			if ( !Tab.m_bRequestInFlight && !Tab.m_bAnimating )
				DoTabScroll( Tab, 10 );
		});


		Tab.m_$Prev.css( 'visibility', 'visible' );
		Tab.m_$PrevLink.attr( 'href', '#' );
		Tab.m_$PrevLink.click( function( event ) {
			event.preventDefault();
			if ( !Tab.m_bRequestInFlight && !Tab.m_bAnimating )
				DoTabScroll( Tab, -10 );
		});
	};

	var UpdateTabDisplay = function( strActiveTab )
	{
		if ( !strActiveTab )
			strActiveTab = g_strActiveTab;
		else
			g_strActiveTab = strActiveTab;

		for ( var strTabName in g_rgTabs )
		{
			var Tab = g_rgTabs[strTabName];
			if ( strTabName == strActiveTab )
			{
				Tab.m_$Select.addClass( 'active' );
				Tab.m_$Content.show();
				if ( Tab.m_nLoaded == 0 )
				{
					Tab.m_$Items.empty();
					LoadTab( Tab );
				}
			}
			else
			{
				Tab.m_$Select.removeClass( 'active' );
				Tab.m_$Content.hide();
			}
		}
	};

	var DoTabScroll = function( Tab, delta )
	{
		if ( Tab.m_iStart + delta + 10 > Tab.m_nLoaded )
			LoadTab( Tab, delta );
		else
			TagScrollTabTo( Tab, Tab.m_iStart + delta );
	};

	var LoadTab = function( Tab, delta )
	{
		if ( Tab.m_bRequestInFlight )
			return;

		if ( !delta )
			delta = 0;

		Tab.m_bNeedsReload = false;
		var url = g_strTabRequestURL + Tab.m_strName;
		var rgParams = $J.extend( {
			'start': Tab.m_iStart + delta
		}, g_rgTabBaseParams );

		for ( var filter in g_rgTabParams )
		{
			var rgParamValues = g_rgTabParams[filter];
			if ( rgParamValues && rgParamValues.length )
			{
				rgParamValues.sort();
				for ( var i = 0; i < rgParamValues.length; i++ )
				{
					rgParams[ filter + '[' + i + ']' ] = rgParamValues[i];
				}
			}
		}

		$J.getJSON( url, rgParams).done( function( data ) {
			Tab.m_bRequestInFlight = false;

			Tab.m_$Items.append( data.html );
			Tab.m_nTotal = data.total;
			Tab.m_nLoaded = data.start + data.count;

			TagScrollTabTo( Tab, data.start );
		});
	};

	var UpdateTabPagingDisplay = function( Tab )
	{
		if ( Tab.m_iStart > 0 )
			Tab.m_$Prev.show();
		else
			Tab.m_$Prev.hide();

		if ( Tab.m_iStart + 10 < Math.min( Tab.m_nTotal, 100 ) )
			Tab.m_$Next.show();
		else
			Tab.m_$Next.hide();

		Tab.m_$CountStart.text( Tab.m_iStart + 1 );
		Tab.m_$CountEnd.text( Math.min( Tab.m_iStart + 10, Tab.m_nTotal ) );
		Tab.m_$CountTotal.text( Tab.m_nTotal );
	};

	var TagScrollTabTo = function( Tab, iStart )
	{
		var delta = iStart - Tab.m_iStart;
		Tab.m_iStart = iStart;
		UpdateTabPagingDisplay( Tab );

		if ( delta != 0 )
		{
			var nItemHeight = Tab.m_$Items.children(':first-child').height() + 1;

			Tab.m_bAnimating = true;
			Tab.m_$Items.css( 'position', 'relative' );
			var nTop = parseInt( Tab.m_$Items.css('top') ) || 0;
			Tab.m_$Items.animate( {top: (nTop - (delta * nItemHeight)) + 'px' }, 750, function() {
				Tab.m_bAnimating = false;
			} );
		}
	};

	// perform initialization

	for ( var i = 0 ; i < rgTabNames.length; i++ )
	{
		var strName = rgTabNames[i];
		var Tab = {
			m_strName: strName,
			m_$Select: $J('#tab_select_' + strName ),
			m_$Content: $J('#tab_' + strName + '_content' ),
			m_$Items: $J('#tab_' + strName + '_items' ),
			m_$Prev: $J('#tab_' + strName + '_prev' ),
			m_$PrevLink: $J('#tab_' + strName + '_prev > a' ),
			m_$Next: $J('#tab_' + strName + '_next' ),
			m_$NextLink: $J('#tab_' + strName + '_next > a' ),
			m_$CountStart: $J('#tab_' + strName + '_count_start' ),
			m_$CountEnd: $J('#tab_' + strName + '_count_end' ),
			m_$CountTotal: $J('#tab_' + strName + '_count_total' ),
			m_iStart: 0,
			m_nTotal: parseInt( $J('#tab_' + strName + '_count_total').text() ) || 0,
			m_nLoaded: 10,

			m_bAnimating: false,
			m_bRequestInFlight: false
		};

		UpdateTabPagingDisplay( Tab );
		InitTabEvents( Tab );

		g_rgTabs[ strName ] = Tab;
	}

	UpdateTabDisplay( rgTabNames[0] );

	$J('.tab_filter_control').each( function() {
		var $Control = $J(this);
		var strParam = $Control.data('param');
		var value = $Control.data('value');
		$Control.click( function() {
			if ( !$Control.hasClass( 'checked' ) )
			{
				fnAddFilter( strParam, value, $Control );
			}
			else
			{
				fnRemoveFilter( strParam, value, $Control );
			}
		});
	});

	$J('#related_tags_more_toggle').click( function() {
		$J('#related_tags_more_toggle').hide();
		$J('#related_tags_more').show('fast');
	});

	// due to php, this might be an empty array, or an object.  on an object, length will be undefined
	if ( rgInitialParams.length !== 0 )
	{
		for ( var param in rgInitialParams )
		{
			var rgValues = rgInitialParams[param];
			for ( var i = 0; i < rgValues.length; i++ )
			{
				$J('.tab_filter_ctn').show();	// when showing initially, skip the animation that fnAddFilter would run
				fnAddFilter( param, rgValues[i] );
			}
		}
	}
}


function InitTagBrowsePage( strTagLanguage, rgDefaultGetParams )
{
	var rgTagResults = {};

	var rgActiveTagByOption = { global: null, yours: null, friends: null, recommended: null };
	var strActiveOption;

	var fnDisplayTag = function( unTagID, strTagName ) {
		if ( !rgTagResults[unTagID] )
		{
			var $Element = $J('<div/>', {'class': 'tag_browse_games_results'} );
			// some pending info
			var $GamesElement = $J('<div/>', {'class':'browse_tag_games'});
			$GamesElement.append($J('<h3/>').text( strTagName ) );
			$GamesElement.append( $J('<div/>', {'class': 'browse_tag_loading' }).html( '<img src="http://store.akamai.steamstatic.com/public/images/login/throbber.gif">' ) );

			$Element.append( $GamesElement );
			$Element.append( $J('<div/>', {'class':'browse_tag_game_total'}).html( '&nbsp;' ) );
			var rgParams = $J.extend( { name: strTagName }, rgDefaultGetParams );

			$J.get( 'http://store.steampowered.com/tagdata/gettaggames/' + strTagLanguage + '/' + unTagID + '/', rgParams ).done( function ( html ) {
				$Element.html( html );
				$Element.InstrumentLinks();
				if ( typeof GDynamicStore != 'undefined' )
					GDynamicStore.DecorateDynamicItems( $Element );
			}).fail( function () {
				$GamesElement.find( '.browse_tag_loading').text( '抱歉，载入物品时出现了错误。请稍后再试。' );
			});

			rgTagResults[unTagID] = $Element;
		}

		$J('#tag_browse_games_ctn').children().detach();
		$J('#tag_browse_games_ctn').append( rgTagResults[unTagID] );
	};

	var fnSelectOption = function( strOption, unTagID )
	{
		strActiveOption = strOption;
		var $Tags =	$J('#tag_browse_' + strOption);
		$Tags.siblings('.tag_browse_tags').hide();
		$Tags.show();

		var $Desc = $J('#tag_browse_description_' + strOption );
		$Desc.siblings().hide();
		$Desc.show();

		$J('.tag_browse_option').removeClass('active');
		$J('.tag_browse_option[data-browseoption=' + strOption + ']').addClass('active');

		if ( unTagID )
		{
			var $Tag = $Tags.children('[data-tagid=' + unTagID + ']');
			if ( $Tag.length )
				rgActiveTagByOption[strActiveOption] = $Tag;
		}

		// select the first tag if none selected
		if ( !rgActiveTagByOption[strActiveOption] && $Tags.children().length )
			rgActiveTagByOption[strActiveOption]  = $J($Tags.children()[0]);

		if ( rgActiveTagByOption[strActiveOption] )
			fnSelectTag( rgActiveTagByOption[strActiveOption] );
	};

	var fnSelectTag = function( $Tag )
	{
		if ( rgActiveTagByOption[ strActiveOption ] )
			rgActiveTagByOption[ strActiveOption ].removeClass('active');

		$Tag.addClass( 'active' );
		rgActiveTagByOption[ strActiveOption ] = $Tag;

		fnDisplayTag( $Tag.data('tagid'), $Tag.text() );
		window.history.replaceState( {}, '', '#' + strActiveOption + '_' + $Tag.data('tagid') );
	};

	$J('.tag_browse_option').click( function () {
		fnSelectOption( $J(this).data('browseoption') );
	});

	//TODO: for testing only
	var strEvent = window.location.href.indexOf( 'test_mouse' ) == -1 ? 'click' : 'mouseenter';
	$J('.tag_browse_tag').on( strEvent, function() {
		fnSelectTag( $J(this) );
	});

	$J(window).on( 'scroll resize', function() {
		var offsetTop = $J('.tag_browse_right_ctn').offset().top;
		var $Ctn = $J('#tag_browse_games_ctn');

		if ( offsetTop > window.scrollY )
		{
			$Ctn.css( 'position', 'absolute' );
		}
		else
		{
			$Ctn.css( 'position', 'fixed' );
		}
	});

	var fnGoToHash = function() {
		var hash = window.location.hash;
		if ( hash && hash.length > 2 )
		{
			var rgHashComponents = hash.substr(1).split('_');
			if ( rgHashComponents.length >= 1 && rgHashComponents.length <= 2 )
			{
				var option = rgHashComponents[0];
				var tagid;
				if ( rgHashComponents.length >= 2 )
					tagid = parseInt( rgHashComponents[1] );
				if ( rgActiveTagByOption[option] || rgActiveTagByOption[option] === null )
				{
					fnSelectOption( option, tagid );
					return;
				}
			}
		}

		fnSelectOption('global');
	};

	if ( window.location.hash.length )
		fnGoToHash();
	else
		fnSelectOption( 'global' );

	if ( g_AccountID != 0 )
	{
		// load recommended tags
		var bGotRecommendedTags = false;
		$J.get( 'http://store.steampowered.com/tagdata/recommendedtags', {games: 10, count: 25, taglang: strTagLanguage }).done( function( data ) {
			if ( data && data.length > 0 )
			{
				bGotRecommendedTags = true;
				var $Tags = $J('#tag_browse_recommended');
				for ( var i = 0; i < data.length; i++ )
				{
					var tag = data[i];
					var $Tag = $J('<div/>', {'class': 'tag_browse_tag', 'data-tagid': tag.tagid }).text( tag.name );
					$Tag.on( strEvent, function() { fnSelectTag( $J(this) ); } );
					$Tags.append( $Tag );
				}
			}
		}).always( function() {
			if ( !bGotRecommendedTags )
			{
				$J('.tag_browse_option[data-browseoption=recommended]').hide();
				if ( strActiveOption == 'recommended' )
					fnSelectOption( 'global' );
			}
			else if ( strActiveOption == 'recommended' )
			{
				if ( window.location.hash.length )
					fnGoToHash();
				else
					fnSelectOption( 'recommended' );
			}
		});
	}
}

function InitBannedTagModal( appid, $BanModal )
{
	var bBansChanged = false;
	window.ShowAppTagBanModal = function() {
		$BanModal.show();
		ShowAlertDialog( '已封禁标签', $BanModal).always( function() {
			if ( bBansChanged )
				window.location.reload();
		} );

		$BanModal.find( '.app_tag_report').click( function() {
			var $Flag = $J(this);
			var $Row = $Flag.parent( '.app_tag_control' );
			var tag = $Row.data('tag');
			ShowConfirmDialog( '解禁标签',
				'您确定要解禁“%s”标签吗？'.replace( /%s/, tag ),
				'解禁标签')
				.done( function() {
					var rgParams = {
						appid: appid,
						sessionid: g_sessionID,
						tag: tag,
						reporttype: -1,
						unban: 1
					};
					$J.post( 'http://store.steampowered.com/tagdata/tagapp', rgParams ).done( function( data ) {
						$Row.hide( 'fast' );
					}).fail( function () {
						ShowAlertDialog( '解禁标签', '在封禁或解禁此标签时出现问题。请稍后再试。' );
					});
					bBansChanged = true;
				});
		});
	};
}

var g_rgPagingControls = {};
function InitPagingControls( rgPagingData, cc, hide_adult_content_violence, hide_adult_content_sex, rgInitialParams )
{
	var g_rgTabs = {};
	var g_rgTabBaseParams = {
		cc: cc,
		l: 'schinese',
		no_violence:hide_adult_content_violence,
		no_sex:hide_adult_content_sex,
		v: "4"
	};
	var g_rgTabParams = {};
	var g_strActiveTab = null;
	var g_nPage = 0;

	var rgTabNames = [];

	for ( var i = 0; i < rgPagingData.length; ++i )
	{
		var oPagingData = rgPagingData[i];
		var oPagingControls = new CAjaxPagingControls( oPagingData, oPagingData['url'] );
		oPagingControls.m_rgStaticParams = g_rgTabBaseParams;

		oPagingControls.SetResponseHandler( function( response ) {
			fnOnRendered();
			$J('#' + this.m_strElementPrefix + 'Rows').InstrumentLinks();
		});
		oPagingControls.SetPageChangingHandler( function( nPage ) {
			g_nPage = nPage;
			UpdateQueryString();
			$J('#' + this.m_strElementPrefix + 'Rows').fadeTo( 0.1, 0.5 );
		} );
		oPagingControls.SetPageChangedHandler( function ( nPage ) {
			$J('#' + this.m_strElementPrefix + 'Rows').fadeTo( 0.1, 1 );
		} );

		g_rgPagingControls[oPagingData['prefix']] = oPagingControls;
		rgTabNames.push( oPagingData['prefix'] );
	}

	function fnOnRendered()
	{
		var bHaveUser = ( g_AccountID != 0 );
		if ( !bHaveUser )
		{
			return;
		}

		GDynamicStore.DecorateDynamicItems();
	}

	var fnOnTabFilterChange = function()
	{
		for ( var strTab in g_rgTabs )
		{
			var Tab = g_rgTabs[strTab];
			Tab.m_iStart = 0;
			Tab.m_nLoaded = 0;
		}
		UpdateTabDisplay();
	};

	var fnAddFilter = function( strParam, value, $Checkbox )
	{
		if ( !$Checkbox )
			$Checkbox = $J('.tab_filter_control[data-param=' + strParam + '][data-value=' + value + ']');

		$Checkbox.addClass( 'checked' );

		if ( !g_rgTabParams[strParam] )
			g_rgTabParams[strParam] = [];
		g_rgTabParams[strParam].push( value );

		var $Filter = $J('<div/>', {'class': 'tab_filter' } );
		$Filter.attr( 'data-param', strParam );
		$Filter.attr( 'data-value', value );
		$Filter.text( $Checkbox.text() );
		$Filter.append( $J('<div/>', {'class': 'tab_filter_remove' }).html('&nbsp;').click( function() { fnRemoveFilter( strParam, value, $Checkbox, $Filter ); } ) );
		$J('.tab_filters').append( $Filter );
		$J('.tab_filter_ctn').show( 'fast' );

		fnOnTabFilterChange();
	};

	var fnRemoveFilter = function( strParam, value, $Checkbox, $Filter )
	{
		if ( !$Checkbox )
			$Checkbox = $J('.tab_filter_control[data-param=' + strParam + '][data-value=' + value + ']');
		if ( !$Filter )
			$Filter = $J('.tab_filter[data-param=' + strParam + '][data-value=' + value + ']');

		$Checkbox.removeClass('checked');

		if ( g_rgTabParams[strParam] )
			g_rgTabParams[strParam] = g_rgTabParams[strParam].filter( function( val ) { return val != value; } );

		$Filter.remove();
		if ( !$J('.tab_filters').children().length )
			$J('.tab_filter_ctn').hide( 'fast' );

		fnOnTabFilterChange();
	};


	var InitTabEvents = function( Tab )
	{
		Tab.m_$Select.click( function() {
			UpdateTabDisplay( Tab.m_strName );
			UpdateQueryString();
		} );
	};

	var UpdateTabDisplay = function( strActiveTab )
	{
		if ( !strActiveTab )
			strActiveTab = g_strActiveTab;
		else
			g_strActiveTab = strActiveTab;

		for ( var strTabName in g_rgTabs )
		{
			var Tab = g_rgTabs[strTabName];
			if ( strTabName == strActiveTab )
			{
				Tab.m_$Select.addClass( 'active' );
				Tab.m_$Content.show();
				if ( Tab.m_nLoaded == 0 )
				{
					LoadTab( Tab );
				}
			}
			else
			{
				Tab.m_$Select.removeClass( 'active' );
				Tab.m_$Content.hide();
			}
		}
	};

	var UpdateQueryString = function() {
		var rgQuery = {};
		$J('.tab_filter_control.checked').each(function(i,ele) {

			var key = $J(ele).data('param');
			var val = $J(ele).data('value');


			if( rgQuery[ key ])
				rgQuery[key].push(val);
			else
				rgQuery[key] = [val];

		});
		rgQuery['p'] = g_nPage;
		rgQuery['tab'] = g_strActiveTab;
		window.location.hash = $J.param( rgQuery );
	};

	var LoadFromQueryString = function() {

		var strQuery = window.location.hash.substr(1);
		var rgQuery = strQuery.toQueryParams();

		$J.each(rgQuery, function(param)
		{
			if( param == 'p')
			{
				g_nPage = parseInt(rgQuery[param]);
				return true; // continue;
			}

			if( param == 'tab')
			{
				g_strActiveTab = rgQuery[param];
				return true;
			}

			var rgValues = rgQuery[param];

			var strParam = param.substr(0, param.length-2);

			if( !$J.isArray( rgValues ) )
				rgValues = [rgValues];

			for( var i=0; i<rgValues.length; i++ )
			{
				var value = rgValues[i];
				var $Checkbox = $J('.tab_filter_control[data-param=' + strParam + '][data-value=' + value + ']');

				$Checkbox.addClass( 'checked' );

				if ( !g_rgTabParams[strParam] )
					g_rgTabParams[strParam] = [];
				g_rgTabParams[strParam].push( value );

				var $Filter = $J('<div/>', {'class': 'tab_filter' } );
				$Filter.attr( 'data-param', strParam );
				$Filter.attr( 'data-value', value );
				$Filter.text( $Checkbox.text() );
				$Filter.append( $J('<div/>', {'class': 'tab_filter_remove' }).html('&nbsp;').click( $J.proxy( fnRemoveFilter, null, strParam, value, $Checkbox, $Filter ) ) );
				$J('.tab_filters').append( $Filter );
				$J('.tab_filter_ctn').show( 'fast' );
			}

		});

		for ( var strTab in g_rgTabs )
		{
			var Tab = g_rgTabs[strTab];
			if( strTab == g_strActiveTab )
				Tab.m_iStart = g_nPage * 10;
			else
				Tab.m_iStart = 0;
			Tab.m_nLoaded = 0;
		}
		UpdateTabDisplay();
	};

	var LoadTab = function( Tab )
	{
		var rgParams = $J.extend( {
		}, g_rgTabBaseParams );

		for ( var filter in g_rgTabParams )
		{
			var rgParamValues = g_rgTabParams[filter];
			if ( rgParamValues && rgParamValues.length )
			{
				rgParamValues.sort();
				for ( var i = 0; i < rgParamValues.length; i++ )
				{
					rgParams[ filter + '[' + i + ']' ] = rgParamValues[i].toString();
				}
			}
		}

		var nPage = Tab.m_iStart / 10;

		var oPagingControls = g_rgPagingControls[Tab.m_strName];
		oPagingControls.m_rgStaticParams = rgParams;
		UpdateQueryString();
		oPagingControls.GoToPage( nPage, true );
	};

	// perform initialization

	for ( var i = 0 ; i < rgTabNames.length; i++ )
	{
		var strName = rgTabNames[i];
		var Tab = {
			m_strName: strName,
			m_$Select: $J('#tab_select_' + strName ),
			m_$Content: $J('#tab_' + strName + '_content' )
		};

		InitTabEvents( Tab );

		g_rgTabs[ strName ] = Tab;
	}

	UpdateTabDisplay( rgTabNames[0] );

	$J('.tab_filter_control').each( function() {
		var $Control = $J(this);
		var strParam = $Control.data('param');
		var value = $Control.data('value');
		$Control.click( function() {
			if ( !$Control.hasClass( 'checked' ) )
			{
				fnAddFilter( strParam, value, $Control );
			}
			else
			{
				fnRemoveFilter( strParam, value, $Control );
			}
		});
	});

	$J('#related_tags_more_toggle').click( function() {
		$J('#related_tags_more_toggle').hide();
		$J('#related_tags_more').show('fast');
	});

	// due to php, this might be an empty array, or an object.  on an object, length will be undefined
	if ( rgInitialParams.length !== 0 )
	{
		for ( var param in rgInitialParams )
		{
			var rgValues = rgInitialParams[param];
			for ( var i = 0; i < rgValues.length; i++ )
			{
				$J('.tab_filter_ctn').show();	// when showing initially, skip the animation that fnAddFilter would run
				fnAddFilter( param, rgValues[i] );
			}
		}
	}

	LoadFromQueryString();

	// not ready yet
	// fnHandleHashChange( true );
}

var g_rgGlobalPopularTags = [];

// A modular tag auto-complete widget.
var CTagAutoComplete = function( $elContainer, fnOnTagSelected )
{
	var $AppTagForm = $elContainer;
	var $AppTagInput = $AppTagForm.find('input[name=tag]');
	var $AppTagButton = $AppTagForm.find('button');

	var TextSuggest;

	if ( $AppTagForm.length )
	{
		var fnOnSubmit = function(event) {
			if ( event )
				event.preventDefault();

			if ( $AppTagInput.val().length == 0 )
				return;

			fnOnTagSelected( $AppTagInput.val() );
			$AppTagInput.val('').change().focus();
		};

		var fnUpdateTagButtonState = function() {
			if ( $AppTagInput.val().length > 0 )
				$AppTagButton.removeClass( 'btn_disabled' );
			else
				$AppTagButton.addClass( 'btn_disabled' );
		};

		$AppTagInput.val('');
		$AppTagInput.change( fnUpdateTagButtonState );
		$AppTagInput.keyup( fnUpdateTagButtonState );
		fnUpdateTagButtonState();
		$AppTagInput.focus();

		$AppTagForm.submit( fnOnSubmit );
		$AppTagForm.keyup( function( event ) { if ( event.which == 13 ) event.stopPropagation() } );

		TextSuggest = new CTextInputSuggest( $AppTagInput, GetTagSuggestFunc( g_rgGlobalPopularTags ), function( suggestion ) { fnOnSubmit(); } );

		// hack to size the input control correctly
		//$AppTagForm.find( '.gray_bevel').css( 'margin-right', ( $AppTagButton.width() + 12 ) + 'px' );

		this.LoadPopularTags();
	}
}

//
CTagAutoComplete.prototype.LoadPopularTags = function( bForce )
{
	if( !bForce && g_rgGlobalPopularTags.length > 0 )
		return;

	$J.get( 'http://store.steampowered.com/tagdata/populartags/schinese').done( function ( data ) {
		for ( var i = 0; i < data.length; i++ )
			g_rgGlobalPopularTags.push( data[i] );	// don't assign, we've got references to this guy

	});
}


