local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = nil;
pcall(function() --[[ Line: 10 ]]
    -- upvalues: v4 (ref), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v4 = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StreamingServiceDispatcherRegistry"
    });
end);
if not v4 then
    v4 = {
        getText = function(_, v6, _, _) --[[ Line: 19 ]] --[[ Name: getText ]]
            return v6;
        end
    };
end;
return v4;