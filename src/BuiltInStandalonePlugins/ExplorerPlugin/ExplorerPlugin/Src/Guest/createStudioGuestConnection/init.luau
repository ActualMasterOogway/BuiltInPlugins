local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v3 = require(l_script_FirstAncestor_0.Src.Util.StudioProtocolConstants);
local v4 = v2.Util.createDebugLogger("createStudioGuestConnection");
return function(v5) --[[ Line: 10 ]] --[[ Name: createStudioGuestConnection ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), l_MemStorageService_0 (copy)
    local l_Name_0 = v5.HostDataModelType.Name;
    local v7, v8 = v2.Observable.create(nil);
    local function v13() --[[ Line: 16 ]] --[[ Name: connect ]]
        -- upvalues: v4 (ref), v7 (copy), v5 (copy), v3 (ref), l_Name_0 (copy), v2 (ref), v8 (copy)
        v4("Starting connection");
        assert(v7.get() == nil, "Connecting to host when there is already an active connection");
        local function v11(v9, ...) --[[ Line: 21 ]] --[[ Name: sendMessage ]]
            -- upvalues: v4 (ref), v5 (ref), v3 (ref), l_Name_0 (ref)
            local v10 = {
                ...
            };
            v4(function() --[[ Line: 23 ]]
                -- upvalues: v9 (copy), v10 (copy)
                return ("Sending \"%*\""):format(v9), unpack(v10);
            end);
            v5:Invoke(v3.fromGuest.message, l_Name_0, v9, ...);
        end;
        local v12 = {
            identifier = l_Name_0, 
            disconnectSignal = v2.Signal.new(), 
            messageReceivedSignal = v2.Signal.new(), 
            sendMessage = v11
        };
        v8(v12);
        v5:Invoke(v3.fromGuest.connect, l_Name_0);
    end;
    local function v17(v14, v15, ...) --[[ Line: 42 ]] --[[ Name: onMessage ]]
        -- upvalues: l_Name_0 (copy), v7 (copy), v4 (ref)
        if l_Name_0 ~= v14 then
            return;
        else
            local v16 = v7.get();
            if v16 == nil then
                v4("Received message directed for %s, but no active connection", v15);
                return;
            else
                v16.messageReceivedSignal:Fire(v15, ...);
                return;
            end;
        end;
    end;
    local function v19() --[[ Line: 56 ]] --[[ Name: disconnectFromNetwork ]]
        -- upvalues: v7 (copy), v4 (ref), v5 (copy), v3 (ref), l_Name_0 (copy), v8 (copy)
        local v18 = v7.get();
        if v18 == nil then
            v4("Disconnecting, but no active connection");
            return;
        else
            assert(v18 ~= nil, "Luau");
            v4("Disconnecting");
            v5:Invoke(v3.fromGuest.disconnect, l_Name_0);
            v18.disconnectSignal:Fire();
            v8(nil);
            return;
        end;
    end;
    local v20 = v5:OnInvoke(v3.fromHost.starting, v13);
    local v21 = v5:OnInvoke(v3.fromHost.message, v17);
    if l_MemStorageService_0:HasItem(v3.fromHost.itemStarted) then
        v13();
    end;
    return v7, function() --[[ Line: 83 ]] --[[ Name: destroy ]]
        -- upvalues: v20 (copy), v21 (copy), v19 (copy)
        v20:Disconnect();
        v21:Disconnect();
        v19();
    end;
end;