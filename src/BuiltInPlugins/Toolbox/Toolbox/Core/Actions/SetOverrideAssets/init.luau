local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 7 ]]
    assert(typeof(v1) == "table", "SetOverrideAssets resultsArray must be a table");
    return {
        resultsArray = v1
    };
end);