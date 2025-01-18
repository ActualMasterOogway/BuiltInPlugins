local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local l_jest_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
return function() --[[ Line: 7 ]] --[[ Name: createMockPlugin ]]
    -- upvalues: l_jest_0 (copy)
    local v2 = {};
    local v3 = {};
    v2.Invoke = l_jest_0.fn(function(_, v5, ...) --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        local v6 = v3[v5];
        if v6 then
            local v7 = table.pack(...);
            for v8, v9 in v7 do
                if typeof(v9) == "table" then
                    v7[v8] = table.clone(v9);
                end;
            end;
            v6(table.unpack(v7));
        end;
    end);
    v2.OnInvoke = l_jest_0.fn(function(_, v11, v12) --[[ Line: 24 ]]
        -- upvalues: v3 (copy)
        v3[v11] = v12;
        return {
            Disconnect = function() --[[ Line: 27 ]] --[[ Name: Disconnect ]]
                -- upvalues: v3 (ref), v11 (copy)
                v3[v11] = nil;
            end
        };
    end);
    v2.Deactivation = {
        Connect = l_jest_0.fn(function(_, _) --[[ Line: 34 ]]
            -- upvalues: l_jest_0 (ref)
            return {
                Disconnect = l_jest_0.fn()
            };
        end)
    };
    return v2;
end;