local l_Parent_0 = script:FindFirstAncestor("Http").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkNetworkingBetterErrors);
local v12 = {
    __tostring = function(v3) --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v1 (copy)
        if v2() then
            return (("HttpResponse = %*"):format((v1.pretty(v3, {
                depth = 1e999, 
                multiline = true
            }))));
        else
            local v4 = {};
            for v5, v6 in pairs(v3.requestOptions) do
                table.insert(v4, string.format("%s : %s", v5, (tostring(v6))));
            end;
            local l_responseBody_0 = v3.responseBody;
            if type(l_responseBody_0) == "table" then
                local v8 = {};
                for v9, v10 in pairs(l_responseBody_0) do
                    table.insert(v8, string.format("%s : %s", v9, (tostring(v10))));
                end;
                l_responseBody_0 = string.format("{ %s }", table.concat(v8, ", "));
            end;
            local v11 = {};
            table.insert(v11, string.format("%s : %s", "responseTimeMs", v3.responseTimeMs));
            table.insert(v11, string.format("%s : %s", "responseCode", v3.responseCode));
            table.insert(v11, string.format("%s : %s", "responseBody", l_responseBody_0));
            table.insert(v11, string.format("%s : { %s }", "requestOptions", table.concat(v4, ", ")));
            return string.format("HttpResponse = { %s }", table.concat(v11, ", "));
        end;
    end
};
v12.new = function(v13, v14, v15, v16) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v17 = {
        responseTimeMs = v14, 
        responseCode = v15, 
        responseBody = v13, 
        requestOptions = v16
    };
    setmetatable(v17, v12);
    return v17;
end;
return v12;