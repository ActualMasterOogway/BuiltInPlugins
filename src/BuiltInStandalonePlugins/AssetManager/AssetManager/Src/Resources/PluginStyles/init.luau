local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return v1.Styling.createStyleSheet("AssetManager", {
    l_createStyleRule_0("ImageLabel", {}, {
        l_createStyleRule_0(".ArrowDownIcon", {
            Image = "$ArrowDownIcon"
        }), 
        l_createStyleRule_0(".ArrowRightIcon", {
            Image = "$ArrowRightIcon"
        }), 
        l_createStyleRule_0(".ArrowUpIcon", {
            Image = "$ArrowUpIcon"
        }), 
        l_createStyleRule_0(".CheckmarkIcon", {
            Image = "$CheckmarkIcon"
        }), 
        l_createStyleRule_0(".ClearIcon", {
            Image = "$ClearIcon"
        }), 
        l_createStyleRule_0(".FilterIcon", {
            Image = "$FilterIcon"
        }), 
        l_createStyleRule_0(".GroupDefaultIcon", {
            Image = "$GroupDefaultIcon"
        }), 
        l_createStyleRule_0(".GroupLargeDefaultIcon", {
            Image = "$GroupLargeDefaultIcon"
        }), 
        l_createStyleRule_0(".ImportIcon", {
            Image = "$ImportIcon"
        }), 
        l_createStyleRule_0(".PlaceholderAssetIcon", {
            Image = "$PlaceholderAssetIcon"
        }), 
        l_createStyleRule_0(".PlaceholderIcon", {
            Image = "$PlaceholderIcon"
        }), 
        l_createStyleRule_0(".RefreshIcon", {
            Image = "$RefreshIcon"
        }), 
        l_createStyleRule_0(".SearchIcon", {
            Image = "$SearchIcon"
        }), 
        l_createStyleRule_0(".SidebarCollapseIcon", {
            Image = "$SidebarCollapseIcon"
        }), 
        l_createStyleRule_0(".SidebarExpandIcon", {
            Image = "$SidebarExpandIcon"
        }), 
        l_createStyleRule_0(".SortIcon", {
            Image = "$SortIcon"
        }), 
        l_createStyleRule_0(".UniverseDefaultIcon", {
            Image = "$UniverseDefaultIcon"
        }), 
        l_createStyleRule_0(".UniverseLargeDefaultIcon", {
            Image = "$UniverseLargeDefaultIcon"
        }), 
        l_createStyleRule_0(".UserDefaultIcon", {
            Image = "$UserDefaultIcon"
        }), 
        l_createStyleRule_0(".UserLargeDefaultIcon", {
            Image = "$UserLargeDefaultIcon"
        })
    }), 
    l_createStyleRule_0(".SearchPanel", {
        Size = UDim2.new(1, 5, 0, 42)
    })
}, {
    HeaderButtonSize = UDim2.fromOffset(26, 26), 
    PaddingSmall = UDim.new(0, 5), 
    Padding = UDim.new(0, 10), 
    SearchFilterSize = UDim2.new(1, 5, 0, 30), 
    IconDisabled = 0.62
});