local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_getAutoTranslatedLanguages_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).getAutoTranslatedLanguages;
local v3 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v4) --[[ Line: 13 ]]
    -- upvalues: l_getAutoTranslatedLanguages_0 (copy), v1 (copy), v3 (copy)
    return function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: l_getAutoTranslatedLanguages_0 (ref), v4 (copy), v1 (ref), v3 (ref)
        local l_Current_0 = v5:getState().Settings.Current;
        local v8 = l_getAutoTranslatedLanguages_0()[v4] or v6.localizationPageController:getAutoTranslationTargetLanguages(v4);
        l_Current_0 = v1.Dictionary.join(l_Current_0, {
            AutoTranslationTargetLanguages = v8
        });
        v5:dispatch(v3(l_Current_0));
    end;
end;