local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 7 ]]
    assert(type(v1) == "string", "searchTerm must be a string");
    return {
        searchTerm = v1
    };
end);