local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    local v2 = true;
    if type(v1) ~= "number" then
        v2 = type(v1) == "nil";
    end;
    assert(v2, string.format("SetEditDevProductId requires a number or nil, not %s", (type(v1))));
    return {
        editDevProductId = v1
    };
end);