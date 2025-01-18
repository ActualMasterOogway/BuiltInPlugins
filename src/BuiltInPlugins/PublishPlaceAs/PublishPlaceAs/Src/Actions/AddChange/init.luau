local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1, v2) --[[ Line: 6 ]]
    assert(v1 ~= nil, "AddChange setting key cannot be nil");
    assert(v2 ~= nil, "AddChange value cannot be nil. You probably meant Cryo.None");
    return {
        setting = v1, 
        value = v2
    };
end);