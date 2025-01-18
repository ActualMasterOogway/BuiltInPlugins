local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.PureComponent:extend("ContextButton");
v5.init = function(v6) --[[ Line: 23 ]] --[[ Name: init ]]
    v6.state = {
        hovered = false
    };
    v6.mouseEnter = function() --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        if v6.props.Mouse then
            v6.props.Mouse:__pushCursor("PointingHand");
            v6:setState({
                hovered = true
            });
        end;
    end;
    v6.mouseLeave = function() --[[ Line: 37 ]]
        -- upvalues: v6 (copy)
        if v6.props.Mouse then
            v6.props.Mouse:__popCursor();
            v6:setState({
                hovered = false
            });
        end;
    end;
    v6.onActivated = function() --[[ Line: 46 ]]
        -- upvalues: v6 (copy)
        if v6.props.OnActivated then
            v6.props.OnActivated();
        end;
    end;
end;
v5.willUnmount = function(v7) --[[ Line: 53 ]] --[[ Name: willUnmount ]]
    v7.props.Mouse:__resetCursor();
end;
v5.render = function(v8) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_state_0 = v8.state;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_TrackSelected_0 = l_props_0.TrackSelected;
    local l_hovered_0 = l_state_0.hovered;
    local v18 = nil;
    v18 = if l_TrackSelected_0 then l_trackTheme_0.selectedTextColor else if l_hovered_0 then l_trackTheme_0.hoveredButtonColor else l_trackTheme_0.buttonColor;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(0, v2.TRACKLIST_BUTTON_SIZE, 0, v2.TRACKLIST_BUTTON_SIZE), 
        AnchorPoint = l_AnchorPoint_0, 
        Position = l_Position_0, 
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        Image = l_trackTheme_0.contextMenu, 
        ImageColor3 = v18, 
        ScaleType = Enum.ScaleType.Fit, 
        [v1.Event.Activated] = v8.onActivated, 
        [v1.Event.MouseEnter] = v8.mouseEnter, 
        [v1.Event.MouseLeave] = v8.mouseLeave
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v5));