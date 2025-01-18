local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", string.format("SetSelectedAssets requires a table, not %s", (type(v1))));
    return {
        editingAssets = v1
    };
end);