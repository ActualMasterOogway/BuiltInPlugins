local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "boolean", string.format("uploadSucceeded arg must be a boolean, received %s", (tostring(v1))));
    return {
        uploadSucceeded = v1
    };
end);