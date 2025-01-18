local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.Mouse);
local v2 = require(script.Parent.Internal.ThemeChangeListener);
local v3 = require(script.Parent.Internal.Theme);
local v4 = nil;
local v5 = v0.PureComponent:extend("ToggleButton");
v5.render = function(v6) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy), v4 (ref), v1 (copy), v2 (copy)
    local function v7() --[[ Line: 37 ]] --[[ Name: renderInternal ]]
        -- upvalues: v0 (ref), v4 (ref), v6 (copy), v1 (ref)
        return v0.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = v4(v6), 
            Position = v6.props.Position, 
            Size = v6.props.Size or UDim2.new(0, 40, 0, 24), 
            LayoutOrder = v6.props.LayoutOrder or 1, 
            [v0.Event.MouseEnter] = function() --[[ Line: 47 ]]
                -- upvalues: v6 (ref), v1 (ref)
                if v6.props.Enabled then
                    v1.onEnter(v6.props.Mouse);
                end;
            end, 
            [v0.Event.MouseLeave] = function() --[[ Line: 48 ]]
                -- upvalues: v6 (ref), v1 (ref)
                if v6.props.Enabled then
                    v1.onLeave(v6.props.Mouse);
                end;
            end, 
            [v0.Event.MouseButton1Click] = function() --[[ Line: 50 ]]
                -- upvalues: v6 (ref)
                if v6.props.IsOn then
                    v6.props.OnClickedOff();
                    return;
                else
                    v6.props.OnClickedOn();
                    return;
                end;
            end
        });
    end;
    return v0.createElement(v2, {
        render = v7
    });
end;
v4 = function(v8) --[[ Line: 65 ]]
    -- upvalues: v3 (copy)
    local v9 = if v8.DarkStyle ~= nil then v8.DarkStyle else v3.isDarkerTheme();
    if v8.props.Enabled then
        if v8.props.IsOn then
            if v9 then
                return "rbxasset://textures/RoactStudioWidgets/toggle_on_dark.png";
            else
                return "rbxasset://textures/RoactStudioWidgets/toggle_on_light.png";
            end;
        elseif v9 then
            return "rbxasset://textures/RoactStudioWidgets/toggle_off_dark.png";
        else
            return "rbxasset://textures/RoactStudioWidgets/toggle_off_light.png";
        end;
    elseif v9 then
        return "rbxasset://textures/RoactStudioWidgets/toggle_disable_dark.png";
    else
        return "rbxasset://textures/RoactStudioWidgets/toggle_disable_light.png";
    end;
end;
return v5;