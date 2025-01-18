local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Math_0 = require(l_Parent_0.Packages.Framework).Util.Math;
local l_decimalDelimiterByLocale_0 = require(script.Parent.delimitersByLocaleId).decimalDelimiterByLocale;
local l_StudioService_0 = game:GetService("StudioService");
local function v6(v4, v5) --[[ Line: 9 ]] --[[ Name: localizeDecimalDelimiter ]]
    return string.gsub(v4, "%.", v5);
end;
local function v9(v7) --[[ Line: 13 ]] --[[ Name: getLocalizedNumber ]]
    -- upvalues: l_StudioService_0 (copy), l_decimalDelimiterByLocale_0 (copy), v6 (copy)
    local v8 = l_decimalDelimiterByLocale_0[l_StudioService_0.StudioLocaleId] or ".";
    return v6(v7, v8);
end;
return function(v10) --[[ Line: 20 ]]
    -- upvalues: l_Math_0 (copy), v9 (copy)
    local v11 = tostring(l_Math_0.round(v10, 3));
    return v9(v11);
end;