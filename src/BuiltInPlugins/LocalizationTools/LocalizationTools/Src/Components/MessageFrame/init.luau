local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_LocalizationToolsFixLabel_0 = game:GetFastFlag("LocalizationToolsFixLabel");
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v3.UI.TextLabel;
local v8 = v1.PureComponent:extend("MessageFrame");
v8.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), l_LocalizationToolsFixLabel_0 (copy)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Message_0 = l_props_0.Message;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderColor3 = l_Stylizer_0.BorderColor
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.Padding)
        }), 
        MessageTextLabel = v1.createElement(l_TextLabel_0, {
            AutomaticSize = if l_LocalizationToolsFixLabel_0 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
            Text = l_Message_0, 
            TextWrapped = true
        })
    });
end;
v8 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8);
return v2.connect(function(v13, _) --[[ Line: 47 ]] --[[ Name: mapStateToProps ]]
    return {
        Message = v13.Message
    };
end)(v8);