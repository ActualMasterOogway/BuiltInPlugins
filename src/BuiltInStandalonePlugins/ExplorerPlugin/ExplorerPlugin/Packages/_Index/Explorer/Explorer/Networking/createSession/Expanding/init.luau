local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Networking.createSession.ExplorerNode);
local v3 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Networking.createSession.SessionChildren);
local v6 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugExplorerImmediateWaiting);
local v9 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v10 = require(l_script_FirstAncestor_0.Util.profile);
local v11 = {};
local v12 = v6("Expanding");
local function v17(v13, v14) --[[ Line: 18 ]] --[[ Name: setExpanded ]]
    local l_uiState_0 = v13.uiState;
    local v16 = if l_uiState_0 then table.clone(l_uiState_0) else {
        isExpanded = false
    };
    v16.isExpanded = v14;
    v13.uiState = table.freeze(v16);
end;
v11.expandKnownInstance = function(v18, v19) --[[ Line: 29 ]] --[[ Name: expandKnownInstance ]]
    -- upvalues: v11 (copy), v9 (copy), v17 (copy), v5 (copy)
    local v20 = v18.instanceIdsToNodes[v19];
    assert(v20 ~= nil, "expandKnownInstance was called for instance we don't know about");
    if v20.datum.parentId ~= nil then
        v11.expandKnownInstance(v18, v20.datum.parentId);
    end;
    if v9(v20) then
        return;
    else
        v17(v20, true);
        local v21 = v18.instanceIdsToHiddenChildren[v19];
        if v21 == nil then
            return;
        else
            v5.replaceChildren(v20, v21);
            v18.instanceIdsToHiddenChildren[v19] = nil;
            return;
        end;
    end;
end;
v11.expandAsync = function(v22, v23) --[[ Line: 53 ]] --[[ Name: expandAsync ]]
    -- upvalues: v9 (copy), v17 (copy), v5 (copy), v10 (copy), v2 (copy), v11 (copy)
    local v24 = v22.getFocusedRootState();
    if v22.rootState.instanceIdsToHiddenChildren[v23] == nil then
        local v28 = v10(function(v25) --[[ Line: 58 ]] --[[ Name: addExpandedExplorerNode ]]
            -- upvalues: v24 (copy), v9 (ref), v17 (ref), v5 (ref)
            assert(v25.datum.parentId ~= nil, "Got expanded datum with no parent ID");
            local v26 = v24.instanceIdsToNodes[v25.datum.parentId];
            assert(v26 ~= nil, "Couldn't find instance node for expanded datum");
            local l_v26_0 = v26;
            while v26 ~= nil do
                if not v9(v26) then
                    v17(v26, true);
                end;
                v26 = v26.datum.parentId and v24.instanceIdsToNodes[v26.datum.parentId];
            end;
            v5.insertInto(v24, l_v26_0, v25);
        end);
        if v24 == v22.rootState then
            for _, v30 in (v22.guestRpcInterface.expandAsync(v23)) do
                local v31 = v22.rootState.instanceIdsToNodes[v30.id];
                if v31 ~= nil then
                    v28(v31);
                else
                    v28((v2.createFromDatum(v30)));
                end;
            end;
        end;
    end;
    v11.expandKnownInstance(v24, v23);
end;
v11.unexpand = function(v32, v33) --[[ Line: 100 ]] --[[ Name: unexpand ]]
    -- upvalues: v5 (copy), v3 (copy), v17 (copy)
    local v34 = v32.getFocusedRootState();
    local v35 = v34.instanceIdsToNodes[v33];
    assert(v35 ~= nil, "Unexpanding node that we are not tracking");
    assert(v34.instanceIdsToHiddenChildren[v33] == nil, "Instance being unexpanded already has hidden children");
    v34.instanceIdsToHiddenChildren[v33] = v5.replaceChildren(v35, v3.empty());
    v17(v35, false);
end;
local function v36(v37, v38) --[[ Line: 117 ]] --[[ Name: collapseNode ]]
    -- upvalues: v3 (copy), v36 (copy), v9 (copy), v11 (copy)
    if v38.children ~= nil then
        for v39 in v3.iterate(v38.children) do
            v36(v37, v39);
        end;
    end;
    if v9(v38) then
        v11.unexpand(v37, v38.datum.id);
    end;
end;
v11.collapseAll = function(v40, v41) --[[ Line: 129 ]] --[[ Name: collapseAll ]]
    -- upvalues: v36 (copy)
    local v42 = v40.getFocusedRootState();
    for _, v44 in v41 do
        local v45 = v42.instanceIdsToNodes[v44];
        assert(v45 ~= nil, "Collapsing node that we're not tracking");
        v36(v40, v45);
    end;
    v42.fireRootChanged();
end;
v11.expandAll = function(v46, v47) --[[ Line: 143 ]] --[[ Name: expandAll ]]
    -- upvalues: v12 (copy), v9 (copy), v11 (copy), v8 (copy), v3 (copy)
    task.spawn(function() --[[ Line: 144 ]]
        -- upvalues: v46 (copy), v47 (copy), v12 (ref), v9 (ref), v11 (ref), v8 (ref), v3 (ref)
        local v48 = v46.getFocusedRootState();
        local v49 = os.clock();
        local v50 = 0;
        local v51 = nil;
        local v52 = os.clock();
        local v53 = table.clone(v47);
        local v54 = 1;
        while true do
            local v55 = v53[v54];
            if v55 ~= nil then
                v54 = v54 + 1;
                local v56 = v48.instanceIdsToNodes[v55];
                if v56 == nil then
                    v12("ID being expanded no longer exists: %s", v55);
                else
                    if not v9(v56) then
                        v11.expandAsync(v46, v56.datum.id);
                        if not v8() then
                            local v57 = os.clock() - v52;
                            if v57 > 0.02 then
                                v48.fireRootChanged();
                                v50 = v50 + v57;
                                if v51 == nil then
                                    v51 = v57;
                                end;
                                task.wait();
                                v52 = os.clock();
                            end;
                        end;
                    end;
                    if v56.children ~= nil then
                        for v58 in v3.iterate(v56.children) do
                            table.insert(v53, v58.datum.id);
                        end;
                    end;
                end;
            else
                break;
            end;
        end;
        v48.fireRootChanged();
        v50 = v50 + (os.clock() - v52);
        local v59 = os.clock() - v49;
        v46.analyticsInterface.logEvent({
            eventName = "LuaExplorerExpandAllFinished", 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = game:DefineFastInt("LuaExplorerExpandAllFinishedThrottlingHundredthsPercent", 10000), 
            description = "Time it takes to perform an expandAll. timeToInteractivity is the time up to the first throttle. unthrottledTime is the total time ignoring throttles (that is, raw work), and totalTime is the complete time, start to finish, to finish seeing all instances.", 
            lastUpdated = "2024-12-03"
        }, {
            totalTime = v59, 
            unthrottledTime = v50, 
            timeToInteractivity = v51 or v59
        });
    end);
end;
v11.getExpandState = function(v60, v61) --[[ Line: 215 ]] --[[ Name: getExpandState ]]
    -- upvalues: v1 (copy)
    if v61 == v1.nilId then
        return "NoChildren";
    else
        local v62 = v60.getFocusedRootState().instanceIdsToNodes[v61];
        if v62 == nil then
            return "NoChildren";
        else
            local l_uiState_1 = v62.uiState;
            if not v62.datum.hasChildren then
                return "NoChildren";
            elseif l_uiState_1 and l_uiState_1.isExpanded then
                return "Expanded";
            else
                return "Collapsed";
            end;
        end;
    end;
end;
return v11;