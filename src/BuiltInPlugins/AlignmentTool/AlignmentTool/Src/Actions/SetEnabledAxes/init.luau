local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 6 ]]
    assert(type(v1) == "table", "Expected axes to be a table");
    assert(type(v1.X) == "boolean", "Expected X to be a boolean");
    assert(type(v1.Y) == "boolean", "Expected Y to be a boolean");
    assert(type(v1.Z) == "boolean", "Expected Z to be a boolean");
    return {
        enabledAxes = {
            X = v1.X, 
            Y = v1.Y, 
            Z = v1.Z
        }
    };
end);