local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
return function(v3) --[[ Line: 7 ]] --[[ Name: useAddOrUpdateModelToPreview ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useCallback(function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v2 (ref)
        v3(function(v5) --[[ Line: 9 ]]
            -- upvalues: v4 (copy), v2 (ref)
            local v6 = table.clone(v5);
            if v4.uuid and v4.hash then
                v6[v4.hash] = v4.uuid;
            end;
            if v2() then
                print("add/update modelToPreview", v6);
            end;
            return v6;
        end);
    end, {
        v3
    });
end;