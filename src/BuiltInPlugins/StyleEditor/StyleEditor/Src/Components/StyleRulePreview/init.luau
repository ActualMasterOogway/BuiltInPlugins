local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local _ = require(l_Parent_0.Src.Types);
local l_ExpandablePane_0 = v2.UI.ExpandablePane;
local l_joinTags_0 = v2.Styling.joinTags;
local v9 = require(l_Parent_0.Src.Resources.ModernIcons).gridpattern();
local v10 = v1.PureComponent:extend("StyleRulePreview");
v10.getPredictedPreviewHeight = function(v11, v12, _, v14) --[[ Line: 41 ]] --[[ Name: getPredictedPreviewHeight ]]
    local v15 = false;
    local v16 = v11.X.Scale ~= 0 and 0 or v14.X;
    local v17 = v11.Y.Scale ~= 0 and 0 or v14.Y;
    local v18 = v11.Y.Scale * v12.Y + v11.Y.Offset + 2 * v17;
    v15 = v12.Y < v18;
    if v15 then
        v18 = v12.Y;
    end;
    return v18, Vector2.new(v16, v17), v15;
end;
v10.init = function(v19) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v19.state = {
        padding = Vector2.new(10, 10), 
        maxSize = Vector2.new(1e999, 1e999), 
        minSize = Vector2.zero, 
        isOverflowing = false
    };
    v19.containerRef = v1.createRef();
end;
v10.updatePreview = function(v20) --[[ Line: 68 ]] --[[ Name: updatePreview ]]
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    local l_current_0 = v20.containerRef.current;
    if not l_current_0 then
        return;
    else
        if l_props_0.PreviewInstance then
            l_props_0.PreviewInstance.Parent = l_current_0;
            local l_StyleLink_0 = Instance.new("StyleLink");
            l_StyleLink_0.Parent = l_props_0.PreviewInstance;
            l_StyleLink_0.StyleSheet = l_props_0.StyleRule:FindFirstAncestorWhichIsA("StyleSheet");
        end;
        if l_state_0.overrideSize == nil then
            l_current_0:ResetPropertyToDefault("Size");
        end;
        return;
    end;
end;
v10.didMount = function(v25) --[[ Line: 88 ]] --[[ Name: didMount ]]
    v25:updatePreview();
end;
v10.didUpdate = function(v26, v27, _) --[[ Line: 92 ]] --[[ Name: didUpdate ]]
    if v27.PreviewInstance ~= v26.props.PreviewInstance and v27.PreviewInstance then
        v27.PreviewInstance:Remove();
    end;
    if v26.props.Expanded then
        v26:updatePreview();
    end;
end;
v10.getDerivedStateFromProps = function(v29, v30) --[[ Line: 104 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v10 (copy), v1 (copy)
    if v29.PreviewInstance then
        local l_MaxSize_0 = v29.MaxSize;
        local l_zero_0 = Vector2.zero;
        local v33 = Vector2.new(10, 10);
        local l_Size_0 = v29.PreviewInstance.Size;
        local _, v36, v37 = v10.getPredictedPreviewHeight(l_Size_0, l_MaxSize_0, l_zero_0, v33);
        local v38 = if v37 then UDim2.new(1, 0, 0, l_MaxSize_0.Y) else v1.None;
        return {
            padding = v36, 
            maxSize = l_MaxSize_0, 
            minSize = l_zero_0, 
            isOverflowing = v37, 
            overrideSize = v38
        };
    else
        return v30;
    end;
end;
v10.render = function(v39) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ExpandablePane_0 (copy), v9 (copy), l_joinTags_0 (copy)
    local l_Localization_1 = v39.props.Localization;
    if v39.props.PreviewInstance then
        return (v1.createElement(l_ExpandablePane_0, {
            Text = l_Localization_1:getText("Control", "Preview"), 
            Expanded = v39.props.Expanded, 
            OnExpandedChanged = v39.props.OnExpandedChanged, 
            LayoutOrder = v39.props.LayoutOrder, 
            [v1.Tag] = "X-ColumnM X-FitY X-PadS"
        }, {
            Background = v1.createElement("ImageLabel", {
                Image = v9, 
                Size = v39.state.overrideSize, 
                ref = v39.containerRef, 
                [v1.Tag] = l_joinTags_0("PreviewGrid X-Middle X-Center X-Clip", not v39.state.isOverflowing and "X-FitY" or nil)
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = v39.state.maxSize, 
                    MinSize = v39.state.minSize
                }), 
                UIPadding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v39.state.padding.X), 
                    PaddingRight = UDim.new(0, v39.state.padding.X), 
                    PaddingTop = UDim.new(0, v39.state.padding.Y), 
                    PaddingBottom = UDim.new(0, v39.state.padding.Y)
                })
            })
        }));
    else
        return v1.None;
    end;
end;
return l_withContext_0({
    Localization = l_Localization_0
})(v10);