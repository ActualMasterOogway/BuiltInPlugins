local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Networking.createSession.Expanding);
local v2 = require(l_script_FirstAncestor_0.Networking.createSession.ExplorerNode);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Networking.createSession.SessionChildren);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v7 = require(l_script_FirstAncestor_0.Util.instanceIdsToSet);
return function(v8, v9) --[[ Line: 11 ]] --[[ Name: createSessionSelection ]]
    -- upvalues: v3 (copy), v7 (copy), v5 (copy), v1 (copy), v2 (copy)
    local v10, v11 = v3.create((table.freeze({})));
    local v12, v13 = v3.create((table.freeze({})));
    local v14, v15 = v3.create((table.freeze({})));
    local v16 = nil;
    local function v23(v17) --[[ Line: 30 ]] --[[ Name: selectIds ]]
        -- upvalues: v8 (copy), v9 (copy), v16 (ref), v10 (copy), v11 (copy), v7 (ref), v13 (copy), v15 (copy)
        assert(table.isfrozen(v17), "Selection is not frozen, table.freeze it before sending");
        local v18 = {};
        for _, v20 in v17 do
            local v21 = v8.rootState.instanceIdsToNodes[v20];
            assert(v21 ~= nil, "Selecting unknown instance");
            local l_parent_0 = v21.parent;
            while l_parent_0 ~= nil do
                v18[l_parent_0.datum.id] = true;
                l_parent_0 = l_parent_0.parent;
            end;
        end;
        if v9() and #v17 > 0 and v8.getFocusedRootState() ~= v8.rootState then
            if v16 == nil then
                v16 = v10.get();
            end;
        else
            v16 = nil;
        end;
        v11(v7(v17));
        v13(v17);
        v15(v18);
        v8.guestRpcInterface.setSelection(v17);
    end;
    local function v35(v24, v25) --[[ Line: 66 ]] --[[ Name: selectionChanged ]]
        -- upvalues: v8 (copy), v5 (ref), v9 (copy), v1 (ref), v2 (ref), v13 (copy), v11 (copy), v7 (ref), v15 (copy)
        local v26 = {};
        for _, v28 in v25 do
            assert(v28.parentId ~= nil, "Selecting instance not in data model. Selection:Set() should filter this out.");
            local v29 = v8.rootState.instanceIdsToNodes[v28.parentId];
            assert(v29 ~= nil, "New datum is under a parent we don't know about");
            local v30 = v8.rootState.instanceIdsToNodes[v28.id];
            if v30 ~= nil then
                v5.insertInto(v8.rootState, v29, v30);
            else
                if v9() then
                    v1.expandKnownInstance(v8.rootState, v28.parentId);
                end;
                v5.insertInto(v8.rootState, v29, v2.createFromDatum(v28));
                while v29 ~= nil do
                    v26[v29.datum.id] = true;
                    v29 = v29.parent;
                end;
            end;
        end;
        for _, v32 in v24 do
            local v33 = v8.rootState.instanceIdsToNodes[v32];
            assert(v33 ~= nil, "Selecting unknown instance");
            assert(v33.datum.parentId ~= nil, "Selecting instance not in data model.");
            if v9() then
                v1.expandKnownInstance(v8.rootState, v33.datum.parentId);
            end;
            local l_parent_1 = v33.parent;
            while l_parent_1 ~= nil do
                v26[l_parent_1.datum.id] = true;
                l_parent_1 = l_parent_1.parent;
            end;
        end;
        v8.rootState.fireRootChanged();
        v13(table.freeze(v24));
        v11(v7(v24));
        v15(v26);
    end;
    v8.searchClearedSignal:Connect(function() --[[ Line: 118 ]]
        -- upvalues: v16 (ref), v9 (copy), v10 (copy), v1 (ref), v8 (copy)
        if v16 == nil then
            return;
        elseif not v9() then
            v16 = nil;
            return;
        else
            for v36 in v10.get() do
                if v16[v36] then
                    return;
                else
                    v1.expandKnownInstance(v8.rootState, v36);
                    v8.rootState.fireRootChanged();
                end;
            end;
            return;
        end;
    end);
    return {
        selectIds = v23, 
        selectionChanged = v35, 
        selectedIdsObservable = v10, 
        selectedIdsArrayObservable = v12, 
        selectedWithinIdsObservable = v14
    };
end;