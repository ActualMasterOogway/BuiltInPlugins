local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_map_0 = v3.map;
local l_filter_0 = v3.filter;
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v7 = v2.Util.LayoutOrderIterator.new();
local v8 = require(l_script_FirstAncestor_0.Src.Components.MappingsListRow);
local l_KEY_NAMES_LIST_DISPLAY_ORDER_0 = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants).KEY_NAMES_LIST_DISPLAY_ORDER;
return v1.memo(function(v10) --[[ Line: 28 ]] --[[ Name: MappingsList ]]
    -- upvalues: v1 (copy), v6 (copy), l_map_0 (copy), l_filter_0 (copy), l_KEY_NAMES_LIST_DISPLAY_ORDER_0 (copy), v8 (copy), v7 (copy)
    local v11 = v1.useContext(v6);
    local v12 = v11.mappings[v11.isUpdatingMappingForGamepadId] or {};
    local v13 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v10 (copy)
        v10.onHoveredMappingChanged(nil);
    end, {
        v10.onHoveredMappingChanged
    });
    return v1.createElement("TextButton", {
        [v1.Tag] = "Component-MappingsList CX-Invisible X-ColumnS", 
        LayoutOrder = v10.LayoutOrder, 
        [v1.Change.AbsoluteSize] = if v10.onAbsoluteSizeChanged ~= nil then v10.onAbsoluteSizeChanged else nil, 
        [v1.Event.MouseLeave] = v13, 
        Text = ""
    }, l_map_0(l_filter_0(l_KEY_NAMES_LIST_DISPLAY_ORDER_0, function(v14) --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        return v12[v14] ~= nil;
    end), function(v15) --[[ Line: 52 ]]
        -- upvalues: v1 (ref), v8 (ref), v7 (ref), v10 (copy)
        return v1.createElement(v8, {
            key = v15, 
            keyName = v15, 
            LayoutOrder = v7:getNextOrder(), 
            onHover = v10.onHoveredMappingChanged
        });
    end));
end);