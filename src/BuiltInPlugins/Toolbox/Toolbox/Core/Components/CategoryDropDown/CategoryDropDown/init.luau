local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local _ = require(l_Packages_0.Dash);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = require(l_Util_0.LayoutOrderIterator);
local v7 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Array_0 = require(l_Packages_0.LuauPolyfill).Array;
local _ = require(l_script_FirstAncestor_0.Core.Util.Images);
local v12 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v14 = require(l_script_FirstAncestor_0.Core.Components.DropdownMenu);
local v15 = v2.PureComponent:extend("CategoryDropDown");
v15.init = function(v16) --[[ Line: 51 ]] --[[ Name: init ]]
    v16.state = {
        selectedIndex = 1
    };
end;
v15.didUpdate = function(v17, v18) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    if v17.props.AudioType ~= v18.AudioType then
        v17:setState({
            selectedIndex = 1
        });
    end;
end;
v15.render = function(v19) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_Array_0 (copy), v2 (copy), v14 (copy), v7 (copy)
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnCategorySelect_0 = l_props_0.OnCategorySelect;
    local l_AudioType_0 = l_props_0.AudioType;
    local l_selectedIndex_0 = l_state_0.selectedIndex;
    local v27 = if v12.MUSIC.name == l_AudioType_0 then l_props_0.Subcategories.music else l_props_0.Subcategories["sound-effect"];
    local v28 = {};
    table.insert(v28, {
        index = 1, 
        name = if v12.MUSIC.name == l_AudioType_0 then l_Localization_0:getText("Audio.Music", "Browse") else l_Localization_0:getText("Audio.SoundEffect", "Browse")
    });
    if v27 and v27.children then
        for v29, v30 in pairs(v27.children) do
            local v31 = v12.MUSIC.name == l_AudioType_0 and "Audio.Music.Genre" or "Audio.SoundEffect.Category";
            if not v30.hidden then
                table.insert(v28, {
                    name = l_Localization_0:getText(v31, v29), 
                    subcategory = v30, 
                    index = v30.index + 1
                });
            end;
        end;
    end;
    v28 = l_Array_0.sort(v28, function(v32, v33) --[[ Line: 102 ]]
        return v32.index - v33.index;
    end);
    local function v35(v34) --[[ Line: 106 ]]
        -- upvalues: v19 (copy), l_OnCategorySelect_0 (copy), v28 (ref)
        v19:setState({
            selectedIndex = v34
        });
        l_OnCategorySelect_0(v28[v34].subcategory);
    end;
    return v2.createElement(v14, {
        Size = UDim2.new(1, 0, 0, 40), 
        visibleDropDownCount = 5, 
        selectedDropDownIndex = l_selectedIndex_0, 
        fontSize = v7.FONT_SIZE_LARGE, 
        items = v28, 
        onItemClicked = v35, 
        setDropdownHeight = function() --[[ Line: 120 ]] --[[ Name: setDropdownHeight ]]
            return 152;
        end, 
        LayoutOrder = l_LayoutOrder_0
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v15));