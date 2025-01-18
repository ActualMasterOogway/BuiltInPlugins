local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "string", string.format("SetUniverseName requires a string, not %s", (type(v1))));
    return {
        universeName = v1
    };
end);