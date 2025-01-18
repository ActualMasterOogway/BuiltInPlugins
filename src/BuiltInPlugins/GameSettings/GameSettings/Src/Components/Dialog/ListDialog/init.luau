local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_BulletList_0 = v2.UI.BulletList;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.Dialog.BaseDialog);
local v8 = v1.PureComponent:extend("ListDialog");
v8.render = function(v9) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), l_BulletList_0 (copy), v7 (copy)
    local l_props_0 = v9.props;
    local l_Header_0 = l_props_0.Header;
    local l_Entries_0 = l_props_0.Entries;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v15 = {
        Header = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.SemiBold, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -60, 0, 0), 
            BackgroundTransparency = 1, 
            Text = l_Header_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })), 
        List = v1.createElement(l_BulletList_0, {
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Items = l_Entries_0, 
            Size = UDim2.new(1, -60, 0, 0)
        })
    };
    return v1.createElement(v7, {
        Buttons = l_Buttons_0, 
        OnResult = l_props_0.OnResult
    }, v15);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));