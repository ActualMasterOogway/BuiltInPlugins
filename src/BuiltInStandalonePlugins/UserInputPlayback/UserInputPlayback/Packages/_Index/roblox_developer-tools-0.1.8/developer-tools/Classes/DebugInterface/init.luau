local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Dash);
local l_class_0 = v3.class;
local l_forEach_0 = v3.forEach;
local l_insert_0 = table.insert;
local v7 = require(l_Parent_0.Services);
local v8 = require(l_Parent_0.EventName);
local v9 = require(l_Parent_0.Classes.PluginEventRouter);
local v10 = require(l_Parent_0.RoactInspector.Classes.RoactInspectorWorker);
local v14 = l_class_0("DebugInterface", function(v11, v12, v13) --[[ Line: 21 ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        sourceId = l_HttpService_0:GenerateGUID(), 
        sourceKind = v11, 
        sourceName = v12, 
        bridges = v13, 
        routers = {}, 
        targets = {}, 
        workers = {}, 
        connectionsForListener = {}, 
        outboundBridgeForBridgeId = {}
    };
end);
v14.addRoactTree = function(v15, v16, v17, v18) --[[ Line: 38 ]] --[[ Name: addRoactTree ]]
    -- upvalues: v10 (copy)
    assert(typeof(v16) == "string", "targetName must be a string");
    assert(v17, "roactTree must be defined");
    return v15:_addTarget(v16, function(v19, v20) --[[ Line: 42 ]]
        -- upvalues: v10 (ref), v15 (copy), v17 (copy), v18 (copy)
        return v10.new(v15, v19, v20, v17, v18);
    end);
end;
v14.addPluginRouter = function(v21, v22) --[[ Line: 47 ]] --[[ Name: addPluginRouter ]]
    -- upvalues: v9 (copy), l_insert_0 (copy)
    l_insert_0(v21.routers, v9.new(v21.sourceName, v22, v21.bridges));
end;
v14._connectTargets = function(v23) --[[ Line: 51 ]] --[[ Name: _connectTargets ]]
    -- upvalues: v8 (copy)
    if #v23.targets > 0 then
        return;
    else
        v23:_connect({
            eventName = v8.GetTargets, 
            onEvent = function(v24) --[[ Line: 59 ]] --[[ Name: onEvent ]]
                -- upvalues: v23 (copy), v8 (ref)
                v23:_send({
                    eventName = v8.ShowTargets, 
                    toBridgeId = v24.fromBridgeId, 
                    sourceId = v23.sourceId, 
                    sourceName = v23.sourceName, 
                    sourceKind = v23.sourceKind, 
                    targets = v23.targets
                });
            end
        });
        return;
    end;
end;
v14._send = function(v25, v26) --[[ Line: 72 ]] --[[ Name: _send ]]
    -- upvalues: v7 (copy), l_forEach_0 (copy)
    if not v7.hasInternalPermission() then
        return;
    elseif not v26.toBridgeId then
        l_forEach_0(v25.bridges, function(v27) --[[ Line: 77 ]]
            -- upvalues: v26 (copy)
            v27:send(v26);
        end);
        return;
    else
        local v28 = v25.outboundBridgeForBridgeId[v26.toBridgeId];
        if not v28 then
            error(("[DeveloperTools] No bridge to other bridge %s"):format(v26.toBridgeId));
        end;
        v28:send(v26);
        return;
    end;
end;
v14._connect = function(v29, v30) --[[ Line: 89 ]] --[[ Name: _connect ]]
    -- upvalues: v7 (copy), l_forEach_0 (copy), l_insert_0 (copy)
    if not v7.hasInternalPermission() then
        return;
    else
        local v31 = {};
        v29.connectionsForListener[v30] = v31;
        l_forEach_0(v29.bridges, function(v32) --[[ Line: 95 ]]
            -- upvalues: v29 (copy), v30 (copy), v31 (copy), l_insert_0 (ref)
            local v37 = v32:connect(function(v33) --[[ Line: 96 ]]
                -- upvalues: v29 (ref), v32 (copy), v30 (ref)
                v29.outboundBridgeForBridgeId[v33.fromBridgeId] = v32;
                local v34 = true;
                if v30.eventName ~= nil then
                    v34 = v30.eventName == v33.eventName;
                end;
                local v35 = true;
                if v30.bridgeId ~= nil then
                    v35 = v30.bridgeId == v33.toBridgeId;
                end;
                local v36 = true;
                if v30.targetId ~= nil then
                    v36 = v30.targetId == v33.toTargetId;
                end;
                if v34 and v35 and v36 then
                    v30.onEvent(v33);
                end;
            end);
            l_insert_0(v31, v37);
        end);
        return;
    end;
end;
v14._disconnect = function(v38, v39) --[[ Line: 110 ]] --[[ Name: _disconnect ]]
    -- upvalues: l_forEach_0 (copy)
    local v40 = v38.connectionsForListener[v39];
    l_forEach_0(v40, function(v41) --[[ Line: 112 ]]
        v41:Disconnect();
    end);
end;
v14._addTarget = function(v42, v43, v44) --[[ Line: 117 ]] --[[ Name: _addTarget ]]
    -- upvalues: l_HttpService_0 (copy), v8 (copy)
    v42:_connectTargets();
    local v45 = l_HttpService_0:GenerateGUID();
    local v46 = {
        id = v45, 
        name = v43
    };
    v42.targets[v45] = v46;
    v42:_connect({
        targetId = v45, 
        eventName = v8.AttachTarget, 
        onEvent = function(v47) --[[ Line: 128 ]] --[[ Name: onEvent ]]
            -- upvalues: v42 (copy), v45 (copy), v44 (copy)
            local v48 = v42.workers[v45] or v44(v45, v47.fromBridgeId);
            v42.workers[v45] = v48;
        end
    });
    return v45;
end;
v14._removeWorker = function(v49, v50) --[[ Line: 136 ]] --[[ Name: _removeWorker ]]
    local v51 = v49.workers[v50];
    if v51 then
        v51:destroy();
    end;
    v49.workers[v50] = nil;
end;
v14.setGuiOptions = function(v52, v53) --[[ Line: 144 ]] --[[ Name: setGuiOptions ]]
    v52.rootInstance = v53.rootInstance;
    v52.pickerParent = v53.pickerParent;
    v52.rootPath = v53.rootPath;
    v52.rootPrefix = v53.rootPrefix;
end;
v14.destroy = function(v54) --[[ Line: 151 ]] --[[ Name: destroy ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v54.bridges, function(v55) --[[ Line: 152 ]]
        v55:destroy();
    end);
    l_forEach_0(v54.routers, function(v56) --[[ Line: 155 ]]
        v56:destroy();
    end);
    l_forEach_0(v54.workers, function(v57) --[[ Line: 158 ]]
        v57:destroy();
    end);
end;
return v14;