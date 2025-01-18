local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(type(v1) == "string", "Expected message to be a string");
    return {
        message = v1
    };
end);