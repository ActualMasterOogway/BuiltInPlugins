local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
return require(script.Parent["useCategorySectionAssets.impl"])({
    fetchCategoryAssets = require(l_script_FirstAncestor_0.Core.Requests.fetchCategoryAssets)
});