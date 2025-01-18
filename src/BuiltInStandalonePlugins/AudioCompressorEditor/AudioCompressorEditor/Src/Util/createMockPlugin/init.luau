local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local l_jest_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
return function() --[[ Line: 6 ]] --[[ Name: createMockPlugin ]]
    -- upvalues: l_jest_0 (copy)
    local v2 = {};
    local v3 = {};
    local v4 = {};
    v2.SetItem = l_jest_0.fn(function(_, v6, v7) --[[ Line: 14 ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3[v6] = if typeof(v7) == "table" then table.clone(v7) else v7;
        local v8 = v4[v6];
        if v8 then
            v8(if typeof(v7) == "table" then table.clone(v7) else v7);
        end;
    end);
    v2.GetItem = l_jest_0.fn(function(_, v10) --[[ Line: 23 ]]
        -- upvalues: v3 (copy)
        local v11 = v3[v10];
        if typeof(v11) == "table" then
            return (table.clone(v11));
        else
            return v11;
        end;
    end);
    v2.MockOnSetItemDisconnect = l_jest_0.fn();
    v2.OnSetItem = l_jest_0.fn(function(_, v13, v14) --[[ Line: 30 ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4[v13] = v14;
        return {
            Disconnect = function() --[[ Line: 34 ]] --[[ Name: Disconnect ]]
                -- upvalues: v4 (ref), v13 (copy), v2 (ref)
                v4[v13] = nil;
                v2.MockOnSetItemDisconnect(v13);
            end
        };
    end);
    local v15 = {};
    v2.Invoke = l_jest_0.fn(function(_, v17, ...) --[[ Line: 44 ]]
        -- upvalues: v15 (copy)
        local v18 = v15[v17];
        if v18 then
            local v19 = table.pack(...);
            for v20, v21 in v19 do
                if typeof(v21) == "table" then
                    v19[v20] = table.clone(v21);
                end;
            end;
            v18(table.unpack(v19));
        end;
    end);
    v2.MockOnInvokeDisconnect = l_jest_0.fn();
    v2.OnInvoke = l_jest_0.fn(function(_, v23, v24) --[[ Line: 59 ]]
        -- upvalues: v15 (copy), v2 (copy)
        v15[v23] = v24;
        return {
            Disconnect = function() --[[ Line: 63 ]] --[[ Name: Disconnect ]]
                -- upvalues: v15 (ref), v23 (copy), v2 (ref)
                v15[v23] = nil;
                v2.MockOnInvokeDisconnect(v23);
            end
        };
    end);
    return v2;
end;