local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    assert(typeof(v1) == "table", script.Name .. " requires friends to be a table, not " .. typeof(v1));
    for _, v3 in ipairs(v1) do
        assert(typeof(v3) == "number", script.Name .. " requires a table of numbers for friends, not " .. typeof(v3));
    end;
    return {
        creatorFriends = v1
    };
end);