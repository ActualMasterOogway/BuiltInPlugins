local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v4.copy;
local l_join_0 = v4.join;
local l_joinDeep_0 = v4.joinDeep;
local v8 = require(l_Parent_0.Packages.Framework);
local l_TreeTable_0 = v8.UI.TreeTable;
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.Clipboard);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.Clipboard.CopyPropertyToClipboard);
local v17 = require(l_Actions_0.Window.SelectItem);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v19 = require(l_Thunks_0.Change.RenameStyleRuleProperty);
local v20 = require(l_Thunks_0.Change.SetStyleRuleProperty);
local v21 = require(l_Thunks_0.Change.SetStyleRulePropertyType);
local v22 = require(l_Thunks_0.Change.SetStyleRuleSelector);
local v23 = require(l_Thunks_0.ContextMenu.ShowStyleRuleMenu);
local v24 = require(l_Thunks_0.Change.UnlinkStyleRulePropertyTokenReference);
local v25 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v26 = require(l_Parent_0.Src.Util.DesignHelpers);
local v27 = require(l_Parent_0.Src.Util.MenuHelpers);
local v28 = require(l_Parent_0.Src.Resources.ModernIcons);
local v29 = require(l_Parent_0.Src.Util.StyleSchema);
local v30 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v31 = require(l_Parent_0.Src.Util.TokenHelpers);
local v32 = require(l_Parent_0.Src.Renderers);
local v33 = require(l_Parent_0.Src.Util.bind);
local v34 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v35 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v36 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v37 = require(script.Tree);
local l_EditTree_0 = v37.EditTree;
local v39 = v2.PureComponent:extend("SelectorPropertyTable");
v39.init = function(v40) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy), v37 (copy), l_EditTree_0 (copy), l_join_0 (copy), v29 (copy), v28 (copy), v33 (copy), v27 (copy), v30 (copy), v31 (copy), v26 (copy), v23 (copy), v22 (copy), v19 (copy), v20 (copy), v35 (copy), l_joinDeep_0 (copy), v21 (copy), v24 (copy), v16 (copy), v34 (copy), v17 (copy)
    v40.state = {
        rootInstance = nil, 
        table = {
            Columns = l_copy_0(v37.Columns), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    local v41 = l_EditTree_0:getStateAdaptor(v40, "table");
    v40.tableCallbacks = l_EditTree_0:getCallbacks(v41);
    v40.onDoubleClick = function(v42) --[[ Line: 107 ]]
        -- upvalues: v41 (copy), l_EditTree_0 (ref), l_join_0 (ref), v29 (ref)
        v41(function(v43) --[[ Line: 108 ]]
            -- upvalues: l_EditTree_0 (ref), v42 (copy), l_join_0 (ref), v29 (ref)
            if not l_EditTree_0:getChild(v43.Items, v42) then
                return nil;
            else
                local v44 = {
                    Schema = l_join_0(v29.SelectorSchema, {
                        Editing = true
                    })
                };
                return l_EditTree_0:updateCell(v43, v44, v42, 1);
            end;
        end);
    end;
    v40.canPasteProperty = function() --[[ Line: 118 ]]
        -- upvalues: v40 (copy)
        return v40.props.ClipboardProperty ~= nil;
    end;
    v40.canPasteSelector = function() --[[ Line: 123 ]]
        -- upvalues: v40 (copy)
        return v40.props.ClipboardInstance ~= nil;
    end;
    v40.selectRow = function(v45, v46) --[[ Line: 128 ]]
        -- upvalues: v41 (copy), l_join_0 (ref)
        v41(function(v47) --[[ Line: 129 ]]
            -- upvalues: v46 (copy), v45 (copy), l_join_0 (ref)
            local l_Expansion_0 = v47.Expansion;
            if v46 and v47.Selection[v45] == true then
                local v49 = not v47.Expansion[v45];
                l_Expansion_0 = l_join_0(v47.Expansion, {
                    [v45] = v49
                });
            end;
            return l_join_0(v47, {
                Selection = {
                    [v45] = true
                }, 
                Expansion = l_Expansion_0
            });
        end);
    end;
    v40.onRightClickRow = function(v50) --[[ Line: 150 ]]
        -- upvalues: v40 (copy)
        local l_item_0 = v50.item;
        v40.selectRow(l_item_0.Id, false);
        v40.showContextMenu(l_item_0);
    end;
    v40.showEmptyRowContextMenu = function(v52) --[[ Line: 158 ]]
        -- upvalues: v40 (copy), v28 (ref), v33 (ref), v27 (ref)
        local l_props_0 = v40.props;
        local l_Localization_0 = l_props_0.Localization;
        local v55 = {
            Id = "EmptyRowMenu", 
            Children = {
                {
                    Id = "PasteProperty", 
                    Text = l_Localization_0:getText("ContextMenu", "Paste"), 
                    Icon = v28.paste(), 
                    Enabled = v40.canPasteProperty(), 
                    OnItemClicked = v33(v40.menuActions.pasteProperty, {
                        v52
                    })
                }
            }
        };
        local v56 = l_props_0.Plugin:get();
        local v57 = l_props_0.Telemetry:get();
        v27.trackClicks(v55, v57);
        v27.showContextMenu(v56, v55);
    end;
    v40.showPropertyRowContextMenu = function(v58) --[[ Line: 181 ]]
        -- upvalues: v40 (copy), v29 (ref), v30 (ref), v31 (ref), v26 (ref), v28 (ref), v33 (ref), v27 (ref)
        local l_props_1 = v40.props;
        local l_Localization_1 = l_props_1.Localization;
        local v61 = v58.Value.Schema.Type == v29.TokenReferenceSchema.Type;
        local v62 = v30.getSelectorChain(l_props_1.RootInstance);
        local v63 = if v62 then v62.Class ~= "" else false;
        local v64 = v31.getTokenSourceStyleSheet(l_props_1.RootInstance, v58.Value.Value);
        local v65 = v26.isTheme(v64);
        local v66 = if v61 then {
            Id = "UnlinkToken", 
            Text = l_Localization_1:getText("ContextMenu", "UnlinkToken"), 
            Icon = v28.Standard.TokenSheet(), 
            OnItemClicked = v33(v40.menuActions.unlinkToken, {
                v58
            })
        } else {
            Id = "LinkToken", 
            Text = l_Localization_1:getText("ContextMenu", "LinkToken"), 
            Icon = v28.Standard.TokenSheet(), 
            OnItemClicked = v33(v40.menuActions.linkToken, {
                v58
            })
        };
        local v67 = v29.getPossiblePropertyTypes(v58.Name.Value);
        local v68 = v27.getAttributeTypeActions(v67, v33(v40.menuActions.changePropertyType, {
            v58
        }));
        local v69 = {
            Id = "PropertyRowMenu", 
            Children = {
                v66, 
                {
                    Id = "ViewTheme", 
                    Text = l_Localization_1:getText("ContextMenu", v65 and "ViewTheme" or "ViewToken"), 
                    Icon = v28.open(), 
                    Hidden = not v61, 
                    OnItemClicked = v33(v40.menuActions.viewTheme, {
                        v58
                    })
                }, 
                {
                    Id = "ChangeType", 
                    Text = l_Localization_1:getText("ContextMenu", "ChangeType"), 
                    Hidden = v63 or #v67 <= 1, 
                    Children = v68
                }, 
                {
                    Id = "Copy", 
                    Text = l_Localization_1:getText("ContextMenu", "Copy"), 
                    Icon = v28.copy(), 
                    OnItemClicked = v33(v40.menuActions.copyProperty, {
                        v58
                    })
                }, 
                {
                    Id = "Paste", 
                    Text = l_Localization_1:getText("ContextMenu", "Paste"), 
                    Icon = v28.paste(), 
                    Enabled = v40.canPasteProperty(), 
                    OnItemClicked = v33(v40.menuActions.pasteProperty, {
                        v58
                    })
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_1:getText("ContextMenu", "Delete"), 
                    Icon = v28.delete(), 
                    OnItemClicked = v33(v40.menuActions.deleteProperty, {
                        v58
                    })
                }
            }
        };
        local v70 = l_props_1.Plugin:get();
        local v71 = l_props_1.Telemetry:get();
        v27.trackClicks(v69, v71);
        v27.showContextMenu(v70, v69);
    end;
    v40.showContextMenu = function(v72) --[[ Line: 254 ]]
        -- upvalues: v40 (copy), v23 (ref)
        local l_props_2 = v40.props;
        if typeof(v72.Instance) == "Instance" then
            l_props_2.dispatch(v23(v72.Instance, v40.menuActions.rename, false));
            return;
        elseif not v72.Value or not v72.Value.Schema then
            return;
        elseif v72.Value.Schema.Type == "Empty" then
            v40.showEmptyRowContextMenu(v72);
            return;
        else
            v40.showPropertyRowContextMenu(v72);
            return;
        end;
    end;
    v40.onEdited = function(v74, v75, v76) --[[ Line: 273 ]]
        -- upvalues: v40 (copy), l_EditTree_0 (ref), v22 (ref), v41 (copy), l_join_0 (ref), v29 (ref), v37 (ref), v19 (ref), v20 (ref)
        local l_props_3 = v40.props;
        local l_state_0 = v40.state;
        local v79 = l_EditTree_0:getChild(l_state_0.table.Items, v75);
        if not v79 then
            return;
        elseif v79.Name.FullSpan then
            if not v79.Instance then
                warn("Table row without valid StyleRule reference:", v79);
                return;
            else
                assert(v79.Instance ~= nil, "expecting valid instance");
                local l_v74_0 = v74;
                l_props_3.dispatch(v22(v79.Instance, l_v74_0));
                if l_v74_0 == v79.Name.Value then
                    v41(function(v81) --[[ Line: 295 ]]
                        -- upvalues: l_join_0 (ref), v29 (ref), l_EditTree_0 (ref), v75 (copy)
                        local v82 = {
                            Schema = l_join_0(v29.SelectorSchema, {
                                Editing = false
                            })
                        };
                        return l_EditTree_0:updateCell(v81, v82, v75, 1);
                    end);
                end;
                return;
            end;
        else
            local l_Value_0 = v79.Name.Value;
            local v84 = l_EditTree_0:getParent(l_state_0.table.Items, v79);
            local l_Instance_0 = v84.Instance;
            if typeof(v79.SetParentValue) == "function" then
                v74 = v79.SetParentValue(v74);
                l_Value_0 = v84.Name.Value;
                l_Instance_0 = l_EditTree_0:getParent(l_state_0.table.Items, v84).Instance;
            end;
            if not l_Instance_0 then
                warn("Table row without valid StyleRule reference:", v84);
                return;
            elseif v76 == v37.NAME_COLUMN_INDEX then
                l_props_3.dispatch(v19(l_Instance_0, l_Value_0, v74));
                return;
            else
                if v76 == v37.VALUE_COLUMN_INDEX then
                    l_props_3.dispatch(v20(l_Instance_0, l_Value_0, v74));
                end;
                return;
            end;
        end;
    end;
    v40.tableCallbacks.OnSelectionChange = function(v86) --[[ Line: 328 ]]
        -- upvalues: v35 (ref), v40 (copy)
        local v87 = v35.getOneSelectedItem(v86);
        if v87 then
            v40.selectRow(v87, true);
        end;
    end;
    v40.onSizeChange = function(_, v89) --[[ Line: 335 ]]
        -- upvalues: v40 (copy), l_joinDeep_0 (ref)
        local v90 = math.min(250, 0.4 * v89);
        local v91 = UDim.new(0, v90);
        local v92 = UDim.new(1, -v90);
        v40:setState(function(v93) --[[ Line: 339 ]]
            -- upvalues: l_joinDeep_0 (ref), v91 (copy), v92 (copy)
            return {
                table = l_joinDeep_0(v93.table, {
                    Columns = {
                        {
                            Width = v91
                        }, 
                        {
                            Width = v92
                        }
                    }
                })
            };
        end);
    end;
    v40.menuActions = {
        linkToken = function(v94, _) --[[ Line: 356 ]] --[[ Name: linkToken ]]
            -- upvalues: v40 (copy), l_EditTree_0 (ref), v21 (ref)
            local l_props_4 = v40.props;
            local l_state_1 = v40.state;
            local v98 = l_EditTree_0:getParent(l_state_1.table.Items, v94);
            local l_Value_1 = v94.Name.Value;
            l_props_4.dispatch(v21(v98.Instance, l_Value_1, "TokenReference"));
        end, 
        unlinkToken = function(v100, _) --[[ Line: 365 ]] --[[ Name: unlinkToken ]]
            -- upvalues: v40 (copy), l_EditTree_0 (ref), v24 (ref)
            local l_props_5 = v40.props;
            local l_state_2 = v40.state;
            local v104 = l_EditTree_0:getParent(l_state_2.table.Items, v100);
            local l_Value_2 = v100.Name.Value;
            l_props_5.dispatch(v24(v104.Instance, l_Value_2));
        end, 
        changePropertyType = function(v106, v107) --[[ Line: 374 ]] --[[ Name: changePropertyType ]]
            -- upvalues: v40 (copy), l_EditTree_0 (ref), v21 (ref)
            local l_props_6 = v40.props;
            local v109 = if v107.Data then v107.Data.Type else nil;
            if not v109 then
                warn("Cannot change to nil type");
                return;
            else
                local l_state_3 = v40.state;
                local v111 = l_EditTree_0:getParent(l_state_3.table.Items, v106);
                local l_Value_3 = v106.Name.Value;
                l_props_6.dispatch(v21(v111.Instance, l_Value_3, v109));
                return;
            end;
        end, 
        copyProperty = function(v113, _) --[[ Line: 389 ]] --[[ Name: copyProperty ]]
            -- upvalues: v40 (copy), v16 (ref)
            v40.props.dispatch(v16(v113.Name.Value, v113.Value.Value));
        end, 
        pasteProperty = function(v115, _) --[[ Line: 394 ]] --[[ Name: pasteProperty ]]
            -- upvalues: v40 (copy), l_EditTree_0 (ref), v34 (ref)
            local l_state_4 = v40.state;
            local l_props_7 = v40.props;
            if not l_props_7.ClipboardProperty then
                return;
            else
                assert(l_props_7.ClipboardProperty, "ClipboardProperty cannot be nil");
                local v119 = l_EditTree_0:getParent(l_state_4.table.Items, v115);
                if not v119 or not v119.Instance then
                    return;
                else
                    v34({
                        Name = "StyleEditor.PasteProperty", 
                        DisplayName = "StyleEditor - Paste Property", 
                        DoChange = function() --[[ Line: 411 ]] --[[ Name: DoChange ]]
                            -- upvalues: v119 (copy), l_props_7 (copy)
                            v119.Instance:SetProperty(l_props_7.ClipboardProperty.Name, l_props_7.ClipboardProperty.Value);
                            return Enum.FinishRecordingOperation.Commit;
                        end
                    });
                    return;
                end;
            end;
        end, 
        deleteProperty = function(v120, _) --[[ Line: 420 ]] --[[ Name: deleteProperty ]]
            -- upvalues: l_EditTree_0 (ref), v40 (copy), v34 (ref)
            local v122 = l_EditTree_0:getParent(v40.state.table.Items, v120);
            if not v122 or not v122.Instance then
                return;
            else
                v34({
                    Name = "StyleEditor.DeleteProperty", 
                    DisplayName = "Style Editor - Delete Property", 
                    DoChange = function() --[[ Line: 429 ]] --[[ Name: DoChange ]]
                        -- upvalues: v122 (copy), v120 (copy)
                        v122.Instance:SetProperty(v120.Name.Value, nil);
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                return;
            end;
        end, 
        viewTheme = function(v123, _) --[[ Line: 436 ]] --[[ Name: viewTheme ]]
            -- upvalues: v40 (copy), v31 (ref), v35 (ref), v17 (ref)
            local l_props_8 = v40.props;
            local v126 = v31.getTokenSourceStyleSheet(v40.props.RootInstance, v123.Value.Value);
            if v126 then
                local v127 = v35.createItemId(v126);
                l_props_8.dispatch(v17(v127));
            end;
        end, 
        rename = function(v128, _) --[[ Line: 445 ]] --[[ Name: rename ]]
            -- upvalues: v40 (copy)
            v40.onDoubleClick(v128.Path);
        end
    };
    v40.onAction = function(v130, v131, _) --[[ Line: 450 ]]
        -- upvalues: l_EditTree_0 (ref), v40 (copy)
        if v130 == "Menu" then
            local v133 = l_EditTree_0:getChild(v40.state.table.Items, v131);
            v40.showContextMenu(v133);
        end;
    end;
    v40.onPropertyPressed = function(v134, _) --[[ Line: 457 ]]
        -- upvalues: v40 (copy), l_EditTree_0 (ref)
        local l_state_5 = v40.state;
        local v137 = l_EditTree_0:getChild(l_state_5.table.Items, v134);
        v40.selectRow(v137.Id, false);
    end;
end;
v39.getDerivedStateFromProps = function(v138, v139) --[[ Line: 465 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v37 (copy), l_copy_0 (copy), l_join_0 (copy)
    local l_RootInstance_0 = v138.RootInstance;
    if l_RootInstance_0 ~= v139.rootInstance or v138.IsDirty then
        local v141 = v37.buildItems(l_RootInstance_0);
        local v142 = {};
        local v143 = {};
        if l_RootInstance_0 == v139.rootInstance then
            v143 = l_copy_0(v139.table.Expansion);
            v142 = l_copy_0(v139.table.Selection);
        end;
        v37.expandNewRows(v141, v143);
        return l_join_0(v139, {
            rootInstance = l_RootInstance_0, 
            table = l_join_0(v139.table, {
                Expansion = v143, 
                Selection = v142, 
                Items = v141
            })
        });
    else
        return v139;
    end;
end;
v39.render = function(v144) --[[ Line: 491 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v37 (copy), v32 (copy), v2 (copy), l_TreeTable_0 (copy)
    local l_state_6 = v144.state;
    local v146 = l_join_0({
        Columns = l_state_6.table.Columns, 
        ClampSize = true, 
        Expansion = l_state_6.table.Expansion, 
        FullSpanEmphasis = true, 
        GetChildren = v37.getItemChildren, 
        GetItemId = v37.getItemId, 
        LayoutOrder = 2, 
        OnCellAction = v144.onAction, 
        OnCellEdited = v144.onEdited, 
        OnCellDoubleClick = v144.onDoubleClick, 
        OnSizeChange = v144.onSizeChange, 
        Renderers = v32, 
        RightClick = v144.onRightClickRow, 
        RootItems = l_state_6.table.Items, 
        RowHeight = 32, 
        Selection = l_state_6.table.Selection, 
        Scroll = true, 
        ScrollProps = {
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
        }, 
        ShowHeader = false, 
        UseScale = true
    }, v144.tableCallbacks);
    return v2.createElement(l_TreeTable_0, v146);
end;
v39 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Telemetry = v36
})(v39);
return v3.connect(function(v147) --[[ Line: 528 ]]
    return {
        IsDirty = v147.Window.IsDirty, 
        ClipboardInstance = v147.Clipboard.Instance, 
        ClipboardProperty = v147.Clipboard.Property
    };
end, v25)(v39);