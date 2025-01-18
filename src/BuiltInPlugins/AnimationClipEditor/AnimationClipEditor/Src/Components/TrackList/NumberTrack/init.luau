local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Components.TrackList.NumberBox);
local v9 = v1.PureComponent:extend("NumberTrack");
v9.init = function(v10, _) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v10.state = {
        values = nil, 
        renderFromNumberEntry = false
    };
    v10.getTextWidth = function(v12, v13) --[[ Line: 69 ]]
        -- upvalues: v2 (ref)
        local l_font_0 = v13.font;
        local l_textSize_0 = v13.trackTheme.textSize;
        return v2.getTextWidth(v12, l_textSize_0, l_font_0);
    end;
    v10.onSetNumber = function(v16, v17) --[[ Line: 75 ]]
        -- upvalues: v10 (copy)
        local l_props_0 = v10.props;
        local l_state_0 = v10.state;
        local l_Items_0 = l_props_0.Items;
        local l_Values_0 = l_state_0.Values;
        local v22 = {};
        for v23, v24 in ipairs(l_Items_0) do
            if l_Values_0 and l_Values_0[v23] then
                v22[v23] = l_Values_0[v23];
            else
                v22[v23] = v24.Value;
            end;
        end;
        v22[v16] = v17;
        v10:setState({
            renderFromNumberEntry = 2, 
            values = v22
        });
    end;
    v10.onItemChanged = function(v25, v26) --[[ Line: 95 ]]
        -- upvalues: v10 (copy)
        if v10.props.OnItemChanged then
            return v10.props.OnItemChanged(v25, v26);
        else
            return;
        end;
    end;
end;
v9.getDerivedStateFromProps = function(_, v28) --[[ Line: 102 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v1 (copy)
    local l_renderFromNumberEntry_0 = v28.renderFromNumberEntry;
    if l_renderFromNumberEntry_0 and l_renderFromNumberEntry_0 > 0 then
        return {
            renderFromNumberEntry = l_renderFromNumberEntry_0 - 1
        };
    else
        return {
            values = v1.None
        };
    end;
end;
v9.render = function(v30) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), v7 (copy), v8 (copy), v6 (copy)
    local l_props_1 = v30.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_1 = v30.state;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local v35 = l_props_1.Indent or 0;
    local l_Name_0 = l_props_1.Name;
    local l_Items_1 = l_props_1.Items;
    local l_ReadOnly_0 = l_props_1.ReadOnly;
    local l_values_0 = l_state_1.values;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local v41 = l_props_1.NameWidth or v30.getTextWidth(l_Name_0, l_Stylizer_0);
    local v42 = v3.new();
    local v43 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v7.NUMBERTRACK_PADDING)
        }), 
        ArrowPadding = v1.createElement("Frame", {
            Size = UDim2.new(0, v7.ARROW_SIZE * 2 - v7.NUMBERTRACK_PADDING, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v42:getNextOrder()
        }), 
        NameLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(0, v41, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v42:getNextOrder(), 
            Text = l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
    for v44, v45 in ipairs(l_Items_1) do
        v43[v45.Key .. "_Entry"] = v1.createElement(v8, {
            Size = UDim2.new(0, v7.NUMBERBOX_WIDTH, 1, -4), 
            LayoutOrder = v42:getNextOrder(), 
            Number = l_values_0 and l_values_0[v44] or v45.Value, 
            Name = v45.Name, 
            ReadOnly = l_ReadOnly_0, 
            SetNumber = function(v46) --[[ Line: 168 ]] --[[ Name: SetNumber ]]
                -- upvalues: l_props_1 (copy), v30 (copy), v44 (copy), v45 (copy)
                l_props_1.OnChangeBegan();
                v30.onSetNumber(v44, v46);
                return v30.onItemChanged(v45.Key, v46);
            end, 
            OnDragMoved = function(v47) --[[ Line: 173 ]] --[[ Name: OnDragMoved ]]
                -- upvalues: v30 (copy), v45 (copy)
                v30.onItemChanged(v45.Key, v45.Value + v47.Delta.X * 0.05);
            end, 
            OnDragBegan = l_props_1.OnChangeBegan
        });
    end;
    return v1.createElement(v6, {
        Height = v7.TRACK_HEIGHT, 
        Indent = v35, 
        LayoutOrder = l_LayoutOrder_0
    }, v43);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));