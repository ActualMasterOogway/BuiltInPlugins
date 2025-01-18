local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.concatList);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v6 = require(l_script_FirstAncestor_0.Util.getExplorerNodeIndex);
local v7 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v8 = require(l_script_FirstAncestor_0.Util.isNodeVisible);
local function _(v9, v10) --[[ Line: 14 ]] --[[ Name: getStartingFromNode ]]
    for v11 = #v10, 1, -1 do
        local v12 = v10[v11];
        local v13 = v9.instanceIdsToNodes[v12];
        if v13 ~= nil then
            return v13;
        end;
    end;
    return nil;
end;
local function v19(v15, v16, v17) --[[ Line: 29 ]] --[[ Name: clearSelectedChildren ]]
    -- upvalues: v2 (copy)
    for v18 in v2.iterate(v15) do
        if v16[v18.datum.id] then
            v17[v18.datum.id] = true;
        end;
    end;
end;
local function _(v20, v21) --[[ Line: 41 ]] --[[ Name: getChildren ]]
    -- upvalues: v7 (copy)
    if v7(v21) then
        return v21.children;
    else
        return v20.instanceIdsToHiddenChildren[v21.datum.id];
    end;
end;
local function v37(v23, v24, v25, v26, v27) --[[ Line: 48 ]] --[[ Name: massage ]]
    -- upvalues: v2 (copy), v7 (copy), v19 (copy)
    local function v31(v28) --[[ Line: 62 ]] --[[ Name: allChildrenSelected ]]
        -- upvalues: v2 (ref), v25 (copy)
        local v29 = true;
        for v30 in v2.iterate(v28) do
            if not v25[v30.datum.id] then
                return false;
            end;
        end;
        return v29;
    end;
    local v32 = {};
    for _, v34 in v24 do
        local v35 = v23.instanceIdsToNodes[v34];
        assert(v35 ~= nil, "Can't find node to check for all children on");
        if not v35.parent or not v25[v35.parent.datum.id] or v26[v35.parent.datum.id] then
            local v36 = if v27[v34] then if v7(v35) then v35.children else v23.instanceIdsToHiddenChildren[v35.datum.id] else v35.children;
            if v27[v34] or v36 == nil or v31(v36) then
                if v36 ~= nil then
                    v19(v36, v25, v26);
                end;
                table.insert(v32, v34);
            else
                v26[v34] = true;
            end;
        end;
    end;
    return v32;
end;
local function _(v38) --[[ Line: 107 ]] --[[ Name: reverseList ]]
    for v39 = 1, #v38 // 2 do
        local v40 = #v38 - (v39 - 1);
        local v41 = v38[v39];
        local v42 = v38[v40];
        v38[v39] = v41;
        v38[v40] = v42;
    end;
end;
local function v47(v44) --[[ Line: 114 ]] --[[ Name: getLowestVisibleNode ]]
    -- upvalues: v7 (copy)
    local v45 = nil;
    local l_v44_0 = v44;
    while l_v44_0.parent ~= nil do
        if not v7(l_v44_0.parent) then
            v45 = l_v44_0.parent;
        end;
        l_v44_0 = l_v44_0.parent;
    end;
    return v45;
end;
local function v53(v48, v49) --[[ Line: 134 ]] --[[ Name: getDirection ]]
    -- upvalues: v8 (copy), v6 (copy), v47 (copy)
    assert(v8(v49), "'to' must be visible");
    assert(not v8(v48), "'from' must not be visible");
    local v50 = v6(v49);
    local v51 = v47(v48);
    assert(v51 ~= nil, "Couldn't find a lowest visible node--this implies that 'from' is visible");
    local v52 = v6(v51);
    if v52 == v50 then
        return 1;
    else
        return (math.sign(v50 - v52));
    end;
end;
local function v58(v54, v55) --[[ Line: 150 ]] --[[ Name: getExplorerNodeDescendantIndexInParent ]]
    -- upvalues: v7 (copy), v2 (copy)
    assert(v55.parent ~= nil, "explorerNode.parent is nil, which indicates that explorerNode is visible");
    local l_parent_0 = v55.parent;
    local v57 = if v7(l_parent_0) then l_parent_0.children else v54.instanceIdsToHiddenChildren[l_parent_0.datum.id];
    assert(v57 ~= nil, "parentChildren is nil when getting from explorerNode.parent");
    l_parent_0 = 1;
    while v2.getNthDescendant(v57, l_parent_0) ~= v55 do
        l_parent_0 = l_parent_0 + 1;
    end;
    return l_parent_0;
end;
local function v59(v60, v61, v62, v63, v64) --[[ Line: 170 ]] --[[ Name: fillHiddenIdsInBetween ]]
    -- upvalues: v8 (copy), v7 (copy), v2 (copy), v59 (copy)
    if v8(v61) then
        return;
    else
        assert(v61.parent ~= nil, "getHiddenIdsInBetween should not be called with root");
        local l_parent_1 = v61.parent;
        local v66 = if v7(l_parent_1) then l_parent_1.children else v60.instanceIdsToHiddenChildren[l_parent_1.datum.id];
        if v66 then
            for v67 in v2.iterateSiblings(v66, v61, v63) do
                table.insert(v64, v67.datum.id);
            end;
        end;
        l_parent_1 = v61.parent;
        if v63 == 1 then
            if v61.parent.parent == nil then
                return;
            else
                local l_parent_2 = v61.parent.parent;
                local v69 = if v7(l_parent_2) then l_parent_2.children else v60.instanceIdsToHiddenChildren[l_parent_2.datum.id];
                assert(v69, "We just checked parent.parent above");
                l_parent_2 = v2.iterateSiblings(v69, v61.parent, 1);
                local _ = l_parent_2();
                local v71 = l_parent_2();
                if v71 == nil then
                    return;
                else
                    l_parent_1 = v71;
                end;
            end;
        end;
        v59(v60, l_parent_1, v62, v63, v64);
        return;
    end;
end;
local function _(v72, v73) --[[ Line: 224 ]] --[[ Name: getNextSibling ]]
    -- upvalues: v7 (copy), v2 (copy)
    local l_parent_3 = v73.parent;
    if l_parent_3 == nil then
        return nil;
    else
        local v75 = if v7(l_parent_3) then l_parent_3.children else v72.instanceIdsToHiddenChildren[l_parent_3.datum.id];
        assert(v75, "Node known to be visible");
        local v76 = v2.iterateSiblings(v75, v73, 1);
        v76();
        return v76();
    end;
end;
local function v88(v78, v79) --[[ Line: 240 ]] --[[ Name: findNextClosestNode ]]
    -- upvalues: v7 (copy), v2 (copy)
    local l_parent_4 = v79.parent;
    assert(l_parent_4 ~= nil, "findNextClosestNode should not be called with root");
    if l_parent_4.parent == nil then
        return nil;
    else
        local l_l_parent_4_0 = l_parent_4;
        local l_parent_5 = l_l_parent_4_0.parent;
        local v83;
        if l_parent_5 == nil then
            v83 = nil;
        else
            local v84 = if v7(l_parent_5) then l_parent_5.children else v78.instanceIdsToHiddenChildren[l_parent_5.datum.id];
            assert(v84, "Node known to be visible");
            local v85 = v2.iterateSiblings(v84, l_l_parent_4_0, 1);
            v85();
            v83 = v85();
        end;
        while true do
            if v83 == nil then
                l_parent_4 = l_parent_4.parent;
                if l_parent_4.parent == nil then
                    return nil;
                else
                    l_l_parent_4_0 = l_parent_4;
                    l_parent_5 = l_l_parent_4_0.parent;
                    if l_parent_5 == nil then
                        v83 = nil;
                    else
                        local v86 = if v7(l_parent_5) then l_parent_5.children else v78.instanceIdsToHiddenChildren[l_parent_5.datum.id];
                        assert(v86, "Node known to be visible");
                        local v87 = v2.iterateSiblings(v86, l_l_parent_4_0, 1);
                        v87();
                        v83 = v87();
                    end;
                end;
            else
                return v83;
            end;
        end;
    end;
end;
local function v89(v90, v91, v92, v93, v94, v95) --[[ Line: 260 ]] --[[ Name: fillInHiddenSearchedIdsBetween ]]
    -- upvalues: v8 (copy), v58 (copy), v7 (copy), v2 (copy), v88 (copy), v89 (copy)
    if v8(v92) then
        return;
    else
        assert(v92.parent ~= nil, "getHiddenIdsInBetween should not be called with root");
        local v96 = v58(v91, v92);
        assert(v96 ~= 0, "indexFrom == 0");
        local l_parent_6 = v92.parent;
        local v98 = if v7(l_parent_6) then l_parent_6.children else v91.instanceIdsToHiddenChildren[l_parent_6.datum.id];
        assert(v98 ~= nil, "parentChildren should not be nil, because we should not be visible");
        if v92.parent == v93 then
            v94 = -1;
        end;
        l_parent_6 = v96;
        while l_parent_6 > 0 do
            local v99 = v2.getNthDescendant(v98, l_parent_6);
            if v99 ~= nil then
                if v90.isInstanceIdSearched(v99.datum.id) then
                    table.insert(v95, v99.datum.id);
                end;
                l_parent_6 = l_parent_6 + v94;
            else
                break;
            end;
        end;
        local v100 = if v94 == 1 then v88(v91, v92) else v92.parent;
        if v100 == nil then
            return;
        else
            v89(v90, v91, v100, v93, v94, v95);
            return;
        end;
    end;
end;
return function(v101, v102, v103, v104) --[[ Line: 307 ]] --[[ Name: shiftClick ]]
    -- upvalues: v1 (copy), v6 (copy), v8 (copy), v53 (copy), v89 (copy), v59 (copy), v47 (copy), v2 (copy), v4 (copy), v37 (copy), v7 (copy), v19 (copy)
    local v105 = false;
    local v106 = if v104 then v104.set else v101.selectedIdsObservable.get();
    if next(v106) == nil then
        v101.selectIds(table.freeze({
            v103
        }));
        return;
    else
        local v107 = if v104 then v104.array else v101.selectedIdsArrayObservable.get();
        local v108 = v102.getFocusedRootState();
        local v109 = v108.instanceIdsToNodes[v1.rootId];
        assert(v109 ~= nil, "No root node");
        local v110;
        for v111 = #v107, 1, -1 do
            local v112 = v107[v111];
            local v113 = v108.instanceIdsToNodes[v112];
            if v113 ~= nil then
                v110 = v113;
                v105 = true;
            end;
            if v105 then
                break;
            end;
        end;
        if not v105 then
            v110 = nil;
        end;
        v105 = false;
        if v110 == nil then
            return;
        else
            local v114 = v108.instanceIdsToNodes[v103];
            assert(v114 ~= nil, "Shift-clicking on unknown instance");
            local v115 = v6(v114);
            local v116 = nil;
            local v117 = table.clone(v106);
            local v118 = {};
            local v119 = {};
            local function _(v120) --[[ Line: 345 ]] --[[ Name: tryAddToSelection ]]
                -- upvalues: v106 (copy), v119 (ref), v117 (copy)
                if v106[v120] then
                    return;
                else
                    table.insert(v119, v120);
                    v117[v120] = true;
                    return;
                end;
            end;
            local v122 = {};
            local v123 = v101.isInstanceIdSearched(v110.datum.id) and v101.isInstanceIdSearched(v114.datum.id);
            if v8(v110) then
                v116 = v6(v110);
            else
                local v124 = v53(v110, v114);
                local v125 = {};
                if v123 then
                    v89(v101, v108, v110, v114, v124, v125);
                else
                    v59(v108, v110, v114, v124, v125);
                end;
                local v126 = nil;
                local v127 = v124 == 1 and 1 or #v125;
                local v128 = if v124 == 1 then #v125 else 1;
                for v129 = v127, v128, v124 do
                    local v130 = v125[v129];
                    v126 = v130;
                    v122[v130] = true;
                    if not v106[v130] then
                        table.insert(v119, v130);
                        v117[v130] = true;
                    end;
                end;
                assert(v126 ~= nil, "Couldn't find last ID for last node");
                v128 = v108.instanceIdsToNodes[v126];
                assert(v128 ~= nil, "Couldn't find last node");
                local v131 = v47(v128);
                assert(v131 ~= nil, "Couldn't find lowest visible node for last node, which implies it is visible, which it shouldn't be");
                v116 = if v123 and v114 == v110.parent then v6(v131) else v6(v131) + v124;
            end;
            local v132 = math.sign(v115 - v116);
            if v132 == 0 then
                v132 = -1;
            end;
            for v133 = v116, v115 - v132, v132 do
                local v134 = v2.getNthDescendant(v109.children, v133);
                assert(v134 ~= nil, "Could not find node in between items");
                if v123 then
                    if v101.isInstanceIdSearched(v134.datum.id) then
                        local l_id_0 = v134.datum.id;
                        if not v106[l_id_0] then
                            table.insert(v119, l_id_0);
                            v117[l_id_0] = true;
                        end;
                    end;
                else
                    local l_id_1 = v134.datum.id;
                    if not v106[l_id_1] then
                        table.insert(v119, l_id_1);
                        v117[l_id_1] = true;
                    end;
                end;
            end;
            local v137 = {};
            if v123 then
                table.insert(v119, v103);
                v4(v137, v107);
                v4(v137, v119);
            else
                if v132 == 1 then
                    local l_v119_0 = v119;
                    for v139 = 1, #l_v119_0 // 2 do
                        local v140 = #l_v119_0 - (v139 - 1);
                        local v141 = l_v119_0[v139];
                        local v142 = l_v119_0[v140];
                        l_v119_0[v139] = v141;
                        l_v119_0[v140] = v142;
                    end;
                end;
                v119 = v37(v108, v119, v117, v118, v122);
                if v132 == 1 then
                    local l_v119_1 = v119;
                    for v144 = 1, #l_v119_1 // 2 do
                        local v145 = #l_v119_1 - (v144 - 1);
                        local v146 = l_v119_1[v144];
                        local v147 = l_v119_1[v145];
                        l_v119_1[v144] = v146;
                        l_v119_1[v145] = v147;
                    end;
                end;
                if v114.parent == nil or not v117[v114.parent.datum.id] or v118[v114.parent.datum.id] then
                    local v148 = if v7(v114) then v114.children else v108.instanceIdsToHiddenChildren[v114.datum.id];
                    if not v106[v103] and v148 ~= nil then
                        v19(v148, v117, v118);
                    end;
                    table.insert(v119, v103);
                end;
                for _, v150 in v107 do
                    if not v118[v150] then
                        table.insert(v137, v150);
                    end;
                end;
                for _, v152 in v119 do
                    if not v118[v152] then
                        table.insert(v137, v152);
                    end;
                end;
            end;
            v101.selectIds(table.freeze(v137));
            return;
        end;
    end;
end;