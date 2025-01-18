local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_ContextItem_0 = require(l_Packages_0.Framework).ContextServices.ContextItem;
local _ = require(l_Packages_0.Roact);
local v4 = require(l_Parent_0.Core.Util.ModalStatus);
local v5 = l_ContextItem_0:extend("ModalContext");
v5.new = function(v6) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v7 = {
        modalTarget = v6
    };
    local v8 = v4.new();
    v7.modalStatus = v8;
    v7.onTooltipTriggered = function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: v8 (copy)
        v8:onTooltipTriggered(v9, v10);
    end;
    v7.onDropdownToggled = function(v11) --[[ Line: 24 ]]
        -- upvalues: v8 (copy)
        v8:onDropdownToggled(v11);
    end;
    v7.onSearchOptionsToggled = function(v12) --[[ Line: 28 ]]
        -- upvalues: v8 (copy)
        v8:onSearchOptionsToggled(v12);
    end;
    v7.onSearchOptionsMouse = function(v13) --[[ Line: 32 ]]
        -- upvalues: v8 (copy)
        v8:onSearchOptionsMouse(v13);
    end;
    v7.isShowingModal = function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        return v8:isShowingModal();
    end;
    v7.isShowingSearchOptions = function() --[[ Line: 40 ]]
        -- upvalues: v8 (copy)
        return v8:isShowingSearchOptions();
    end;
    v7.isMouseInSearchOptions = function() --[[ Line: 44 ]]
        -- upvalues: v8 (copy)
        return v8:isMouseInSearchOptions();
    end;
    v7.isAssetPreviewing = function() --[[ Line: 48 ]]
        -- upvalues: v8 (copy)
        return v8:isAssetPreviewing();
    end;
    v7.onAssetPreviewToggled = function(v14) --[[ Line: 52 ]]
        -- upvalues: v8 (copy)
        return v8:onAssetPreviewToggled(v14);
    end;
    v7.canHoverAsset = function() --[[ Line: 56 ]]
        -- upvalues: v8 (copy)
        return v8:canHoverAsset();
    end;
    setmetatable(v7, v5);
    return v7;
end;
return v5;