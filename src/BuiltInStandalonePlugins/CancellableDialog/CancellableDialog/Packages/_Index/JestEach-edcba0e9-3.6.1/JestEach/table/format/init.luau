local l_Parent_0 = script.Parent.Parent.Parent;
local l_NaN_0 = require(l_Parent_0.LuauPolyfill).Number.NaN;
local l_HttpService_0 = game:GetService("HttpService");
return function(...) --[[ Line: 32 ]]
    -- upvalues: l_NaN_0 (copy), l_HttpService_0 (copy)
    local v3 = 2;
    local v4 = {
        ...
    };
    local v5 = v4[1];
    local v6 = #v4;
    return (v5:gsub("%%[sdj%%]", function(v7) --[[ Line: 38 ]]
        -- upvalues: v3 (ref), v6 (copy), v4 (copy), l_NaN_0 (ref), l_HttpService_0 (ref)
        if v7 == "%%" then
            return "%";
        elseif v6 < v3 then
            return v7;
        elseif v7 == "%s" then
            local v8 = nil;
            v8 = typeof(v4[v3]) == "function" and "Function" or tostring(v4[v3]);
            v3 = v3 + 1;
            return v8;
        elseif v7 == "%d" then
            local v9 = tonumber(v4[v3]) or l_NaN_0;
            v3 = v3 + 1;
            return (tostring(v9));
        elseif v7 == "%j" then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 59 ]]
                -- upvalues: l_HttpService_0 (ref), v4 (ref), v3 (ref)
                local v10 = l_HttpService_0:JSONEncode(v4[v3]);
                v3 = v3 + 1;
                return v10;
            end);
            if not l_status_0 then
                v3 = v3 + 1;
                return "[Circular]";
            else
                return l_result_0;
            end;
        else
            return v7;
        end;
    end));
end;