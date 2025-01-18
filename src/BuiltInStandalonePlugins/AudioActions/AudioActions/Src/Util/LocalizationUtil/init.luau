local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local v4 = nil;
return {
    createLocalization = function() --[[ Line: 15 ]] --[[ Name: createLocalization ]]
        -- upvalues: v4 (ref), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
        v4 = l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "AudioActions"
        });
    end, 
    getLocalized = function(v5, v6) --[[ Line: 23 ]] --[[ Name: getLocalized ]]
        -- upvalues: v4 (ref)
        if v4 then
            return (v4:getText(v5, v6));
        else
            return v6;
        end;
    end, 
    action = function(v7) --[[ Line: 27 ]] --[[ Name: action ]]
        -- upvalues: v4 (ref)
        if v4 then
            return (v4:getText("Action", v7));
        else
            return v7;
        end;
    end, 
    tooltip = function(v8) --[[ Line: 31 ]] --[[ Name: tooltip ]]
        -- upvalues: v4 (ref)
        if v4 then
            return (v4:getText("Tooltip", v8));
        else
            return v8;
        end;
    end
};