local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    local v2 = false;
    if typeof(v1) == "Instance" then
        v2 = v1:IsA("DataModel");
    end;
    assert(v2, string.format(script.Name .. " requires game to be a DataModel, not %s", (typeof(v1))));
    return {
        game = v1
    };
end);