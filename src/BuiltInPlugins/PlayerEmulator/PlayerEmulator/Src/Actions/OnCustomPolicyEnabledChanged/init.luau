return require(script.Parent.Action)(script.Name, function(v0) --[[ Line: 3 ]]
    assert(type(v0) == "boolean", "Expected enabled to be a boolean");
    return {
        enabled = v0
    };
end);