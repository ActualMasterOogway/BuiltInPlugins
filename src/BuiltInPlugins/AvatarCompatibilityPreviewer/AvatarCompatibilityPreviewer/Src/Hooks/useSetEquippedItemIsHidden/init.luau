local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUseSerializedState);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: useSetEquippedItemIsHidden ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    return v2.useCallback(function(v7) --[[ Line: 17 ]]
        -- upvalues: v5 (copy), v1 (ref), v6 (copy)
        v5(function(v8) --[[ Line: 18 ]]
            -- upvalues: v1 (ref), v7 (copy), v6 (ref)
            local v9 = table.clone(v8);
            local v11 = v1.findIndex(v9, function(v10) --[[ Line: 21 ]]
                -- upvalues: v7 (ref)
                return (v10.palette.OverrideEquipKey or v10.palette.Key) == (v7.palette.OverrideEquipKey or v7.palette.Key);
            end);
            if v11 ~= nil then
                local v12 = table.clone(v9[v11]);
                v12.isHidden = v6;
                v9[v11] = v12;
            end;
            return v9;
        end);
    end, {
        v5, 
        v6, 
        if v4() then v5 else nil
    });
end;