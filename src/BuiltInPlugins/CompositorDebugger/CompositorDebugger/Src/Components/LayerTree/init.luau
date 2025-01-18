local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_join_0 = v1.join;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_TreeView_0 = v2.UI.TreeView;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v12 = require(l_Actions_0.SetSelectedLayer);
local v13 = require(l_Actions_0.SetHistoryField);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.LayerTreeRow);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v17 = require(l_Thunks_0.SetScrubberOffset);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v19 = require(l_Util_0.traverse);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v21 = v3.PureComponent:extend("LayerTree");
v21.init = function(v22) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v22.state = {
        Selection = {}, 
        Expansion = {}
    };
    v22.getItemId = function(v23) --[[ Line: 54 ]]
        return v23.id;
    end;
    v22.onExpand = function(v24) --[[ Line: 58 ]]
        -- upvalues: v22 (copy), l_join_0 (ref)
        v22:setState({
            Expansion = l_join_0(v22.state.Expansion, v24)
        });
    end;
    v22.onToggleAdornment = function(v25) --[[ Line: 64 ]]
        -- upvalues: v22 (copy)
        if v22.props.OnToggleAdornment then
            v22.props.OnToggleAdornment(v25);
        end;
    end;
    v22.onSelect = function(v26) --[[ Line: 70 ]]
        -- upvalues: v22 (copy)
        for v27, _ in v26 do
            v22.props.SetSelectedLayer(v27);
        end;
        v22.props.SetScrubberOffset(v22.props.HistoryOffset);
        v22.props.ClearHistoryField();
        v22:setState({
            Selection = v26
        });
    end;
end;
updateTreeViewItems = function(v29, v30) --[[ Line: 82 ]] --[[ Name: updateTreeViewItems ]]
    -- upvalues: v19 (copy)
    local v31 = {};
    if v29 then
        v19(v29, function(v32) --[[ Line: 86 ]]
            -- upvalues: v30 (copy), v31 (copy)
            if v30[v32.id] == nil then
                v31[v32.id] = true;
            end;
            if v32.children then
                table.sort(v32.children, function(v33, v34) --[[ Line: 93 ]]
                    if v33.index and v34.index and v33.index ~= v34.index then
                        return v33.index < v34.index;
                    elseif v33.name and v34.name and v33.name ~= v34.name then
                        return v33.name < v34.name;
                    elseif v33.className and v34.className and v33.className ~= v34.className then
                        return v33.className < v34.className;
                    else
                        return v33.id < v34.id;
                    end;
                end);
            end;
        end);
    end;
    return v31;
end;
v21.getDerivedStateFromProps = function(v35, v36) --[[ Line: 111 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_join_0 (copy)
    local v37 = updateTreeViewItems(v35.FramePayload, v36.Expansion);
    if next(v37) then
        return {
            Expansion = l_join_0(v36.Expansion, v37)
        };
    else
        return {};
    end;
end;
v21.render = function(v38) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_TreeView_0 (copy), v15 (copy)
    local l_state_0 = v38.state;
    local l_props_0 = v38.props;
    local l_FramePayload_0 = l_props_0.FramePayload;
    return v3.createElement(l_TreeView_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        RootItems = {
            l_FramePayload_0
        }, 
        Expansion = l_state_0.Expansion, 
        Selection = l_state_0.Selection, 
        GetItemId = v38.getItemId, 
        RowComponent = v15, 
        RowProps = {
            GetItemId = v38.getItemId, 
            Adornments = l_props_0.Adornments, 
            OnToggleAdornment = v38.onToggleAdornment
        }, 
        RowHeight = 26, 
        OnExpansionChange = v38.onExpand, 
        OnSelectionChange = v38.onSelect, 
        ScrollingDirection = Enum.ScrollingDirection.Y
    }, {});
end;
v21 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v21);
return (v4.connect(function(v42, _) --[[ Line: 152 ]] --[[ Name: mapStateToProps ]]
    return {
        HistoryOffset = v42.Status.HistoryOffset
    };
end, function(v44) --[[ Line: 158 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v17 (copy), v12 (copy)
    return {
        ClearHistoryField = function() --[[ Line: 160 ]] --[[ Name: ClearHistoryField ]]
            -- upvalues: v44 (copy), v13 (ref)
            v44(v13(nil, nil, nil));
        end, 
        SetScrubberOffset = function(v45) --[[ Line: 164 ]] --[[ Name: SetScrubberOffset ]]
            -- upvalues: v44 (copy), v17 (ref)
            v44(v17(v45));
        end, 
        SetSelectedLayer = function(v46) --[[ Line: 168 ]] --[[ Name: SetSelectedLayer ]]
            -- upvalues: v44 (copy), v12 (ref)
            v44(v12(v46));
        end
    };
end)(v21));