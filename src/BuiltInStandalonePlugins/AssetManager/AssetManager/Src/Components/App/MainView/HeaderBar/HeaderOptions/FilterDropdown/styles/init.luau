local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule(".FilterDropdown", {
    Size = "$HeaderButtonSize"
}, {});