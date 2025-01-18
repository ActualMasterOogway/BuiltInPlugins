local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.React);
local v7 = require(l_Parent_0.Packages.RoactRodux);
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v8.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_joinTags_0 = v8.Styling.joinTags;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.SessionStats.TrackButtonPress);
local v20 = require(l_Parent_0.Src.Enums.InstancesHaveVariant);
local v21 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v22 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v23 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v24 = require(l_Parent_0.Src.Components.SelectorPropertyTable);
local v25 = require(l_Parent_0.Src.Components.StyleRulePreview);
local v26 = require(l_Parent_0.Src.Resources.PluginStyles);
local l_v26_Attribute_0 = v26:GetAttribute("ButtonHeight");
local l_v26_Attribute_1 = v26:GetAttribute("PaddingSm");
local l_v26_Attribute_2 = v26:GetAttribute("Spacing");
local l_v26_Attribute_3 = v26:GetAttribute("TitleTextSize");
local v31 = v6.PureComponent:extend("StyleRuleView");
v31.init = function(v32) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v31 (ref), l_Selection_0 (copy), v23 (copy), l_RunService_0 (copy), l_CollectionService_0 (copy), v19 (copy), v20 (copy), v22 (copy), l_StylingService_0 (copy)
    v32.state = {
        expanded = true, 
        scrollHeight = -200, 
        instance = nil, 
        selection = {}, 
        story = nil
    };
    v32.containerRef = v6.createRef();
    v32.expandedChanged = function() --[[ Line: 66 ]]
        -- upvalues: v32 (copy), v31 (ref)
        v32:setState(function(v33) --[[ Line: 67 ]]
            -- upvalues: v31 (ref), v32 (ref)
            local v34 = not v33.expanded;
            local v35 = if v34 then v31.getPreview(v32.props.StyleRule) else v33.instance;
            local v36 = v31.estimateScrollHeight(v34, v35, v32.props.StyleRule);
            return {
                expanded = v34, 
                instance = v35, 
                scrollHeight = v36
            };
        end);
    end;
    v32.onSelectionChanged = function() --[[ Line: 80 ]]
        -- upvalues: l_Selection_0 (ref), v23 (ref), v32 (copy)
        local v37 = l_Selection_0:Get();
        local v38 = v23.canApplyVariant(v32.props.StyleRule, v37);
        local v39 = v23.instancesHaveVariant(v37, v32.props.StyleRule);
        v32:setState({
            selection = v37, 
            hasVariant = v39, 
            canApplyVariant = v38
        });
    end;
    v32.removeTagConnections = function() --[[ Line: 91 ]]
        -- upvalues: v32 (copy)
        if v32.tagConnections then
            for _, v41 in v32.tagConnections do
                for _, v43 in v41 do
                    v43:Disconnect();
                end;
            end;
        end;
        v32.tagConnections = {};
    end;
    v32.createTagConnections = function() --[[ Line: 102 ]]
        -- upvalues: v23 (ref), v32 (copy), l_RunService_0 (ref), l_CollectionService_0 (ref)
        local v44 = v23.getSelectorChain(v32.props.StyleRule);
        if not v44 then
            return;
        else
            local function v45() --[[ Line: 108 ]]
                -- upvalues: l_RunService_0 (ref), v32 (ref)
                l_RunService_0.RenderStepped:Wait();
                v32.onSelectionChanged();
            end;
            v32.tagConnections = {};
            for _, v47 in v44.Tags do
                v32.tagConnections[v47] = {
                    Added = l_CollectionService_0:GetInstanceAddedSignal(v47):Connect(v45), 
                    Removed = l_CollectionService_0:GetInstanceRemovedSignal(v47):Connect(v45)
                };
            end;
            return;
        end;
    end;
    v32.onApplyStyle = function() --[[ Line: 123 ]]
        -- upvalues: v32 (copy), v19 (ref), v20 (ref), v23 (ref), v22 (ref), l_StylingService_0 (ref)
        local l_state_0 = v32.state;
        local l_props_0 = v32.props;
        l_props_0.dispatch(v19("StyleRuleView/ApplyTag"));
        if l_state_0.hasVariant == v20.Mixed then
            print("Error: Variant action cannot be performed on all selected instances");
            return;
        elseif not l_state_0.canApplyVariant then
            print("Error: Variant cannot be applied to all selected instances");
            return;
        else
            local l_StyleRule_0 = l_props_0.StyleRule;
            if not l_StyleRule_0 then
                print("Error: No StyleRule to apply");
                return;
            elseif #l_state_0.selection < 1 then
                print("Error: No instance selected in Explorer");
                return;
            else
                local v51 = v23.getSelectorChain(l_StyleRule_0);
                v22({
                    Name = "StyleEditor.ApplyTags", 
                    DisplayName = "StyleEditor - Apply Tag(s)", 
                    DoChange = function() --[[ Line: 155 ]] --[[ Name: DoChange ]]
                        -- upvalues: l_state_0 (copy), v51 (copy), v20 (ref), v23 (ref), l_StyleRule_0 (copy), l_StylingService_0 (ref)
                        for _, v53 in l_state_0.selection do
                            if v51.Class ~= "" and v53.ClassName ~= v51.Class then
                                print("Error: Selector class does not match ClassName on", v53);
                            elseif l_state_0.hasVariant == v20.All then
                                v23.removeVariant(l_StyleRule_0, v53);
                            else
                                v23.addStyleLinkToRoot(v53, l_StyleRule_0);
                                local l_status_0, l_result_0 = pcall(function() --[[ Line: 171 ]]
                                    -- upvalues: l_StylingService_0 (ref), v53 (copy)
                                    return l_StylingService_0:GetAppliedStyles(v53);
                                end);
                                if l_status_0 then
                                    if v51.Class ~= "" then
                                        for _, v57 in l_result_0 do
                                            if #v57.PossibleClasses == 1 and v57.PossibleClasses[1] == v53.ClassName then
                                                v23.removeVariant(v57.Instance, v53);
                                            end;
                                        end;
                                    end;
                                    v23.applyVariant(l_StyleRule_0, v53);
                                    local l_l_StyleRule_0_0 = l_StyleRule_0;
                                    while l_l_StyleRule_0_0 and l_l_StyleRule_0_0:IsA("StyleRule") do
                                        for v59, v60 in l_l_StyleRule_0_0:GetProperties() do
                                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 197 ]]
                                                -- upvalues: v53 (copy), v59 (copy)
                                                if v53:IsPropertyModified(v59) then
                                                    v53:ResetPropertyToDefault(v59);
                                                end;
                                            end);
                                            l_status_0 = l_status_1;
                                            v60 = l_result_1;
                                            if not l_status_0 then
                                                warn((("Style Editor could not reset %* on %*"):format(v59, v53)));
                                            end;
                                        end;
                                        l_l_StyleRule_0_0 = l_l_StyleRule_0_0.Parent;
                                    end;
                                end;
                            end;
                        end;
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                v32:setState({
                    hasVariant = if l_state_0.hasVariant == v20.All then v20.None else v20.All
                });
                return;
            end;
        end;
    end;
end;
v31.estimateScrollHeight = function(v63, v64, v65) --[[ Line: 222 ]] --[[ Name: estimateScrollHeight ]]
    -- upvalues: v23 (copy), l_v26_Attribute_1 (copy), v6 (copy), v25 (copy), l_v26_Attribute_2 (copy), l_v26_Attribute_3 (copy), l_v26_Attribute_0 (copy)
    local v66 = v23.ruleHasTags(v65);
    local v67 = v23.findFirstClassSelector(v65);
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 225 ]]
        -- upvalues: v67 (copy)
        local v68 = false;
        if v67 ~= "" then
            v68 = Instance.new(v67):IsA("GuiObject");
        end;
        return v68;
    end);
    local l_l_v26_Attribute_1_0 = l_v26_Attribute_1;
    if l_status_2 and l_result_2 then
        if v63 and v64 and v64 ~= v6.None then
            return l_l_v26_Attribute_1_0 + (v25.getPredictedPreviewHeight(v64.Size, Vector2.new(1e999, 300), Vector2.new(0, 0), Vector2.new(l_v26_Attribute_2, l_v26_Attribute_2)) + l_v26_Attribute_3 + 3 * l_v26_Attribute_2);
        else
            return l_l_v26_Attribute_1_0 + l_v26_Attribute_0;
        end;
    else
        if v66 then
            l_l_v26_Attribute_1_0 = l_l_v26_Attribute_1_0 + l_v26_Attribute_0;
        end;
        return l_l_v26_Attribute_1_0;
    end;
end;
v31.createPreviewInstanceFromSelectorLink = function(v72) --[[ Line: 249 ]] --[[ Name: createPreviewInstanceFromSelectorLink ]]
    local v73 = if v72.Class and #v72.Class > 0 then v72.Class else "Frame";
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 253 ]]
        -- upvalues: v73 (copy)
        return Instance.new(v73);
    end);
    if not l_status_3 then
        return;
    else
        if v72.Name and #v72.Name > 0 then
            l_result_3.Name = v72.Name;
        end;
        for _, v77 in v72.Tags do
            l_result_3:AddTag(v77);
        end;
        return l_result_3;
    end;
end;
v31.isVisible = function(v78) --[[ Line: 272 ]] --[[ Name: isVisible ]]
    -- upvalues: l_StylingService_0 (copy), v31 (ref)
    if not v78 or not v78:IsA("StyleRule") then
        return true;
    else
        assert(v78 ~= nil, "expecting valid style rule");
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 279 ]]
            -- upvalues: l_StylingService_0 (ref), v78 (copy)
            return l_StylingService_0:GetStyleInfo(v78);
        end);
        if not l_status_4 then
            return true;
        elseif l_result_4.Properties.Visible then
            return l_result_4.Properties.Visible.Value;
        else
            return v31.isVisible(v78.Parent);
        end;
    end;
end;
v31.getPreview = function(v81) --[[ Line: 294 ]] --[[ Name: getPreview ]]
    -- upvalues: v6 (copy), l_StylingService_0 (copy), v31 (ref)
    if not v81 or #v81.SelectorError > 0 then
        return v6.None;
    else
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 299 ]]
            -- upvalues: l_StylingService_0 (ref), v81 (copy)
            return l_StylingService_0:GetStyleInfo(v81);
        end);
        if not l_status_5 then
            return v6.None;
        else
            local l_SelectorChains_0 = l_result_5.SelectorChains;
            local v85 = nil;
            local v86 = nil;
            local v87 = nil;
            local v88 = false;
            for v89, v90 in l_SelectorChains_0[#l_SelectorChains_0] do
                v86 = v31.createPreviewInstanceFromSelectorLink(v90);
                if v86 then
                    local v91 = v90.Class and #v90.Class > 0 and v90.Combinator ~= "Pseudo";
                    if v85 then
                        v86.Parent = v85;
                    else
                        v87 = v86;
                    end;
                    if v90.Combinator ~= "Pseudo" and v86:IsA("GuiObject") then
                        if v85 then
                            v86.Size = UDim2.fromScale(1, 1);
                        end;
                        v86.Position = UDim2.new();
                        v86.AnchorPoint = Vector2.new();
                        if v89 ~= #l_SelectorChains_0[#l_SelectorChains_0] then
                            v86.BackgroundTransparency = 1;
                            local _ = pcall(function() --[[ Line: 336 ]]
                                -- upvalues: v86 (ref)
                                v86.TextTransparency = 1;
                            end);
                        end;
                        v85 = v86;
                    end;
                    v88 = v88 or v91;
                end;
            end;
            if v87 then
                if v88 and v86 and v86:IsA("GuiObject") then
                    local v93 = UDim2.fromOffset(200, 100);
                    if not v31.isVisible(v81) then
                        v93 = UDim2.new();
                    elseif l_result_5.Properties.Size and typeof(l_result_5.Properties.Size.Value) == "UDim2" then
                        v93 = l_result_5.Properties.Size.Value;
                    end;
                    v87.Size = v93;
                    return v87;
                else
                    v87:Remove();
                end;
            end;
            return v6.None;
        end;
    end;
end;
v31.getDerivedStateFromProps = function(v94, v95) --[[ Line: 368 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v31 (ref), v6 (copy), v23 (copy)
    if v94.StyleRule ~= v95.StyleRule or v94.IsDirty then
        local l_expanded_0 = v95.expanded;
        local v97 = v31.getPreview(v94.StyleRule) or v6.None;
        return {
            StyleRule = v94.StyleRule, 
            hasVariant = v23.instancesHaveVariant(v95.selection, v94.StyleRule), 
            canApplyVariant = v23.canApplyVariant(v94.StyleRule, v95.selection), 
            instance = v97, 
            scrollHeight = v31.estimateScrollHeight(l_expanded_0, v97, v94.StyleRule)
        };
    else
        return v95;
    end;
end;
v31.didUpdate = function(v98, v99, _) --[[ Line: 385 ]] --[[ Name: didUpdate ]]
    if v99.StyleRule ~= v98.props.StyleRule then
        v98.removeTagConnections();
        v98.createTagConnections();
    end;
end;
v31.didMount = function(v101) --[[ Line: 392 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy)
    v101.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v101.onSelectionChanged);
    v101.onSelectionChanged();
end;
v31.willUnmount = function(v102) --[[ Line: 397 ]] --[[ Name: willUnmount ]]
    v102.removeTagConnections();
    if v102.selectionChangedConnection then
        v102.selectionChangedConnection:Disconnect();
        v102.selectionChangedConnection = nil;
    end;
end;
v31.render = function(v103) --[[ Line: 405 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v6 (copy), l_Pane_0 (copy), v23 (copy), l_IconButton_0 (copy), l_joinTags_0 (copy), v25 (copy), v24 (copy)
    local l_props_1 = v103.props;
    local l_state_1 = v103.state;
    local v106 = l_state_1.hasVariant == v20.None and "Apply" or l_state_1.hasVariant == v20.Mixed and "Mixed" or "Remove";
    local v107 = "ApplyBtn.Text" .. v106 .. "Tag";
    local v108 = "ApplyBtn.Tooltip" .. v106 .. "Tag";
    local v109 = true;
    if l_state_1.hasVariant ~= v20.Mixed then
        v109 = not l_state_1.canApplyVariant;
    end;
    local l_Localization_1 = l_props_1.Localization;
    return v6.createElement(l_Pane_0, {
        [v6.Tag] = "X-ColumnS X-FitY X-Right"
    }, {
        Container = v6.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v6.Tag] = "X-FitY"
        }, {
            ApplyStyleButton = if v23.ruleHasTags(l_props_1.StyleRule) then v6.createElement(l_IconButton_0, {
                OnClick = v103.onApplyStyle, 
                Text = l_Localization_1:getText("Control", v107), 
                TooltipText = l_Localization_1:getText("Control", v108), 
                [v6.Tag] = l_joinTags_0("PositionRight", v109 and "Disabled" or "")
            }) else nil, 
            Preview = v6.createElement(v25, {
                Expanded = l_state_1.expanded, 
                MaxSize = Vector2.new(1e999, 300), 
                OnExpandedChanged = v103.expandedChanged, 
                PreviewInstance = l_state_1.instance, 
                StyleRule = l_props_1.StyleRule
            })
        }), 
        ScrollingView = v6.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_state_1.scrollHeight)
        }, {
            StyleRule = v6.createElement(v24, {
                RootInstance = l_state_1.StyleRule
            })
        })
    });
end;
v31 = l_withContext_0({
    Localization = l_Localization_0
})(v31);
return v7.connect(function(v111) --[[ Line: 459 ]]
    return {
        IsDirty = v111.Window.IsDirty
    };
end, v21)(v31);