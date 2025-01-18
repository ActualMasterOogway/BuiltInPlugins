local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Src.Util.StudioProtocolConstants);
local l_createElement_0 = v4.createElement;
local l_Plugin_0 = v3.ContextServices.Plugin;
local v8 = v2.Util.createDebugLogger("StudioNetworkContextProvider");
return function(v9) --[[ Line: 16 ]] --[[ Name: StudioNetworkContextProvider ]]
    -- upvalues: l_Plugin_0 (copy), v4 (copy), v5 (copy), v8 (copy), v2 (copy), l_MemStorageService_0 (copy), l_createElement_0 (copy)
    local v10 = l_Plugin_0:use():get();
    local v27 = v4.useCallback(function(v11) --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v5 (ref), v8 (ref), v2 (ref), l_MemStorageService_0 (ref)
        local v12 = {};
        local v16 = v10:OnInvoke(v5.fromGuest.connect, function(v13) --[[ Line: 26 ]]
            -- upvalues: v12 (copy), v8 (ref), v2 (ref), v10 (ref), v5 (ref), v11 (copy)
            assert(typeof(v13) == "string", "Connection identifier is not a string");
            if v12[v13] ~= nil then
                error((("Double connection with %*"):format(v13)));
            end;
            v8("%s connected", v13);
            local v15 = {
                identifier = v13, 
                disconnectSignal = v2.Signal.new(), 
                messageReceivedSignal = v2.Signal.new(), 
                sendMessage = function(v14, ...) --[[ Line: 39 ]] --[[ Name: sendMessage ]]
                    -- upvalues: v10 (ref), v5 (ref), v13 (copy)
                    v10:Invoke(v5.fromHost.message, v13, v14, ...);
                end
            };
            v12[v13] = v15;
            v11(v15);
        end);
        local v21 = v10:OnInvoke(v5.fromGuest.message, function(v17, v18, ...) --[[ Line: 51 ]]
            -- upvalues: v12 (copy), v8 (ref)
            assert(typeof(v17) == "string", "Message identifier is not a string");
            local v19 = v12[v17];
            if v19 == nil then
                error((("Message sent by %* without a connection: %*"):format(v17, v18)));
            end;
            assert(v19 ~= nil, "Luau");
            local v20 = table.pack(...);
            v8(function() --[[ Line: 62 ]]
                -- upvalues: v17 (copy), v18 (copy), v20 (copy)
                return ("%* sent message \"%*\""):format(v17, v18), table.unpack(v20);
            end);
            v19.messageReceivedSignal:Fire(v18, ...);
        end);
        local v24 = v10:OnInvoke(v5.fromGuest.disconnect, function(v22) --[[ Line: 72 ]]
            -- upvalues: v8 (ref), v12 (copy)
            assert(typeof(v22) == "string", "Connection identifier is not a string");
            v8("%s disconnecting", v22);
            local v23 = v12[v22];
            assert(v23 ~= nil, "Disconnect sent without a connection");
            v12[v22] = nil;
            v23.disconnectSignal:Fire();
        end);
        v10:Invoke(v5.fromHost.starting);
        l_MemStorageService_0:SetItem(v5.fromHost.itemStarted);
        return function() --[[ Line: 88 ]]
            -- upvalues: v8 (ref), v16 (copy), v24 (copy), v21 (copy), v12 (copy), l_MemStorageService_0 (ref), v5 (ref)
            v8("Destroying");
            v16:Disconnect();
            v24:Disconnect();
            v21:Disconnect();
            for _, v26 in v12 do
                v26.disconnectSignal:Fire();
            end;
            l_MemStorageService_0:RemoveItem(v5.fromHost.itemStarted);
        end;
    end, {});
    return l_createElement_0(v2.Components.Contexts.NetworkContextProvider, {
        registerOnConnect = v27
    }, v9.children);
end;