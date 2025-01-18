local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeTable_0 = v5.UI.TreeTable;
local v9 = require(l_Parent_0.Src.Renderers.DeriveRenderer);
local v10 = require(l_Parent_0.Src.Util.DesignHelpers);
local v11 = require(l_Parent_0.Src.Util.StyleSchema);
local v12 = require(l_Parent_0.Src.Util.getAutocompleteItems);
local v13 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v14 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v17 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v17.collectArray;
local l_filter_0 = v17.filter;
local l_join_0 = v17.join;
local l_mapOne_0 = v17.mapOne;
local l_copy_0 = v17.copy;
local l_insert_0 = table.insert;
local v26 = l_TreeTable_0.EditTree.new({
    getChildren = function(v24) --[[ Line: 43 ]] --[[ Name: getChildren ]]
        return v24.Children or {};
    end, 
    getId = function(v25) --[[ Line: 46 ]] --[[ Name: getId ]]
        return v25;
    end
});
local v27 = {
    {
        Name = "Name", 
        Key = "Name", 
        Width = UDim.new(1, 0)
    }
};
local v28 = v3.PureComponent:extend("DerivesTable");
v28.init = function(v29) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy), v27 (copy), v26 (copy), v13 (copy), l_mapOne_0 (copy), v10 (copy), l_collectArray_0 (copy), v12 (copy)
    v29.state = {
        allSheets = {}, 
        styleSheet = nil, 
        table = {
            Columns = l_copy_0(v27), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    local v30 = v26:getStateAdaptor(v29, "table");
    v29.tableCallbacks = v26:getCallbacks(v30);
    v29.onEdited = function(v31, _, _) --[[ Line: 107 ]]
        -- upvalues: v29 (copy), v13 (ref), l_mapOne_0 (ref), v10 (ref)
        local l_props_0 = v29.props;
        local l_state_0 = v29.state;
        local l_StyleSheet_0 = l_props_0.StyleSheet;
        v13({
            Name = "StyleEditor.SetDerives", 
            DisplayName = "Style Editor - Set Derives", 
            DoChange = function() --[[ Line: 116 ]] --[[ Name: DoChange ]]
                -- upvalues: l_state_0 (copy), l_mapOne_0 (ref), v31 (copy), v10 (ref), l_StyleSheet_0 (copy)
                local l_allSheets_0 = l_state_0.allSheets;
                local v39 = l_mapOne_0(l_allSheets_0, function(v38) --[[ Line: 118 ]]
                    -- upvalues: v31 (ref)
                    if v38.Name == v31 then
                        return v38;
                    else
                        return nil;
                    end;
                end);
                v10.insertDerive(l_StyleSheet_0, v39);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
    v29.getChildren = function(v40) --[[ Line: 131 ]]
        return v40.Children or {};
    end;
    v29.getCellAutocomplete = function(v41) --[[ Line: 135 ]]
        -- upvalues: v29 (copy), l_collectArray_0 (ref), v10 (ref), v12 (ref)
        local l_StyleSheet_1 = v29.props.StyleSheet;
        local l_allSheets_1 = v29.state.allSheets;
        l_allSheets_1 = l_collectArray_0(l_allSheets_1, function(_, v45) --[[ Line: 138 ]]
            -- upvalues: v10 (ref), l_StyleSheet_1 (copy)
            if v10.isValidDerive(l_StyleSheet_1, v45) then
                return v45.Name;
            else
                return;
            end;
        end);
        return v12(l_allSheets_1, v41);
    end;
end;
v28.getAllSheets = function(v46) --[[ Line: 147 ]] --[[ Name: getAllSheets ]]
    -- upvalues: l_filter_0 (copy), l_ReplicatedStorage_0 (copy)
    return l_filter_0(l_ReplicatedStorage_0:GetDescendants(), function(v47) --[[ Line: 148 ]]
        -- upvalues: v46 (copy)
        return v47:IsA("StyleSheet") and v47 ~= v46;
    end);
end;
v28.getEmptyRow = function() --[[ Line: 153 ]] --[[ Name: getEmptyRow ]]
    -- upvalues: l_join_0 (copy), v11 (copy)
    return {
        Name = {
            Schema = l_join_0(v11.TextSchema, {
                PlaceholderText = "Add a Derive..."
            }), 
            Value = ""
        }, 
        Value = {
            Schema = {
                Type = "Empty"
            }, 
            Value = ""
        }
    };
end;
v28.getItems = function(v48) --[[ Line: 169 ]] --[[ Name: getItems ]]
    -- upvalues: l_join_0 (copy), v11 (copy), l_collectArray_0 (copy), v13 (copy), v10 (copy), v28 (ref), l_insert_0 (copy), v26 (copy)
    if not v48 then
        return;
    else
        assert(v48 ~= nil, "expecting valid stylesheet");
        local l_v48_Derives_0 = v48:GetDerives();
        local v53 = {
            Name = {
                Schema = l_join_0(v11.SelectorSchema, {
                    Editing = false
                }), 
                FullSpan = true, 
                Value = "Derives"
            }, 
            Children = l_collectArray_0(l_v48_Derives_0, function(_, v51) --[[ Line: 182 ]]
                -- upvalues: v13 (ref), v10 (ref), v48 (copy), v11 (ref)
                return {
                    Name = {
                        OnClick = function(v52) --[[ Line: 185 ]] --[[ Name: OnClick ]]
                            -- upvalues: v13 (ref), v10 (ref), v48 (ref)
                            if not v52 then
                                return nil;
                            else
                                v13({
                                    Name = "StyleEditor.RemoveDerive", 
                                    DisplayName = "Style Editor - Remove Derive from {derivedSheet.Name}", 
                                    DoChange = function() --[[ Line: 193 ]] --[[ Name: DoChange ]]
                                        -- upvalues: v10 (ref), v48 (ref), v52 (copy)
                                        v10.removeDerive(v48, v52);
                                        return Enum.FinishRecordingOperation.Commit;
                                    end
                                });
                                return;
                            end;
                        end, 
                        Schema = v11.DeriveSchema, 
                        Value = v51
                    }, 
                    Instance = v51
                };
            end)
        };
        l_insert_0(v53.Children, v28.getEmptyRow());
        return v26:updatePaths({
            v53
        });
    end;
end;
v28.getDerivedStateFromProps = function(v54, v55) --[[ Line: 211 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v28 (ref), v14 (copy), v26 (copy), l_join_0 (copy)
    local l_StyleSheet_2 = v54.StyleSheet;
    if l_StyleSheet_2 ~= v55.styleSheet or v54.IsDirty then
        local v57 = v28.getAllSheets(l_StyleSheet_2);
        local v58 = v28.getItems(l_StyleSheet_2);
        v14.updateItems(v26, v55.table, {
            Children = v55.table.Items
        }, {
            Children = v58
        });
        local l_Expansion_0 = v55.table.Expansion;
        l_Expansion_0[v58[1]] = true;
        return l_join_0(v55, {
            allSheets = v57, 
            styleSheet = l_StyleSheet_2, 
            table = l_join_0(v55.table, {
                Expansion = l_Expansion_0, 
                Items = v58
            })
        });
    else
        return v55;
    end;
end;
v28.render = function(v60) --[[ Line: 237 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v9 (copy), v3 (copy), l_TreeTable_0 (copy)
    local l_props_1 = v60.props;
    local l_state_1 = v60.state;
    local v63 = l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Columns = l_state_1.table.Columns, 
        Expansion = l_state_1.table.Expansion, 
        FullSpanEmphasis = true, 
        GetCellAutocomplete = v60.getCellAutocomplete, 
        GetChildren = v60.getChildren, 
        LayoutOrder = l_props_1.LayoutOrder, 
        OnCellEdited = v60.onEdited, 
        Renderers = {
            Derive = v9
        }, 
        RootItems = l_state_1.table.Items, 
        RowHeight = 32, 
        Selection = l_state_1.table.Selection, 
        ShowHeader = false, 
        UseScale = true
    }, v60.tableCallbacks);
    return v3.createElement(l_TreeTable_0, v63);
end;
v28 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v28);
return v4.connect(function(v64) --[[ Line: 265 ]]
    return {
        IsDirty = v64.Window.IsDirty
    };
end)(v28);