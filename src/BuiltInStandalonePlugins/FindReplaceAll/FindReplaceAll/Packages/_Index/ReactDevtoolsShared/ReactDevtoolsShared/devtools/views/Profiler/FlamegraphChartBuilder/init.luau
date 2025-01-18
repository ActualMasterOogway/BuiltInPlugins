local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local v5 = {};
local _ = require(script.Parent.Parent.Parent.types);
local l_formatDuration_0 = require(script.Parent.utils).formatDuration;
local _ = require(script.Parent.types);
local v9 = l_Map_0.new();
v5.getChartData = function(v10) --[[ Line: 49 ]] --[[ Name: getChartData ]]
    -- upvalues: v9 (copy), l_Map_0 (copy), l_Set_0 (copy), l_Boolean_0 (copy), l_formatDuration_0 (copy)
    local l_commitIndex_0 = v10.commitIndex;
    local l_commitTree_0 = v10.commitTree;
    local l_profilerStore_0 = v10.profilerStore;
    local l_rootID_0 = v10.rootID;
    local v15 = l_profilerStore_0:getCommitData(l_rootID_0, l_commitIndex_0);
    local l_fiberActualDurations_0 = v15.fiberActualDurations;
    local l_fiberSelfDurations_0 = v15.fiberSelfDurations;
    local l_nodes_0 = l_commitTree_0.nodes;
    local v19 = ("%s-%s"):format(tostring(l_rootID_0), (tostring(l_commitIndex_0)));
    if v9:has(v19) then
        return (v9:get(v19));
    else
        local v20 = l_Map_0.new();
        local v21 = l_Set_0.new();
        local v22 = {};
        local v23 = 0;
        local v24 = 0;
        local function v25(v26, v27, v28) --[[ Line: 72 ]] --[[ Name: walkTree ]]
            -- upvalues: v20 (copy), l_nodes_0 (copy), l_fiberActualDurations_0 (copy), l_fiberSelfDurations_0 (copy), l_Boolean_0 (ref), l_formatDuration_0 (ref), v23 (ref), v24 (ref), v22 (copy), v25 (copy)
            v20:set(v26, v28);
            local v29 = l_nodes_0:get(v26);
            if v29 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v26))));
            end;
            local l_children_0 = v29.children;
            local l_displayName_0 = v29.displayName;
            local l_hocDisplayNames_0 = v29.hocDisplayNames;
            local l_key_0 = v29.key;
            local l_treeBaseDuration_0 = v29.treeBaseDuration;
            local v35 = l_fiberActualDurations_0:get(v26) or 0;
            local v36 = l_fiberSelfDurations_0:get(v26) or 0;
            local v37 = l_fiberActualDurations_0:has(v26);
            local v38 = l_displayName_0 or "Anonymous";
            local v39 = if l_Boolean_0.toJSBoolean(l_key_0) then (" key=\"%s\""):format((tostring(l_key_0))) else "";
            local v40 = "";
            if l_hocDisplayNames_0 ~= nil and #l_hocDisplayNames_0 > 0 then
                v40 = string.format(" (%s)", (tostring(l_hocDisplayNames_0[1])));
            end;
            local v41 = string.format("%s%s%s%s", tostring(v38), tostring(v40), tostring(v39), if v37 then string.format(" (%sms of %sms)", tostring(l_formatDuration_0(v36)), (tostring(l_formatDuration_0(v35)))) else "");
            v23 = math.max(v23, v28);
            v24 = math.max(v24, v36);
            local v42 = {
                actualDuration = v35, 
                didRender = v37, 
                id = v26, 
                label = v41, 
                name = v38, 
                offset = v27 - l_treeBaseDuration_0, 
                selfDuration = v36, 
                treeBaseDuration = l_treeBaseDuration_0
            };
            if #v22 < v28 then
                table.insert(v22, {
                    v42
                });
            else
                table.insert(v22[v28 - 1], v42);
            end;
            local v43 = #l_children_0;
            while v43 >= 1 do
                local v44 = l_children_0[v43];
                v27 = v27 - v25(v44, v27, v28).treeBaseDuration;
                v43 = v43 - 1;
            end;
            return v42;
        end;
        local v45 = 0;
        if l_nodes_0.size > 0 then
            local v46 = l_nodes_0:get(l_rootID_0);
            if v46 == nil then
                error(string.format("Could not find root node with id \"%s\" in commit tree", (tostring(l_rootID_0))));
            end;
            local v47 = #v46.children;
            while v47 >= 1 do
                local v48 = v46.children[v47];
                local v49 = l_nodes_0:get(v48);
                if v49 == nil then
                    error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v48))));
                end;
                v45 = v45 + v49.treeBaseDuration;
                v25(v48, v45, 2);
                v47 = v47 - 1;
            end;
            for v50, _ in l_fiberActualDurations_0 do
                local v52 = l_nodes_0:get(v50);
                if v52 ~= nil then
                    local l_parentID_0 = v52.parentID;
                    while l_parentID_0 ~= 0 and not v21:has(l_parentID_0) do
                        v21:add(l_parentID_0);
                        v52 = l_nodes_0:get(l_parentID_0);
                        if v52 ~= nil then
                            l_parentID_0 = v52.parentID;
                        else
                            l_parentID_0 = 0;
                        end;
                    end;
                end;
            end;
        end;
        local v54 = {
            baseDuration = v45, 
            depth = v23, 
            idToDepthMap = v20, 
            maxSelfDuration = v24, 
            renderPathNodes = v21, 
            rows = v22
        };
        v9:set(v19, v54);
        return v54;
    end;
end;
v5.invalidateChartData = function() --[[ Line: 213 ]] --[[ Name: invalidateChartData ]]
    -- upvalues: v9 (copy)
    return v9:clear();
end;
return v5;