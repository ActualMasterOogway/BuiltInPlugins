local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local v4 = require(l_Actions_0.SetAutocompleteResults);
return function(v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v7 (copy), v4 (ref), v5 (copy), v6 (copy), v8 (copy), v3 (ref), v2 (ref)
        if v7 == "" then
            v9:dispatch(v4({}));
            return;
        else
            return v5:getAutocompleteResults(v6, v7, v8):andThen(function(v10) --[[ Line: 16 ]]
                -- upvalues: v7 (ref), v9 (copy), v4 (ref)
                local l_responseBody_0 = v10.responseBody;
                if l_responseBody_0 and l_responseBody_0.Data and v7 == l_responseBody_0.Args.Prefix then
                    local v12 = {};
                    for v13, _ in pairs(l_responseBody_0.Data) do
                        table.insert(v12, l_responseBody_0.Data[v13].Query);
                    end;
                    v9:dispatch(v4(v12));
                end;
            end, function(v15) --[[ Line: 25 ]]
                -- upvalues: v3 (ref), v9 (copy), v2 (ref)
                if v3.shouldDebugWarnings() then
                    warn("Toolbox: Could not fetch autocomplete results");
                end;
                v9:dispatch(v2(v15));
            end);
        end;
    end;
end;