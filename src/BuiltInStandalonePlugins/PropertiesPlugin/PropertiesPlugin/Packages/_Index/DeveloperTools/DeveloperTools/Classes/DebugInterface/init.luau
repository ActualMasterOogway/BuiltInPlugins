local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Dash);
local l_class_0 = v3.class;
local l_forEach_0 = v3.forEach;
local l_map_0 = v3.map;
local l_insert_0 = table.insert;
local _ = require(l_Parent_0.Services);
local v9 = require(l_Parent_0.EventName);
local v10 = require(l_Parent_0.Classes.PluginEventRouter);
local v11 = require(l_Parent_0.RoactInspector.Classes.RoactInspectorWorker);
local v12 = require(l_Parent_0.Roact17.Classes.Roact17TargetWatcher);
local v16 = l_class_0("DebugInterface", function(v13, v14, v15) --[[ Line: 23 ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        sourceId = l_HttpService_0:GenerateGUID(), 
        sourceKind = v13, 
        sourceName = v14, 
        bridges = v15, 
        routers = {}, 
        targets = {}, 
        workers = {}, 
        connectionsForListener = {}, 
        outboundBridgeForBridgeId = {}
    };
end);
v16.addRoactTree = function(v17, v18, v19, v20) --[[ Line: 40 ]] --[[ Name: addRoactTree ]]
    -- upvalues: v11 (copy)
    assert(typeof(v18) == "string", "targetName must be a string");
    assert(v19, "roactTree must be defined");
    return v17:addTarget(v18, function(v21, v22) --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v17 (copy), v19 (copy), v20 (copy)
        return v11.new(v17, v21, v22, v19, v20);
    end);
end;
v16.initRoact = function(v23, v24, v25) --[[ Line: 49 ]] --[[ Name: initRoact ]]
    -- upvalues: v12 (copy)
    local v26 = v24.setup(v25);
    v23.workers.reactTargetWatcher = v12.new(v23, v26);
end;
v16.addPluginRouter = function(v27, v28) --[[ Line: 54 ]] --[[ Name: addPluginRouter ]]
    -- upvalues: v10 (copy), l_insert_0 (copy)
    l_insert_0(v27.routers, v10.new(v27.sourceName, v28, v27.bridges));
end;
v16._connectTargets = function(v29) --[[ Line: 58 ]] --[[ Name: _connectTargets ]]
    -- upvalues: v9 (copy), l_map_0 (copy)
    if next(v29.targets) then
        return;
    else
        v29:_connect({
            eventName = v9.GetTargets, 
            onEvent = function(v30) --[[ Line: 66 ]] --[[ Name: onEvent ]]
                -- upvalues: v29 (copy), v9 (ref), l_map_0 (ref)
                v29:_send({
                    eventName = v9.ShowTargets, 
                    toBridgeId = v30.fromBridgeId, 
                    sourceId = v29.sourceId, 
                    sourceName = v29.sourceName, 
                    sourceKind = v29.sourceKind, 
                    targets = l_map_0(v29.targets, function(v31) --[[ Line: 73 ]]
                        return {
                            id = v31.id, 
                            name = v31.name
                        };
                    end)
                });
            end
        });
        return;
    end;
end;
v16._send = function(v32, v33) --[[ Line: 84 ]] --[[ Name: _send ]]
    -- upvalues: l_forEach_0 (copy)
    if not v33.toBridgeId then
        l_forEach_0(v32.bridges, function(v34) --[[ Line: 86 ]]
            -- upvalues: v33 (copy)
            v34:send(v33);
        end);
        return;
    else
        local v35 = v32.outboundBridgeForBridgeId[v33.toBridgeId];
        if not v35 then
            error(("[DeveloperTools] No bridge to other bridge %s"):format(v33.toBridgeId));
        end;
        v35:send(v33);
        return;
    end;
end;
v16._connect = function(v36, v37) --[[ Line: 98 ]] --[[ Name: _connect ]]
    -- upvalues: l_forEach_0 (copy), l_insert_0 (copy)
    local v38 = {};
    v36.connectionsForListener[v37] = v38;
    l_forEach_0(v36.bridges, function(v39) --[[ Line: 101 ]]
        -- upvalues: v36 (copy), v37 (copy), v38 (copy), l_insert_0 (ref)
        local v44 = v39:connect(function(v40) --[[ Line: 102 ]]
            -- upvalues: v36 (ref), v39 (copy), v37 (ref)
            v36.outboundBridgeForBridgeId[v40.fromBridgeId] = v39;
            local v41 = true;
            if v37.eventName ~= nil then
                v41 = v37.eventName == v40.eventName;
            end;
            local v42 = true;
            if v37.bridgeId ~= nil then
                v42 = v37.bridgeId == v40.toBridgeId;
            end;
            local v43 = true;
            if v37.targetId ~= nil then
                v43 = v37.targetId == v40.toTargetId;
            end;
            if v41 and v42 and v43 then
                v37.onEvent(v40);
            end;
        end);
        l_insert_0(v38, v44);
    end);
end;
v16._disconnect = function(v45, v46) --[[ Line: 116 ]] --[[ Name: _disconnect ]]
    -- upvalues: l_forEach_0 (copy)
    local v47 = v45.connectionsForListener[v46];
    l_forEach_0(v47, function(v48) --[[ Line: 118 ]]
        v48:Disconnect();
    end);
end;
v16.addTarget = function(v49, v50, v51) --[[ Line: 123 ]] --[[ Name: addTarget ]]
    -- upvalues: l_HttpService_0 (copy), v9 (copy)
    v49:_connectTargets();
    local v52 = l_HttpService_0:GenerateGUID();
    local v55 = {
        id = v52, 
        name = v50, 
        listener = {
            targetId = v52, 
            eventName = v9.AttachTarget, 
            onEvent = function(v53) --[[ Line: 132 ]] --[[ Name: onEvent ]]
                -- upvalues: v49 (copy), v52 (copy), v51 (copy)
                local v54 = v49.workers[v52] or v51(v52, v53.fromBridgeId);
                v49.workers[v52] = v54;
            end
        }
    };
    v49.targets[v52] = v55;
    v49:_connect(v55.listener);
    return v52;
end;
v16.removeTarget = function(v56, v57) --[[ Line: 143 ]] --[[ Name: removeTarget ]]
    local v58 = v56.targets[v57];
    if v58 ~= nil then
        v56:_disconnect(v58.listener);
        v56.targets[v57] = nil;
    end;
end;
v16.removeWorker = function(v59, v60) --[[ Line: 151 ]] --[[ Name: removeWorker ]]
    local v61 = v59.workers[v60];
    if v61 then
        v61:destroy();
    end;
    v59.workers[v60] = nil;
end;
v16.setGuiOptions = function(v62, v63) --[[ Line: 159 ]] --[[ Name: setGuiOptions ]]
    v62.rootInstance = v63.rootInstance;
    v62.pickerParent = v63.pickerParent;
    v62.rootPath = v63.rootPath;
    v62.rootPrefix = v63.rootPrefix;
end;
v16.destroy = function(v64) --[[ Line: 166 ]] --[[ Name: destroy ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v64.bridges, function(v65) --[[ Line: 167 ]]
        v65:destroy();
    end);
    l_forEach_0(v64.routers, function(v66) --[[ Line: 170 ]]
        v66:destroy();
    end);
    l_forEach_0(v64.workers, function(v67) --[[ Line: 173 ]]
        v67:destroy();
    end);
end;
return v16;