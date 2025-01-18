local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.NetworkContext);
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Parent.Signal);
return function() --[[ Line: 11 ]] --[[ Name: useServe ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v5 = v3.useContext(v1.Context);
    assert(not v5.default, "NetworkContext not provided");
    local v6, v7 = v3.useState({});
    local v8 = v3.useRef({});
    assert(v8.current ~= nil, "Luau");
    v3.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy), v7 (copy), v8 (copy)
        return v5.registerOnConnect(function(v9) --[[ Line: 21 ]]
            -- upvalues: v7 (ref), v8 (ref)
            v7(function(v10) --[[ Line: 22 ]]
                -- upvalues: v9 (copy)
                assert(v10[v9.identifier] == nil, "Identifier already in connections list");
                v10 = table.clone(v10);
                v10[v9.identifier] = v9;
                return v10;
            end);
            v8.current[v9.identifier] = v9.disconnectSignal:Connect(function() --[[ Line: 30 ]]
                -- upvalues: v7 (ref), v9 (copy), v8 (ref)
                v7(function(v11) --[[ Line: 31 ]]
                    -- upvalues: v9 (ref)
                    assert(v11[v9.identifier] ~= nil, "Identifier not found in connections list when disconnecting");
                    v11 = table.clone(v11);
                    v11[v9.identifier] = nil;
                    return v11;
                end);
                v8.current[v9.identifier] = nil;
            end);
        end);
    end, {
        v5.registerOnConnect
    });
    v3.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v8 (copy)
        return function() --[[ Line: 48 ]]
            -- upvalues: v8 (ref)
            for _, v13 in v8.current do
                v13:Disconnect();
            end;
        end;
    end, {});
    return v6;
end;