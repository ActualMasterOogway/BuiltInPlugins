local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(typeof(v1) == "string", script.Name .. " requires creatorName to be a string, not " .. typeof(v1));
    return {
        creatorName = v1
    };
end);