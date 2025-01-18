local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_assign_0 = require(l_script_FirstAncestor_0.Packages.Dash).assign;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_joinTags_0 = v3.Styling.joinTags;
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_withControl_0 = v3.Wrappers.withControl;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.getSafeName);
local v17 = require(l_Util_0.isNan);
local v18 = require(l_Util_0.getThemeToken);
local v19 = require(script.Timestamp);
local v20 = require(script.styles);
local v21 = game:DefineFastFlag("CDRigLod", false);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v23 = {
    Tree = 250, 
    Weight = 40, 
    Timestamp = 100
};
local v24 = v2.Component:extend("LayerTreeRow");
v24.init = function(v25) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v25.state = {
        ForceRefresh = 0
    };
    v25.onToggle = function() --[[ Line: 101 ]]
        -- upvalues: v25 (copy)
        if v25.props.OnToggle then
            v25.props.OnToggle(v25.props);
        end;
    end;
    v25.onToggleAdornment = function() --[[ Line: 107 ]]
        -- upvalues: v25 (copy)
        if v25.props.OnToggleAdornment then
            v25.props.OnToggleAdornment(v25.props.Item);
        end;
    end;
    v25.toggleRef = v2.createRef();
    v25.tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
end;
v24.getContents = function(v26, v27) --[[ Line: 117 ]] --[[ Name: getContents ]]
    -- upvalues: v16 (copy), v17 (copy)
    local l_props_0 = v26.props;
    return v16(v27), if v27.weight then v17(v27.weight) and "nan" or string.format("%d%%", (math.floor(math.clamp(v27.weight, 0, 1) * 100 + 0.5))) else nil, l_props_0.Adornments and l_props_0.Adornments[l_props_0.GetItemId(v27)] or {};
end;
v24.didMount = function(v29) --[[ Line: 132 ]] --[[ Name: didMount ]]
    pcall(function() --[[ Line: 134 ]]
        -- upvalues: v29 (copy)
        v29.onThemeChanged = settings().Studio.ThemeChanged:Connect(function() --[[ Line: 135 ]]
            -- upvalues: v29 (ref)
            v29:setState({
                ForceRefresh = v29.state.ForceRefresh + 1
            });
        end);
    end);
end;
v24.willUnmount = function(v30) --[[ Line: 141 ]] --[[ Name: willUnmount ]]
    v30.onThemeChanged:Disconnect();
end;
v24.shouldComponentUpdate = function(v31, v32, v33) --[[ Line: 145 ]] --[[ Name: shouldComponentUpdate ]]
    local l_state_0 = v31.state;
    local l_props_1 = v31.props;
    local l_Item_0 = l_props_1.Item;
    local l_Item_1 = v32.Item;
    if l_state_0.ForceRefresh ~= v33.ForceRefresh or l_props_1.StyleModifier ~= v32.StyleModifier or l_props_1.Expanded ~= v32.Expanded or l_Item_0 and not l_Item_1 or not l_Item_0 and l_Item_1 then
        return true;
    elseif not l_Item_0 or not l_Item_1 then
        return false;
    elseif l_Item_0.weight ~= l_Item_1.weight or l_Item_0.id ~= l_Item_1.id then
        return true;
    elseif l_props_1.Adornments ~= v32.Adornments then
        return true;
    elseif l_Item_0.state and l_Item_0.state.timePositionNormalized and l_Item_0.state.length and (l_Item_0.state.timePositionNormalized ~= l_Item_1.state.timePositionNormalized or l_Item_0.state.length ~= l_Item_1.state.length) then
        return true;
    else
        return false;
    end;
end;
v24.render = function(v38) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v20 (copy), v23 (copy), v17 (copy), l_RunService_0 (copy), v18 (copy), v2 (copy), l_Pane_0 (copy), l_assign_0 (copy), l_joinTags_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy), v19 (copy)
    local l_props_2 = v38.props;
    local l_Index_0 = l_props_2.Index;
    local l_Item_2 = l_props_2.Item;
    local v42 = l_props_2.Depth or 0;
    local v43 = l_props_2.Children and #l_props_2.Children > 0;
    local l_Expanded_0 = l_props_2.Expanded;
    local l_BeforeIndentItem_0 = l_props_2.BeforeIndentItem;
    local l_ExpandableRoot_0 = l_props_2.ExpandableRoot;
    local v47 = UDim2.new(1, 0, 0, 24);
    local l_Position_0 = l_props_2.Position;
    local v49, v50, v51 = v38:getContents(l_Item_2);
    if v21 and v42 == 0 and l_Item_2.lod then
        v49 = string.format("%s (LOD: %d)", v49, l_Item_2.lod);
    end;
    local v52 = nil;
    local v53 = nil;
    if v51.index and v51.enabled then
        v52 = "AdornmentOn";
        v53 = "AdornmentDot" .. tostring(v51.index);
    else
        v52 = "AdornmentOff";
        v53 = "AdornmentDotOff";
    end;
    local v54 = true;
    if v42 == 0 then
        v54 = l_ExpandableRoot_0;
    end;
    local v55 = (v42 - (not l_ExpandableRoot_0 and 1 or 0)) * v20:GetAttribute("Indent");
    local v56 = UDim2.new(0, v23.Weight, 1, 0);
    local v57 = UDim2.new(0, v23.Timestamp, 1, 0);
    local v58 = l_Item_2.state and l_Item_2.state.timePositionNormalized and l_Item_2.state.length;
    local l_weight_0 = l_Item_2.weight;
    if not l_weight_0 then
        l_weight_0 = 1;
    elseif v17(l_weight_0) then
        l_weight_0 = 0;
    end;
    local v60 = l_RunService_0:IsServer();
    local v61 = v55 + v20:GetAttribute("IconSize").X.Offset * 3 + 10 + (if v42 ~= 0 then v23.Weight + v23.Timestamp + 10 else 0) + 15 + 20;
    local v62 = UDim2.new(1, -v61, 1, 0);
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    if v42 == 0 then
        v63 = v60 and "Server" or "Client";
        v66 = "RigName";
    else
        v64 = if l_props_2.Selected then v18("ActiveLayer") else v18("InactiveLayer"):Lerp(v18("ActiveLayer"), l_weight_0);
    end;
    v65 = v18("InactiveTimeBar"):Lerp(v18("ActiveTimeBar"), l_weight_0);
    local v67 = (v63 or "") .. " LayerIcon " .. (l_Item_2.className or "");
    return v2.createElement(l_Pane_0, l_assign_0({
        LayoutOrder = l_BeforeIndentItem_0 and 2 or l_Index_0, 
        Size = v47, 
        Position = l_Position_0, 
        [v2.Tag] = l_joinTags_0("LayerTreeRow X-RowS X-Middle", l_props_2.Selected and "Selected" or nil)
    }, l_props_2.WrapperProps), {
        Spacer = v2.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, v55, 0, 0)
        }), 
        Toggle = v2.createElement(l_Pane_0, {
            LayoutOrder = 4
        }, {
            ToggleButton = if v54 and v43 then v2.createElement("ImageButton", {
                ImageRectOffset = v20:GetAttribute(l_Expanded_0 and "ExpandedOffset" or "CollapsedOffset"), 
                [v2.Event.Activated] = v38.onToggle
            }) else nil
        }), 
        LeftIcon = v2.createElement(l_Image_0, {
            LayoutOrder = 6, 
            ImageColor3 = v64, 
            [v2.Tag] = v67
        }), 
        LayerName = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 7, 
            Text = v49, 
            TextColor = v64, 
            Size = v62, 
            [v2.Tag] = l_joinTags_0("Name", v63, v66)
        }), 
        Weight = if v42 ~= 0 then if v50 then v2.createElement(l_TextLabel_0, {
            TextColor = v64, 
            LayoutOrder = 8, 
            Text = v50, 
            Size = v56, 
            TextXAlignment = Enum.TextXAlignment.Right
        }) else v2.createElement(l_Pane_0, {
            Size = v56, 
            LayoutOrder = 8
        }) else nil, 
        Timestamp = if v42 ~= 0 then if v58 then v2.createElement(v19, {
            Size = v57, 
            LayoutOrder = 9, 
            TimePercentage = l_Item_2.state.timePositionNormalized, 
            Length = l_Item_2.state.length, 
            TextColor = v64, 
            BarColor = v65
        }) else v2.createElement(l_Pane_0, {
            Size = v57, 
            LayoutOrder = 9
        }) else nil, 
        Adornment = if v42 ~= 0 then v2.createElement(l_Pane_0, {
            LayoutOrder = 10, 
            OnPress = v38.onToggleAdornment, 
            [v2.Tag] = "X-RowS X-Middle"
        }, {
            EyeIcon = v2.createElement("ImageButton", {
                LayoutOrder = 1, 
                [v2.Event.Activated] = v38.onToggleAdornment, 
                [v2.Tag] = v52
            }), 
            Dot = v2.createElement("ImageButton", {
                LayoutOrder = 2, 
                [v2.Event.Activated] = v38.onToggleAdornment, 
                [v2.Tag] = v53
            })
        }) else nil
    });
end;
v24.defaultProps = {
    ExpandableRoot = true
};
return l_withControl_0((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v24)));