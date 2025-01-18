local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v3 = require(script.Parent.AudioSort);
local v4 = require(script.Parent["AudioView.mocks"]);
local function v5() --[[ Line: 9 ]]
    return true;
end;
return {
    controls = {
        isLoading = false, 
        isSceneSuggestions = false, 
        noResults = false
    }, 
    story = function(v6) --[[ Line: 25 ]] --[[ Name: story ]]
        -- upvalues: v4 (copy), v1 (copy), v2 (copy), v3 (copy), v5 (copy)
        local v7 = if v6.controls.isSceneSuggestions then v4.createMockContextualRecommendations() else v4.createMockList("Sample");
        if v7.ResultsState then
            if v6.controls.isLoading then
                v7.ResultsState.loading = true;
            end;
            if v6.controls.noResults then
                v7.ResultsState.assets = {};
            end;
        end;
        return v1.createElement(v2, {}, {
            AudioSort = v1.createElement(v3, {
                AudioSection = v7, 
                AssetLogicWrapperProps = {
                    CanInsertAsset = v5, 
                    LogAssetImpression = v5, 
                    OnAssetPreviewButtonClicked = v5, 
                    TryInsert = v5, 
                    TryOpenAssetConfig = v5
                }
            })
        });
    end
};