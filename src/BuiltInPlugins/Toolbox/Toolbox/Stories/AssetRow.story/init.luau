local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRow);
local v2 = require(l_script_FirstAncestor_0.TestUtils.MockItems);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAsset(11322590111, "Asset Row");
local v6 = v3.PureComponent:extend("MockAssetRowInteractiveWrapper");
v6.init = function(v7) --[[ Line: 13 ]] --[[ Name: init ]]
    v7.state = {
        isExpanded = false
    };
    v7.updateExpanded = function() --[[ Line: 18 ]]
        -- upvalues: v7 (copy)
        v7:setState(function(v8) --[[ Line: 19 ]]
            return {
                isExpanded = not v8.isExpanded
            };
        end);
    end;
end;
v6.render = function(v9) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), v5 (copy)
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        AssetRow = v3.createElement(v1, {
            AssetInfo = v5, 
            CanInsertAsset = function() --[[ Line: 35 ]] --[[ Name: CanInsertAsset ]]
                return true;
            end, 
            InsertAsset = function() --[[ Line: 38 ]] --[[ Name: InsertAsset ]]
                print("Insert Asset");
            end, 
            IsExpanded = v9.state.isExpanded, 
            OnExpanded = v9.updateExpanded, 
            LayoutOrder = 1, 
            OnAssetPreviewButtonClicked = function() --[[ Line: 44 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                print("Asset Preview Clicked");
            end, 
            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
            TryOpenAssetConfig = function() --[[ Line: 48 ]] --[[ Name: TryOpenAssetConfig ]]
                print("Try Open Asset Config");
            end
        })
    });
end;
return {
    summary = "AssetRow", 
    stories = {
        {
            name = "Interactive AssetRow", 
            summary = "Never expanding row (IsExpanded = false)", 
            story = function() --[[ Line: 61 ]] --[[ Name: story ]]
                -- upvalues: v3 (copy), v4 (copy), v6 (copy)
                return v3.createElement(v4, {}, {
                    v3.createElement(v6)
                });
            end
        }, 
        {
            name = "Unexpanded AssetRow", 
            summary = "Never expanding row (IsExpanded = false)", 
            story = function() --[[ Line: 70 ]] --[[ Name: story ]]
                -- upvalues: v3 (copy), v4 (copy), v1 (copy), v5 (copy)
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        AssetRow = v3.createElement(v1, {
                            AssetInfo = v5, 
                            CanInsertAsset = function() --[[ Line: 79 ]] --[[ Name: CanInsertAsset ]]
                                return true;
                            end, 
                            InsertAsset = function() --[[ Line: 82 ]] --[[ Name: InsertAsset ]]
                                print("Insert Asset");
                            end, 
                            IsExpanded = false, 
                            OnExpanded = function(v10) --[[ Line: 86 ]] --[[ Name: OnExpanded ]]
                                print("On Expanded id:", v10);
                            end, 
                            LayoutOrder = 1, 
                            OnAssetPreviewButtonClicked = function() --[[ Line: 90 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                                print("Asset Preview Clicked");
                            end, 
                            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
                            TryOpenAssetConfig = function() --[[ Line: 94 ]] --[[ Name: TryOpenAssetConfig ]]
                                print("Try Open Asset Config");
                            end
                        })
                    })
                });
            end
        }, 
        {
            name = "Expanded AssetRow", 
            summary = "Always expanded Row (IsExpanded = true)", 
            story = function() --[[ Line: 105 ]] --[[ Name: story ]]
                -- upvalues: v3 (copy), v4 (copy), v1 (copy), v5 (copy)
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        AssetRow = v3.createElement(v1, {
                            AssetInfo = v5, 
                            CanInsertAsset = function() --[[ Line: 114 ]] --[[ Name: CanInsertAsset ]]
                                return true;
                            end, 
                            InsertAsset = function() --[[ Line: 117 ]] --[[ Name: InsertAsset ]]
                                print("Insert Asset");
                            end, 
                            IsExpanded = true, 
                            OnExpanded = function() --[[ Line: 121 ]] --[[ Name: OnExpanded ]]
                                print("On Expanded");
                            end, 
                            LayoutOrder = 1, 
                            OnAssetPreviewButtonClicked = function() --[[ Line: 125 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                                print("Asset Preview Clicked");
                            end, 
                            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
                            TryOpenAssetConfig = function() --[[ Line: 129 ]] --[[ Name: TryOpenAssetConfig ]]
                                print("Try Open Asset Config");
                            end
                        })
                    })
                });
            end
        }
    }
};