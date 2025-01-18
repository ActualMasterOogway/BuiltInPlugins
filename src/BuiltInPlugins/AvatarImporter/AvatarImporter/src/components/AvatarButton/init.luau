local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.src.Assets);
local v4 = require(l_Parent_0.src.utils.themeConfig);
local v5 = require(l_Parent_0.src.utils.getTextWidth);
local v6 = require(l_Parent_0.src.components.Tooltip);
local v7 = require(l_Parent_0.src.thunks.Import);
local v8 = require(l_Parent_0.src.thunks.DetectType);
local v9 = require(l_Parent_0.src.thunks.DetectTypeWithOrigAvatarType);
local v10 = require(l_Parent_0.src.Constants);
local l_Studio_0 = settings().Studio;
local function v19(v12, v13, v14) --[[ Line: 42 ]] --[[ Name: getTooltipSize ]]
    -- upvalues: v5 (copy), v10 (copy)
    v12 = v12 or "";
    v13 = v13 or "";
    v14 = v14 or "";
    local v15 = math.max(v5(v12, v10.FONT_SIZE_SMALL, v10.FONT_BOLD), v5(v13, v10.FONT_SIZE_SMALL, v10.FONT), v5(v14, v10.FONT_SIZE_SMALL, v10.FONT));
    local v16 = 0;
    if v12 ~= "" then
        v16 = v16 + 1;
    end;
    if v13 ~= "" then
        v16 = v16 + 1;
    end;
    if v14 ~= "" then
        v16 = v16 + 1;
    end;
    local v17 = v15 + 10;
    local v18 = 5 + 14 * v16 + 5;
    return UDim2.new(0, v17, 0, v18);
end;
local v20 = v1.Component:extend("AvatarButton");
v20.init = function(v21) --[[ Line: 71 ]] --[[ Name: init ]]
    v21.state = {
        hover = false, 
        down = false
    };
end;
v20.getColor = function(v22) --[[ Line: 78 ]] --[[ Name: getColor ]]
    -- upvalues: l_Studio_0 (copy)
    if v22.state.down then
        return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Pressed);
    elseif v22.state.hover then
        return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Hover);
    else
        return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Default);
    end;
end;
v20.getTooltipFields = function(v23) --[[ Line: 88 ]] --[[ Name: getTooltipFields ]]
    local v24 = {};
    if v23.props.contextInfo.title then
        v24[#v24 + 1] = v23.props.contextInfo.title;
    end;
    if v23.props.contextInfo.height then
        v24[#v24 + 1] = string.format("Ideal height: %s studs", (tostring(v23.props.contextInfo.height)));
    end;
    if v23.props.contextInfo.description then
        v24[#v24 + 1] = v23.props.contextInfo.description;
    end;
    return v24;
end;
v20.render = function(v25) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v1 (copy), v3 (copy), v6 (copy), v19 (copy), l_Studio_0 (copy), v4 (copy)
    local v26 = v25:getTooltipFields();
    local v27 = v26[1];
    local v28 = v26[2];
    local v29 = v26[3];
    local function _(v30) --[[ Line: 108 ]] --[[ Name: detectRigTypeOrImport ]]
        -- upvalues: v10 (ref), v25 (copy)
        if v30 ~= v10.AVATAR_TYPE.CUSTOM then
            v25.props.doImport(v25.props.avatarType);
            return;
        else
            v25.props.detectTypeWithOrigAvatarType(v30);
            return;
        end;
    end;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = v3.BUTTON_AVATAR_TYPE, 
        LayoutOrder = v25.props.layoutOrder, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(0, v10.BUTTON_WIDTH, 0, v10.BUTTON_HEIGHT), 
        SliceCenter = Rect.new(4, 4, 5, 5), 
        ImageColor3 = v25:getColor(), 
        [v1.Event.InputBegan] = function(_, v33) --[[ Line: 127 ]]
            -- upvalues: v25 (copy)
            if v33.UserInputType == Enum.UserInputType.MouseMovement and not v25.state.hover then
                v25:setState({
                    hover = true
                });
            end;
        end, 
        [v1.Event.InputChanged] = function(_, v35) --[[ Line: 133 ]]
            -- upvalues: v25 (copy)
            if v35.UserInputType == Enum.UserInputType.MouseMovement and not v25.state.hover then
                v25:setState({
                    hover = true
                });
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v37) --[[ Line: 139 ]]
            -- upvalues: v25 (copy)
            if v37.UserInputType == Enum.UserInputType.MouseMovement and (v25.state.hover or v25.state.down) then
                v25:setState({
                    hover = false, 
                    down = false
                });
            end;
        end, 
        [v1.Event.MouseButton1Down] = function() --[[ Line: 148 ]]
            -- upvalues: v25 (copy)
            v25:setState({
                down = true
            });
        end, 
        [v1.Event.MouseButton1Up] = function() --[[ Line: 152 ]]
            -- upvalues: v25 (copy)
            v25:setState({
                down = false
            });
        end, 
        [v1.Event.Activated] = function() --[[ Line: 156 ]]
            -- upvalues: v25 (copy), v10 (ref)
            if v25.props.avatarType == v10.AVATAR_TYPE.CUSTOM then
                local l_avatarType_0 = v25.props.avatarType;
                if l_avatarType_0 ~= v10.AVATAR_TYPE.CUSTOM then
                    v25.props.doImport(v25.props.avatarType);
                    return;
                else
                    v25.props.detectTypeWithOrigAvatarType(l_avatarType_0);
                    return;
                end;
            elseif v25.props.avatarType ~= v10.AVATAR_TYPE.CUSTOM then
                v25.props.detectTypeWithOrigAvatarType(v25.props.avatarType);
                return;
            else
                v25.props.doImport(v25.props.avatarType);
                return;
            end;
        end
    }, {
        tooltip = v1.createElement(v6, {
            Size = v19(v27, v28, v29)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UIPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 5), 
                PaddingTop = UDim.new(0, 5)
            }), 
            Title = v27 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Font = v10.FONT_BOLD, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v27
            }), 
            Top = v28 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v28
            }), 
            Bottom = v29 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v29
            })
        }), 
        border = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v3.BUTTON_AVATAR_TYPE_BORDER, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, 0), 
            SliceCenter = Rect.new(4, 4, 5, 5), 
            ImageColor3 = v4({
                Light = Color3.fromRGB(184, 184, 184), 
                Dark = Color3.fromRGB(60, 60, 60)
            })
        }), 
        icon = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 28, 0, 17), 
            Size = UDim2.new(0, 91, 0, 160), 
            Image = v4(v25.props.iconOptions)
        }), 
        title = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v10.FONT_SEMIBOLD, 
            Position = UDim2.new(0, 0, 0, 188), 
            Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_TITLE), 
            Text = v25.props.name, 
            TextSize = v10.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = v4({
                Light = Color3.fromRGB(0, 162, 255), 
                Dark = Color3.fromRGB(204, 204, 204)
            })
        })
    });
end;
return v2.connect(nil, function(v39) --[[ Line: 260 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy)
    return {
        doImport = function(v40) --[[ Line: 262 ]] --[[ Name: doImport ]]
            -- upvalues: v39 (copy), v7 (ref)
            v39(v7(v40));
        end, 
        detectType = function() --[[ Line: 265 ]] --[[ Name: detectType ]]
            -- upvalues: v39 (copy), v8 (ref)
            v39(v8());
        end, 
        detectTypeWithOrigAvatarType = function(v41) --[[ Line: 268 ]] --[[ Name: detectTypeWithOrigAvatarType ]]
            -- upvalues: v39 (copy), v9 (ref)
            v39(v9(v41));
        end
    };
end)(v20);