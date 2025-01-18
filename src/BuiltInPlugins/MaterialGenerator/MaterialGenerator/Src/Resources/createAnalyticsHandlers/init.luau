local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local v3 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorFixAnalytics);
local v4 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local _ = require(l_Parent_0.Src.Types);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_join_0 (copy), v2 (copy), l_HttpService_0 (copy), v3 (copy), v4 (copy)
    local function v11(v8, v9) --[[ Line: 19 ]] --[[ Name: sendEvent ]]
        -- upvalues: l_join_0 (ref), v7 (copy), v2 (ref), l_HttpService_0 (ref)
        local v10 = v9 or {};
        v10 = l_join_0({
            studioSid = v7:GetSessionId(), 
            clientId = v7:GetClientId(), 
            placeId = game.PlaceId
        }, v10);
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialGenerator", v8, l_HttpService_0:JSONEncode(v10)));
        end;
        v7:SendEventDeferred("studio", "MaterialGenerator", v8, v10);
    end;
    return {
        generateButtonClicked = function(_, v13, v14, v15, v16) --[[ Line: 42 ]] --[[ Name: generateButtonClicked ]]
            -- upvalues: v11 (copy)
            v11("GenerateButtonClicked", {
                generationId = v13, 
                samples = v14, 
                textPrompt = v15, 
                filteredTextPrompt = v16
            });
        end, 
        generateMaterials = function(_, v18, v19, v20, v21, v22) --[[ Line: 57 ]] --[[ Name: generateMaterials ]]
            -- upvalues: v3 (ref), v11 (copy)
            if not v3() then
                return;
            else
                v11("GenerateMaterials", {
                    generationId = v18, 
                    inputType = v19, 
                    samples = v20, 
                    promptText = v21, 
                    filteredPromptText = v22
                });
                return;
            end;
        end, 
        generateMaterialsError = function(_, v24, v25, v26) --[[ Line: 77 ]] --[[ Name: generateMaterialsError ]]
            -- upvalues: v3 (ref), v4 (ref), v11 (copy)
            if not v3() then
                return;
            else
                assert(v4.isEnumValue(v25), "Expected errorType to be a GenerationErrorType");
                local v27 = nil;
                v27 = if v26 and v26 ~= "" then ("%*: '%*'"):format(v25, v26) else tostring(v25);
                v11("GenerateMaterialsError", {
                    promptText = v24, 
                    errorMessage = v27
                });
                return;
            end;
        end, 
        saveButtonClicked = function(_, v29, v30) --[[ Line: 97 ]] --[[ Name: saveButtonClicked ]]
            -- upvalues: v11 (copy), v3 (ref)
            local v31 = nil;
            if v29.BaseMaterial then
                v31 = v29.BaseMaterial.Name;
            end;
            local v32 = nil;
            if v29.MaterialPattern then
                v32 = v29.MaterialPattern.Name;
            end;
            v11(v3() and "SaveGeneratedMaterial" or "SaveButtonClicked", {
                colorMap = v29.ColorMap, 
                metalnessMap = v29.MetalnessMap, 
                normalMap = v29.NormalMap, 
                roughnessMap = v29.RoughnessMap, 
                name = v29.Name, 
                baseMaterial = v31, 
                materialPattern = v32, 
                studsPerTile = v29.StudsPerTile, 
                generationId = v30
            });
        end
    };
end;