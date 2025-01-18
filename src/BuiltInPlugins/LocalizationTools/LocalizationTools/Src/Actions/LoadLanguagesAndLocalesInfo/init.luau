local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 4 ]]
    assert(type(v1) == "table", "Expected allLanguages to be a table");
    assert(type(v2) == "table", "Expected localesToLanguages to be a table");
    return {
        allLanguages = v1, 
        localesToLanguages = v2
    };
end);