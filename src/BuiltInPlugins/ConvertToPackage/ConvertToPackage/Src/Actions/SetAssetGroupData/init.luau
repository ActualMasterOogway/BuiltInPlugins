local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", string.format("assetData arg must be a table, received %s", (tostring(v1))));
    return {
        assetGroupData = v1
    };
end);