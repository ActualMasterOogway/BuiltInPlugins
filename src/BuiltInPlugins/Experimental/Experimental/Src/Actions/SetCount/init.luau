local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 11 ]]
    assert(typeof(v1) == "number", "Expected count to be a number");
    return {
        count = v1
    };
end);