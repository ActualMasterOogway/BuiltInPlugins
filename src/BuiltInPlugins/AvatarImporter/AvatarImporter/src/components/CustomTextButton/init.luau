local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.src.Assets);
local v3 = require(l_Parent_0.src.utils.themeConfig);
local v4 = require(l_Parent_0.src.Constants);
local v5 = {
    Default = {
        Light = Color3.fromRGB(255, 255, 255), 
        Dark = Color3.fromRGB(60, 60, 60)
    }, 
    Hover = {
        Light = Color3.fromRGB(228, 238, 254), 
        Dark = Color3.fromRGB(66, 66, 66)
    }
};
local v6 = {
    Default = {
        Light = Color3.fromRGB(0, 162, 255), 
        Dark = Color3.fromRGB(0, 162, 255)
    }, 
    Hover = {
        Light = Color3.fromRGB(50, 181, 255), 
        Dark = Color3.fromRGB(50, 181, 255)
    }
};
local v7 = {
    Light = Color3.fromRGB(0, 0, 0), 
    Dark = Color3.fromRGB(255, 255, 255)
};
local v8 = {
    Light = Color3.fromRGB(255, 255, 255), 
    Dark = Color3.fromRGB(255, 255, 255)
};
local v9 = {
    Light = Color3.fromRGB(184, 184, 184), 
    Dark = Color3.fromRGB(60, 60, 60)
};
local v10 = {
    Light = Color3.fromRGB(0, 162, 255), 
    Dark = Color3.fromRGB(0, 162, 255)
};
local v11 = v1.Component:extend("CustomTextButton");
v11.init = function(v12) --[[ Line: 64 ]] --[[ Name: init ]]
    v12.state = {
        hovered = false, 
        pressed = false
    };
end;
v11.getButtonThemeConfig = function(v13) --[[ Line: 71 ]] --[[ Name: getButtonThemeConfig ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy)
    local v14 = nil;
    v14 = if v13.props.isMain then if v13.state.pressed or v13.state.hovered then v6.Hover else v6.Default else if v13.state.pressed or v13.state.hovered then v5.Hover else v5.Default;
    return v3(v14);
end;
v11.getLabelThemeConfig = function(v15) --[[ Line: 89 ]] --[[ Name: getLabelThemeConfig ]]
    -- upvalues: v3 (copy), v8 (copy), v7 (copy)
    return v3(v15.props.isMain and v8 or v7);
end;
v11.getBorderThemeConfig = function(v16) --[[ Line: 93 ]] --[[ Name: getBorderThemeConfig ]]
    -- upvalues: v3 (copy), v10 (copy), v9 (copy)
    return v3(v16.props.isMain and v10 or v9);
end;
v11.render = function(v17) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy)
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = v2.BUTTON_AVATAR_TYPE, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = v17.props.isLarge and UDim2.new(0, 192, 0, 34) or UDim2.new(0, 102, 0, 34), 
        SliceCenter = Rect.new(4, 4, 5, 5), 
        ImageColor3 = v17:getButtonThemeConfig(), 
        LayoutOrder = v17.props.layoutOrder, 
        [v1.Event.InputBegan] = function(_, v19) --[[ Line: 107 ]]
            -- upvalues: v17 (copy)
            if v19.UserInputType == Enum.UserInputType.MouseMovement then
                v17:setState({
                    hovered = true
                });
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v21) --[[ Line: 113 ]]
            -- upvalues: v17 (copy)
            if v21.UserInputType == Enum.UserInputType.MouseMovement then
                v17:setState({
                    hovered = false, 
                    pressed = false
                });
            end;
        end, 
        [v1.Event.MouseButton1Down] = function() --[[ Line: 122 ]]
            -- upvalues: v17 (copy)
            v17:setState({
                pressed = true
            });
        end, 
        [v1.Event.MouseButton1Up] = function() --[[ Line: 126 ]]
            -- upvalues: v17 (copy)
            v17:setState({
                pressed = false
            });
        end, 
        [v1.Event.MouseButton1Click] = v17.props[v1.Event.MouseButton1Click]
    }, {
        border = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v2.BUTTON_AVATAR_TYPE_BORDER, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, 0), 
            SliceCenter = Rect.new(4, 4, 5, 5), 
            ImageColor3 = v17:getBorderThemeConfig()
        }), 
        label = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v4.FONT, 
            Size = UDim2.new(1, 0, 1, 0), 
            TextSize = v4.FONT_SIZE_TITLE, 
            Text = v17.props.labelText, 
            TextColor3 = v17:getLabelThemeConfig()
        })
    });
end;
return v11;