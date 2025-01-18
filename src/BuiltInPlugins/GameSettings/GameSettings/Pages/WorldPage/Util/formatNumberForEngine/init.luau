local l_decimalDelimiterByLocale_0 = require(script.Parent.delimitersByLocaleId).decimalDelimiterByLocale;
local l_StudioService_0 = game:GetService("StudioService");
local function v5(v2, v3, v4) --[[ Line: 8 ]] --[[ Name: replaceLast ]]
    if v3 == "." then
        v3 = "%.";
    end;
    return v2:gsub("(.*)" .. v3 .. "(.*)", "%1" .. v4 .. "%2");
end;
local function v8(v6) --[[ Line: 16 ]] --[[ Name: removeLocalizedDecimalDelimiter ]]
    -- upvalues: l_StudioService_0 (copy), l_decimalDelimiterByLocale_0 (copy), v5 (copy)
    local v7 = l_decimalDelimiterByLocale_0[l_StudioService_0.StudioLocaleId] or ".";
    return v5(v6, v7, ".");
end;
return function(v9) --[[ Line: 22 ]]
    -- upvalues: v8 (copy)
    return v8(v9);
end;