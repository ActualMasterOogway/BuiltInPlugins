local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Fields.AllFields);
local _ = require(l_script_FirstAncestor_0.Fields.FieldTypes);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v7 = require(l_script_FirstAncestor_0.Util.diffArray);
local v8 = require(l_script_FirstAncestor_0.Util.find);
local v9 = v5("createSessionFields");
local function v14(v10, v11, v12) --[[ Line: 14 ]] --[[ Name: setFieldValue ]]
    v10.datum = table.clone(v10.datum);
    local v13 = if v10.datum.fieldValues == nil then {} else table.clone(v10.datum.fieldValues);
    v13[v11] = v12;
    v10.datum.fieldValues = v13;
    table.freeze(v13);
    table.freeze(v10.datum);
end;
return function(v15) --[[ Line: 28 ]] --[[ Name: createSessionFields ]]
    -- upvalues: v3 (copy), v8 (copy), v9 (copy), v14 (copy), v7 (copy), v1 (copy)
    local v16, v17 = v3.create(table.freeze({}));
    local function v34(v18, v19) --[[ Line: 38 ]] --[[ Name: addField ]]
        -- upvalues: v17 (copy), v15 (copy), v8 (ref), v9 (ref), v14 (ref)
        v17(function(v20) --[[ Line: 39 ]]
            -- upvalues: v18 (copy), v19 (copy)
            v20 = table.clone(v20);
            table.insert(v20, table.freeze({
                token = nil, 
                field = v18, 
                parameters = v19
            }));
            return table.freeze(v20);
        end);
        local v21 = nil;
        local v22 = false;
        task.spawn(function() --[[ Line: 57 ]]
            -- upvalues: v15 (ref), v18 (copy), v19 (copy), v22 (ref), v21 (ref), v17 (ref), v8 (ref), v9 (ref), v14 (ref)
            local v23, v24 = v15.guestRpcInterface.createFieldAsync(v18.key, v19);
            if v22 then
                v15.guestRpcInterface.deleteField(v23);
                return;
            else
                v21 = v23;
                v17(function(v25) --[[ Line: 68 ]]
                    -- upvalues: v8 (ref), v18 (ref), v19 (ref), v9 (ref), v23 (copy)
                    local _, v29 = v8(v25, function(v26) --[[ Line: 69 ]]
                        -- upvalues: v18 (ref), v19 (ref)
                        local v27 = false;
                        if v26.field == v18 then
                            v27 = v26.parameters == v19;
                        end;
                        return v27;
                    end);
                    if v29 == nil then
                        v9("Field %s was removed before we received the token and values for it", v18.key);
                        return v25;
                    else
                        v25 = table.clone(v25);
                        local v30 = table.clone(v25[v29]);
                        v30.token = v23;
                        v25[v29] = table.freeze(v30);
                        return table.freeze(v25);
                    end;
                end);
                for v31, v32 in v24 do
                    local v33 = v15.rootState.instanceIdsToNodes[v31];
                    assert(v33 ~= nil, "Adding a field told us about an instance ID we don't know about");
                    v14(v33, v23, v32);
                end;
                v15.rootState.fireRootChanged();
                return;
            end;
        end);
        return function() --[[ Line: 97 ]]
            -- upvalues: v22 (ref), v21 (ref), v15 (ref)
            v22 = true;
            if v21 ~= nil then
                v15.guestRpcInterface.deleteField(v21);
            end;
        end;
    end;
    local function v39(v35, v36, v37) --[[ Line: 105 ]] --[[ Name: updateFieldValue ]]
        -- upvalues: v15 (copy), v14 (ref)
        local v38 = v15.rootState.instanceIdsToNodes[v36];
        assert(v38 ~= nil, "Updating field for an instance we don't know about. Most likely a field isn't disconnecting itself, and this is on an instance we have since garbage collected.");
        v14(v38, v35, v37);
        v15.rootState.fireRootChanged();
    end;
    local _ = function(v40) --[[ Line: 116 ]] --[[ Name: viewInstances ]]
        -- upvalues: v15 (copy), v16 (copy), v9 (ref), v14 (ref)
        task.spawn(function() --[[ Line: 117 ]]
            -- upvalues: v15 (ref), v40 (copy), v16 (ref), v9 (ref), v14 (ref)
            local v41 = v15.guestRpcInterface.viewInstancesAsync(v40);
            local v42 = v16.get();
            local v43 = {};
            for _, v45 in v42 do
                if v45.token ~= nil then
                    v43[v45.token] = true;
                end;
            end;
            for v46, v47 in v41 do
                for v48, v49 in v47 do
                    if not v43[v48] then
                        v9("Unknown field token received, so should be one we've removed before: %s", v48);
                    else
                        local v50 = v15.rootState.instanceIdsToNodes[v46];
                        assert(v50 ~= nil, "Server is telling us about field for instance we don't know about");
                        v14(v50, v48, v49);
                    end;
                end;
            end;
            v15.rootState.fireRootChanged();
        end);
    end;
    local v52 = {};
    local function v66(v53) --[[ Line: 151 ]] --[[ Name: setViewingInstances ]]
        -- upvalues: v7 (ref), v52 (ref), v15 (copy), v16 (copy), v9 (ref), v14 (ref)
        local v54, v55 = v7(v53, v52);
        if #v54 > 0 then
            task.spawn(function() --[[ Line: 117 ]]
                -- upvalues: v15 (ref), v54 (copy), v16 (ref), v9 (ref), v14 (ref)
                local v56 = v15.guestRpcInterface.viewInstancesAsync(v54);
                local v57 = v16.get();
                local v58 = {};
                for _, v60 in v57 do
                    if v60.token ~= nil then
                        v58[v60.token] = true;
                    end;
                end;
                for v61, v62 in v56 do
                    for v63, v64 in v62 do
                        if not v58[v63] then
                            v9("Unknown field token received, so should be one we've removed before: %s", v63);
                        else
                            local v65 = v15.rootState.instanceIdsToNodes[v61];
                            assert(v65 ~= nil, "Server is telling us about field for instance we don't know about");
                            v14(v65, v63, v64);
                        end;
                    end;
                end;
                v15.rootState.fireRootChanged();
            end);
        end;
        if #v55 > 0 then
            v15.guestRpcInterface.stopViewingInstances(v55);
        end;
        v52 = v53;
    end;
    for _, v68 in v1 do
        assert(v68 ~= nil, "Luau");
        if v68.permanent then
            v34(v68, nil);
        end;
    end;
    return {
        addField = v34, 
        requestedFieldsObservable = v16, 
        updateFieldValue = v39, 
        setViewingInstances = v66
    };
end;