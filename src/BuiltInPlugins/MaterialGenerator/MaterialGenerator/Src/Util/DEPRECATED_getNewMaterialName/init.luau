local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorAllowPatternName);
local function v3(v2) --[[ Line: 15 ]] --[[ Name: toCamelCase ]]
    -- upvalues: v1 (copy)
    v2 = v2:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.upper);
    if not v1() then
        v2 = v2:gsub("%p", "");
    end;
    return v2;
end;
local function v11(v4, v5) --[[ Line: 27 ]] --[[ Name: numberName ]]
    local v6 = {};
    if v5 then
        for _, v8 in pairs(v5:GetDescendants()) do
            if v8:IsA("MaterialVariant") then
                v6[string.lower(v8.Name)] = v8.Name;
            end;
        end;
    end;
    local v9 = string.lower(v4);
    if not v6[v9] then
        return v4;
    else
        local v10 = 0;
        repeat
            v10 = v10 + 1;
        until not v6[string.format("%s %0d", v9, v10)];
        return string.format("%s %0d", v4, v10);
    end;
end;
return function(v12, v13) --[[ Line: 50 ]]
    -- upvalues: v3 (copy), v11 (copy)
    local v14 = v3(v12 .. " Material");
    return v11(v14, v13);
end;