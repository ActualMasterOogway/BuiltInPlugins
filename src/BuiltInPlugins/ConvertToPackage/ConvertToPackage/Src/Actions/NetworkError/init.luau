local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v1, v2) --[[ Line: 5 ]]
    assert(type(v2) == "string", string.format("networkErrorAction must be a string, received %s", (type(v2))));
    local v3 = "response must be a string, or table, received %s";
    local v4 = true;
    if type(v1) ~= "string" then
        v4 = type(v1) == "table";
    end;
    assert(v4, string.format(v3, (type(v1))));
    local l_v1_0 = v1;
    if typeof(v1) == "string" then
        l_v1_0 = {
            responseBody = v1
        };
    end;
    return {
        response = l_v1_0, 
        networkErrorAction = v2
    };
end);