local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Networking.NetworkedRPCInterfaces);
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.createDebugLogger)("startGuest");
return function(v5) --[[ Line: 12 ]] --[[ Name: startGuest ]]
    -- upvalues: v4 (copy), v1 (copy)
    v4("Starting guest");
    local v6 = nil;
    local function v14(v7) --[[ Line: 21 ]] --[[ Name: connected ]]
        -- upvalues: v6 (ref), v1 (ref), v5 (copy)
        if v7 == nil then
            return;
        else
            assert(v6 == nil, "There is an already active connection");
            local v8, v9 = v1.createNetworkedGuestToHostRPCInterface(v7);
            local v10, v11 = v5.createGuestRpcInterface(v8);
            local v12 = v1.addNetworkLayerToGuestRPCInterface(v7, v10);
            local v13 = v7.disconnectSignal:Connect(function() --[[ Line: 36 ]]
                -- upvalues: v6 (ref)
                assert(v6 ~= nil, "Disconnected with no destroyNetworkedInterface");
                v6();
            end);
            v6 = function() --[[ Line: 41 ]]
                -- upvalues: v13 (copy), v11 (copy), v9 (copy), v12 (copy), v6 (ref)
                v13:Disconnect();
                v11();
                v9();
                v12();
                v6 = nil;
            end;
            return;
        end;
    end;
    local v15 = v5.guestConnectionObservable.get();
    if v15 ~= nil then
        v14(v15);
    end;
    local v16 = v5.guestConnectionObservable.changedSignal:Connect(v14);
    return function() --[[ Line: 59 ]]
        -- upvalues: v4 (ref), v16 (copy), v6 (ref)
        v4("Destroying guest");
        v16:Disconnect();
        if v6 ~= nil then
            v6();
        end;
    end;
end;