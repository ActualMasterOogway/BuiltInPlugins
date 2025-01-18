local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_CaptureFocus_0 = v3.UI.CaptureFocus;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v1.PureComponent:extend("FocusedPrompt");
v8.renderButton = function(v9, v10, v11, _) --[[ Line: 32 ]] --[[ Name: renderButton ]]
    -- upvalues: v2 (copy), v1 (copy), l_Button_0 (copy)
    local l_props_0 = v9.props;
    local l_Y_0 = v2.PROMPT_BUTTON_SIZE.Y;
    local l_X_0 = v2.PROMPT_BUTTON_SIZE.X;
    return v1.createElement(l_Button_0, {
        Size = UDim2.new(0, l_X_0, 0, l_Y_0), 
        LayoutOrder = v10, 
        Style = v11.Style, 
        Text = v11.Text, 
        OnClick = function() --[[ Line: 42 ]] --[[ Name: OnClick ]]
            -- upvalues: l_props_0 (copy), v11 (copy)
            l_props_0.OnButtonClicked(v11.Key);
        end
    });
end;
v8.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_CaptureFocus_0 (copy)
    local l_props_1 = v16.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_PROMPT_BUTTON_PADDING_0 = v2.PROMPT_BUTTON_PADDING;
    local l_Y_1 = v2.PROMPT_BUTTON_SIZE.Y;
    local l_Buttons_0 = l_props_1.Buttons;
    local l_PromptText_0 = l_props_1.PromptText;
    local v24 = l_props_1.Size or v2.PROMPT_SIZE;
    local v25 = nil;
    v25 = if l_PromptText_0 then {
        PromptText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            TextSize = l_dialogTheme_0.textSize, 
            TextColor3 = l_dialogTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Stylizer_0.font, 
            Text = l_PromptText_0, 
            TextWrapped = true
        })
    } else v16.props[v1.Children];
    local v26 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, l_PROMPT_BUTTON_PADDING_0)
        })
    };
    for v27, v28 in ipairs(l_Buttons_0) do
        table.insert(v26, v16:renderButton(v27, v28, l_dialogTheme_0.textSize));
    end;
    return v1.createElement(l_CaptureFocus_0, {}, {
        Background = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.35, 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new()
        }, {
            CenterFrame = v1.createElement("ImageButton", {
                Size = v24, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_0.backgroundColor, 
                AutoButtonColor = false, 
                ImageTransparency = 1
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v2.PROMPT_VERTICAL_PADDING), 
                    PaddingBottom = UDim.new(0, v2.PROMPT_VERTICAL_PADDING), 
                    PaddingLeft = UDim.new(0, v2.PROMPT_HORIZONTAL_PADDING), 
                    PaddingRight = UDim.new(0, v2.PROMPT_HORIZONTAL_PADDING)
                }), 
                Container = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -(l_Y_1 + v2.PROMPT_VERTICAL_PADDING)), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, v25), 
                Buttons = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Y_1), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, v26)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));