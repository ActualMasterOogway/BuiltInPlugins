local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local v4 = require(script.Parent.AudioView);
local v5 = require(script.Parent["AudioView.mocks"]);
return {
    story = function() --[[ Line: 11 ]] --[[ Name: story ]]
        -- upvalues: v5 (copy), v1 (copy), v2 (copy), v4 (copy)
        local v6 = {
            v5.createMockSwimlane("Categories", v5.MOCK_CATEGORIES), 
            v5.createMockContextualRecommendations(), 
            v5.createMockList("Trending"), 
            v5.createMockList("Essentials")
        };
        return v1.createElement(v2, {}, {
            AudioView = v1.createElement(v4, {
                Sections = v6, 
                PageSize = 10, 
                AssetLogicWrapperProps = {
                    CanInsertAsset = function() --[[ Line: 24 ]] --[[ Name: CanInsertAsset ]]
                        return true;
                    end, 
                    LogAssetImpression = function() --[[ Line: 27 ]] --[[ Name: LogAssetImpression ]]
                        return nil;
                    end, 
                    OnAssetPreviewButtonClicked = function() --[[ Line: 30 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                        return nil;
                    end, 
                    TryInsert = function() --[[ Line: 33 ]] --[[ Name: TryInsert ]]
                        return nil;
                    end, 
                    TryOpenAssetConfig = function() --[[ Line: 36 ]] --[[ Name: TryOpenAssetConfig ]]
                        return nil;
                    end
                }
            })
        });
    end
};