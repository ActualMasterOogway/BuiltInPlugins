local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.Util.TypedDash);
local _ = require(l_script_FirstAncestor_0.Src.Util.TypedNetworking);
local l_pretty_0 = v1.pretty;
return function(v4) --[[ Line: 8 ]] --[[ Name: createResponseValidator ]]
    -- upvalues: l_pretty_0 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), l_pretty_0 (ref)
        local v6 = v4(v5.responseBody);
        if v6 then
            local v7 = l_pretty_0(v5.responseBody, {
                multiline = true
            });
            error("Response does not match schema" .. ("\nReason: %*"):format(v6) .. ("\nMethod: %*"):format(v5.requestOptions.Method) .. ("\nURL: %*"):format(v5.requestOptions.Url) .. ("\nBody:\n%*"):format(v7));
        end;
        return v5.responseBody;
    end;
end;