local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 10 ]]
    assert(v1, "Expected count to be defined");
    return {
        count = v1
    };
end);