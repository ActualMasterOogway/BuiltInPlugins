local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v12 = v1.PureComponent:extend("Vector3Entry");
l_Typecheck_0.wrap(v12, script);
local function _(v13) --[[ Line: 35 ]] --[[ Name: verifyNumberFromText ]]
    local v14 = tonumber(v13);
    if v14 ~= nil then
        return (math.floor(v14));
    else
        return nil;
    end;
end;
v12.init = function(v16) --[[ Line: 45 ]] --[[ Name: init ]]
    v16.onValueChanged = function() --[[ Line: 46 ]]
        -- upvalues: v16 (copy)
        if v16.xValue ~= nil and v16.yValue ~= nil and v16.zValue ~= nil then
            v16.props.OnVectorValueChanged((Vector3.new(v16.xValue, v16.yValue, v16.zValue)));
            return;
        else
            v16.props.OnVectorValueChanged(nil);
            return;
        end;
    end;
    v16.onXChanged = function(v17) --[[ Line: 54 ]]
        -- upvalues: v16 (copy)
        local l_v16_0 = v16;
        local v19 = tonumber(v17);
        l_v16_0.xValue = if v19 ~= nil then math.floor(v19) else nil;
        v16.onValueChanged();
    end;
    v16.onYChanged = function(v20) --[[ Line: 59 ]]
        -- upvalues: v16 (copy)
        local l_v16_1 = v16;
        local v22 = tonumber(v20);
        l_v16_1.yValue = if v22 ~= nil then math.floor(v22) else nil;
        v16.onValueChanged();
    end;
    v16.onZChanged = function(v23) --[[ Line: 64 ]]
        -- upvalues: v16 (copy)
        local l_v16_2 = v16;
        local v25 = tonumber(v23);
        l_v16_2.zValue = if v25 ~= nil then math.floor(v25) else nil;
        v16.onValueChanged();
    end;
end;
v12.willUpdate = function(v26, v27) --[[ Line: 70 ]] --[[ Name: willUpdate ]]
    -- upvalues: v1 (copy)
    if v26.props.VectorValue ~= v27.VectorValue and v27.VectorValue ~= v1.None then
        v26.xValue = v27.VectorValue.X;
        v26.yValue = v27.VectorValue.Y;
        v26.zValue = v27.VectorValue.Z;
    end;
end;
local function _(v28, v29, v30) --[[ Line: 80 ]] --[[ Name: useStateOrPropValue ]]
    if not v30 then
        return "";
    elseif not v28 then
        if v29 then
            return (tostring(v29));
        else
            return "";
        end;
    else
        return (tostring(v28));
    end;
end;
v12.render = function(v32) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_DEPRECATED_TextInput_0 (copy)
    local l_props_0 = v32.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Title_0 = l_props_0.Title;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_VectorValue_0 = l_props_0.VectorValue;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v40 = l_LayoutOrderIterator_0.new();
    local v41 = l_VectorValue_0 ~= nil;
    local l_xValue_0 = v32.xValue;
    local v43 = v41 and l_VectorValue_0.X;
    local v44 = not l_Enabled_0 and "" or if l_xValue_0 then tostring(l_xValue_0) else if v43 then tostring(v43) else "";
    v43 = v32.yValue;
    local v45 = v41 and l_VectorValue_0.Y;
    l_xValue_0 = not l_Enabled_0 and "" or if v43 then tostring(v43) else if v45 then tostring(v45) else "";
    v45 = v32.zValue;
    local v46 = v41 and l_VectorValue_0.Z;
    v43 = not l_Enabled_0 and "" or if v45 then tostring(v45) else if v46 then tostring(v46) else "";
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Stylizer_0.FramePadding
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = l_Title_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v40:getNextOrder(), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        InputBoxes = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v40:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Spacing = l_Stylizer_0.ValueTextBoxPadding, 
            Padding = {
                Right = l_Stylizer_0.FramePadding
            }
        }, {
            XInput = v1.createElement(l_DEPRECATED_TextInput_0, {
                Enabled = l_Enabled_0, 
                Style = "FilledRoundedBorder", 
                PlaceholderText = "X", 
                Text = v44, 
                Size = UDim2.new(0, l_Stylizer_0.ValueTextBoxWidth, 1, 0), 
                OnTextChanged = v32.onXChanged, 
                LayoutOrder = v40:getNextOrder()
            }), 
            YInput = v1.createElement(l_DEPRECATED_TextInput_0, {
                Enabled = l_Enabled_0, 
                Style = "FilledRoundedBorder", 
                PlaceholderText = "Y", 
                Text = l_xValue_0, 
                Size = UDim2.new(0, l_Stylizer_0.ValueTextBoxWidth, 1, 0), 
                OnTextChanged = v32.onYChanged, 
                LayoutOrder = v40:getNextOrder()
            }), 
            ZInput = v1.createElement(l_DEPRECATED_TextInput_0, {
                Enabled = l_Enabled_0, 
                Style = "FilledRoundedBorder", 
                PlaceholderText = "Z", 
                Text = v43, 
                Size = UDim2.new(0, l_Stylizer_0.ValueTextBoxWidth, 1, 0), 
                OnTextChanged = v32.onZChanged, 
                LayoutOrder = v40:getNextOrder()
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));