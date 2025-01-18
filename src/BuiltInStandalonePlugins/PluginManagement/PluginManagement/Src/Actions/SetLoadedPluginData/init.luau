local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Action)(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", "Expected pluginData to be a table.");
    if next(v1) ~= nil then
        assert(type((next(v1))) == "number", "Expected pluginData to be a map.");
    end;
    return {
        pluginData = v1
    };
end);