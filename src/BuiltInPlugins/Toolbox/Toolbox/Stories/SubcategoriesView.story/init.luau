local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.Core.Components.Categorization.SubcategoriesView);
local function v6(v5) --[[ Line: 9 ]] --[[ Name: ToolboxWrapper ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, v5);
end;
return {
    summary = "A grid of Subcategory IconTiles with flexible widths.", 
    stories = {
        {
            name = "SubcategoriesView", 
            summary = "Example with 5 subcategories.", 
            story = function() --[[ Line: 19 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v4 (copy)
                return v2.createElement(v6, {}, {
                    IconTile = v2.createElement(v4, {
                        Size = UDim2.new(1, 0, 0, 200), 
                        SubcategoryDict = {
                            {
                                displayName = "Category", 
                                children = {}, 
                                childCount = 0, 
                                index = 1, 
                                name = "1", 
                                path = {}, 
                                thumbnail = {
                                    assetId = 5657301130, 
                                    backgroundColor = "#32a852"
                                }
                            }, 
                            {
                                displayName = "Vehicle", 
                                children = {}, 
                                childCount = 0, 
                                index = 2, 
                                name = "2", 
                                path = {}, 
                                thumbnail = {
                                    assetId = 5657301130, 
                                    backgroundColor = "#32a852"
                                }
                            }, 
                            {
                                displayName = "3rd", 
                                children = {}, 
                                childCount = 0, 
                                index = 3, 
                                name = "3", 
                                path = {}, 
                                thumbnail = {
                                    assetId = 5657301130, 
                                    backgroundColor = "#32a852"
                                }
                            }, 
                            {
                                displayName = "4", 
                                children = {}, 
                                childCount = 0, 
                                index = 3, 
                                name = "4", 
                                path = {}, 
                                thumbnail = {
                                    assetId = 5657301130, 
                                    backgroundColor = "#32a852"
                                }
                            }, 
                            {
                                displayName = "5", 
                                children = {}, 
                                childCount = 0, 
                                name = "5", 
                                index = 3, 
                                path = {}, 
                                thumbnail = {
                                    assetId = 5657301130, 
                                    backgroundColor = "#32a852"
                                }
                            }
                        }
                    })
                });
            end
        }
    }
};