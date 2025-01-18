local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useHomeConfiguration);
local v6 = require(l_script_FirstAncestor_0.Core.Hooks.useCategorySectionAssets);
local v7 = require(l_script_FirstAncestor_0.Core.Hooks.useContextualAssets);
local v8 = require(l_script_FirstAncestor_0.Core.Hooks.useCachedValue);
local _ = require(l_script_FirstAncestor_0.Core.Requests.fetchCategoryAssets);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v12 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxThrottleContextualRecommendationRequests);
local l_Localization_0 = v2.ContextServices.Localization;
local l_game_FastInt_0 = game:GetFastInt("ToolboxSceneAnalysisPollingSeconds");
return function(v16, v17) --[[ Line: 46 ]] --[[ Name: useCategorySections ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), v5 (copy), v13 (copy), v8 (copy), v7 (copy), l_game_FastInt_0 (copy), v3 (copy), v12 (copy), v1 (copy), v6 (copy)
    local v18 = l_Localization_0:use();
    local v19 = v4.getEngineAssetType(v16.assetType);
    local v20 = v5(v19, v18.locale);
    local v21 = if v13() then v8(v7(), l_game_FastInt_0) else v7();
    local v25 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v20 (copy)
        local v22 = {};
        if v20 and v20.sections then
            for _, v24 in v20.sections do
                if not v24.subcategory then
                    table.insert(v22, v24);
                end;
            end;
        end;
        return v22;
    end, {
        v20
    });
    local v30 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v25 (copy), v17 (copy), v12 (ref), v1 (ref), v21 (copy)
        local v26 = {};
        for _, v28 in v25 do
            local v29 = {
                pageSize = v17
            };
            if v28.name == v12.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
                v29 = v1.Dictionary.join(v29, {
                    assetsInCameraVicinity = v21.assetsInCameraVicinity, 
                    assetsInCameraViewport = v21.assetsInCameraViewport
                });
            end;
            table.insert(v26, {
                name = v28.name, 
                fetchArgs = v29
            });
        end;
        return v26;
    end, {
        v25, 
        v21.assetsInCameraVicinity, 
        v21.assetsInCameraViewport
    });
    local v31 = v6(v16.name, v30);
    return (v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v20 (copy), v31 (copy)
        local v32 = {};
        if v20 then
            for _, v34 in v20.sections do
                table.insert(v32, {
                    Section = v34, 
                    ResultsState = v31[v34.name]
                });
            end;
        end;
        return v32;
    end, {
        v20, 
        v31
    }));
end;