local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.updatePreview);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
return function(v4) --[[ Line: 9 ]] --[[ Name: useUpdatePreview ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.useCallback(function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v2 (ref), v3 (ref)
        v4(function(v6) --[[ Line: 11 ]]
            -- upvalues: v5 (copy), v2 (ref), v3 (ref)
            if v5.uuid == nil then
                return v6;
            elseif v6[v5.uuid] == nil then
                return v6;
            else
                local v7 = table.clone(v6);
                v2(v7, v5);
                if v3() then
                    print("update previewTable", v7);
                end;
                return table.freeze(v7);
            end;
        end);
    end, {
        v4
    });
end;