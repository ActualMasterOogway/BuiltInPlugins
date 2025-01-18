local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v4, v5) --[[ Line: 12 ]] --[[ Name: findPromptGroup ]]
    -- upvalues: v1 (copy)
    return v1.find(v5, function(v6) --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return table.find(v6.materialVariants, v4) ~= nil;
    end);
end;
return function(v8, v9) --[[ Line: 18 ]] --[[ Name: removeMaterial ]]
    -- upvalues: v1 (copy), l_LUAU_ANALYZE_ERROR_0 (copy)
    local v11 = v1.find(v9, function(v10) --[[ Line: 13 ]]
        -- upvalues: v8 (copy)
        return table.find(v10.materialVariants, v8) ~= nil;
    end);
    if not v11 then
        warn("MaterialVariant doesn't belong to a group");
        return v9;
    else
        assert(v11 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        local v13 = v1.join(v11, {
            materialVariants = v1.filter(v11.materialVariants, function(v12) --[[ Line: 28 ]]
                -- upvalues: v8 (copy)
                return v12 ~= v8;
            end)
        });
        if #v13.materialVariants == 0 then
            local v14 = table.find(v9, v11);
            assert(v14 ~= nil, "Expected promptGroups to contain found group");
            local v15 = v9[v14 - 1];
            local v16 = v9[v14 + 1];
            if v15 and v16 and v15.promptText == v16.promptText then
                local v17 = v1.slice(v9, nil, v14 - 2);
                local v18 = v1.slice(v9, v14 + 2, nil);
                local v19 = v1.join(v15, {
                    materialVariants = v1.append({}, v15.materialVariants, v16.materialVariants)
                });
                return v1.append(v17, {
                    v19
                }, v18);
            else
                return v1.filter(v9, function(v20) --[[ Line: 53 ]]
                    -- upvalues: v11 (copy)
                    return v20 ~= v11;
                end);
            end;
        else
            return v1.map(v9, function(v21) --[[ Line: 59 ]]
                -- upvalues: v11 (copy), v13 (copy)
                if v21 == v11 then
                    return v13;
                else
                    return v21;
                end;
            end);
        end;
    end;
end;