local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v3 = require(l_Parent_0.Util.parseMaterial);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local v6, v7 = v3(v4);
    if v7 then
        return v7.Name;
    elseif v5 then
        return v5:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "Materials", v6.Name);
    else
        return v6.Name;
    end;
end;