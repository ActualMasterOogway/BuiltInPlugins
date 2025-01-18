local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4) --[[ Line: 9 ]] --[[ Name: useAvatarAssets ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useMemo(function() --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v2 (ref)
        local v5 = {
            accessories = {}, 
            animation = nil, 
            clothing = {}, 
            emotion = nil, 
            patches = {}, 
            skinTone = nil
        };
        for v6, v7 in v4 do
            local l_item_0 = v7.item;
            if l_item_0.source == v2.SOURCE_BUILTIN then
                assert(l_item_0.source == v2.SOURCE_BUILTIN, v2.LUAU_ANALYZE_ERROR);
                if not v7.isHidden then
                    v7.palette.WearBuiltin(l_item_0.builtinItem, v5, v6);
                end;
            end;
        end;
        return v5;
    end, {
        v4
    });
end;