local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.Dialog.BaseDialog);
local v7 = v1.PureComponent:extend("SimpleDialog");
v7.render = function(v8) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v3 (copy)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Header_0 = l_props_0.Header;
    local l_Body_0 = l_props_0.Body;
    local l_Buttons_0 = l_props_0.Buttons;
    return v1.createElement(v6, {
        Buttons = l_Buttons_0, 
        OnResult = l_props_0.OnResult
    }, {
        Header = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Text = l_Header_0, 
            TextWrapped = true
        })), 
        Body = l_Body_0
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));