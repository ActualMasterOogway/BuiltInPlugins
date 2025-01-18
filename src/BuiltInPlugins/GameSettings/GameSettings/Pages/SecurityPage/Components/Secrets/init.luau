local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v1.PureComponent:extend("Secrets");
v8.render = function(v9) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TitledFrame_0 (copy), l_TextInput_0 (copy)
    local l_props_0 = v9.props;
    return v1.createElement(l_TitledFrame_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Title = l_props_0.Localization:getText("General", "TitleSecrets")
    }, {
        TextBox = v1.createElement(l_TextInput_0, {
            Height = 130, 
            MultiLine = true, 
            OnTextChanged = l_props_0.OnChanged, 
            Text = l_props_0.Secrets, 
            BottomText = l_props_0.Localization:getText("Security", "LocalSecretsDesc")
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v8));