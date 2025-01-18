local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(typeof(v1) == "table", string.format("SetRecentAssets requires a table, not %s", (type(v1))));
    return {
        recentAssets = v1
    };
end);