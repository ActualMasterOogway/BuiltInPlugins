local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v5, v6) --[[ Line: 15 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v4 (copy), v1 (copy)
    v5.Name = l_script_FirstAncestor_0.Name;
    local v7 = {
        plugin = v5, 
        pluginName = "CancellableDialog", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        noToolbar = true
    };
    if v4.get() == v4.Standalone then
        v6(v5, (v1.build(v7)));
    end;
end;