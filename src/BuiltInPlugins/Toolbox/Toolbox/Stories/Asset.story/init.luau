local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Components.Asset.Asset);
local v4 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v5 = require(l_Parent_0.TestUtils.MockItems);
local v6 = require(l_Parent_0.Core.Actions.GetAssets);
local function v10(v7) --[[ Line: 12 ]] --[[ Name: AssetStory ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy)
    local l_fakeAsset_0 = v7.fakeAsset;
    v7.storeSetup = function(v9) --[[ Line: 15 ]]
        -- upvalues: v6 (ref), l_fakeAsset_0 (copy)
        v9:dispatch(v6({
            l_fakeAsset_0
        }, 1));
    end;
    return v2.createElement(v4, v7);
end;
local v11 = v5.getSimpleAsset(123456);
return {
    name = "Asset", 
    summary = "An asset used in the grid view.", 
    stories = {
        {
            name = "Asset", 
            story = function() --[[ Line: 31 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v10 (copy), v11 (copy), v3 (copy)
                v2.createElement(v10, {
                    fakeAsset = v11
                }, {
                    Asset = v2.createElement(v3, {
                        asset = v11, 
                        assetData = v11, 
                        assetId = 123456, 
                        LayoutOrder = 1
                    })
                });
            end
        }, 
        {
            name = "Asset hovered", 
            story = function() --[[ Line: 46 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v10 (copy), v11 (copy), v3 (copy)
                v2.createElement(v10, {
                    fakeAsset = v11
                }, {
                    v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 250), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        Asset = v2.createElement(v3, {
                            asset = v11, 
                            assetData = v11, 
                            assetId = 123456, 
                            isHovered = true, 
                            LayoutOrder = 1
                        })
                    })
                });
            end
        }
    }
};