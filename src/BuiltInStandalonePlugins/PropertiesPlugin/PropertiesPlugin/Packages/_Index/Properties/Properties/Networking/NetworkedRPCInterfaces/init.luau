local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v4 = require(l_script_FirstAncestor_0.Util.createNextNonce);
local v5 = {};
local v6 = v3("NetworkedRPCInterfaces");
local function v23(v7) --[[ Line: 21 ]] --[[ Name: createNetworkedSender ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v8 = v4();
    local v9 = {};
    local v17 = v7.messageReceivedSignal:Connect(function(v10, ...) --[[ Line: 32 ]]
        -- upvalues: v6 (ref), v7 (copy), v9 (ref)
        if v10:match((("(.+)%*$"):format("_FINISHED"))) == nil then
            return;
        else
            local v11 = ...;
            v6("Received async nonce from %s for %s: %s", v7.identifier, v10, v11);
            local v12 = nil;
            for _, v14 in v9 do
                if v14.nonce == v11 then
                    v12 = v14;
                    break;
                end;
            end;
            assert(v12 ~= nil, (("Guest sending invalid nonce for finished async task: %*"):format(v11)));
            if #v9 == 1 then
                v9 = {};
                task.spawn(v12.thread, select(2, ...));
                return;
            else
                local v15 = table.pack(select(2, ...));
                v12.resumeWith = function() --[[ Line: 60 ]]
                    -- upvalues: v15 (copy)
                    return table.unpack(v15);
                end;
                while #v9 > 0 and v9[1].resumeWith ~= nil do
                    local v16 = table.remove(v9, 1);
                    assert(v16 ~= nil, "Couldn't pop yielding thread");
                    assert(v16.resumeWith ~= nil, "Yielding thread didn't set resumeWith");
                    task.spawn(v16.thread, v16.resumeWith());
                end;
                return;
            end;
        end;
    end);
    local function v21(v18) --[[ Line: 74 ]] --[[ Name: fireAsync ]]
        -- upvalues: v8 (copy), v9 (ref), v6 (ref), v7 (copy)
        return function(...) --[[ Line: 75 ]]
            -- upvalues: v8 (ref), v9 (ref), v6 (ref), v7 (ref), v18 (copy)
            local v19 = v8();
            local v20 = coroutine.running();
            table.insert(v9, {
                thread = v20, 
                nonce = v19
            });
            v6(function(...) --[[ Line: 84 ]]
                -- upvalues: v7 (ref), v18 (ref), v19 (copy)
                return ("fireAsync to %*: %*, nonce = %*"):format(v7.identifier, v18, v19), ...;
            end, ...);
            v7.sendMessage(v18, v19, ...);
            return coroutine.yield();
        end;
    end;
    return {
        fire = function(v22) --[[ Line: 94 ]] --[[ Name: fire ]]
            -- upvalues: v6 (ref), v7 (copy)
            return function(...) --[[ Line: 95 ]]
                -- upvalues: v6 (ref), v7 (ref), v22 (copy)
                v6(function(...) --[[ Line: 96 ]]
                    -- upvalues: v7 (ref), v22 (ref)
                    return ("fire to %*: %*"):format(v7.identifier, v22), ...;
                end, ...);
                v7.sendMessage(v22, ...);
            end;
        end, 
        fireAsync = v21, 
        destroy = function() --[[ Line: 105 ]] --[[ Name: destroy ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end
    };
end;
local function _(v24, v25) --[[ Line: 116 ]] --[[ Name: addNetworkLayer ]]
    local v27 = v24.messageReceivedSignal:Connect(function(v26, ...) --[[ Line: 120 ]]
        -- upvalues: v25 (copy), v24 (copy)
        if v26:match("_FINISHED" .. "$") then
            return;
        else
            if v25[v26] == nil then
                error((("Connection received invalid message key: %*"):format(v26)));
            end;
            if not v26:match("Async$") then
                v25[v26](...);
                return;
            else
                v24.sendMessage(v26 .. "_FINISHED", ..., v25[v26](select(2, ...)));
                return;
            end;
        end;
    end);
    return function() --[[ Line: 138 ]]
        -- upvalues: v27 (copy)
        v27:Disconnect();
    end;
end;
local function v33(v29) --[[ Line: 145 ]] --[[ Name: createGenericNetworkedSender ]]
    return (setmetatable({}, {
        __index = function(v30, v31) --[[ Line: 147 ]] --[[ Name: __index ]]
            -- upvalues: v29 (copy)
            local v32 = if v31:match("Async$") then v29.fireAsync(v31) else v29.fire(v31);
            v30[v31] = v32;
            return v32;
        end
    }));
end;
v5.createNetworkedHostToGuestRPCInterface = function(v34) --[[ Line: 155 ]] --[[ Name: createNetworkedHostToGuestRPCInterface ]]
    -- upvalues: v23 (copy), v33 (copy)
    local v35 = v23(v34);
    return v33(v35), v35.destroy;
end;
v5.addNetworkLayerToGuestRPCInterface = function(v36, v37) --[[ Line: 162 ]] --[[ Name: addNetworkLayerToGuestRPCInterface ]]
    local v39 = v36.messageReceivedSignal:Connect(function(v38, ...) --[[ Line: 120 ]]
        -- upvalues: v37 (copy), v36 (copy)
        if v38:match("_FINISHED" .. "$") then
            return;
        else
            if v37[v38] == nil then
                error((("Connection received invalid message key: %*"):format(v38)));
            end;
            if not v38:match("Async$") then
                v37[v38](...);
                return;
            else
                v36.sendMessage(v38 .. "_FINISHED", ..., v37[v38](select(2, ...)));
                return;
            end;
        end;
    end);
    return function() --[[ Line: 138 ]]
        -- upvalues: v39 (copy)
        v39:Disconnect();
    end;
end;
v5.createNetworkedGuestToHostRPCInterface = function(v40) --[[ Line: 169 ]] --[[ Name: createNetworkedGuestToHostRPCInterface ]]
    -- upvalues: v23 (copy), v33 (copy)
    local v41 = v23(v40);
    return v33(v41), v41.destroy;
end;
v5.addNetworkLayerToHostRPCInterface = function(v42, v43) --[[ Line: 176 ]] --[[ Name: addNetworkLayerToHostRPCInterface ]]
    local v45 = v42.messageReceivedSignal:Connect(function(v44, ...) --[[ Line: 120 ]]
        -- upvalues: v43 (copy), v42 (copy)
        if v44:match("_FINISHED" .. "$") then
            return;
        else
            if v43[v44] == nil then
                error((("Connection received invalid message key: %*"):format(v44)));
            end;
            if not v44:match("Async$") then
                v43[v44](...);
                return;
            else
                v42.sendMessage(v44 .. "_FINISHED", ..., v43[v44](select(2, ...)));
                return;
            end;
        end;
    end);
    return function() --[[ Line: 138 ]]
        -- upvalues: v45 (copy)
        v45:Disconnect();
    end;
end;
return v5;