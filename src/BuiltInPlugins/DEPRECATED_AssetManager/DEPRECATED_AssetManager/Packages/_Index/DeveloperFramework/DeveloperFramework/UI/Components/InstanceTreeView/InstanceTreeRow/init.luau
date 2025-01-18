local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Util.Typecheck);
local l_isInputMainPress_0 = v2.isInputMainPress;
local l_UI_0 = l_Parent_0.UI;
local v6 = require(l_UI_0.Components.Pane);
local v7 = require(l_UI_0.Components.TextLabel);
local v8 = v1.PureComponent:extend("InstanceTreeRow");
v3.wrap(v8, script);
local v9 = {
    Image = "rbxasset://textures/ClassImages.png", 
    ImageRectOffset = Vector2.new(736, 0), 
    ImageRectSize = Vector2.new(16, 16)
};
local l_StudioService_0 = game:GetService("StudioService");
local v11 = pcall(function() --[[ Line: 42 ]]
    -- upvalues: l_StudioService_0 (copy)
    return l_StudioService_0:GetClassIcon("Folder");
end);
local function _(v12) --[[ Line: 46 ]] --[[ Name: getClassIcon ]]
    -- upvalues: v11 (copy), v9 (copy), l_StudioService_0 (copy)
    if not v11 then
        return v9;
    else
        local l_ClassName_0 = v12.ClassName;
        if v12.IsA and (v12:IsA("JointInstance") and l_ClassName_0 == "ManualWeld" or l_ClassName_0 == "ManualGlue") then
            return l_StudioService_0:GetClassIcon("JointInstance");
        else
            return l_StudioService_0:GetClassIcon(l_ClassName_0);
        end;
    end;
end;
v8.init = function(v15) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: l_isInputMainPress_0 (copy)
    v15.state = {
        isHovering = false
    };
    v15.onMouseEnter = function() --[[ Line: 64 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            isHovering = true
        });
    end;
    v15.onMouseLeave = function() --[[ Line: 70 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            isHovering = false
        });
    end;
    v15.onInputBegan = function(_, v17) --[[ Line: 76 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v15 (copy)
        if l_isInputMainPress_0(v17) then
            v15.props.onSelected(v15.props.row);
        end;
    end;
end;
v8.render = function(v18) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v9 (copy), l_StudioService_0 (copy), v1 (copy), v6 (copy), v7 (copy)
    local l_props_0 = v18.props;
    local l_row_0 = l_props_0.row;
    local l_item_0 = l_row_0.item;
    local l_style_0 = l_props_0.style;
    local l_isSelected_0 = l_props_0.isSelected;
    local l_isExpanded_0 = l_props_0.isExpanded;
    local v25 = #l_item_0:GetChildren() > 0;
    local l_onToggled_0 = l_props_0.onToggled;
    local v27 = l_row_0.depth * l_style_0.Indent;
    local l_Size_0 = l_style_0.Arrow.Size;
    local l_IconPadding_0 = l_style_0.IconPadding;
    local v30;
    if not v11 then
        v30 = v9;
    else
        local l_ClassName_1 = l_item_0.ClassName;
        v30 = if l_item_0.IsA and (not (not l_item_0:IsA("JointInstance") or l_ClassName_1 ~= "ManualWeld") or l_ClassName_1 == "ManualGlue") then l_StudioService_0:GetClassIcon("JointInstance") else l_StudioService_0:GetClassIcon(l_ClassName_1);
    end;
    local v32 = v30.ImageRectSize or Vector2.new();
    local v33 = v27 + l_Size_0 + 2 * l_IconPadding_0;
    local v34 = v32.X + 3 * l_IconPadding_0;
    return v1.createElement(v6, {
        Padding = {
            Left = v27
        }, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, {
        Toggle = v25 and v1.createElement("ImageButton", {
            Position = UDim2.new(0, v27 + l_IconPadding_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, l_Size_0, 0, l_Size_0), 
            BackgroundTransparency = 1, 
            Image = l_style_0.Arrow.Image, 
            ImageColor3 = l_style_0.Arrow.Color, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            ImageRectOffset = l_isExpanded_0 and l_style_0.Arrow.ExpandedOffset or l_style_0.Arrow.CollapsedOffset, 
            [v1.Event.Activated] = function() --[[ Line: 121 ]]
                -- upvalues: l_onToggled_0 (copy), l_row_0 (copy)
                l_onToggled_0(l_row_0);
            end
        }) or nil, 
        Label = v1.createElement("TextButton", {
            [v1.Event.MouseEnter] = v18.onMouseEnter, 
            [v1.Event.MouseLeave] = v18.onMouseLeave, 
            [v1.Event.InputBegan] = v18.onInputBegan, 
            BackgroundTransparency = v18.state.isHovering or l_isSelected_0 and 0 or 1, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_isSelected_0 and l_style_0.SelectedColor or l_style_0.HoverColor, 
            Position = UDim2.fromOffset(v33, 0), 
            Size = UDim2.new(1, -l_Size_0, 1, 0), 
            Text = "", 
            AutoButtonColor = false
        }, {
            Icon = v1.createElement("ImageLabel", {
                Size = UDim2.fromOffset(v32.X, v32.Y), 
                BackgroundTransparency = 1, 
                Image = v30.Image, 
                ImageRectSize = v32, 
                ImageRectOffset = v30.ImageRectOffset, 
                Position = UDim2.new(0, l_IconPadding_0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            Text = v1.createElement(v7, {
                Style = l_style_0.Text, 
                Text = l_item_0.Name, 
                TextColor = l_isSelected_0 and l_style_0.SelectedTextColor or nil, 
                Size = UDim2.new(1, -v34, 1, 0), 
                Position = UDim2.new(0, v34, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;
return v8;