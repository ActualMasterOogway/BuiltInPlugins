local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1) --[[ Line: 4 ]]
    assert(v1 ~= nil, "ClearChange setting key cannot be nil");
    return {
        setting = v1
    };
end);