local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 6 ]]
    assert(type(v1) == "boolean", "Expected enabled to be a boolean");
    local v3 = true;
    if type(v2) ~= "table" then
        v3 = v2 == nil;
    end;
    assert(v3, "Expected reason to be a table or nil");
    local v4 = v2 or {};
    return {
        alignEnabled = v1, 
        disabledReason = v4
    };
end);