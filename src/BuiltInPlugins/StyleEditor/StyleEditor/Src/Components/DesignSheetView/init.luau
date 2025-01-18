local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.Window.SetDesignSheet);
local v12 = require(l_Actions_0.SessionStats.TrackButtonPress);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v15 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v15.copy;
local l_forEach_0 = v15.forEach;
local l_join_0 = v15.join;
local l_mapOne_0 = v15.mapOne;
local l_UI_0 = v6.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v25 = require(l_Parent_0.Src.Renderers.BreadcrumbRadioRenderer);
local v26 = require(l_Parent_0.Src.Components.DerivesTable);
local v27 = require(l_Parent_0.Src.Util.DesignHelpers);
local v28 = require(l_Parent_0.Src.Util.MenuHelpers);
local v29 = require(l_Parent_0.Src.Resources.ModernIcons);
local v30 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v31 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v32 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local l_joinTags_0 = v6.Styling.joinTags;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local v36 = v4.PureComponent:extend("DesignSheetView");
v36.init = function(v37) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_forEach_0 (copy), l_insert_0 (copy), l_sort_0 (copy), l_Selection_0 (copy), v12 (copy), v32 (copy), v30 (copy), v4 (copy), l_Pane_0 (copy), l_join_0 (copy), l_joinTags_0 (copy), l_IconButton_0 (copy), v29 (copy), v27 (copy), v11 (copy), l_mapOne_0 (copy)
    v37.state = {
        Designs = {}, 
        Disabled = false
    };
    local l_Localization_1 = v37.props.Localization;
    v37.updateStyleSheets = function() --[[ Line: 71 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), l_forEach_0 (ref), l_insert_0 (ref), l_sort_0 (ref), v37 (copy)
        local l_l_ReplicatedStorage_0_0 = l_ReplicatedStorage_0;
        local v40 = {};
        l_forEach_0(l_l_ReplicatedStorage_0_0:GetDescendants(), function(v41) --[[ Line: 74 ]]
            -- upvalues: v40 (copy), l_insert_0 (ref)
            if v41:IsA("StyleSheet") then
                local l_v41_Attribute_0 = v41:GetAttribute("StyleCategory");
                if not l_v41_Attribute_0 or l_v41_Attribute_0 == "Designs" then
                    l_insert_0(v40, {
                        StyleSheet = v41
                    });
                end;
            end;
        end);
        l_sort_0(v40, function(v43, v44) --[[ Line: 83 ]]
            return v43.StyleSheet.Name < v44.StyleSheet.Name;
        end);
        v37:setState({
            Designs = v40
        });
    end;
    v37.onCreateStyleLink = function() --[[ Line: 92 ]]
        -- upvalues: v37 (copy), l_Selection_0 (ref), v12 (ref), v32 (ref), v30 (ref)
        local l_props_0 = v37.props;
        local l_DesignSheet_0 = l_props_0.DesignSheet;
        local v47 = l_Selection_0:Get();
        l_props_0.dispatch(v12("StyleSheetView/AddStyleLink"));
        v32({
            Name = "StyleEditor.AddStyleLink", 
            DisplayName = "Style Editor - Add StyleLink(s)", 
            DoChange = function() --[[ Line: 104 ]] --[[ Name: DoChange ]]
                -- upvalues: v47 (copy), v30 (ref), l_DesignSheet_0 (copy), l_Selection_0 (ref)
                for _, v49 in ipairs(v47) do
                    if not v49 then
                        print("Error: No instance selected in Explorer--unable to create StyleLink");
                        return;
                    elseif v49:FindFirstChildWhichIsA("StyleLink") then
                        print("Error: There is already a StyleLink for this root");
                        return;
                    else
                        local v50 = v30.addStyleLinkToRoot(v49, l_DesignSheet_0);
                        if #v47 == 1 then
                            l_Selection_0:Set({
                                v50
                            });
                        end;
                    end;
                end;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
    v37.AddActionHeader = function(v51) --[[ Line: 125 ]]
        -- upvalues: v4 (ref), l_Pane_0 (ref), l_join_0 (ref), l_joinTags_0 (ref), l_IconButton_0 (ref), v29 (ref), v37 (copy), l_Localization_1 (copy)
        return v4.createElement(l_Pane_0, l_join_0({
            [v4.Tag] = l_joinTags_0("X-Right X-RowS", v51[v4.Tag])
        }, v51), {
            Button = v4.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                LeftIcon = v29.new(), 
                OnClick = v37.addDesign, 
                TooltipText = l_Localization_1:getText("Label", "AddDesignStyleSheet"), 
                [v4.Tag] = "IconOnly Icon16"
            })
        });
    end;
    v37.addDesign = function() --[[ Line: 143 ]]
        -- upvalues: v27 (ref), v37 (copy), v12 (ref), v11 (ref)
        local v52 = v27.createDesign(v37.props.DesignSheet);
        local l_props_1 = v37.props;
        l_props_1.dispatch(v12("StyleSheetView/AddDesignSheet"));
        if v52:GetAttribute("StyleCategory") == "Designs" then
            l_props_1.dispatch(v11(v52));
        end;
    end;
    v37.toggleDesign = function(v54) --[[ Line: 153 ]]
        -- upvalues: v37 (copy), l_mapOne_0 (ref), v32 (ref), v11 (ref)
        local l_props_2 = v37.props;
        local l_state_0 = v37.state;
        local l_DesignSheet_1 = l_props_2.DesignSheet;
        local v59 = l_mapOne_0(l_state_0.Designs, function(v58) --[[ Line: 158 ]]
            -- upvalues: v54 (copy)
            if v54 == v58.StyleSheet then
                return v58.StyleSheet;
            else
                return nil;
            end;
        end);
        v32({
            Name = "StyleEditor.SetDesignSheet", 
            DisplayName = "Style Editor - Set Current Design", 
            DoChange = function() --[[ Line: 169 ]] --[[ Name: DoChange ]]
                -- upvalues: l_DesignSheet_1 (copy), v59 (copy)
                if l_DesignSheet_1 then
                    l_DesignSheet_1:SetAttribute("StyleCategory", nil);
                end;
                v59:SetAttribute("StyleCategory", "Designs");
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        l_props_2.dispatch(v11(v59));
    end;
    v37.onSelectionChanged = function() --[[ Line: 180 ]]
        -- upvalues: l_Selection_0 (ref), v30 (ref), v37 (copy)
        local v60 = l_Selection_0:Get();
        local v61 = false;
        for _, v63 in v60 do
            if v30.getStyleLinkRoot(v63) then
                v61 = true;
                break;
            end;
        end;
        v37:setState({
            Disabled = not v61 or not v37.props.DesignSheet
        });
    end;
    v37.updateStyleSheets();
end;
v36.didMount = function(v64) --[[ Line: 198 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy)
    v64.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v64.onSelectionChanged);
    v64.onSelectionChanged();
end;
v36.willUnmount = function(v65) --[[ Line: 203 ]] --[[ Name: willUnmount ]]
    if v65.selectionChangedConnection then
        v65.selectionChangedConnection:Disconnect();
        v65.selectionChangedConnection = nil;
    end;
end;
v36.didUpdate = function(v66, v67, _) --[[ Line: 210 ]] --[[ Name: didUpdate ]]
    local l_props_3 = v66.props;
    if v67.IsDirty and not l_props_3.IsDirty or v67.DesignSheet ~= l_props_3.DesignSheet then
        v66.updateStyleSheets();
    end;
end;
v36.render = function(v70) --[[ Line: 219 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v25 (copy), l_copy_0 (copy), v32 (copy), l_ScrollingFrame_0 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), v28 (copy), l_SimpleExpandablePane_0 (copy), v26 (copy)
    local l_props_4 = v70.props;
    local l_state_1 = v70.state;
    local l_Localization_2 = l_props_4.Localization;
    local v74 = {};
    for v75, v76 in ipairs(l_state_1.Designs) do
        v74["Design " .. v75] = v4.createElement(v25, {
            Value = v76.StyleSheet, 
            OnClick = v70.toggleDesign, 
            Selected = v76.StyleSheet == l_props_4.DesignSheet, 
            Editing = v76.Editing, 
            OnDoubleClick = function() --[[ Line: 232 ]] --[[ Name: OnDoubleClick ]]
                -- upvalues: v70 (copy), l_copy_0 (ref), v75 (copy)
                v70:setState(function(v77) --[[ Line: 233 ]]
                    -- upvalues: l_copy_0 (ref), v75 (ref)
                    local v78 = l_copy_0(v77.Designs);
                    v78[v75].Editing = true;
                    return {
                        Designs = v78
                    };
                end);
            end, 
            OnChanged = function(v79) --[[ Line: 241 ]] --[[ Name: OnChanged ]]
                -- upvalues: v70 (copy), l_copy_0 (ref), v75 (copy), v32 (ref), v76 (copy)
                v70:setState(function(v80) --[[ Line: 242 ]]
                    -- upvalues: l_copy_0 (ref), v75 (ref)
                    local v81 = l_copy_0(v80.Designs);
                    v81[v75].Editing = false;
                    return {
                        Designs = v81
                    };
                end);
                v32({
                    Name = "StyleEditor.RenameStyleSheet", 
                    DisplayName = "Style Editor - Rename StyleSheet", 
                    DoChange = function() --[[ Line: 253 ]] --[[ Name: DoChange ]]
                        -- upvalues: v76 (ref), v79 (copy)
                        v76.StyleSheet.Name = v79;
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
            end, 
            [v4.Tag] = "PropertyCellSize"
        });
    end;
    return v4.createElement(l_ScrollingFrame_0, {
        [v4.Tag] = "ScrollingAutomaticSize X-ColumnS"
    }, {
        Content = v4.createElement(l_Pane_0, {
            [v4.Tag] = "X-ColumnM X-FitY X-PadS X-Right"
        }, {
            StyleLinkButton = v4.createElement(l_IconButton_0, {
                LayoutOrder = 1, 
                LeftIcon = v28.getClassIcon("StyleLink"), 
                OnClick = v70.onCreateStyleLink, 
                Text = l_Localization_2:getText("Control", "InsertStyleLinkButton"), 
                TooltipText = l_Localization_2:getText("Control", "InsertStyleLinkButtonTooltip"), 
                [v4.Tag] = l_state_1.Disabled and "Disabled" or nil
            }), 
            Designs = v4.createElement(l_SimpleExpandablePane_0, {
                Expanded = true, 
                HeaderComponent = v70.AddActionHeader, 
                LayoutOrder = 2, 
                Text = l_Localization_2:getText("Label", "DesignStyleSheets"), 
                [v4.Tag] = "X-ColumnM X-FitY X-PadS"
            }, {
                Container = v4.createElement(l_Pane_0, {
                    [v4.Tag] = "X-ColumnM X-FitY X-PadM"
                }, v74)
            }), 
            Derives = v4.createElement(v26, {
                LayoutOrder = 3, 
                StyleSheet = l_props_4.DesignSheet
            })
        })
    });
end;
v36 = l_withContext_0({
    Localization = l_Localization_0
})(v36);
return v5.connect(function(v82) --[[ Line: 300 ]]
    return {
        DesignSheet = v82.Window.DesignSheet, 
        IsDirty = v82.Window.IsDirty
    };
end, v31)(v36);