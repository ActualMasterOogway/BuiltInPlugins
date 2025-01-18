local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Networking.NetworkedRPCInterfaces);
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v5 = require(l_script_FirstAncestor_0.Guest.createInstanceGuestRPCInterface);
local v6 = v4("startGuest");
return function(v7) --[[ Line: 13 ]] --[[ Name: startGuest ]]
    -- upvalues: v6 (copy), v1 (copy), v5 (copy)
    v6("Starting guest");
    local v8 = nil;
    local function v20(v9) --[[ Line: 22 ]] --[[ Name: connected ]]
        -- upvalues: v8 (ref), v1 (ref), v7 (copy), v5 (ref)
        if v9 == nil then
            return;
        else
            assert(v8 == nil, "There is an already active connection to the host");
            local v10, v11 = v1.createNetworkedGuestToHostRPCInterface(v9);
            local v12 = nil;
            local v13 = nil;
            if v7.createGuestRpcInterface == nil then
                local v14, v15 = v5(game:GetService("Selection"), v10);
                v12 = v14;
                v13 = v15;
            else
                local v16, v17 = v7.createGuestRpcInterface(v10);
                v12 = v16;
                v13 = v17;
            end;
            local v18 = v1.addNetworkLayerToGuestRPCInterface(v9, v12);
            local v19 = v9.disconnectSignal:Connect(function() --[[ Line: 43 ]]
                -- upvalues: v8 (ref)
                assert(v8 ~= nil, "Disconnected with no destroyNetworkedInterface");
                v8();
            end);
            v8 = function() --[[ Line: 48 ]]
                -- upvalues: v19 (copy), v13 (ref), v11 (copy), v18 (copy), v8 (ref)
                v19:Disconnect();
                v13();
                v11();
                v18();
                v8 = nil;
            end;
            return;
        end;
    end;
    local v21 = v7.guestConnectionObservable.get();
    if v21 ~= nil then
        v20(v21);
    end;
    local v22 = v7.guestConnectionObservable.changedSignal:Connect(v20);
    return function() --[[ Line: 66 ]]
        -- upvalues: v6 (ref), v22 (copy), v8 (ref)
        v6("Destroying guest");
        v22:Disconnect();
        if v8 ~= nil then
            v8();
        end;
    end;
end;