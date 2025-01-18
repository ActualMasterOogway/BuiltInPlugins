local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 13 ]]
    assert(type(v1) == "table", "pluginData must be a table");
    assert(next(v1) ~= nil, "pluginData can't be an empty table");
    return {
        pluginData = v1
    };
end);