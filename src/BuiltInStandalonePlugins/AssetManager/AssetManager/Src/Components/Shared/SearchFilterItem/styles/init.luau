local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule(".SearchFilterItem", {
    Size = UDim2.new(1, 0, 0, 40)
}, {}, {});