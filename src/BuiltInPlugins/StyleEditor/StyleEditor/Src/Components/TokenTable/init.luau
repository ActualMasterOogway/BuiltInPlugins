local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v4.copy;
local l_join_0 = v4.join;
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_TreeTable_0 = v7.UI.TreeTable;
local v12 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v13 = require(l_Parent_0.Src.Util.StyleSchema);
local v14 = require(l_Parent_0.Src.Renderers);
local v15 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v16 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v17 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.Clipboard);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v22 = require(l_Thunks_0.ContextMenu.ShowStyleSheetMenu);
local v23 = require(l_Thunks_0.ContextMenu.ShowTokenMenu);
local v24 = require(l_Thunks_0.ContextMenu.ShowEmptyTokenMenu);
local v25 = require(script.Tree);
local l_EditTree_0 = v25.EditTree;
local v27 = v2.PureComponent:extend("TokenTable");
v27.init = function(v28) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_copy_0 (copy), v25 (copy), l_EditTree_0 (copy), v27 (ref), v13 (copy), v15 (copy), l_join_0 (copy), v24 (copy), v22 (copy), v23 (copy), v12 (copy)
    v28.state = {
        selectSchema = v2.None, 
        table = {
            Columns = l_copy_0(v25.Columns), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    local v29 = l_EditTree_0:getStateAdaptor(v28, "table");
    v28.tableCallbacks = l_EditTree_0:getCallbacks(v29);
    v28.setConnections = function() --[[ Line: 94 ]]
        -- upvalues: v28 (copy), v27 (ref), v13 (ref), v25 (ref), v15 (ref), l_join_0 (ref)
        local l_props_0 = v28.props;
        local l_RootInstance_0 = v28.props.RootInstance;
        v27.disconnect(v28.connections);
        v28.connections = {
            styleSheet = l_RootInstance_0.AttributeChanged:Connect(function(v32) --[[ Line: 99 ]]
                -- upvalues: v28 (ref), l_RootInstance_0 (copy), v13 (ref), v25 (ref), l_props_0 (copy), v15 (ref), l_join_0 (ref)
                v28:setState(function(v33) --[[ Line: 100 ]]
                    -- upvalues: l_RootInstance_0 (ref), v32 (copy), v13 (ref), v25 (ref), l_props_0 (ref), v15 (ref), l_join_0 (ref)
                    local l_l_RootInstance_0_Attribute_0 = l_RootInstance_0:GetAttribute(v32);
                    local v35 = v13.getAttributeSchema(l_l_RootInstance_0_Attribute_0);
                    local v36 = v25.buildTree(l_RootInstance_0, l_props_0.ThemeSelected, l_props_0.OnClick, v35);
                    local v37 = v15.createItemId(l_RootInstance_0);
                    local l_Expansion_0 = v33.table.Expansion;
                    l_Expansion_0[v37] = true;
                    return {
                        table = l_join_0(v33.table, {
                            Expansion = l_Expansion_0, 
                            Items = v36
                        })
                    };
                end);
            end)
        };
    end;
    v28.onDoubleClick = function(v39) --[[ Line: 120 ]]
        -- upvalues: v29 (copy), l_EditTree_0 (ref), l_join_0 (ref)
        v29(function(v40) --[[ Line: 121 ]]
            -- upvalues: l_EditTree_0 (ref), v39 (copy), l_join_0 (ref)
            local v41 = l_EditTree_0:getChild(v40.Items, v39);
            if not v41 then
                return nil;
            else
                local v42 = {
                    Schema = l_join_0(v41.Name.Schema, {
                        Editing = true
                    })
                };
                return l_EditTree_0:updateCell(v40, v42, v39, 1);
            end;
        end);
    end;
    v28.onRightClickRow = function(v43) --[[ Line: 131 ]]
        -- upvalues: v28 (copy)
        local l_item_0 = v43.item;
        v28.selectRow(l_item_0.Id, false);
        if l_item_0.Value ~= nil then
            v28.showRowContextMenu(l_item_0.Path);
            return;
        else
            return;
        end;
    end;
    v28.showRowContextMenu = function(v45) --[[ Line: 143 ]]
        -- upvalues: v28 (copy), l_EditTree_0 (ref), v13 (ref), v24 (ref), v22 (ref), v23 (ref)
        local l_props_1 = v28.props;
        local v47 = l_EditTree_0:getChild(v28.state.table.Items, v45);
        local v48 = if v47.Value then v47.Value.Schema else nil;
        local function v49() --[[ Line: 149 ]] --[[ Name: renameItem ]]
            -- upvalues: v28 (ref), v45 (copy)
            v28.onDoubleClick(v45);
        end;
        if v48 == v13.EmptySchema or v48 == v13.SelectTokenSchema then
            l_props_1.dispatch(v24(l_props_1.RootInstance));
            return;
        elseif v47.Name.FullSpan then
            l_props_1.dispatch(v22(l_props_1.RootInstance, v49));
            return;
        else
            l_props_1.dispatch(v23(l_props_1.RootInstance, v47.Name.Value));
            return;
        end;
    end;
    v28.selectRow = function(v50, v51) --[[ Line: 162 ]]
        -- upvalues: v29 (copy), l_join_0 (ref)
        v29(function(v52) --[[ Line: 163 ]]
            -- upvalues: v51 (copy), v50 (copy), l_join_0 (ref)
            local l_Expansion_1 = v52.Expansion;
            if v51 and v52.Selection[v50] == true then
                local v54 = not v52.Expansion[v50];
                l_Expansion_1 = l_join_0(v52.Expansion, {
                    [v50] = v54
                });
            end;
            return l_join_0(v52, {
                Selection = {
                    [v50] = true
                }, 
                Expansion = l_Expansion_1
            });
        end);
    end;
    v28.tableCallbacks.OnSelectionChange = function(v55) --[[ Line: 184 ]]
        -- upvalues: v15 (ref), v28 (copy)
        local v56 = v15.getOneSelectedItem(v55);
        if v56 then
            v28.selectRow(v56, true);
        end;
    end;
    v28.onCellAction = function(v57, v58, _) --[[ Line: 191 ]]
        -- upvalues: v28 (copy)
        if v57 == "Menu" then
            v28.showRowContextMenu(v58);
        end;
    end;
    v28.onTokenEdited = function(v60, v61, v62) --[[ Line: 197 ]]
        -- upvalues: v29 (copy), l_EditTree_0 (ref), v28 (copy), l_join_0 (ref), v12 (ref), v13 (ref)
        v29(function(v63) --[[ Line: 198 ]]
            -- upvalues: l_EditTree_0 (ref), v61 (copy), v28 (ref), v60 (ref), v62 (copy), l_join_0 (ref), v12 (ref), v13 (ref)
            local v64 = l_EditTree_0:getChild(v63.Items, v61);
            local l_RootInstance_1 = v28.props.RootInstance;
            if not v64 then
                return;
            else
                local v66 = {
                    Value = v60
                };
                local v67 = if v64.Value then v64.Value.Schema else v64.Name.Schema;
                if v62 == 1 then
                    if v64.Name.FullSpan then
                        v66.Schema = l_join_0(v67, {
                            Editing = false
                        });
                        v66.Value = if v67.Type == "Theme" then l_RootInstance_1 else v60;
                        v12({
                            Name = "StyleEditor.RenameStyleSheet", 
                            DisplayName = "Style Editor - Rename StyleSheet", 
                            DoChange = function() --[[ Line: 217 ]] --[[ Name: DoChange ]]
                                -- upvalues: l_RootInstance_1 (copy), v60 (ref)
                                l_RootInstance_1.Name = v60;
                                return Enum.FinishRecordingOperation.Commit;
                            end
                        });
                    elseif l_RootInstance_1 and l_RootInstance_1:GetAttribute(v60) ~= nil then
                        v66.Value = v64.Name.Value;
                    elseif v64.Name.Value == "" then
                        v66.Schema = v13.TextSchema;
                        if v67 == v13.SelectTokenSchema and v64.Value.Value then
                            v67 = v64.Value.Value;
                        end;
                        if v67 ~= v13.SelectTokenSchema then
                            v12({
                                Name = "StyleEditor.AddToken", 
                                DisplayName = "Style Editor - Add Token", 
                                DoChange = function() --[[ Line: 235 ]] --[[ Name: DoChange ]]
                                    -- upvalues: l_RootInstance_1 (copy), v60 (ref), v67 (ref)
                                    local l_status_0, _ = pcall(function() --[[ Line: 236 ]]
                                        -- upvalues: l_RootInstance_1 (ref), v60 (ref), v67 (ref)
                                        l_RootInstance_1:SetAttribute(v60, v67.GetDefaultValue());
                                    end);
                                    if l_status_0 then
                                        return Enum.FinishRecordingOperation.Commit;
                                    else
                                        return nil;
                                    end;
                                end
                            });
                        end;
                    else
                        v12({
                            Name = "StyleEditor.EditToken", 
                            DisplayName = "Style Editor - Edit Token", 
                            DoChange = function() --[[ Line: 249 ]] --[[ Name: DoChange ]]
                                -- upvalues: l_RootInstance_1 (copy), v60 (ref), v64 (copy)
                                local l_status_1, _ = pcall(function() --[[ Line: 250 ]]
                                    -- upvalues: l_RootInstance_1 (ref), v60 (ref), v64 (ref)
                                    l_RootInstance_1:SetAttribute(v60, v64.Value.Value);
                                    l_RootInstance_1:SetAttribute(v64.Name.Value, nil);
                                end);
                                if l_status_1 then
                                    return Enum.FinishRecordingOperation.Commit;
                                else
                                    return nil;
                                end;
                            end
                        });
                    end;
                elseif v62 == 2 then
                    local l_Value_0 = v64.Name.Value;
                    if v67 == v13.SelectTokenSchema then
                        v28:setState({
                            selectSchema = v60
                        });
                        if l_Value_0 and l_Value_0 ~= "" then
                            v66.Schema = v60;
                            v60 = v60.GetDefaultValue();
                            v66.Value = v60;
                        end;
                    elseif v64.Name.Schema == v13.ChildComponentSchema then
                        l_Value_0 = l_EditTree_0:getParent(v63.Items, v64).Name.Value;
                        v60 = if v64.SetParentValue then v64.SetParentValue(v60) else v60;
                    end;
                    do
                        local l_l_Value_0_0 = l_Value_0;
                        if l_l_Value_0_0 and l_l_Value_0_0 ~= "" then
                            v12({
                                Name = "StyleEditor.EditToken", 
                                DisplayName = "Style Editor - Edit Token", 
                                DoChange = function() --[[ Line: 280 ]] --[[ Name: DoChange ]]
                                    -- upvalues: l_RootInstance_1 (copy), l_l_Value_0_0 (ref), v60 (ref)
                                    local l_status_2, _ = pcall(function() --[[ Line: 281 ]]
                                        -- upvalues: l_RootInstance_1 (ref), l_l_Value_0_0 (ref), v60 (ref)
                                        l_RootInstance_1:SetAttribute(l_l_Value_0_0, v60);
                                    end);
                                    if l_status_2 then
                                        return Enum.FinishRecordingOperation.Commit;
                                    else
                                        return nil;
                                    end;
                                end
                            });
                        end;
                    end;
                end;
                return l_EditTree_0:updateCell(v63, v66, v61, v62);
            end;
        end);
    end;
end;
v27.didMount = function(v76) --[[ Line: 294 ]] --[[ Name: didMount ]]
    v76.setConnections();
end;
v27.didUpdate = function(v77, v78, _) --[[ Line: 298 ]] --[[ Name: didUpdate ]]
    if v77.props.RootInstance ~= v78.RootInstance or not v77.connections then
        v77.setConnections();
    end;
end;
v27.getDerivedStateFromProps = function(v80, v81) --[[ Line: 306 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v13 (copy), v2 (copy), v25 (copy), v15 (copy), l_join_0 (copy)
    local l_RootInstance_2 = v80.RootInstance;
    if l_RootInstance_2 ~= v81.styleSheet or v80.ThemeSelected ~= v81.ThemeSelected then
        local l_selectSchema_0 = v81.selectSchema;
        if l_RootInstance_2 ~= v81.styleSheet then
            l_selectSchema_0 = if #l_RootInstance_2:GetDerives() > 0 then v13.TokenReferenceSchema else v2.None;
        end;
        local v84 = v25.buildTree(l_RootInstance_2, v80.ThemeSelected, v80.OnClick, l_selectSchema_0);
        local l_Expansion_2 = v81.table.Expansion;
        if v80.ThemeSelected == nil then
            l_Expansion_2[v15.createItemId(l_RootInstance_2)] = true;
        end;
        return l_join_0(v81, {
            selctSchema = l_selectSchema_0, 
            ThemeSelected = v80.ThemeSelected, 
            styleSheet = l_RootInstance_2, 
            table = l_join_0(v81.table, {
                Expansion = l_Expansion_2, 
                Items = v84
            })
        });
    else
        return v81;
    end;
end;
v27.disconnect = function(v86) --[[ Line: 335 ]] --[[ Name: disconnect ]]
    if v86 then
        for v87, v88 in pairs(v86) do
            if v88 then
                v88:Disconnect();
            end;
            v86[v87] = nil;
        end;
    end;
end;
v27.willUnmount = function(v89) --[[ Line: 346 ]] --[[ Name: willUnmount ]]
    -- upvalues: v27 (ref)
    v27.disconnect(v89.connections);
end;
v27.render = function(v90) --[[ Line: 350 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_TreeTable_0 (copy), l_join_0 (copy), v25 (copy), v14 (copy)
    local l_state_0 = v90.state;
    return v2.createElement(l_TreeTable_0, l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Columns = l_state_0.table.Columns, 
        Expansion = l_state_0.table.Expansion, 
        FullSpanEmphasis = true, 
        GetChildren = v25.getItemChildren, 
        GetItemId = v25.getItemId, 
        OnCellAction = v90.onCellAction, 
        OnCellDoubleClick = v90.onDoubleClick, 
        OnCellEdited = v90.onTokenEdited, 
        OnCellPressed = v90.onPropertyPressed, 
        RightClick = v90.onRightClickRow, 
        RootItems = l_state_0.table.Items, 
        RowHeight = 32, 
        Renderers = v14, 
        ShowHeader = false, 
        Selection = l_state_0.table.Selection, 
        UseScale = true
    }, v90.tableCallbacks));
end;
v27 = l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_ContextServices_0.Plugin, 
    Telemetry = v16
})(v27);
return v3.connect(function(v92) --[[ Line: 383 ]]
    return {
        ClipboardAttribute = v92.Clipboard.Attribute
    };
end, v17)(v27);