local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(typeof(v1) == "boolean", string.format("SetRecentViewToggled requires a boolean, not %s", (type(v1))));
    return {
        recentViewToggled = v1
    };
end);