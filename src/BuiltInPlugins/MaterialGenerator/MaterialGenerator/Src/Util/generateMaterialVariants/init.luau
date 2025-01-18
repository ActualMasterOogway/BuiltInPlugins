local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Promise);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Util_0.parseGenerationError);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v7, v8) --[[ Line: 15 ]] --[[ Name: generateImages ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    return v2.new(function(v9, v10) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v8 (copy), v7 (copy), v5 (ref)
        local v11 = nil;
        local v12 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
            -- upvalues: v4 (ref), v11 (ref), v12 (ref), v8 (ref), v7 (ref)
            local v13 = {
                Samples = v4.GENERATION_SAMPLES
            };
            local v14, v15 = v8:GenerateImagesAsync(v7, v13);
            v11 = v14;
            v12 = v15;
        end);
        if l_status_0 then
            v9({
                imageIds = v11, 
                filteredPromptText = v12
            });
        else
            local v18, v19 = v5(l_result_0);
            v10({
                errorType = v18, 
                message = v19
            });
        end;
    end);
end;
local function v30(v21, v22) --[[ Line: 41 ]] --[[ Name: generateTextureMaps ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.new(function(v23, v24) --[[ Line: 42 ]]
        -- upvalues: v22 (copy), v21 (copy), v5 (ref)
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v22 (ref), v21 (ref), v23 (copy), v5 (ref), v24 (copy)
            local v25 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 46 ]]
                -- upvalues: v25 (ref), v22 (ref), v21 (ref)
                v25 = v22:GenerateMaterialMapsAsync(v21);
            end);
            if l_status_1 and v25 then
                v23({
                    colorMap = v21, 
                    metalnessMap = v25.MetalnessMap, 
                    normalMap = v25.NormalMap, 
                    roughnessMap = v25.RoughnessMap
                });
            else
                local v28, v29 = v5(l_result_1);
                v24({
                    errorType = v28, 
                    message = v29
                });
            end;
        end);
    end);
end;
return function(v31, v32) --[[ Line: 68 ]] --[[ Name: generateMaterialVariants ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v1 (copy), v30 (copy)
    local v33 = nil;
    return v2.new(function(v34, v35) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v32 (copy), v31 (copy), v5 (ref)
        local v36 = nil;
        local v37 = nil;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 19 ]]
            -- upvalues: v4 (ref), v36 (ref), v37 (ref), v32 (ref), v31 (ref)
            local v38 = {
                Samples = v4.GENERATION_SAMPLES
            };
            local v39, v40 = v32:GenerateImagesAsync(v31, v38);
            v36 = v39;
            v37 = v40;
        end);
        if l_status_2 then
            v34({
                imageIds = v36, 
                filteredPromptText = v37
            });
        else
            local v43, v44 = v5(l_result_2);
            v35({
                errorType = v43, 
                message = v44
            });
        end;
    end):andThen(function(v45) --[[ Line: 72 ]]
        -- upvalues: v33 (ref), v2 (ref), v1 (ref), v30 (ref), v32 (copy)
        v33 = v45.filteredPromptText;
        return v2.all(v1.map(v45.imageIds, function(v46) --[[ Line: 74 ]]
            -- upvalues: v30 (ref), v32 (ref)
            return v30(v46, v32);
        end));
    end):andThen(function(v47) --[[ Line: 78 ]]
        -- upvalues: v1 (ref), v2 (ref), v33 (ref)
        local v50 = v1.map(v47, function(v48) --[[ Line: 79 ]]
            local l_MaterialVariant_0 = Instance.new("MaterialVariant");
            l_MaterialVariant_0.Archivable = false;
            l_MaterialVariant_0.ColorMap = v48.colorMap;
            l_MaterialVariant_0.MetalnessMap = v48.metalnessMap;
            l_MaterialVariant_0.NormalMap = v48.normalMap;
            l_MaterialVariant_0.RoughnessMap = v48.roughnessMap;
            return l_MaterialVariant_0;
        end);
        return v2.resolve({
            materialVariants = v50, 
            filteredPromptText = v33
        });
    end);
end;