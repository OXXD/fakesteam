function CSlider($Container, $Grabber, args) {
    this.m_$Container = $Container;
    this.m_$Grabber = $Grabber || $Container.find('.handle');
    this.m_nMinVal = args.min || 0;
    this.m_nMaxVal = args.max || 100;
    this.m_nIncrement = args.increment || 1;
    this.m_nValue = args.value || 0;
    this.m_fnOnChange = args.fnOnChange || function(value, bInDrag) {};

    this.m_$Grabber.css('position', 'absolute');
    this.CalcRatios();
    this.SetValue(this.m_nValue);

    var fnGetPageX = function(event) {
        if (event.type.indexOf('touch') == 0) {
            var TouchEvent = event.originalEvent;
            var rgTouches = TouchEvent ? TouchEvent.touches : null;
            if (!rgTouches || rgTouches.length < 1)
                return event.pageX || 0; //probably wrong
            return rgTouches[0].pageX || 0;
        } else {
            return event.pageX || 0;
        }
    };

    var _this = this;
    this.m_$Container.on('mousedown touchstart', function(event) {
        _this.CalcRatios();

        if (!_this.m_$Grabber.is(event.target)) {
            // jump the grabber to this position and start the drag
            var nPosition = fnGetPageX(event) - _this.m_$Container.offset().left;
            // we want the grabber centered under the mosue if possible
            nPosition -= Math.floor(_this.m_$Grabber.width() / 2);
            var nNewPosition = Math.min(Math.max(nPosition, 0), _this.m_nWidth);

            _this.m_$Grabber.css('left', nNewPosition + 'px');
            _this.m_nValue = nNewPosition / _this.m_flRatio;
            if (_this.m_nIncrement > 1 && _this.m_nValue < _this.m_nMaxVal) {
                //_this.m_nValue += _this.m_nIncrement - 1;
                _this.m_nValue = parseInt(_this.m_nValue / _this.m_nIncrement) * _this.m_nIncrement;
            }

            _this.m_fnOnChange(_this.m_nValue, true);
        }
        var nInitialPosition = parseInt(_this.m_$Grabber.css('left'));
        var nStartDragX = fnGetPageX(event);

        $J(document).on('mousemove.CSlider touchmove.CSlider', function(event) {
            var nDelta = fnGetPageX(event) - nStartDragX;

            var nNewPosition = Math.min(Math.max(nInitialPosition + nDelta, 0), _this.m_nWidth);

            _this.m_$Grabber.css('left', nNewPosition + 'px');
            _this.m_nValue = nNewPosition / _this.m_flRatio;
            if (_this.m_nIncrement > 1 && _this.m_nValue < _this.m_nMaxVal) {
                //_this.m_nValue += _this.m_nIncrement - 1;
                _this.m_nValue = parseInt(_this.m_nValue / _this.m_nIncrement) * _this.m_nIncrement;
            }

            _this.m_fnOnChange(_this.m_nValue, true);
        });
        $J(document).on('mouseup.CSlider touchend.CSlider', function(event) {
            $J(document).off('.CSlider');
            _this.m_fnOnChange(_this.m_nValue, false);
        });

        event.preventDefault();
    });
}

CSlider.prototype.CalcRatios = function() {
    var nGrabberWidth = this.m_$Grabber.width();
    this.m_nWidth = this.m_$Container.width() - nGrabberWidth;

    this.m_flRatio = this.m_nWidth / (this.m_nMaxVal - this.m_nMinVal);
};

CSlider.prototype.SetValue = function(nValue, nAnimationSpeed) {
    this.m_nValue = Math.min(Math.max(nValue, this.m_nMinVal), this.m_nMaxVal);

    var nNewPosition = Math.floor((this.m_nValue - this.m_nMinVal) * this.m_flRatio);

    this.m_$Grabber.stop();
    if (nAnimationSpeed)
        this.m_$Grabber.animate({ left: nNewPosition }, nAnimationSpeed);
    else
        this.m_$Grabber.css('left', nNewPosition + 'px');
};

CSlider.prototype.GetValue = function() {
    return this.m_nValue;
};

CSlider.prototype.GetMin = function() {
    return this.m_nMinVal;
};

CSlider.prototype.GetMax = function() {
    return this.m_nMaxVal;
};

CSlider.prototype.SetRange = function(nMinVal, nMaxVal, nValue) {
    this.m_nMinVal = nMinVal;
    this.m_nMaxVal = nMaxVal;
    if (typeof nValue != 'undefined')
        this.m_nValue = nValue;
    this.CalcRatios();
    this.SetValue(this.m_nValue);
};

CSlider.prototype.SetIncrement = function(nIncrement) {
    this.m_nIncrement = nIncrement;
};

function CScrollSlider($Scroll, $Container, $Grabber, args) {
    this.m_$Scroll = $Scroll;
    this.m_$SliderCtn = $Container;

    var $Slider = $Container.children('.slider');

    this.m_Slider = new CSlider($Slider.length ? $Slider : $Container, $Grabber, { fnOnChange: $J.proxy(this.OnSliderChange, this) });

    this.m_$Scroll.css('overflowX', 'scroll');
    // add momentum on iOS
    this.m_$Scroll.css('-webkit-overflow-scrolling', 'touch');

    var _this = this;
    var bDidInitialRecalc = false;
    this.m_$Scroll.on('scroll.ScrollSlider', function() {
        if (!bDidInitialRecalc) {
            // we don't want to do this all the time, but on some browsers the first call to
            //	update ranges is too early and values don't compute correctly.
            _this.UpdateRanges();
            bDidInitialRecalc = true;
        }
        _this.m_Slider.SetValue(_this.m_$Scroll.scrollLeft());
    });
    $J(window).on('resize.ScrollSlider', function() {
        _this.UpdateRanges();
    });
    this.m_$Scroll.on('v_contentschanged', function() {
        _this.UpdateRanges();
    });

    this.UpdateRanges();
}

CScrollSlider.prototype.SetValue = function(value, nAnimationSpeed) {
    if (nAnimationSpeed) {
        this.m_$Scroll.stop().animate({ 'scrollLeft': value }, nAnimationSpeed);
    } else {
        this.m_$Scroll.stop().scrollLeft(value);
    }
};

CScrollSlider.prototype.GetValue = function() {
    return this.m_Slider.GetValue();
};

CScrollSlider.prototype.UpdateRanges = function() {
    var nParentWidth = this.m_$Scroll.width();
    var nScrollWidth = this.m_$Scroll[0].scrollWidth;

    if (nScrollWidth <= nParentWidth) {
        this.m_$SliderCtn.hide();
    } else {
        this.m_Slider.SetRange(0, nScrollWidth - nParentWidth, this.m_$Scroll.scrollLeft());
        this.m_$SliderCtn.show();
    }
};

CScrollSlider.prototype.OnSliderChange = function(value, bInDrag) {
    this.m_$Scroll.stop().scrollLeft(value);
};

function IsValidEmailAddress(email) {
    var email_regex = /^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i;
    return (email != '' && email_regex.test(email));
}


(function($) {
    $.deparam = function(params, coerce) {
        var obj = {},
            coerce_types = { 'true': !0, 'false': !1, 'null': null };

        $.each(params.replace(/\+/g, ' ').split('&'), function(j, v) {
            var param = v.split('='),
                key = decodeURIComponent(param[0]),
                val,
                cur = obj,
                i = 0,

                keys = key.split(']['),
                keys_last = keys.length - 1;

            if (/\[/.test(keys[0]) && /\]$/.test(keys[keys_last])) {
                keys[keys_last] = keys[keys_last].replace(/\]$/, '');

                keys = keys.shift().split('[').concat(keys);

                keys_last = keys.length - 1;
            } else {
                keys_last = 0;
            }

            if (param.length === 2) {
                val = decodeURIComponent(param[1]);

                if (coerce) {
                    val = val && !isNaN(val) ? +val // number
                        :
                        val === 'undefined' ? undefined // undefined
                        :
                        coerce_types[val] !== undefined ? coerce_types[val] // true, false, null
                        :
                        val; // string
                }

                if (keys_last) {
                    for (; i <= keys_last; i++) {
                        key = keys[i] === '' ? cur.length : keys[i];
                        cur = cur[key] = i < keys_last ?
                            cur[key] || (keys[i + 1] && isNaN(keys[i + 1]) ? {} : []) :
                            val;
                    }

                } else {

                    if ($.isArray(obj[key])) {
                        obj[key].push(val);

                    } else if (obj[key] !== undefined) {
                        obj[key] = [obj[key], val];

                    } else {
                        obj[key] = val;
                    }
                }

            } else if (key) {
                obj[key] = coerce ?
                    undefined :
                    '';
            }
        });

        return obj;
    };
})(jQuery);