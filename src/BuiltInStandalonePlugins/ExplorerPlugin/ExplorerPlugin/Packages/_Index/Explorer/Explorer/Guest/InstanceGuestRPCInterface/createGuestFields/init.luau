local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Fields.AllFields);
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v6 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.getInstanceId);
local v7 = require(l_script_FirstAncestor_0.Util.onlyOnce);
local v8 = v5("createGuestFields");
return function(v9) --[[ Line: 13 ]] --[[ Name: createGuestFields ]]
    -- upvalues: v3 (copy), v6 (copy), v7 (copy), v1 (copy), v8 (copy)
    local v10 = v3.createUniqueKey();
    local function v20(v11, v12, v13) --[[ Line: 32 ]] --[[ Name: trackField ]]
        -- upvalues: v9 (copy), v6 (ref), v7 (ref)
        local v14 = v13.instances[v11];
        if v14 ~= nil then
            return v14.value;
        else
            local v15 = nil;
            local function v17(v16) --[[ Line: 47 ]] --[[ Name: update ]]
                -- upvalues: v15 (ref), v9 (ref), v12 (copy), v6 (ref), v11 (copy)
                assert(v15 ~= nil, "update called before the watch completed");
                v15.value = v16;
                v9.hostRpcInterface.updateFieldValue(v12, v6(v9, v11), v16);
            end;
            local v18, v19 = v13.field.watch(v11, v17, v13.parameters);
            v15 = {
                value = v18, 
                disconnect = v7(function() --[[ Line: 55 ]] --[[ Name: disconnect ]]
                    -- upvalues: v19 (copy)
                    v19();
                end)
            };
            v13.instances[v11] = v15;
            return v18;
        end;
    end;
    local function v30(v21, v22) --[[ Line: 69 ]] --[[ Name: createFieldAsync ]]
        -- upvalues: v1 (ref), v10 (copy), v9 (copy), v6 (ref), v20 (copy)
        local v23 = v1[v21];
        if v23 == nil then
            error((("Invalid field requested: %*"):format(v23)));
        end;
        local v24, v25 = v23.validateArgs(v22);
        if not v24 then
            error((("Invalid arguments sent to %*: %*"):format(v23, v25)));
        end;
        local v26 = v10(v23.key);
        local v27 = {
            field = v23, 
            parameters = v22, 
            instances = {}
        };
        local v28 = {};
        for v29 in v9.instancesInView do
            v28[v6(v9, v29)] = v20(v29, v26, v27);
        end;
        v9.trackingFields[v26] = v27;
        return v26, v28;
    end;
    local function v32(_) --[[ Line: 102 ]] --[[ Name: deleteField ]]
        error("NYI: deleteField");
    end;
    local function v41(v33) --[[ Line: 106 ]] --[[ Name: viewInstancesAsync ]]
        -- upvalues: v9 (copy), v8 (ref), v20 (copy)
        local v34 = {};
        for _, v36 in v33 do
            local v37 = v9.instanceIdsToInstance[v36];
            assert(v37 ~= nil, "Guest is viewing an instance we don't know about");
            if v9.instancesInView[v37] then
                v8("%* is being viewed twice", v37);
            else
                v9.instancesInView[v37] = true;
                if next(v9.trackingFields) ~= nil then
                    local v38 = {};
                    for v39, v40 in v9.trackingFields do
                        assert(v40 ~= nil, "Luau");
                        v38[v39] = v20(v37, v39, v40);
                    end;
                    v34[v36] = v38;
                end;
            end;
        end;
        return v34;
    end;
    return {
        createFieldAsync = v30, 
        deleteField = v32, 
        viewInstancesAsync = v41, 
        stopViewingInstances = function(v42) --[[ Line: 160 ]] --[[ Name: stopViewingInstances ]]
            -- upvalues: v9 (copy)
            for _, v44 in v42 do
                local v45 = v9.instanceIdsToInstance[v44];
                assert(v45 ~= nil, "Host stopped viewing instance we don't know about");
                assert(v9.instancesInView[v45], "Host stopped viewing instance not in view");
                v9.instancesInView[v45] = nil;
                for _, v47 in v9.trackingFields do
                    assert(v47 ~= nil, "Luau");
                    local v48 = v47.instances[v45];
                    assert(v48 ~= nil, "Instance not being tracked by field");
                    v48.disconnect();
                    v47.instances[v45] = nil;
                end;
            end;
        end, 
        performFieldAction = function(v49, v50, v51, ...) --[[ Line: 140 ]] --[[ Name: performFieldAction ]]
            -- upvalues: v9 (copy)
            local v52 = v9.trackingFields[v50];
            assert(v52 ~= nil, "Host performed action on field that we are not tracking");
            local v53 = v9.instanceIdsToInstance[v49];
            assert(v53 ~= nil, "Host performed action on instance that we don't know about");
            local v54 = v52.field.actions and v52.field.actions[v51];
            if v54 == nil then
                error((("Host performed action \"%*\" on %*, which doesn't exist"):format(v51, v52.field.key)));
            end;
            v54(v53, v52.parameters, ...);
        end, 
        destroy = function() --[[ Line: 179 ]] --[[ Name: destroy ]]
            -- upvalues: v9 (copy)
            for _, v56 in v9.trackingFields do
                assert(v56 ~= nil, "Luau");
                for _, v58 in v56.instances do
                    assert(v58 ~= nil, "Luau");
                    v58.disconnect();
                end;
            end;
            table.clear(v9.trackingFields);
        end
    };
end;