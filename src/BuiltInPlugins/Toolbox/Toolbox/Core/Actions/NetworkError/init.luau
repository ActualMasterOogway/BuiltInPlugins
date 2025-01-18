local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 7 ]]
    local l_v1_0 = v1;
    if type(v1) == "string" then
        l_v1_0 = {
            responseBody = v1
        };
    end;
    return {
        response = l_v1_0, 
        networkErrorAction = v2
    };
end);