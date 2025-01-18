local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagExplorerEnableSharedHover);
local v6 = require(l_script_FirstAncestor_0.Util.isExpanded);
return function(v7, v8) --[[ Line: 10 ]] --[[ Name: createSessionHoverTracker ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), v5 (copy)
    local v9, v10 = v2.create(nil);
    local v11 = nil;
    local v12 = nil;
    local function v24() --[[ Line: 29 ]] --[[ Name: updateHoveredId ]]
        -- upvalues: v9 (copy), v12 (ref), v10 (copy), v11 (ref), v7 (copy), v1 (ref), v6 (ref)
        local v13 = v9.get();
        if v12 ~= nil then
            if v13 ~= nil and v13.instanceId == v12 and not v13.hoveredWithin then
                return;
            else
                v10({
                    instanceId = v12, 
                    hoveredWithin = false
                });
                return;
            end;
        elseif v11 == nil then
            if v13 ~= nil then
                v10(nil);
            end;
            return;
        else
            local v14 = v7.getFocusedRootState();
            local v15 = if v11.ancestorIdsUpToKnown then table.clone(v11.ancestorIdsUpToKnown) else {};
            table.insert(v15, 1, v11.instanceId);
            local v16 = v15[#v15];
            local v17 = v14.instanceIdsToNodes[v16];
            if v17 == nil then
                return;
            else
                local l_parent_0 = v17.parent;
                while l_parent_0 ~= nil and l_parent_0.datum.id ~= v1.rootId do
                    table.insert(v15, l_parent_0.datum.id);
                    l_parent_0 = l_parent_0.parent;
                end;
                local v19 = nil;
                for _, v21 in v15 do
                    local v22 = v14.instanceIdsToNodes[v21];
                    if v22 == nil then
                        v19 = nil;
                    elseif not v6(v22) or v19 == nil then
                        v19 = v22.datum.id;
                    end;
                end;
                if v19 ~= nil then
                    local v23 = v19 ~= v11.instanceId;
                    if v13 ~= nil and v13.hoveredWithin == v23 and v13.instanceId == v19 then
                        return;
                    else
                        v10({
                            hoveredWithin = v23, 
                            instanceId = v19
                        });
                        return;
                    end;
                else
                    warn("Couldn't find the furthest expanded hovered instance, even though we have one");
                    v10(nil);
                    return;
                end;
            end;
        end;
    end;
    local function v27(v25, v26) --[[ Line: 117 ]] --[[ Name: guestHovered ]]
        -- upvalues: v11 (ref), v24 (copy)
        v11 = {
            instanceId = v25, 
            ancestorIdsUpToKnown = v26
        };
        v24();
    end;
    local function v28() --[[ Line: 126 ]] --[[ Name: guestUnhovered ]]
        -- upvalues: v11 (ref), v24 (copy)
        v11 = nil;
        v24();
    end;
    local function v30(v29) --[[ Line: 131 ]] --[[ Name: hoverId ]]
        -- upvalues: v12 (ref), v5 (ref), v7 (copy), v24 (copy)
        if v12 == v29 then
            return;
        else
            if v5() then
                v7.guestRpcInterface.hostHovered(v29);
            end;
            v12 = v29;
            v24();
            return;
        end;
    end;
    v8.changedSignal:Connect(v24);
    return {
        hoverId = v30, 
        hoveredObservable = v9, 
        guestHovered = v27, 
        guestUnhovered = v28
    };
end;