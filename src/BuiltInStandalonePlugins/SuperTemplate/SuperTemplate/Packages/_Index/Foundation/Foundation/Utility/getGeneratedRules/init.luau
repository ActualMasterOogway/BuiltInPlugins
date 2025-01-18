local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.Theme);
local v2 = require(l_script_FirstAncestor_0.Enums.Device);
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: getGeneratedRules ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v1 (copy), v2 (copy)
    local v6 = nil;
    local v7 = nil;
    local v8 = require(l_script_FirstAncestor_0.Generated.StyleRules.Common);
    if v5 then
        if v3 == v1.Dark then
            v6 = require(l_script_FirstAncestor_0.Generated.StyleRules["Dark-Foundation"]);
        elseif v3 == v1.Light then
            v6 = require(l_script_FirstAncestor_0.Generated.StyleRules["Light-Foundation"]);
        end;
    elseif v3 == v1.Dark then
        v6 = require(l_script_FirstAncestor_0.Generated.StyleRules["Dark-UIBlox"]);
    elseif v3 == v1.Light then
        v6 = require(l_script_FirstAncestor_0.Generated.StyleRules["Light-UIBlox"]);
    end;
    v7 = if v4 == v2.Console then require(l_script_FirstAncestor_0.Generated.StyleRules.Console) else require(l_script_FirstAncestor_0.Generated.StyleRules.Desktop);
    if not v6 or not v7 or not v8 then
        return {};
    else
        local v9 = table.clone(v7);
        for v10, v11 in v8 do
            v9[v10] = v11;
        end;
        for v12, v13 in v6 do
            v9[v12] = v13;
        end;
        return v9;
    end;
end;