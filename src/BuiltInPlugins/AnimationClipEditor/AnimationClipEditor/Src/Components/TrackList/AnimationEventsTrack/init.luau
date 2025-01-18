local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = v1.PureComponent:extend("AnimationEventsTrack");
v8.init = function(v9) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v9.state = {
        hovering = false
    };
    v9.getTextWidth = function(v10, v11) --[[ Line: 29 ]]
        -- upvalues: v3 (ref)
        local l_font_0 = v11.font;
        local l_textSize_0 = v11.trackTheme.textSize;
        return v3.getTextWidth(v10, l_textSize_0, l_font_0);
    end;
    v9.onButtonClick = function() --[[ Line: 35 ]]
        -- upvalues: v9 (copy)
        if v9.props.OnButtonClick then
            v9.props.OnButtonClick();
        end;
    end;
    v9.mouseEnter = function() --[[ Line: 41 ]]
        -- upvalues: v9 (copy)
        if v9.props.Mouse then
            v9.props.Mouse:__pushCursor("PointingHand");
        end;
        v9:setState({
            hovering = true
        });
    end;
    v9.mouseLeave = function() --[[ Line: 50 ]]
        -- upvalues: v9 (copy)
        if v9.props.Mouse then
            v9.props.Mouse:__popCursor();
        end;
        v9:setState({
            hovering = false
        });
    end;
end;
v8.willUnmount = function(v14) --[[ Line: 60 ]] --[[ Name: willUnmount ]]
    v14.props.Mouse:__resetCursor();
end;
v8.render = function(v15) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v7 (copy)
    local l_Localization_0 = v15.props.Localization;
    local l_props_0 = v15.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_state_0 = v15.state;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v21 = l_props_0.Indent or 0;
    local _ = l_state_0.hovering;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_eventMarker_0 = l_Stylizer_0.eventMarker;
    return v1.createElement(v6, {
        Height = v7.TRACK_HEIGHT, 
        Indent = v21, 
        ShowBackground = true, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        TitleLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_Localization_0:getText("Title", "AnimationEvents"), 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        AddEvent = v1.createElement("ImageButton", {
            Size = UDim2.new(0, v7.TRACKLIST_BUTTON_SIZE, 0, v7.TRACKLIST_BUTTON_SIZE), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v7.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = 1, 
            [v1.Event.Activated] = v15.onButtonClick, 
            [v1.Event.MouseEnter] = v15.mouseEnter, 
            [v1.Event.MouseLeave] = v15.mouseLeave
        }, {
            EventMarker = v1.createElement("ImageLabel", {
                Size = UDim2.new(0, 5, 0, 15), 
                Position = UDim2.new(0, 1, 0, 1), 
                Image = l_trackTheme_0.addEventBackground, 
                ImageColor3 = l_eventMarker_0.imageColor, 
                BackgroundTransparency = 1
            }), 
            EventBorder = v1.createElement("ImageLabel", {
                Size = UDim2.new(0, 15, 0, 15), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_trackTheme_0.addEventBorder, 
                ImageColor3 = l_trackTheme_0.plusIconColor, 
                BackgroundTransparency = 1
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v8));