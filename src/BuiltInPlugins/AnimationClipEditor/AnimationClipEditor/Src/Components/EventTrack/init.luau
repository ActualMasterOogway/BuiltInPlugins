local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = v3.Util.StyleModifier;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v8 = require(l_script_FirstAncestor_0.Src.Components.EventMarker);
local v9 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.TrackUtils);
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v17 = v1.PureComponent:extend("EventTrack");
v17.init = function(v18) --[[ Line: 44 ]] --[[ Name: init ]]
    v18.state = {
        showFilterMenu = false
    };
    v18.showFilterMenu = function() --[[ Line: 49 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showFilterMenu = true
        });
    end;
    v18.hideFilterMenu = function() --[[ Line: 55 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showFilterMenu = false
        });
    end;
end;
v17.renderEvent = function(v19, v20, v21, v22) --[[ Line: 62 ]] --[[ Name: renderEvent ]]
    -- upvalues: v2 (copy), v1 (copy), v8 (copy)
    local l_props_0 = v19.props;
    local l_Events_0 = l_props_0.Events;
    local l_EventFilters_0 = l_props_0.EventFilters;
    local v26 = l_Events_0.Data[v22] and v2.Dictionary.keys(l_Events_0.Data[v22]) or {};
    if l_EventFilters_0 then
        local v27 = {};
        for _, v29 in v26 do
            if l_EventFilters_0[v29] then
                table.insert(v27, v29);
            end;
        end;
        v26 = v27;
    end;
    table.sort(v26);
    if next(v26) then
        return (v1.createElement(v8, {
            Selected = v20, 
            Names = v26, 
            Position = UDim2.new(0, v21, 0.5, 0), 
            ZIndex = l_props_0.ZIndex, 
            OnRightClick = function(_, _) --[[ Line: 88 ]] --[[ Name: OnRightClick ]]
                -- upvalues: l_props_0 (copy), v22 (copy), v20 (copy)
                l_props_0.OnEventRightClick(v22, v20);
            end, 
            OnInputBegan = function(_, v33) --[[ Line: 92 ]] --[[ Name: OnInputBegan ]]
                -- upvalues: l_props_0 (copy), v22 (copy), v20 (copy)
                l_props_0.OnEventInputBegan(v22, v20, v33);
            end, 
            OnInputEnded = function(_, v35) --[[ Line: 96 ]] --[[ Name: OnInputEnded ]]
                -- upvalues: l_props_0 (copy), v22 (copy), v20 (copy)
                l_props_0.OnEventInputEnded(v22, v20, v35);
            end
        }));
    else
        return nil;
    end;
end;
v17.renderPreviewEvent = function(v36, v37, _) --[[ Line: 103 ]] --[[ Name: renderPreviewEvent ]]
    -- upvalues: v1 (copy), v8 (copy)
    local l_props_1 = v36.props;
    return v1.createElement(v8, {
        Selected = true, 
        Position = UDim2.new(0, v37, 0.5, 0), 
        ZIndex = l_props_1.ZIndex + 1
    });
end;
v17.renderEvents = function(v40, v41) --[[ Line: 112 ]] --[[ Name: renderEvents ]]
    -- upvalues: v12 (copy)
    local l_props_2 = v40.props;
    local l_Width_0 = l_props_2.Width;
    local l_StartTick_0 = l_props_2.StartTick;
    local l_EndTick_0 = l_props_2.EndTick;
    local l_Keyframes_0 = l_props_2.Events.Keyframes;
    local l_SelectedEvents_0 = l_props_2.SelectedEvents;
    local v48, v49 = v12.getKeyframesExtents(l_Keyframes_0, l_StartTick_0, l_EndTick_0);
    if v48 ~= nil and v49 ~= nil then
        for v50 = v48, v49 do
            local v51 = l_Keyframes_0[v50];
            local v52 = v12.getScaledKeyframePosition(v51, l_StartTick_0, l_EndTick_0, l_Width_0);
            v41[v50] = v40:renderEvent(l_SelectedEvents_0 and l_SelectedEvents_0[v51], v52, v51);
        end;
    end;
end;
v17.makeFilterActions = function(v53) --[[ Line: 132 ]] --[[ Name: makeFilterActions ]]
    -- upvalues: v11 (copy), v2 (copy)
    local l_props_3 = v53.props;
    local l_Localization_0 = l_props_3.Localization;
    local v56 = {};
    local l_AvailableEvents_0 = l_props_3.AvailableEvents;
    local l_EventFilters_1 = l_props_3.EventFilters;
    for _, v60 in ipairs(l_AvailableEvents_0) do
        table.insert(v56, {
            Text = v60, 
            Checked = l_EventFilters_1 and l_EventFilters_1[v60], 
            OnItemClicked = function(v61) --[[ Line: 143 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_3 (copy)
                l_props_3.ToggleEventFilter(v61.Text);
            end
        });
    end;
    if #v56 > 0 then
        table.insert(v56, v11.MENU_SEPARATOR);
    end;
    local v62 = {
        Text = l_Localization_0:getText("Menu", "Nothing")
    };
    local v63 = false;
    if #l_AvailableEvents_0 > 0 then
        v63 = not l_EventFilters_1 or #v2.Dictionary.keys(l_EventFilters_1) == 0;
    end;
    v62.Checked = v63;
    v62.OnItemClicked = v53.props.ClearEventFilters;
    table.insert(v56, v62);
    table.insert(v56, {
        Text = l_Localization_0:getText("Menu", "Everything"), 
        Checked = not l_EventFilters_1 or #v2.Dictionary.keys(l_EventFilters_1) == #l_AvailableEvents_0, 
        OnItemClicked = v53.props.SetAllEventFilters
    });
    return v56;
end;
v17.render = function(v64) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Button_0 (copy), v11 (copy), l_Tooltip_0 (copy), v9 (copy), v7 (copy)
    local l_props_4 = v64.props;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_Localization_1 = l_props_4.Localization;
    local l_showFilterMenu_0 = v64.state.showFilterMenu;
    local v69 = l_props_4[v1.Children] or {};
    l_props_4[v1.Children] = nil;
    local l_Events_1 = l_props_4.Events;
    if l_Events_1 and l_Events_1.Keyframes and #l_Events_1.Keyframes > 0 then
        v64:renderEvents(v69);
    end;
    return v1.createElement(l_Pane_0, {}, {
        FilterButton = v1.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v11.TOGGLE_EDITOR_BUTTON_WIDTH, v11.TOGGLE_EDITOR_BUTTON_HEIGHT), 
            Position = UDim2.fromOffset(v64.props.TrackPadding / 4, v11.TIMELINE_HEIGHT / 2), 
            Style = l_Stylizer_0.button.EventFilter, 
            OnClick = v64.showFilterMenu
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = l_Stylizer_0.eventTheme.filterButton.size, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Stylizer_0.eventTheme.filterButton.image, 
                ImageColor3 = l_Stylizer_0.playbackTheme.iconColor
            }), 
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltip", "FilterEvents")
            }), 
            FilterMenu = l_showFilterMenu_0 and v1.createElement(v9, {
                Actions = v64:makeFilterActions(), 
                OnMenuOpened = v64.hideFilterMenu
            })
        }), 
        Markers = v1.createElement(v7, l_props_4, v69)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v17));