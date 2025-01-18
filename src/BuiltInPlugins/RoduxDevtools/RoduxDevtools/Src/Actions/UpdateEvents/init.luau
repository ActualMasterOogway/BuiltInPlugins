local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 13 ]]
    assert(typeof(v1) == "table", string.format("Expected args to be a table, received %s", (type(v1))));
    return {
        events = v1
    };
end);