local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_Plugin_0 = v2.Plugin;
local l_Localization_0 = v2.Localization;
local v5 = require(script.Parent.Label);
local l_SourceStrings_0 = script.Parent.SourceStrings;
local l_LocalizedStrings_0 = script.Parent.LocalizedStrings;
local v8 = l_Plugin_0.new(plugin);
local v9 = l_Localization_0.new({
    stringResourceTable = l_SourceStrings_0, 
    translationResourceTable = l_LocalizedStrings_0, 
    pluginName = "TestFramework"
});
return v2.provide({
    v8, 
    v9
}, {
    Label = v1.createElement(v5, {
        Name = "ZeroIndex"
    })
});