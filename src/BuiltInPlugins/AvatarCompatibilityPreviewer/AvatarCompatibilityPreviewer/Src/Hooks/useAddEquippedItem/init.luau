local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v12(v5, v6) --[[ Line: 10 ]] --[[ Name: solvePreferredLayer ]]
    -- upvalues: v3 (copy)
    local v7 = 0;
    local v8 = 0;
    for v9, v10 in v5 do
        local l_PreferredLayer_0 = v10.palette.PreferredLayer;
        if l_PreferredLayer_0 ~= nil then
            assert(l_PreferredLayer_0 ~= nil, v3.LUAU_ANALYZE_ERROR);
            if l_PreferredLayer_0 <= v6 and v8 <= l_PreferredLayer_0 then
                v7 = v9;
            end;
        end;
    end;
    return v7 + 1;
end;
return function(v13) --[[ Line: 28 ]] --[[ Name: useAddEquippedItem ]]
    -- upvalues: v2 (copy), v1 (copy), v12 (copy)
    return v2.useCallback(function(v14) --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v1 (ref), v12 (ref)
        v13(function(v15) --[[ Line: 33 ]]
            -- upvalues: v1 (ref), v14 (copy), v12 (ref)
            local v16 = table.clone(v15);
            local v18 = v1.findIndex(v16, function(v17) --[[ Line: 36 ]]
                -- upvalues: v14 (ref)
                return (v17.palette.OverrideEquipKey or v17.palette.Key) == (v14.palette.OverrideEquipKey or v14.palette.Key);
            end);
            if v18 ~= nil then
                table.remove(v16, v18);
            end;
            if v14.palette.PreferredLayer == nil then
                table.insert(v16, v14);
                return v16;
            else
                table.insert(v16, v12(v16, v14.palette.PreferredLayer), v14);
                return v16;
            end;
        end);
    end, {
        v13
    });
end;