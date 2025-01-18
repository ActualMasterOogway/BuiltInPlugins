local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 7 ]]
    assert(type(v1) == "table", "assetData has to be a table.");
    assert(next(v1) ~= nil, "assetData can't be an empty table.");
    return {
        assetConfigData = v1
    };
end);