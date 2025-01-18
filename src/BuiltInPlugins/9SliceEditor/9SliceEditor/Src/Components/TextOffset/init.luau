local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v13 = v1.PureComponent:extend("TextOffset");
local v14 = v4.Left.rawValue();
local v15 = v4.Right.rawValue();
local v16 = v4.Top.rawValue();
local v17 = v4.Bottom.rawValue();
local function v24(v18, v19) --[[ Line: 39 ]] --[[ Name: SliceToOffset ]]
    -- upvalues: v4 (copy)
    local v20 = v4.Left.rawValue();
    local v21 = v4.Right.rawValue();
    local v22 = v4.Top.rawValue();
    local v23 = v4.Bottom.rawValue();
    return {
        v18[v20], 
        v19.X - v18[v21], 
        v18[v22], 
        v19.Y - v18[v23]
    };
end;
v13.init = function(v25, _) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy)
    v25.onLeftFocusLost = function(_, v28) --[[ Line: 57 ]]
        -- upvalues: v25 (copy), v24 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref)
        local l_sliceRect_0 = v25.props.sliceRect;
        local l_setSliceRect_0 = v25.props.setSliceRect;
        local l_pixelDimensions_0 = v25.props.pixelDimensions;
        local v32 = v24(l_sliceRect_0, l_pixelDimensions_0)[v14];
        local v33 = tonumber(v28.Text);
        if v33 then
            local v34 = math.round((math.clamp(v33, 0, l_sliceRect_0[v15])));
            l_setSliceRect_0({
                v34, 
                l_sliceRect_0[v15], 
                l_sliceRect_0[v16], 
                l_sliceRect_0[v17]
            }, true);
            v28.Text = ("%d"):format(v34);
            return;
        else
            v28.Text = ("%d"):format(v32);
            return;
        end;
    end;
    v25.onRightFocusLost = function(_, v36) --[[ Line: 76 ]]
        -- upvalues: v25 (copy), v24 (ref), v15 (ref), v14 (ref), v16 (ref), v17 (ref)
        local l_sliceRect_1 = v25.props.sliceRect;
        local l_setSliceRect_1 = v25.props.setSliceRect;
        local l_pixelDimensions_1 = v25.props.pixelDimensions;
        local v40 = v24(l_sliceRect_1, l_pixelDimensions_1)[v15];
        local v41 = tonumber(v36.Text);
        if v41 then
            local v42 = math.round((math.clamp(v41, 0, l_pixelDimensions_1.X - l_sliceRect_1[v14])));
            local v43 = l_pixelDimensions_1.X - v42;
            l_setSliceRect_1({
                l_sliceRect_1[v14], 
                v43, 
                l_sliceRect_1[v16], 
                l_sliceRect_1[v17]
            }, true);
            v36.Text = ("%d"):format(v42);
            return;
        else
            v36.Text = ("%d"):format(v40);
            return;
        end;
    end;
    v25.onTopFocusLost = function(_, v45) --[[ Line: 96 ]]
        -- upvalues: v25 (copy), v24 (ref), v16 (ref), v17 (ref), v14 (ref), v15 (ref)
        local l_sliceRect_2 = v25.props.sliceRect;
        local l_setSliceRect_2 = v25.props.setSliceRect;
        local l_pixelDimensions_2 = v25.props.pixelDimensions;
        local v49 = v24(l_sliceRect_2, l_pixelDimensions_2)[v16];
        local v50 = tonumber(v45.Text);
        if v50 then
            local v51 = math.round((math.clamp(v50, 0, l_sliceRect_2[v17])));
            l_setSliceRect_2({
                l_sliceRect_2[v14], 
                l_sliceRect_2[v15], 
                v51, 
                l_sliceRect_2[v17]
            }, true);
            v45.Text = ("%d"):format(v51);
            return;
        else
            v45.Text = ("%d"):format(v49);
            return;
        end;
    end;
    v25.onBottomFocusLost = function(_, v53) --[[ Line: 115 ]]
        -- upvalues: v25 (copy), v24 (ref), v17 (ref), v16 (ref), v14 (ref), v15 (ref)
        local l_sliceRect_3 = v25.props.sliceRect;
        local l_setSliceRect_3 = v25.props.setSliceRect;
        local l_pixelDimensions_3 = v25.props.pixelDimensions;
        local v57 = v24(l_sliceRect_3, l_pixelDimensions_3)[v17];
        local v58 = tonumber(v53.Text);
        if v58 then
            local v59 = math.round((math.clamp(v58, 0, l_pixelDimensions_3.Y - l_sliceRect_3[v16])));
            local v60 = l_pixelDimensions_3.Y - v59;
            l_setSliceRect_3({
                l_sliceRect_3[v14], 
                l_sliceRect_3[v15], 
                l_sliceRect_3[v16], 
                v60
            }, true);
            v53.Text = ("%d"):format(v59);
            return;
        else
            v53.Text = ("%d"):format(v57);
            return;
        end;
    end;
end;
v13.render = function(v61) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: v24 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v3 (copy), l_DEPRECATED_TextInput_0 (copy)
    local l_props_0 = v61.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_pixelDimensions_4 = l_props_0.pixelDimensions;
    local l_sliceRect_4 = l_props_0.sliceRect;
    local l_orientation_0 = l_props_0.orientation;
    local l_TextOffsetItem_0 = l_Stylizer_0.TextOffsetItem;
    local v68 = nil;
    local v69 = v24(l_sliceRect_4, l_pixelDimensions_4)[l_orientation_0];
    if l_orientation_0 == v14 then
        v68 = v61.onLeftFocusLost;
    elseif l_orientation_0 == v15 then
        v68 = v61.onRightFocusLost;
    elseif l_orientation_0 == v16 then
        v68 = v61.onTopFocusLost;
    elseif l_orientation_0 == v17 then
        v68 = v61.onBottomFocusLost;
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_TextOffsetItem_0.PaneSize, 
        LayoutOrder = l_props_0.layoutOrder or 0
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.new(0, l_TextOffsetItem_0.LabelXWidth, 1, 0), 
            Text = l_props_0.labelText or "", 
            TextSize = v3.TEXTSIZE, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        TextInput = v1.createElement(l_DEPRECATED_TextInput_0, {
            Enabled = true, 
            Size = l_TextOffsetItem_0.TextBoxSize, 
            Position = UDim2.fromOffset(l_TextOffsetItem_0.LabelXWidth + l_TextOffsetItem_0.LabelTextBoxSpacing, 0), 
            Style = l_TextOffsetItem_0.Style, 
            Text = ("%d"):format(v69), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OnFocusLost = v68
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));