local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 13 ]]
    assert(typeof(v1) == "string", string.format("Expected searchTerm to be a string, received %s", (type(v1))));
    return {
        searchTerm = v1
    };
end);