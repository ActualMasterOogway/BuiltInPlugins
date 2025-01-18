local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Action)(script.Name, function(v1) --[[ Line: 4 ]]
    assert(type(v1) == "string", "Expected pluginId to be a string");
    return {
        pluginId = v1
    };
end);