local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 11 ]]
    assert(type(v1) == "string", "Bad original");
    assert(type(v2) == "string", "Bad filteredText");
    return {
        original = v1, 
        filteredText = v2
    };
end);