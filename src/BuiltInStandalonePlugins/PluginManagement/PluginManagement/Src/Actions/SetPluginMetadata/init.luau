local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Action)(script.Name, function(v1, v2, v3, v4, v5, v6) --[[ Line: 4 ]]
    assert(type(v1) == "string", "Expected pluginId to be a string");
    assert(type(v2) == "string", "Expected name to be a string");
    assert(type(v3) == "string", "Expected description to be a string");
    assert(type(v4) == "string", "Expected versionId to be a string");
    assert(type(v5) == "string", "Expected created to be a string");
    assert(type(v6) == "string", "Expected updated to be a string");
    return {
        pluginId = v1, 
        name = v2, 
        description = v3, 
        versionId = v4, 
        created = v5, 
        updated = v6
    };
end);