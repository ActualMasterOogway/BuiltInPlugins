local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Action)(script.Name, function(v1, v2, v3) --[[ Line: 4 ]]
    assert(type(v1) == "string", "Expected pluginId to be a string");
    assert(type(v2) == "number", "Expected statusCode to be a number");
    assert(type(v3) == "string", "Expected message to be a string");
    return {
        pluginId = v1, 
        statusCode = v2, 
        message = v3
    };
end);