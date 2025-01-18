local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(typeof(v1) == "number", script.Name .. " requires creatorId to be a number, not " .. typeof(v1));
    return {
        creatorId = v1
    };
end);