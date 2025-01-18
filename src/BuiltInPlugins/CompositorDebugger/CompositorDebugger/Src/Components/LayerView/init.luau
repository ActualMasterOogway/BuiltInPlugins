local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_copy_0 = v1.copy;
local l_join_0 = v1.join;
local l_keys_0 = v1.keys;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v17 = require(l_Actions_0.SetExpandedSections);
local v18 = require(l_Actions_0.SetHistoryField);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v20 = require(l_Components_0.LayerViewCell);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v22 = require(l_Thunks_0.SetOverride);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v24 = require(l_Util_0.Constants);
local v25 = require(l_Util_0.debugFlags);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v28 = {
    layerDetails = {
        Formatters = {
            weight = function(v27) --[[ Line: 70 ]] --[[ Name: toPercent ]]
                return tostring((math.floor(v27 * 100 + 0.5))) .. "%";
            end
        }
    }, 
    props = {
        Editable = true, 
        Overrides = true, 
        History = true
    }, 
    state = {
        History = true
    }, 
    watches = {
        History = true
    }
};
local v33 = {
    number = {
        Type = "Number", 
        History = true
    }, 
    string = {
        Type = "Text"
    }, 
    boolean = {
        Type = "Checkbox"
    }, 
    Vector2 = {
        Type = "Vector", 
        Components = {
            "X", 
            "Y"
        }, 
        GetValue = function(v29) --[[ Line: 100 ]] --[[ Name: GetValue ]]
            return Vector2.new(v29[1], v29[2]);
        end, 
        GetComponents = function(v30) --[[ Line: 103 ]] --[[ Name: GetComponents ]]
            return {
                v30.X, 
                v30.Y
            };
        end, 
        History = true
    }, 
    Vector3 = {
        Type = "Vector", 
        Components = {
            "X", 
            "Y", 
            "Z"
        }, 
        GetValue = function(v31) --[[ Line: 111 ]] --[[ Name: GetValue ]]
            return (Vector3.new(v31[1], v31[2], v31[3]));
        end, 
        GetComponents = function(v32) --[[ Line: 114 ]] --[[ Name: GetComponents ]]
            return {
                v32.X, 
                v32.Y, 
                v32.Z
            };
        end, 
        History = true
    }
};
local v34 = v3.PureComponent:extend("LayerView");
v34.init = function(v35) --[[ Line: 123 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy), v24 (copy)
    v35.getChildren = function(v36) --[[ Line: 124 ]]
        return v36.children or {};
    end;
    v35.getItemId = function(v37) --[[ Line: 128 ]]
        return v37.id;
    end;
    v35.onToggle = function(v38) --[[ Line: 132 ]]
        -- upvalues: v35 (copy), l_join_0 (ref)
        v35.props.SetExpandedSections(l_join_0(v35.props.ExpandedSections, v38));
    end;
    v35.onDoubleClick = function(v39) --[[ Line: 136 ]]
        -- upvalues: v35 (copy)
        if v39.hasChildren then
            local v40 = v35.getItemId(v39.item);
            v35.onToggle({
                [v40] = v35.props.ExpandedSections[v40] == false
            });
        end;
    end;
    v35.onCellEdited = function(v41, v42) --[[ Line: 145 ]]
        -- upvalues: v35 (copy)
        v35.props.SetOverride(v42.id, v42.field, v41);
    end;
    v35.onCellAction = function(v43, v44) --[[ Line: 149 ]]
        -- upvalues: v24 (ref), v35 (copy)
        if v43 == v24.LAYERVIEW_ACTIONS.Clear then
            v35.props.SetOverride(v44.id, v44.field, nil);
            return;
        else
            if v43 == v24.LAYERVIEW_ACTIONS.History then
                v35.props.SetHistoryField(v44.id, v44.section, v44.field);
            end;
            return;
        end;
    end;
    v35:setState({
        LayerData = nil
    });
end;
local _ = function(v45, v46) --[[ Line: 162 ]] --[[ Name: findOverride ]]
    local l_v45_0 = v45;
    for _, v49 in v46 do
        l_v45_0 = l_v45_0 and l_v45_0[v49];
    end;
    return l_v45_0;
end;
local function v51(v52, v53, v54, v55, v56, v57) --[[ Line: 170 ]] --[[ Name: addChildren ]]
    -- upvalues: v28 (copy), l_keys_0 (copy), l_copy_0 (copy), v24 (copy), v51 (copy), v33 (copy)
    if not v55 then
        return;
    else
        assert(v55);
        local v58 = v28[v54];
        local v59 = v58 and v58.Editable;
        local v60 = v58 and v58.Overrides;
        local v61 = v58 and v58.History;
        v57 = v57 or {};
        local v62 = l_keys_0(v55);
        table.sort(v62);
        for _, v64 in v62 do
            local v65 = v55[v64];
            local v66 = {};
            local v67 = l_copy_0(v57);
            table.insert(v67, v64);
            if v60 and v56 then
                local l_v56_0 = v56;
                for _, v70 in v67 do
                    l_v56_0 = l_v56_0 and l_v56_0[v70];
                end;
                local l_l_v56_0_0 = l_v56_0;
                if l_l_v56_0_0 ~= nil then
                    v65 = l_l_v56_0_0;
                    table.insert(v66, {
                        Id = v24.LAYERVIEW_ACTIONS.Clear, 
                        Icon = "rbxasset://textures/CompositorDebugger/clear.png", 
                        Tooltip = "ClearOverride"
                    });
                end;
            end;
            local v72 = {
                name = v64, 
                id = v54 .. "|" .. table.concat(v67, "|"), 
                path = {
                    id = v53, 
                    section = v54, 
                    field = v67
                }
            };
            local v73 = typeof(v65);
            if v73 == "table" then
                v72.value = {
                    Value = "", 
                    Actions = v66
                };
                v72.children = {};
                v51(v72.children, v53, v54, v65, v56, v67);
            elseif not v33[v73] then
                v72.value = "[" .. v73 .. "]";
            else
                if v61 and v33[v73].History then
                    table.insert(v66, {
                        Id = v24.LAYERVIEW_ACTIONS.History, 
                        Icon = "rbxasset://textures/CompositorDebugger/history.png", 
                        Tooltip = "ViewHistory"
                    });
                else
                    table.insert(v66, {
                        Id = v24.LAYERVIEW_ACTIONS.NoOp
                    });
                end;
                local l_v65_0 = v65;
                if v58 and v58.Formatters and v58.Formatters[v64] then
                    l_v65_0 = v58.Formatters[v64](v65);
                end;
                v72.value = {
                    Value = l_v65_0, 
                    Disabled = not v59, 
                    Schema = v33[v73], 
                    Actions = v66
                };
            end;
            table.insert(v52, v72);
        end;
        table.sort(v52, function(v75, v76) --[[ Line: 258 ]]
            if typeof(v75.name) == typeof(v76.name) then
                return v75.name < v76.name;
            else
                return typeof(v75.name) < typeof(v76.name);
            end;
        end);
        return;
    end;
end;
local function _(v77, v78, v79, v80) --[[ Line: 269 ]] --[[ Name: addSectionWrapper ]]
    -- upvalues: v51 (copy)
    return function(v81, v82) --[[ Line: 275 ]]
        -- upvalues: v80 (copy), v51 (ref), v78 (copy), v79 (copy), v77 (copy)
        if v82 and next(v82) then
            local v83 = {
                name = v80:getText("LayerView", v81), 
                children = {}, 
                id = v81
            };
            v51(v83.children, v78, v81, v82, v79);
            table.insert(v77, v83);
        end;
    end;
end;
local function v94(v85, v86, v87) --[[ Line: 288 ]] --[[ Name: formatLayerData ]]
    -- upvalues: v25 (copy), v51 (copy)
    if not v85 then
        return nil;
    else
        local v88 = {};
        if v25.ShowLayerID then
            table.insert(v88, {
                name = v85.id, 
                children = {}, 
                id = v85.id or "uuid"
            });
        end;
        local l_id_0 = v85.id;
        local function v93(v90, v91) --[[ Line: 275 ]]
            -- upvalues: v87 (copy), v51 (ref), l_id_0 (copy), v86 (copy), v88 (copy)
            if v91 and next(v91) then
                local v92 = {
                    name = v87:getText("LayerView", v90), 
                    children = {}, 
                    id = v90
                };
                v51(v92.children, l_id_0, v90, v91, v86);
                table.insert(v88, v92);
            end;
        end;
        v93("layerDetails", {
            name = v85.name or "", 
            lod = v85.lod, 
            class = v85.className, 
            children = v85.children and #v85.children or 0, 
            weight = v85.weight
        });
        v93("linkData", v85.linkData);
        v93("props", v85.props);
        v93("state", v85.state);
        v93("watches", v85.watches);
        return v88;
    end;
end;
v34.getDerivedStateFromProps = function(v95, _) --[[ Line: 319 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v94 (copy), v3 (copy)
    return {
        LayerData = v94(v95.LayerData, v95.Overrides, v95.Localization) or v3.None
    };
end;
v34.render = function(v97) --[[ Line: 325 ]] --[[ Name: render ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_copy_0 (copy), v25 (copy), v3 (copy), l_TextInput_0 (copy), l_TreeTable_0 (copy), v20 (copy), l_Pane_0 (copy)
    local l_state_0 = v97.state;
    local l_props_0 = v97.props;
    if l_props_0.RawMode then
        local v100 = nil;
        local v101 = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable);
        if l_props_0.LayerData then
            local v102 = l_copy_0(l_props_0.LayerData);
            if not v25.ShowRawDataChildren then
                v102.children = if v102.children then #v102.children else 0;
            end;
            if not v25.ShowLayerID then
                v102.id = nil;
            end;
            v101(v102, nil, function(v103) --[[ Line: 344 ]]
                -- upvalues: v100 (ref)
                v100 = v103;
            end);
        else
            v100 = "{}";
        end;
        return v3.createElement(l_TextInput_0, {
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = l_props_0.LayoutOrder, 
            MultiLine = true, 
            Disabled = true, 
            Text = v100, 
            [v3.Tag] = l_props_0[v3.Tag]
        });
    elseif l_state_0.LayerData then
        return v3.createElement(l_TreeTable_0, {
            LayoutOrder = l_props_0.LayoutOrder, 
            Columns = {
                {
                    Name = "Name", 
                    Key = "name"
                }, 
                {
                    Name = "Value", 
                    Key = "value"
                }
            }, 
            Expansion = l_props_0.ExpandedSections, 
            Selection = {}, 
            RootItems = l_state_0.LayerData, 
            ShowHeader = false, 
            GetChildren = v97.getChildren, 
            GetItemId = v97.getItemId, 
            FullSpan = true, 
            FullSpanEmphasis = true, 
            Scroll = true, 
            CellComponent = v20, 
            OnExpansionChange = v97.onToggle, 
            OnDoubleClick = v97.onDoubleClick, 
            OnCellEdited = v97.onCellEdited, 
            OnCellAction = v97.onCellAction, 
            [v3.Tag] = l_props_0[v3.Tag]
        });
    else
        return v3.createElement(l_Pane_0, {
            LayoutOrder = l_props_0.LayoutOrder, 
            [v3.Tag] = l_props_0[v3.Tag]
        });
    end;
end;
v34 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v34);
return (v4.connect(function(v104, _) --[[ Line: 397 ]] --[[ Name: mapStateToProps ]]
    return {
        ExpandedSections = v104.Status.ExpandedSections, 
        HistoryField = v104.Status.HistoryField
    };
end, function(v106) --[[ Line: 404 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy), v22 (copy), v18 (copy)
    return {
        SetExpandedSections = function(v107) --[[ Line: 406 ]] --[[ Name: SetExpandedSections ]]
            -- upvalues: v106 (copy), v17 (ref)
            v106(v17(v107));
        end, 
        SetOverride = function(v108, v109, v110) --[[ Line: 410 ]] --[[ Name: SetOverride ]]
            -- upvalues: v106 (copy), v22 (ref)
            v106(v22(v108, v109, v110));
        end, 
        SetHistoryField = function(v111, v112, v113) --[[ Line: 414 ]] --[[ Name: SetHistoryField ]]
            -- upvalues: v106 (copy), v18 (ref)
            v106(v18(v111, v112, v113));
        end
    };
end)(v34));