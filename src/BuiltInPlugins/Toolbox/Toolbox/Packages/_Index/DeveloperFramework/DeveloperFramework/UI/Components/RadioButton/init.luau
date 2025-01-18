local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v6 = require(l_Parent_0.UI.Components.Pane);
local v7 = require(l_Parent_0.UI.Components.TextLabel);
local v8 = require(l_Parent_0.UI.Components.LinkText);
local v9 = require(l_Parent_0.Util.prioritize);
local v10 = require(l_Parent_0.Util.Typecheck);
local v11 = require(l_Parent_0.Util.StyleModifier);
local v12 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkDisabledRadioButtonTransparency)();
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v14 = v2.PureComponent:extend("RadioButton");
v10.wrap(v14, script);
local v15 = Vector2.new(1000000, 50);
v14.defaultProps = {
    Disabled = false, 
    Selected = false, 
    OnClick = function() --[[ Line: 53 ]] --[[ Name: OnClick ]]

    end, 
    VerticalAlignment = Enum.VerticalAlignment.Center
};
v14.init = function(v16) --[[ Line: 57 ]] --[[ Name: init ]]
    v16.onClick = function() --[[ Line: 58 ]]
        -- upvalues: v16 (copy)
        local l_Disabled_0 = v16.props.Disabled;
        local l_Key_0 = v16.props.Key;
        local l_OnClick_0 = v16.props.OnClick;
        if not l_Disabled_0 then
            l_OnClick_0(l_Key_0);
        end;
    end;
end;
v14.render = function(v20) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_TextService_0 (copy), v15 (copy), v11 (copy), v2 (copy), v5 (copy), v6 (copy), v7 (copy), v12 (copy), v8 (copy), l_join_0 (copy)
    local l_AutomaticSize_0 = v20.props.AutomaticSize;
    local l_Description_0 = v20.props.Description;
    local l_LinkProps_0 = v20.props.LinkProps;
    local l_Selected_0 = v20.props.Selected;
    local l_Disabled_1 = v20.props.Disabled;
    local l_LayoutOrder_0 = v20.props.LayoutOrder;
    local l_Size_0 = v20.props.Size;
    local l_Text_0 = v20.props.Text;
    local l_Stylizer_0 = v20.props.Stylizer;
    local v30 = v9(v20.props.TextWrapped, l_Stylizer_0.TextWrapped);
    local v31 = v9(v20.props.TextXAlignment, l_Stylizer_0.TextXAlignment);
    local v32 = v9(v20.props.VerticalAlignment, l_Stylizer_0.VerticalAlignment);
    local l_Font_0 = l_Stylizer_0.Font;
    local v34 = nil;
    local v35 = v9(v20.props.TextSize, l_Stylizer_0.TextSize);
    if typeof(v35) == "table" then
        v35 = v20.props.TextSize.MainText;
        v34 = v20.props.TextSize.Description;
    end;
    local l_ImageSize_0 = l_Stylizer_0.ImageSize;
    local v37 = l_Stylizer_0.Padding or 0;
    local v38 = nil;
    v38 = if l_Font_0 then l_TextService_0:GetTextSize(l_Text_0, v35, l_Font_0, v15) else Vector2.new();
    local v39 = nil;
    if l_Description_0 and v34 then
        v39 = if l_Font_0 then l_TextService_0:GetTextSize(l_Description_0, v34, l_Font_0, v15) else Vector2.new();
    elseif l_Description_0 then
        v39 = if l_Font_0 then l_TextService_0:GetTextSize(l_Description_0, v35, l_Font_0, v15) else Vector2.new();
    end;
    local v40 = v38.X + v37;
    local l_Y_0 = v38.Y;
    if v39 then
        v40 = l_Y_0 + v39.X;
        l_Y_0 = l_Y_0 + v39.Y;
    end;
    if l_ImageSize_0 then
        v40 = v40 + l_ImageSize_0.X.Offset;
        l_Y_0 = math.max(l_ImageSize_0.Y.Offset, l_Y_0);
    end;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if l_AutomaticSize_0 ~= nil then
        v42 = l_Size_0;
        v43 = l_Size_0;
        v44 = l_Size_0;
    else
        v42 = UDim2.new(0, v40, 0, l_Y_0);
        v43 = if v39 then UDim2.new(0, v39.X, 0, v39.Y) else nil;
        v44 = UDim2.new(0, v38.X, 0, v38.Y);
    end;
    local v45 = nil;
    local v46 = nil;
    if l_Disabled_1 and l_Selected_0 then
        v45 = v11.Indeterminate;
        v46 = v11.Disabled;
    elseif l_Disabled_1 then
        v45 = v11.Disabled;
        v46 = v11.Disabled;
    elseif l_Selected_0 then
        v45 = v11.Selected;
        v46 = v11.Selected;
    end;
    return v2.createElement("TextButton", {
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = v42, 
        Text = "", 
        [v2.Event.Activated] = v20.onClick
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_Stylizer_0.Padding), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v32
        }), 
        RadioImage = v2.createElement(v5, {
            LayoutOrder = 1, 
            OnClick = v20.onClick, 
            Size = l_Stylizer_0.ImageSize, 
            Style = l_Stylizer_0.BackgroundStyle, 
            StyleModifier = v45
        }), 
        TextFrame = v2.createElement(v6, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, {
            MainTextLabel = v2.createElement(v7, {
                AutomaticSize = l_AutomaticSize_0, 
                LayoutOrder = 1, 
                Size = v44, 
                StyleModifier = if not v12 then v46 else nil, 
                TextTransparency = if v12 then l_Disabled_1 and 0.5 or 0 else nil, 
                Text = l_Text_0, 
                TextSize = v35, 
                TextWrapped = v30, 
                TextXAlignment = v31
            }), 
            DescriptionTextLabel = l_Description_0 and v2.createElement(v7, {
                AutomaticSize = l_AutomaticSize_0, 
                LayoutOrder = 2, 
                Size = v43, 
                StyleModifier = v11.Disabled, 
                Text = l_Description_0, 
                TextSize = v34 or nil, 
                TextWrapped = v30, 
                TextXAlignment = v31
            }), 
            LinkText = if l_LinkProps_0 then v2.createElement(v8, l_join_0({
                LayoutOrder = 3, 
                StyleModifier = v11.Disabled, 
                TextXAlignment = v31, 
                Size = v43
            }, l_LinkProps_0)) else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v14));