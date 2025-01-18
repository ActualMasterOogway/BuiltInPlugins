local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.createSignal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (setmetatable({
        _signal = v1(), 
        _currentTooltipAssetId = 0, 
        _currentTooltipTypeId = 0, 
        _isDropdownShown = false, 
        _isMouseInSearchOptions = false, 
        _isSearchOptionsShown = false, 
        _isAssetPreviewing = false
    }, v2));
end;
v2.subscribe = function(v3, ...) --[[ Line: 31 ]] --[[ Name: subscribe ]]
    return v3._signal:subscribe(...);
end;
v2.isShowingModal = function(v4) --[[ Line: 35 ]] --[[ Name: isShowingModal ]]
    return v4._isDropdownShown;
end;
v2.isShowingSearchOptions = function(v5) --[[ Line: 39 ]] --[[ Name: isShowingSearchOptions ]]
    return v5._isSearchOptionsShown;
end;
v2.isMouseInSearchOptions = function(v6) --[[ Line: 43 ]] --[[ Name: isMouseInSearchOptions ]]
    return v6._isMouseInSearchOptions;
end;
v2.isAssetPreviewing = function(v7) --[[ Line: 47 ]] --[[ Name: isAssetPreviewing ]]
    return v7._isAssetPreviewing;
end;
v2.onTooltipTriggered = function(v8, v9, v10) --[[ Line: 51 ]] --[[ Name: onTooltipTriggered ]]
    v8._currentTooltipAssetId = v9;
    v8._currentTooltipTypeId = v10;
    v8._signal:fire();
end;
v2.onDropdownToggled = function(v11, v12) --[[ Line: 58 ]] --[[ Name: onDropdownToggled ]]
    v11._isDropdownShown = v12;
    v11._signal:fire();
end;
v2.onSearchOptionsToggled = function(v13, v14) --[[ Line: 64 ]] --[[ Name: onSearchOptionsToggled ]]
    v13._isSearchOptionsShown = v14;
    v13._signal:fire();
end;
v2.onSearchOptionsMouse = function(v15, v16) --[[ Line: 70 ]] --[[ Name: onSearchOptionsMouse ]]
    v15._isMouseInSearchOptions = v16;
    v15._signal:fire();
end;
v2.onAssetPreviewToggled = function(v17, v18) --[[ Line: 76 ]] --[[ Name: onAssetPreviewToggled ]]
    v17._isAssetPreviewing = v18;
    v17._signal:fire();
end;
v2.isCurrentTooltip = function(v19, v20, v21) --[[ Line: 82 ]] --[[ Name: isCurrentTooltip ]]
    local v22 = false;
    if v19._currentTooltipAssetId == v20 then
        v22 = v19._currentTooltipTypeId == v21;
    end;
    return v22;
end;
v2.canHoverAsset = function(v23) --[[ Line: 86 ]] --[[ Name: canHoverAsset ]]
    return not v23._isDropdownShown and not v23._isAssetPreviewing and not (v23._isSearchOptionsShown and v23._isMouseInSearchOptions);
end;
v2.canShowCurrentTooltip = function(v24, v25, v26) --[[ Line: 92 ]] --[[ Name: canShowCurrentTooltip ]]
    return not v24._isDropdownShown and v24:isCurrentTooltip(v25, v26) and not v24._isAssetPreviewing and not (v24._isSearchOptionsShown and v24._isMouseInSearchOptions);
end;
return v2;