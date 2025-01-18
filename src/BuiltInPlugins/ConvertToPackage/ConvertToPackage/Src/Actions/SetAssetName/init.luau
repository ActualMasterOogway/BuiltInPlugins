local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "string", string.format("assetName arg must be a string, received %s", (tostring(v1))));
    return {
        assetName = v1
    };
end);