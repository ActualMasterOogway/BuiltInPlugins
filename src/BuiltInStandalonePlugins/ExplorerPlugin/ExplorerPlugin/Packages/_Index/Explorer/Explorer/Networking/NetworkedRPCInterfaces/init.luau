local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v4 = require(l_script_FirstAncestor_0.Util.createNextNonce);
local v5 = require(l_script_FirstAncestor_0.Util.find);
local v6 = {};
local v7 = v3("NetworkedRPCInterfaces");
local function v23(v8) --[[ Line: 22 ]] --[[ Name: createNetworkedSender ]]
    -- upvalues: v4 (copy), v7 (copy), v5 (copy)
    local v9 = v4();
    local v10 = {};
    local v17 = v8.messageReceivedSignal:Connect(function(v11, ...) --[[ Line: 33 ]]
        -- upvalues: v7 (ref), v8 (copy), v5 (ref), v10 (ref)
        if v11:match((("(.+)%*$"):format("_FINISHED"))) == nil then
            return;
        else
            local v12 = ...;
            v7("Received async nonce from %s for %s: %s", v8.identifier, v11, v12);
            local v14 = v5(v10, function(v13) --[[ Line: 43 ]]
                -- upvalues: v12 (copy)
                return v13.nonce == v12;
            end);
            assert(v14 ~= nil, (("Guest sending invalid nonce for finished async task: %*"):format(v12)));
            if #v10 == 1 then
                v10 = {};
                task.spawn(v14.thread, select(2, ...));
                return;
            else
                local v15 = table.pack(select(2, ...));
                v14.resumeWith = function() --[[ Line: 57 ]]
                    -- upvalues: v15 (copy)
                    return table.unpack(v15);
                end;
                while #v10 > 0 and v10[1].resumeWith ~= nil do
                    local v16 = table.remove(v10, 1);
                    assert(v16 ~= nil, "Couldn't pop yielding thread");
                    assert(v16.resumeWith ~= nil, "Yielding thread didn't set resumeWith");
                    task.spawn(v16.thread, v16.resumeWith());
                end;
                return;
            end;
        end;
    end);
    local function v21(v18) --[[ Line: 71 ]] --[[ Name: fireAsync ]]
        -- upvalues: v9 (copy), v10 (ref), v7 (ref), v8 (copy)
        return function(...) --[[ Line: 72 ]]
            -- upvalues: v9 (ref), v10 (ref), v7 (ref), v8 (ref), v18 (copy)
            local v19 = v9();
            local v20 = coroutine.running();
            table.insert(v10, {
                thread = v20, 
                nonce = v19
            });
            v7(function(...) --[[ Line: 81 ]]
                -- upvalues: v8 (ref), v18 (ref), v19 (copy)
                return ("fireAsync to %*: %*, nonce = %*"):format(v8.identifier, v18, v19), ...;
            end, ...);
            v8.sendMessage(v18, v19, ...);
            return coroutine.yield();
        end;
    end;
    return {
        fire = function(v22) --[[ Line: 91 ]] --[[ Name: fire ]]
            -- upvalues: v7 (ref), v8 (copy)
            return function(...) --[[ Line: 92 ]]
                -- upvalues: v7 (ref), v8 (ref), v22 (copy)
                v7(function(...) --[[ Line: 93 ]]
                    -- upvalues: v8 (ref), v22 (ref)
                    return ("fire to %*: %*"):format(v8.identifier, v22), ...;
                end, ...);
                v8.sendMessage(v22, ...);
            end;
        end, 
        fireAsync = v21, 
        destroy = function() --[[ Line: 102 ]] --[[ Name: destroy ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end
    };
end;
local function _(v24, v25) --[[ Line: 113 ]] --[[ Name: addNetworkLayer ]]
    local v27 = v24.messageReceivedSignal:Connect(function(v26, ...) --[[ Line: 117 ]]
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
    return function() --[[ Line: 135 ]]
        -- upvalues: v27 (copy)
        v27:Disconnect();
    end;
end;
local function v33(v29) --[[ Line: 142 ]] --[[ Name: createGenericNetworkedSender ]]
    return (setmetatable({}, {
        __index = function(v30, v31) --[[ Line: 144 ]] --[[ Name: __index ]]
            -- upvalues: v29 (copy)
            local v32 = if v31:match("Async$") then v29.fireAsync(v31) else v29.fire(v31);
            v30[v31] = v32;
            return v32;
        end
    }));
end;
v6.createNetworkedHostToGuestRPCInterface = function(v34) --[[ Line: 152 ]] --[[ Name: createNetworkedHostToGuestRPCInterface ]]
    -- upvalues: v23 (copy), v33 (copy)
    local v35 = v23(v34);
    return v33(v35), v35.destroy;
end;
v6.addNetworkLayerToGuestRPCInterface = function(v36, v37) --[[ Line: 159 ]] --[[ Name: addNetworkLayerToGuestRPCInterface ]]
    local v39 = v36.messageReceivedSignal:Connect(function(v38, ...) --[[ Line: 117 ]]
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
    return function() --[[ Line: 135 ]]
        -- upvalues: v39 (copy)
        v39:Disconnect();
    end;
end;
v6.createNetworkedGuestToHostRPCInterface = function(v40) --[[ Line: 166 ]] --[[ Name: createNetworkedGuestToHostRPCInterface ]]
    -- upvalues: v23 (copy), v33 (copy)
    local v41 = v23(v40);
    return v33(v41), v41.destroy;
end;
v6.addNetworkLayerToHostRPCInterface = function(v42, v43) --[[ Line: 173 ]] --[[ Name: addNetworkLayerToHostRPCInterface ]]
    local v45 = v42.messageReceivedSignal:Connect(function(v44, ...) --[[ Line: 117 ]]
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
    return function() --[[ Line: 135 ]]
        -- upvalues: v45 (copy)
        v45:Disconnect();
    end;
end;
return v6;