local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Components_0 = l_Parent_0.UI.Components;
local v5 = require(l_Components_0.HoverArea);
local v6 = v1.PureComponent:extend("RoundArrowButton");
v6.init = function(v7) --[[ Line: 43 ]] --[[ Name: init ]]
    v7.state = {
        Hovering = false
    };
end;
v6.mouseHoverChanged = function(v8, v9) --[[ Line: 49 ]] --[[ Name: mouseHoverChanged ]]
    v8:setState({
        Hovering = v9
    });
end;
v6.render = function(v10) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_props_0 = v10.props;
    local l_RoundArrowButton_0 = l_props_0.Theme.RoundArrowButton;
    local l_Visible_0 = l_props_0.Visible;
    local v14 = l_props_0.Flipped or false;
    local v15 = l_props_0.Position or UDim2.new();
    local v16 = l_props_0.AnchorPoint or Vector2.new();
    local l_Disabled_0 = l_props_0.Disabled;
    local l_Hovering_0 = v10.state.Hovering;
    local v19 = l_Disabled_0 and "Forbidden" or "PointingHand";
    local l_Mouse_0 = l_props_0.Mouse;
    return v1.createElement("ImageButton", {
        Visible = l_Visible_0, 
        Position = v15, 
        AnchorPoint = v16, 
        Size = l_RoundArrowButton_0.ButtonSize, 
        BackgroundTransparency = 1, 
        ImageTransparency = (not l_Hovering_0 or l_Disabled_0) and 0.3 or 0, 
        Image = l_RoundArrowButton_0.ButtonImage, 
        Rotation = v14 and 180 or 0, 
        [v1.Event.Activated] = function() --[[ Line: 81 ]]
            -- upvalues: l_Disabled_0 (copy), l_props_0 (copy)
            if not l_Disabled_0 then
                l_props_0.OnClick();
            end;
        end
    }, {
        Hover = v1.createElement(v5, {
            Cursor = "rbxasset://SystemCursors/" .. v19, 
            Mouse = l_Mouse_0, 
            MouseEnter = function() --[[ Line: 91 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v10 (copy)
                v10:mouseHoverChanged(true);
            end, 
            MouseLeave = function() --[[ Line: 94 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v10 (copy)
                v10:mouseHoverChanged(false);
            end
        })
    });
end;
return (l_withContext_0({
    Mouse = v2.Mouse
})(v6));