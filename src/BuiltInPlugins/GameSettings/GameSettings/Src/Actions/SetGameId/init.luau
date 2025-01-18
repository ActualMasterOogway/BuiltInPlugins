local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(typeof(v1) == "number", string.format(script.Name .. " requires gameId to be a number, not %s", (typeof(v1))));
    return {
        gameId = v1
    };
end);