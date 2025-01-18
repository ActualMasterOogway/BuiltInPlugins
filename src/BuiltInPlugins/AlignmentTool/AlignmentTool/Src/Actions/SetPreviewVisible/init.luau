local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 6 ]]
    assert(type(v1) == "boolean", "Expected visible to be a boolean");
    return {
        visible = v1
    };
end);