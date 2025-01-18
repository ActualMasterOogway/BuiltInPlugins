local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Src.SharedFeatures.createPluginRpcMethod);
local l_createElement_0 = v2.createElement;
local v6 = {};
local v7 = {
    fromGuest = {
        performSelectAll = v4("PerformSelectAll")
    }, 
    fromHost = {
        connectSelectAll = v4("ConnectSelectAll"), 
        disconnectSelectAll = v4("DisconnectSelectAll")
    }
};
v6.Provider = function(v8) --[[ Line: 25 ]] --[[ Name: Provider ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v1 (copy), l_createElement_0 (copy)
    v3.useEventConnection(v8.dockWidget.WindowFocused, function() --[[ Line: 29 ]]
        -- upvalues: v7 (ref)
        v7.fromHost.connectSelectAll.fire();
    end, {});
    v3.useEventConnection(v8.dockWidget.WindowFocusReleased, function() --[[ Line: 33 ]]
        -- upvalues: v7 (ref)
        v7.fromHost.disconnectSelectAll.fire();
    end, {});
    local v9 = v2.useState(v1.Signal.new);
    v7.fromGuest.performSelectAll.useListenToGuest(function() --[[ Line: 38 ]]
        -- upvalues: v9 (copy)
        v9:Fire();
    end, {});
    local v12 = v2.useCallback(function(v10) --[[ Line: 42 ]]
        -- upvalues: v9 (copy)
        local v11 = v9:Connect(v10);
        return function() --[[ Line: 44 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {
        v9
    });
    return l_createElement_0(v1.Components.Contexts.SelectAllContextProvider, {
        registerSelectAll = v12
    }, v8.children);
end;
v6.connectGuest = function(v13) --[[ Line: 54 ]] --[[ Name: connectGuest ]]
    -- upvalues: v7 (copy)
    if not game:GetFastFlag("SelectAllComponent") then
        return function() --[[ Line: 56 ]]

        end;
    else
        local l_v13_PluginComponent_0 = v13:GetPluginComponent("SelectAll");
        local v15 = nil;
        local function _() --[[ Line: 68 ]] --[[ Name: disconnectSelectAllConnection ]]
            -- upvalues: v15 (ref)
            if v15 == nil then
                return;
            else
                task.cancel(v15.thread);
                if v15.connection ~= nil then
                    v15.connection:Disconnect();
                end;
                v15 = nil;
                return;
            end;
        end;
        local v18 = v7.fromHost.connectSelectAll.listen(function() --[[ Line: 82 ]]
            -- upvalues: v15 (ref), l_v13_PluginComponent_0 (copy), v7 (ref)
            if v15 ~= nil then
                return;
            else
                local v17 = nil;
                v17 = {
                    connection = nil, 
                    thread = task.defer(function() --[[ Line: 91 ]]
                        -- upvalues: v17 (ref), l_v13_PluginComponent_0 (ref), v7 (ref)
                        v17.connection = l_v13_PluginComponent_0:AddOverrideAsync(1, function() --[[ Line: 92 ]]
                            -- upvalues: v7 (ref)
                            v7.fromGuest.performSelectAll.fire();
                        end);
                    end)
                };
                v15 = v17;
                return;
            end;
        end);
        local v19 = v7.fromHost.disconnectSelectAll.listen(function() --[[ Line: 101 ]]
            -- upvalues: v15 (ref)
            if v15 == nil then
                return;
            else
                task.cancel(v15.thread);
                if v15.connection ~= nil then
                    v15.connection:Disconnect();
                end;
                v15 = nil;
                return;
            end;
        end);
        return function() --[[ Line: 105 ]]
            -- upvalues: v15 (ref), v18 (copy), v19 (copy)
            if v15 ~= nil then
                task.cancel(v15.thread);
                if v15.connection ~= nil then
                    v15.connection:Disconnect();
                end;
                v15 = nil;
            end;
            v18();
            v19();
        end;
    end;
end;
return v6;