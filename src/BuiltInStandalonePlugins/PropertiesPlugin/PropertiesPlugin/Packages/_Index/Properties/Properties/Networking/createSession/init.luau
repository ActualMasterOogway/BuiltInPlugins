local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Networking.NetworkedRPCInterfaces);
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.propertyIdToString);
local v6 = require(l_script_FirstAncestor_0.Util.samePropertyId);
return function(v7) --[[ Line: 10 ]] --[[ Name: createSession ]]
    -- upvalues: v3 (copy), v1 (copy), v6 (copy), v5 (copy)
    local v8 = {};
    local v9, v10 = v3.create((table.freeze({})));
    local v11, v12 = v3.create((table.freeze({})));
    local v13, v14 = v3.create(false);
    local v15 = nil;
    local v16 = nil;
    local v17, v18 = v1.createNetworkedHostToGuestRPCInterface(v7);
    local function v21(v19, v20) --[[ Line: 25 ]] --[[ Name: updateSummary ]]
        -- upvalues: v12 (copy), v14 (copy)
        v12(v19);
        v14(v20);
    end;
    local function v25() --[[ Line: 30 ]] --[[ Name: updatePropertiesObservableFromLatest ]]
        -- upvalues: v8 (copy), v10 (copy)
        local v22 = {};
        for _, v24 in v8 do
            table.insert(v22, v24);
        end;
        v10(table.freeze(v22));
    end;
    v25();
    local function v34(v26, v27) --[[ Line: 40 ]] --[[ Name: showProperties ]]
        -- upvalues: v15 (ref), v6 (ref), v16 (ref), v5 (ref), v8 (copy), v25 (copy)
        local v28 = #v26;
        assert(#v27 == v28, "Mismatched count of properties and values");
        for v29 = 1, v28 do
            local v30 = table.freeze(v26[v29]);
            local v31 = v27[v29];
            if v15 and v6(v15, v30) then
                v16 = v31;
            else
                local v32 = v5(v30);
                local v33 = v8[v32];
                if v33 then
                    v8[v32] = table.freeze({
                        id = v33.id, 
                        value = v31
                    });
                else
                    v8[v32] = table.freeze({
                        id = v30, 
                        value = v31
                    });
                end;
            end;
        end;
        v25();
    end;
    local function v38(v35) --[[ Line: 75 ]] --[[ Name: clearProperties ]]
        -- upvalues: v8 (copy), v5 (ref), v25 (copy)
        for _, v37 in v35 do
            v8[v5(v37)] = nil;
        end;
        v25();
    end;
    local v39 = {
        updateSummary = v21, 
        showProperties = v34, 
        clearProperties = v38
    };
    local v40 = v1.addNetworkLayerToHostRPCInterface(v7, v39);
    local function v43(v41, v42) --[[ Line: 89 ]] --[[ Name: finishEditingProperty ]]
        -- upvalues: v15 (ref), v6 (ref), v17 (copy), v16 (ref), v34 (copy)
        if v15 ~= nil and v6(v15, v41) then
            v17.finishEditing(v15, v42);
            v15 = nil;
            if v16 then
                if v42 == Enum.FinishRecordingOperation.Cancel then
                    v34({
                        table.clone(v41)
                    }, {
                        v16
                    });
                end;
                v16 = nil;
            end;
        end;
    end;
    local function v46(v44, v45) --[[ Line: 107 ]] --[[ Name: beginEditingPropertyAsync ]]
        -- upvalues: v15 (ref), v43 (copy), v17 (copy)
        if v15 ~= nil then
            v43(v15, Enum.FinishRecordingOperation.Commit);
        end;
        v15 = v44;
        v17.beginEditingAsync(v44, v45);
    end;
    local function v52(v47, v48, v49) --[[ Line: 115 ]] --[[ Name: setPropertyPart ]]
        -- upvalues: v15 (ref), v6 (ref), v8 (copy), v5 (ref), v17 (copy)
        assert(v15, "Not editing a property");
        if v6(v15, v47) then
            local v50 = v8[v5(v47)];
            if v50 then
                local v51 = v50.value.parts[v48];
                v51.value = v49;
                v51.multiple = false;
            end;
            v17.continueEditing(v15, v48, v49);
        end;
    end;
    local function v53() --[[ Line: 131 ]] --[[ Name: destroy ]]
        -- upvalues: v15 (ref), v43 (copy), v40 (copy), v18 (copy)
        if v15 ~= nil then
            v43(v15, Enum.FinishRecordingOperation.Cancel);
        end;
        v40();
        v18();
    end;
    return {
        beginEditingPropertyAsync = v46, 
        finishEditingProperty = v43, 
        setPropertyPart = v52, 
        propertiesObservable = v9, 
        summaryObservable = v11, 
        pendingObservable = v13, 
        destroy = v53
    };
end;