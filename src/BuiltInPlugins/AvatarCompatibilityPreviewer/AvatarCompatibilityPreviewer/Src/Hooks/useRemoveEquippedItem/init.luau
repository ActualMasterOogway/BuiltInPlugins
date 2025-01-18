local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.equippedItemDataEquals);
return function(v4) --[[ Line: 8 ]] --[[ Name: useRemoveEquippedItem ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.useCallback(function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v3 (ref)
        v4(function(v6) --[[ Line: 12 ]]
            -- upvalues: v3 (ref), v5 (copy)
            for v7, v8 in v6 do
                if v3(v8, v5) then
                    local v9 = table.clone(v6);
                    table.remove(v9, v7);
                    return v9;
                end;
            end;
            return v6;
        end);
    end, {
        v4
    });
end;