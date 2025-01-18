local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Promise);
local v2 = require(l_script_FirstAncestor_0.Src.Enum.GenerationErrorType);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: uploadMaterialVariant ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.new(function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (ref)
        local v8 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: v4 (ref), v8 (ref), v5 (ref)
            local l_ColorMap_0 = v4.ColorMap;
            v8 = v5:UploadMaterialAsync(l_ColorMap_0);
        end);
        if l_status_0 and v8 then
            v6({
                colorMap = v8.ColorMap, 
                metalnessMap = v8.MetalnessMap, 
                normalMap = v8.NormalMap, 
                roughnessMap = v8.RoughnessMap
            });
            return;
        else
            v7({
                errorType = if l_result_0 then v2.CustomMessage else v2.Unknown, 
                message = l_result_0
            });
            return;
        end;
    end);
end;