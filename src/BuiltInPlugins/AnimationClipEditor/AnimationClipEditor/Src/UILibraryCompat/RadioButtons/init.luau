local v0 = Vector2.new(1000000, 50);
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(script.Parent.createFitToContent);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v3.PureComponent:extend("RadioButtons");
v7.init = function(v8) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v8.layoutRef = v3.createRef();
    v8.containerRef = v3.createRef();
    v8.currentLayout = 0;
    v8.onButtonClicked = function(v9, v10) --[[ Line: 27 ]]
        -- upvalues: v8 (copy)
        if v8.props.onButtonClicked then
            v8.props.onButtonClicked(v9, v10);
        end;
    end;
end;
v7.createButton = function(v11, v12, v13, v14, v15, v16) --[[ Line: 34 ]] --[[ Name: createButton ]]
    -- upvalues: l_TextService_0 (copy), v0 (copy), v3 (copy)
    local l_X_0 = l_TextService_0:GetTextSize(v13, v16.radioButton.textSize, v16.radioButton.font, v0).X;
    local l_buttonHeight_0 = v16.radioButton.buttonHeight;
    local v19 = UDim2.new(1, 0, 0, l_buttonHeight_0);
    if v11.props.FillDirection == Enum.FillDirection.Horizontal then
        v19 = UDim2.new(0, l_X_0 + l_buttonHeight_0, 0, l_buttonHeight_0);
    end;
    return v3.createElement("Frame", {
        LayoutOrder = v11:nextLayout(), 
        BackgroundTransparency = 1, 
        Size = v19
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v16.radioButton.buttonPadding)
        }), 
        Background = v3.createElement("ImageButton", {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_buttonHeight_0, 0, l_buttonHeight_0), 
            BackgroundTransparency = 1, 
            ImageColor3 = v16.radioButton.radioButtonColor, 
            Image = v16.radioButton.radioButtonBackground, 
            [v3.Event.Activated] = function() --[[ Line: 62 ]]
                -- upvalues: v11 (copy), v12 (copy), v14 (copy)
                v11.onButtonClicked(v12, v14);
            end
        }, {
            Highlight = v15 and v3.createElement("ImageLabel", {
                Size = UDim2.new(0.4, 0, 0.4, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundTransparency = 1, 
                Image = v16.radioButton.radioButtonSelected
            })
        }), 
        Text = v3.createElement("TextButton", {
            LayoutOrder = 2, 
            Text = v13, 
            Size = UDim2.new(0, l_X_0, 1, 0), 
            BackgroundTransparency = 1, 
            Font = v16.radioButton.font, 
            TextSize = v16.radioButton.textSize, 
            TextColor3 = v16.radioButton.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v3.Event.Activated] = function() --[[ Line: 85 ]]
                -- upvalues: v11 (copy), v12 (copy), v14 (copy)
                v11.onButtonClicked(v12, v14);
            end
        })
    });
end;
v7.resetLayout = function(v20) --[[ Line: 92 ]] --[[ Name: resetLayout ]]
    v20.currentLayout = 0;
end;
v7.nextLayout = function(v21) --[[ Line: 96 ]] --[[ Name: nextLayout ]]
    v21.currentLayout = v21.currentLayout + 1;
    return v21.currentLayout;
end;
v7.render = function(v22) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy)
    local l_props_0 = v22.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Selected_0 = l_props_0.Selected;
    local l_FillDirection_0 = l_props_0.FillDirection;
    local v29 = v4("Frame", "UIListLayout", {
        FillDirection = l_FillDirection_0 or Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, l_Stylizer_0.radioButton.contentPadding), 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    v22:resetLayout();
    local v30 = {};
    for v31, v32 in ipairs(l_Buttons_0) do
        v30[v32.Key] = v22:createButton(v32.Key, v32.Text, v31, l_Selected_0 == v32.Key, l_Stylizer_0);
    end;
    return v3.createElement(v29, {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v30);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));