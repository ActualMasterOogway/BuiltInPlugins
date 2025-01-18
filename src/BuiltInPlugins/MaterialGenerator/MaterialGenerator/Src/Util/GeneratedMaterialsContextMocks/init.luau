local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.GeneratedMaterialsContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = {};
local function v20(v6) --[[ Line: 13 ]] --[[ Name: MockProvider ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7, _ = v2.useState(v6.promptGroups);
    local v9, _ = v2.useState(v6.materialStates);
    local v11, v12 = v2.useState(nil);
    local v19 = {
        promptGroups = v7, 
        materialStates = v9, 
        addMaterials = function() --[[ Line: 26 ]] --[[ Name: addMaterials ]]

        end, 
        removeMaterial = function() --[[ Line: 27 ]] --[[ Name: removeMaterial ]]

        end, 
        removeAllMaterials = function() --[[ Line: 28 ]] --[[ Name: removeAllMaterials ]]

        end, 
        hasBaseMaterial = function(_) --[[ Line: 30 ]] --[[ Name: hasBaseMaterial ]]
            return false;
        end, 
        markHasBaseMaterial = function(_) --[[ Line: 33 ]] --[[ Name: markHasBaseMaterial ]]

        end, 
        getMaterialStatus = function(_) --[[ Line: 34 ]] --[[ Name: getMaterialStatus ]]
            return "None";
        end, 
        setMaterialStatus = function(_, _) --[[ Line: 37 ]] --[[ Name: setMaterialStatus ]]

        end, 
        getMaterialIdentifiers = function(_) --[[ Line: 38 ]] --[[ Name: getMaterialIdentifiers ]]
            return "", 0;
        end, 
        previewMaterial = v11, 
        setPreviewMaterial = v12
    };
    return v2.createElement(v3.Provider, {
        value = v19
    }, v6.children);
end;
v5.BasicProvider = function(v21) --[[ Line: 51 ]] --[[ Name: BasicProvider ]]
    -- upvalues: v2 (copy), v1 (copy), v20 (copy)
    local v22 = v2.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v21 (copy)
        return {
            {
                materialVariants = v21.instances, 
                promptText = "test prompt", 
                filteredPromptText = "test prompt"
            }
        };
    end, {
        v21.instances
    });
    local v25 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v1 (ref), v21 (copy)
        return v1.collect(v21.instances, function(_, v24) --[[ Line: 66 ]]
            return v24, {
                generationId = "1", 
                hasBaseMaterial = false; 
                "None"
            };
        end);
    end, {
        v21.instances
    });
    return v2.createElement(v20, {
        promptGroups = v22, 
        materialStates = v25
    }, v21.children);
end;
return v5;