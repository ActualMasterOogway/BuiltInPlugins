return require(script.Parent.Action)(script.Name, function(v0, v1) --[[ Line: 7 ]]
    assert(type(v0) == "boolean", string.format("Expected isEnabled to be a boolean, received %s", (tostring(v0))));
    assert(type(v1) == (not v0 and "string" or "table"));
    return {
        isEnabled = v0, 
        errorMessage = not v0 and v1 or nil
    };
end);