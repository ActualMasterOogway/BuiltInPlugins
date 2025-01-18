local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "number", string.format("SetSelectionIndex requires a number, not %s", (type(v1))));
    return {
        selectionIndex = v1
    };
end);