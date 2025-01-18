local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.AssetConfigConstants);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v16 = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v17 = v2.PureComponent:extend("ConfigTextField");
v17.init = function(v18, _) --[[ Line: 58 ]] --[[ Name: init ]]
    v18.state = {};
    v18.hasError = false;
    v18.onTextChanged = function(v20) --[[ Line: 63 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            currentContent = v20
        });
        v18.props.TextChangeCallBack(v20);
    end;
end;
v17.render = function(v21) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), v16 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_StyleModifier_0 (copy), l_TextLabel_0 (copy)
    local l_Stylizer_0 = v21.props.Stylizer;
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Title_0 = l_props_0.Title;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaxCount_0 = l_props_0.MaxCount;
    local v29 = l_props_0.TextContent or "";
    local v30 = l_state_0.currentContent or v29;
    if v21.props.ErrorCallback then
        if #v30 > v21.props.MaxCount then
            if not v21.hasError then
                v21.hasError = true;
                v21.props.ErrorCallback(v21.hasError);
            end;
        elseif v21.hasError then
            v21.hasError = false;
            v21.props.ErrorCallback(v21.hasError);
        end;
    end;
    local _ = l_Stylizer_0.publishAsset;
    local v32 = utf8.len(v30);
    local v33 = l_MaxCount_0 and l_MaxCount_0 < v32;
    local v34 = l_MaxCount_0 and v32 .. "/" .. l_MaxCount_0 or "";
    local v35 = l_MaxCount_0 and l_MaxCount_0 > 50;
    local v36 = l_LayoutOrderIterator_0.new();
    local l_inputBottomText_0 = l_Stylizer_0.assetConfig.inputBottomText;
    return v2.createElement(v16, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Title_0
    }, {
        TextFieldWrapper = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v36:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
            Spacing = l_inputBottomText_0.bottomTextSpacing
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TextField = v2.createElement(l_TextInput_0, {
                BottomText = if l_props_0.BottomRightText then nil else v34, 
                LayoutOrder = v36:getNextOrder(), 
                MultiLine = v35, 
                OnTextChanged = v21.onTextChanged, 
                Size = UDim2.new(1, 0, 0, l_TotalHeight_0 - 40 - 20), 
                StyleModifier = if v33 then l_StyleModifier_0.Error else nil, 
                Text = v30
            }), 
            BottomTextWrapper = if l_props_0.BottomRightText then v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v36:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                CounterText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v36:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v34, 
                    TextColor = if v33 then l_inputBottomText_0.textErrorColor else l_inputBottomText_0.textColor, 
                    TextSize = l_inputBottomText_0.textSize
                }), 
                BottomText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v36:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_props_0.BottomRightText, 
                    TextColor = l_inputBottomText_0.textColor, 
                    TextSize = l_inputBottomText_0.textSize, 
                    TextXAlignment = Enum.TextXAlignment.Right
                })
            }) else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v17));