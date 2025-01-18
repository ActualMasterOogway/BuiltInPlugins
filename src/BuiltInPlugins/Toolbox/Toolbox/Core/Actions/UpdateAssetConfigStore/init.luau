local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 8 ]]
    assert(type(v1) == "table", "storeData has to be a table.");
    assert(next(v1) ~= nil, "storeData can't be an empty table.");
    return {
        storeData = v1
    };
end);