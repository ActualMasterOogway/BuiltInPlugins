local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v3.Dash;
local l_append_0 = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_keys_0 = l_Dash_0.keys;
local l_map_0 = l_Dash_0.map;
local l_Pane_0 = v3.UI.Pane;
local _ = l_script_FirstAncestor_0.Src.Actions;
local v13 = require(script.TagComponent);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v16 = v1.PureComponent:extend("TagsBar");
v16.init = function(v17) --[[ Line: 41 ]] --[[ Name: init ]]
    v17.state = {
        tags = {}, 
        _Ref = {
            Filters = nil
        }
    };
end;
local function v25(v18, v19, v20, v21) --[[ Line: 50 ]] --[[ Name: addRigTabs ]]
    -- upvalues: l_keys_0 (copy), l_append_0 (copy), l_map_0 (copy)
    local v22 = v19[v20];
    local v23 = l_keys_0(v22);
    table.sort(v23);
    l_append_0(v18, l_map_0(v23, function(v24) --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v21 (copy)
        return {
            Label = string.format("%s %s", v20, if not (v24 ~= "Assigned") or v24 == "Unassigned" then v21:getText("ScriptPane", v24) else v24), 
            Data = {
                RigType = v20, 
                InstanceName = v24
            }
        };
    end));
end;
local function _(v26, v27) --[[ Line: 70 ]] --[[ Name: genTags ]]
    -- upvalues: v25 (copy)
    local v28 = {};
    v25(v28, v26.rigFilters, "R6", v27);
    v25(v28, v26.rigFilters, "R15", v27);
    return v28;
end;
v16.getDerivedStateFromProps = function(v30, v31) --[[ Line: 78 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v25 (copy), l_join_0 (copy)
    if v30.Filters ~= v31._Ref.Filters then
        local l_Filters_0 = v30.Filters;
        local l_Localization_0 = v30.Localization;
        local v34 = {};
        v25(v34, l_Filters_0.rigFilters, "R6", l_Localization_0);
        v25(v34, l_Filters_0.rigFilters, "R15", l_Localization_0);
        return {
            tags = v34, 
            _Ref = l_join_0(v31._Ref, {
                Filters = v30.Filters
            })
        };
    else
        return;
    end;
end;
v16.render = function(v35) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), v1 (copy), v13 (copy), l_Pane_0 (copy)
    local l_state_0 = v35.state;
    local l_props_0 = v35.props;
    local v40 = l_map_0(l_state_0.tags, function(v38, v39) --[[ Line: 95 ]]
        -- upvalues: v1 (ref), v13 (ref), l_props_0 (copy)
        return v1.createElement(v13, {
            LayoutOrder = v39, 
            Tag = v38, 
            OnClosed = l_props_0.OnFilterClosed
        });
    end);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = 4, 
        ClipsDescendants = true
    }, v40);
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v16));