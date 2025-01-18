local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v2.Dash;
local l_append_0 = l_Dash_0.append;
local _ = l_Dash_0.join;
local l_map_0 = l_Dash_0.map;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.ScriptReplacement);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v18 = v1.PureComponent:extend("ScriptFilterButton");
local function v24(v19, v20, v21, v22, v23) --[[ Line: 54 ]] --[[ Name: makeOption ]]
    return {
        Text = v23 or v19 .. " " .. v20, 
        Checked = v21[v19] and v21[v19][v20], 
        Data = {
            RigType = v19, 
            InstanceName = v20
        }, 
        OnItemClicked = v22
    };
end;
v18.init = function(v25) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: l_append_0 (copy), l_map_0 (copy), v24 (copy), l_showContextMenu_0 (copy)
    v25.showMenu = function() --[[ Line: 73 ]]
        -- upvalues: v25 (copy), l_append_0 (ref), l_map_0 (ref), v24 (ref), l_showContextMenu_0 (ref)
        local l_props_0 = v25.props;
        local l_Localization_0 = l_props_0.Localization;
        local v28 = l_props_0.Plugin:get();
        local v30 = l_append_0(l_map_0(l_props_0.InstanceNames, function(v29) --[[ Line: 79 ]]
            -- upvalues: v24 (ref), l_props_0 (copy)
            return (v24("R6", v29, l_props_0.Filters, l_props_0.OnFilterSelected));
        end), {
            {
                ShowSeparator = true
            }, 
            v24("R15", "Unassigned", l_props_0.Filters, l_props_0.OnFilterSelected, "R15 " .. l_Localization_0:getText("ScriptPane", "Unassigned")), 
            (v24("R15", "Assigned", l_props_0.Filters, l_props_0.OnFilterSelected, "R15 " .. l_Localization_0:getText("ScriptPane", "Assigned")))
        });
        l_showContextMenu_0(v28, v30);
    end;
end;
v18.render = function(v31) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy)
    local _ = v31.state;
    local l_props_1 = v31.props;
    return v1.createElement(l_IconButton_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = l_props_1.Size, 
        LeftIcon = "rbxasset://textures/StudioSharedUI/Filter.png", 
        OnClick = v31.showMenu
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v2.Style.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v18));