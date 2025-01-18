local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(type(v1) == "boolean", "Expected isBusy to be a boolean");
    return {
        isBusy = v1
    };
end);