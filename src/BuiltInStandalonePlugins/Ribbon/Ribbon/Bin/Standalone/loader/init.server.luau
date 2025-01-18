local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
v1.launch("Ribbon", l_script_FirstAncestor_0.Src);
if v1.isCli() then
    return;
elseif not game:GetFastFlag("EnableRibbonPlugin") then
    return;
else
    plugin.Name = l_script_FirstAncestor_0.Name;
    local v2 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
    local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
    local v6 = {
        plugin = plugin, 
        pluginName = "Ribbon", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        noToolbar = true, 
        extraTriggers = {
            SessionStarted = function() --[[ Line: 32 ]] --[[ Name: SessionStarted ]]
                -- upvalues: l_MultipleDocumentInterfaceInstance_0 (copy)
                return l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted;
            end
        }, 
        shouldImmediatelyOpen = function() --[[ Line: 36 ]] --[[ Name: shouldImmediatelyOpen ]]
            return true;
        end
    };
    if not v2.build(v6).pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin);
        return;
    end;
end;