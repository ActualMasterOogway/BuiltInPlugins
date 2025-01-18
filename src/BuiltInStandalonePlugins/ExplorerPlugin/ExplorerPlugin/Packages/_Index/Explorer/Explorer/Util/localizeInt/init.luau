local l_LocalizationService_0 = game:GetService("LocalizationService");
local function v2() --[[ Line: 5 ]] --[[ Name: getLocalizationTable ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local l_LocalizationTable_0 = Instance.new("LocalizationTable");
    l_LocalizationTable_0:SetEntries({
        {
            Key = "translatedNumber", 
            Source = "{1:num}", 
            Values = {
                [l_LocalizationService_0.RobloxLocaleId] = "{1:num}"
            }
        }
    });
    return l_LocalizationTable_0;
end;
return function(v3) --[[ Line: 25 ]] --[[ Name: localizeInt ]]
    -- upvalues: v2 (copy), l_LocalizationService_0 (copy)
    return v2():GetTranslator(l_LocalizationService_0.RobloxLocaleId):FormatByKey("translatedNumber", {
        v3
    }):sub(1, -4);
end;