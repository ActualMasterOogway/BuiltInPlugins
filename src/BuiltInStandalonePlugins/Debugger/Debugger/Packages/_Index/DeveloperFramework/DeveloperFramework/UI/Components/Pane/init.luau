local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v1.withContext;
local v3 = require(l_Parent_0.Parent.Roact);
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local v6 = require(l_Parent_0.Util);
local l_isInputMainPress_0 = v6.isInputMainPress;
local l_prioritize_0 = v6.prioritize;
local v9 = require(l_Parent_0.Wrappers.withForwardRef);
local v10 = require(l_Parent_0.Styling.joinTags);
local v11 = require(l_Parent_0.Parent.Dash);
local l_assign_0 = v11.assign;
local l_join_0 = v11.join;
local l_omit_0 = v11.omit;
local v15 = {
    Box = "Main", 
    BorderBox = "Main X-Border", 
    SubtleBox = "Muted", 
    SubtleBorderBox = "Muted X-Border", 
    RoundBox = "Main X-Corner", 
    InputBox = "X-Input", 
    ErrorBorderBox = "X-Error", 
    CornerBox = "X-Corner"
};
local v16 = game:DefineFastFlag("DevFrameworkOnRightClickPosition", false);
local v17 = game:DefineFastFlag("DevFrameworkPaneImmutableProps", false);
local v18 = v3.PureComponent:extend("Pane");
local _ = function(v19, v20) --[[ Line: 62 ]] --[[ Name: getClassName ]]
    -- upvalues: l_prioritize_0 (copy)
    local _ = nil;
    local v22 = v19.OnClick or v19.OnRightClick or v19.OnPress;
    if l_prioritize_0(v19.Image, v20.Image) then
        if v22 then
            return "ImageButton";
        else
            return "ImageLabel";
        end;
    elseif v22 then
        return "TextButton";
    else
        return "Frame";
    end;
end;
v18.defaultProps = {
    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
    VerticalAlignment = Enum.VerticalAlignment.Center
};
v18.init = function(v24) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: l_isInputMainPress_0 (copy), v3 (copy)
    v24.onPress = function(_, v26) --[[ Line: 89 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v24 (copy)
        if l_isInputMainPress_0(v26) then
            v24.props.OnPress(v26);
        end;
    end;
    v24.onRightClick = function(_, v28) --[[ Line: 95 ]]
        -- upvalues: v24 (copy)
        if v28.UserInputType == Enum.UserInputType.MouseButton2 then
            v24.props.OnRightClick(Vector2.new(v28.Position.X, v28.Position.Y));
        end;
    end;
    v24.onInputBegan = function(v29, v30) --[[ Line: 101 ]]
        -- upvalues: v24 (copy), v3 (ref)
        if v24.props[v3.Event.InputBegan] then
            v24.props[v3.Event.InputBegan](v29, v30);
        end;
        if v24.props.OnPress then
            v24.onPress(v29, v30);
        end;
        if v24.props.OnRightClick then
            v24.onRightClick(v29, v30);
        end;
    end;
end;
v18.render = function(v31) --[[ Line: 114 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v15 (copy), l_Parent_0 (copy), l_prioritize_0 (copy), v16 (copy), v17 (copy), l_assign_0 (copy), l_omit_0 (copy), l_join_0 (copy), v10 (copy)
    local l_props_0 = v31.props;
    local v33 = if v5 then l_props_0.Style or {} else l_props_0.Stylizer;
    local v34 = if v5 then l_props_0[v4.Tag] else nil;
    local v35 = l_props_0[v3.Children] or {};
    local v36 = nil;
    if v5 and typeof(v33) == "string" then
        v36 = v15[v33];
        if game:GetFastFlag("DebugDeveloperFrameworkSdk") then
            local l_Folder_0 = l_Parent_0:FindFirstAncestorWhichIsA("Plugin"):FindFirstChildWhichIsA("Folder");
            print((("[DebugDeveloperFrameworkSdk] %* StyleSheets DEPRECATED: Replace Pane Style = %* with [React.Tag] = %*"):format(l_Folder_0.Name, v33, v36)));
        end;
        v33 = {};
    end;
    local l_Padding_0 = l_props_0.Padding;
    if l_Padding_0 then
        local v39 = type(l_Padding_0) == "number";
        v35.Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v39 and l_Padding_0 or l_Padding_0.Top or 0), 
            PaddingBottom = UDim.new(0, v39 and l_Padding_0 or l_Padding_0.Bottom or 0), 
            PaddingLeft = UDim.new(0, v39 and l_Padding_0 or l_Padding_0.Left or 0), 
            PaddingRight = UDim.new(0, v39 and l_Padding_0 or l_Padding_0.Right or 0)
        });
    end;
    if l_props_0.Layout then
        local v40 = nil;
        if l_props_0.Spacing then
            v40 = if typeof(l_props_0.Spacing) == "number" then UDim.new(0, l_props_0.Spacing) else l_props_0.Spacing;
        end;
        v35.Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = l_props_0.Layout, 
            HorizontalAlignment = l_props_0.HorizontalAlignment, 
            VerticalAlignment = l_props_0.VerticalAlignment, 
            Padding = v40
        });
    end;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local v42 = 1;
    local v43 = 1;
    if l_AutomaticSize_0 then
        if l_AutomaticSize_0 == Enum.AutomaticSize.X or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
            v42 = 0;
        end;
        if l_AutomaticSize_0 == Enum.AutomaticSize.Y or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
            v43 = 0;
        end;
    end;
    local l_v33_0 = v33;
    local v45 = nil;
    local v46 = l_props_0.OnClick or l_props_0.OnRightClick or l_props_0.OnPress;
    local v47 = if l_prioritize_0(l_props_0.Image, l_v33_0.Image) then v46 and "ImageButton" or "ImageLabel" else v46 and "TextButton" or "Frame";
    l_v33_0 = if v5 then {
        Size = l_prioritize_0(l_props_0.Size, v33.Size, if l_AutomaticSize_0 then UDim2.fromScale(v42, v43) else nil)
    } else {
        BackgroundTransparency = l_prioritize_0(l_props_0.Transparency, v33.Transparency, 1), 
        BorderSizePixel = 0, 
        Size = l_prioritize_0(l_props_0.Size, v33.Size, UDim2.fromScale(v42, v43))
    };
    v45 = l_props_0.BackgroundColor3 or l_props_0.BackgroundColor or v33.Background;
    if v45 then
        l_v33_0.BackgroundTransparency = if v5 then l_props_0.Transparency or 0 else l_prioritize_0(l_props_0.Transparency, v33.Transparency, 0);
    end;
    v46 = nil;
    if v16 and v17 then
        if l_props_0.OnRightClick or l_props_0.OnPress then
            v46 = v31.onInputBegan;
        end;
    elseif l_props_0.OnPress then
        if v17 then
            v46 = v31.onPress;
        else
            l_props_0[v3.Event.InputBegan] = v31.onPress;
        end;
    end;
    local v48 = l_props_0.OnClick or l_props_0.OnRightClick or l_props_0.OnPress;
    if l_props_0.OnClick then
        if v17 then
            l_v33_0[v3.Event.Activated] = l_props_0.OnClick;
        else
            v31.props[v3.Event.Activated] = l_props_0.OnClick;
        end;
    end;
    if not v16 and l_props_0.OnRightClick then
        if v17 then
            l_v33_0[v3.Event.MouseButton2Click] = l_props_0.OnRightClick;
        else
            l_props_0[v3.Event.MouseButton2Click] = l_props_0.OnRightClick;
        end;
    end;
    local v49 = l_prioritize_0(l_props_0.Image, v33.Image);
    if v48 and not v49 then
        if v17 then
            l_v33_0.AutoButtonColor = false;
            l_v33_0.Text = "";
        else
            l_props_0.AutoButtonColor = false;
            l_props_0.Text = "";
        end;
    end;
    if v49 then
        l_assign_0(l_v33_0, {
            Image = v49, 
            ImageColor3 = v45, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v33.SliceCenter
        });
    elseif v45 then
        l_v33_0.BackgroundColor3 = v45;
    end;
    local v50 = if v5 then nil else l_prioritize_0(l_props_0.Border, v33.Border, nil);
    if v50 then
        if not v50.Image then
            l_assign_0(l_v33_0, {
                BorderColor3 = v50.Color, 
                BorderSizePixel = v50.Size or 1
            });
        else
            v35 = {
                Contents = v3.createElement("ImageLabel", {
                    Size = UDim2.fromScale(v42, v43), 
                    AutomaticSize = l_AutomaticSize_0, 
                    Image = v50.Image, 
                    ImageColor3 = l_props_0.BorderColor or v50.Background, 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v50.SliceCenter
                }, v35)
            };
        end;
    end;
    if v5 and v33.CornerRadius then
        v35.UICorner = v3.createElement("UICorner", {
            CornerRadius = v33.CornerRadius
        });
    end;
    if l_props_0.ForwardRef then
        l_v33_0[v3.Ref] = l_props_0.ForwardRef;
    end;
    local v51 = l_omit_0(l_join_0(l_v33_0, l_props_0), {
        v3.Children, 
        "StyleModifier", 
        "BackgroundColor", 
        "BorderColor", 
        "Padding", 
        "Layout", 
        "Spacing", 
        "Style", 
        "Stylizer", 
        "Theme", 
        "HorizontalAlignment", 
        "VerticalAlignment", 
        "OnClick", 
        "OnRightClick", 
        "OnPress", 
        "ForwardRef"
    });
    if v17 and v46 then
        v51[v3.Event.InputBegan] = v46;
    end;
    if v5 then
        v51[v4.Tag] = v10("Component-Pane", v34, v36);
    end;
    return v3.createElement(v47, v51, v35);
end;
return v9((l_withContext_0({
    Stylizer = if v5 then nil else v1.Stylizer
})(v18)));