local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    return {
        isItemTagsFeatureEnabled = v1, 
        enabledAssetTypesForItemTags = v2, 
        maximumItemTagsPerItem = v3
    };
end);