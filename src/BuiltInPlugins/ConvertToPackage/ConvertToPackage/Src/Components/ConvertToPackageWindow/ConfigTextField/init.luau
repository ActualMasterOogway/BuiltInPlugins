local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextInput_0 = v3.UI.TextInput;
local l_Util_0 = l_Parent_0.Src.Util;
local v8 = require(l_Util_0.Constants);
local v9 = v2.PureComponent:extend("ConfigTextField");
v9.init = function(v10, _) --[[ Line: 34 ]] --[[ Name: init ]]
    v10.state = {};
    v10.onTextChanged = function(v12) --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            currentContent = v12
        });
        v10.props.TextChangeCallBack(v12);
    end;
end;
v9.render = function(v13) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), l_TextInput_0 (copy)
    local l_props_0 = v13.props;
    local l_state_0 = v13.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaxCount_0 = l_props_0.MaxCount;
    local v21 = l_props_0.TextContent or "";
    local v22 = l_state_0.currentContent or v21;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v8.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v8.FONT, 
            LayoutOrder = 1
        }), 
        TextField = v2.createElement(l_TextInput_0, {
            LayoutOrder = 2, 
            MaxLength = l_MaxCount_0, 
            MultiLine = l_MaxCount_0 > 50, 
            OnTextChanged = v13.onTextChanged, 
            Text = v22, 
            Size = UDim2.new(1, -v8.TITLE_GUTTER_WIDTH, 0, l_TotalHeight_0 - 40 - 20)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));