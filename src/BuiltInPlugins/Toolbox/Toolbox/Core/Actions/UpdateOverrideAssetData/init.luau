local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 7 ]]
    assert(typeof(v1) == "table", "UpdateOverrideAssetData resultsArray parameter must be a table");
    assert(typeof(v2) == "boolean", "UpdateOverrideAssetData fetchedAll parameter must be a boolean");
    return {
        resultsArray = v1, 
        fetchedAll = v2
    };
end);