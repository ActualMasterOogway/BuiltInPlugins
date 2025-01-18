local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(typeof(v1) == "number", script.Name .. " expected groupOwnerId to be a number, not " .. typeof(v1));
    return {
        groupOwnerId = v1
    };
end);