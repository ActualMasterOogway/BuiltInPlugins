local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 13 ]]
    assert(typeof(v1) == "number", string.format("Expected selectedIndex to be a number, received %s", (type(v1))));
    return {
        selectedIndex = v1
    };
end);