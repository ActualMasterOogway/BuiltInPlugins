local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v2.join;
local l_some_0 = v2.some;
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local l_useState_0 = v5.useState;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local v12 = {};
local v13 = {
    IsPlaceholder = true
};
v12.new = function(v14, v15) --[[ Line: 68 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v12 (copy)
    return (setmetatable({
        dirty = false, 
        itemsByKey = {}, 
        lists = {}, 
        signal = l_Signal_0.new(), 
        getItemKey = v14, 
        getQueryDetails = v15, 
        load = function() --[[ Line: 83 ]] --[[ Name: load ]]

        end, 
        unload = function() --[[ Line: 84 ]] --[[ Name: unload ]]

        end
    }, {
        __index = v12
    }));
end;
v12.getList = function(v16, v17) --[[ Line: 91 ]] --[[ Name: getList ]]
    local v18 = v16.lists[v17];
    if v18 then
        return v18;
    else
        local v19 = {
            query = v17, 
            dirty = true, 
            items = {}, 
            pages = {}, 
            memberSet = {}, 
            requestedCount = nil, 
            targetCount = nil, 
            pageIndex = 0, 
            pageSize = 0
        };
        v16.lists[v17] = v19;
        return v19;
    end;
end;
v12.upsertItems = function(v20, v21) --[[ Line: 113 ]] --[[ Name: upsertItems ]]
    for _, v23 in v21 do
        v20:upsertItem(v23);
    end;
end;
v12.setItemsForPage = function(v24, v25, v26, v27) --[[ Line: 120 ]] --[[ Name: setItemsForPage ]]
    local v28 = v24:getList(v25);
    for _, v30 in v27 do
        local v31 = v24.getItemKey(v30);
        v28.memberSet[v31] = nil;
    end;
    v28.pages[v26 + 1] = {};
    v24:upsertItemsForList(v25, v26, v27);
end;
v12.upsertItemsForList = function(v32, v33, v34, v35) --[[ Line: 132 ]] --[[ Name: upsertItemsForList ]]
    for _, v37 in v35 do
        v32:upsertItemForList(v33, v34, v37);
    end;
end;
v12.upsertItem = function(v38, v39) --[[ Line: 139 ]] --[[ Name: upsertItem ]]
    -- upvalues: l_some_0 (copy), l_join_0 (copy)
    local v40 = v38.getItemKey(v39);
    local v41 = v38.itemsByKey[v40] or {};
    if not l_some_0(v39, function(v42, v43) --[[ Line: 143 ]]
        -- upvalues: v41 (copy)
        return v41[v43] ~= v42;
    end) then
        return false;
    else
        v38.itemsByKey[v40] = l_join_0(v41, v39);
        for _, v45 in v38.lists do
            if v45.memberSet[v40] then
                v38:dirtyList(v45);
            end;
        end;
        return true;
    end;
end;
v12.upsertItemForList = function(v46, v47, v48, v49) --[[ Line: 162 ]] --[[ Name: upsertItemForList ]]
    -- upvalues: l_insert_0 (copy)
    local v50 = v46:upsertItem(v49);
    local v51 = v46.getItemKey(v49);
    local v52 = v46:getList(v47);
    if not v52.memberSet[v51] then
        v52.memberSet[v51] = true;
        local v53 = v52.pages[v48 + 1] or {};
        l_insert_0(v53, v51);
        v52.pages[v48 + 1] = v53;
        v46:dirtyList(v52);
        return;
    else
        if v50 then
            v46:dirtyList(v52);
        end;
        return;
    end;
end;
v12.setTargetCount = function(v54, v55, v56) --[[ Line: 180 ]] --[[ Name: setTargetCount ]]
    local v57 = v54:getList(v55);
    v57.targetCount = v56;
    v54:dirtyList(v57);
end;
v12.updateItemsByFilter = function(v58, v59) --[[ Line: 186 ]] --[[ Name: updateItemsByFilter ]]
    for _, v61 in v58.itemsByKey do
        local v62 = v59(v61);
        if v62 then
            v58:upsertItem(v62);
        end;
    end;
end;
v12.updateItemsInListByFilter = function(v63, v64, v65) --[[ Line: 195 ]] --[[ Name: updateItemsInListByFilter ]]
    for v66 in v63:getList(v64).memberSet do
        local v67 = v65(v63.itemsByKey[v66]);
        if v67 then
            v63:upsertItem(v67);
        end;
    end;
end;
v12.deleteItem = function(v68, v69) --[[ Line: 206 ]] --[[ Name: deleteItem ]]
    if not v68.itemsByKey[v69] then
        return false;
    else
        for _, v71 in v68.lists do
            v68:removeItemFromList(v71, v69);
        end;
        return true;
    end;
end;
v12.removeItemFromList = function(v72, v73, v74) --[[ Line: 218 ]] --[[ Name: removeItemFromList ]]
    if not v73.memberSet[v74] then
        return false;
    else
        v73.memberSet[v74] = nil;
        if v73.targetCount and v73.targetCount > 0 then
            v73.targetCount = v73.targetCount - 1;
        end;
        v72:dirtyList(v73);
        for _, v76 in v73.pages do
            for v77 = #v76, 1, -1 do
                if v76[v77] == v74 then
                    table.remove(v76, v77);
                end;
            end;
        end;
        return true;
    end;
end;
v12.dirtyList = function(v78, v79) --[[ Line: 244 ]] --[[ Name: dirtyList ]]
    if not v79.dirty then
        v79.dirty = true;
    end;
    v78:dirtyCache();
end;
v12.dirtyCache = function(v80) --[[ Line: 251 ]] --[[ Name: dirtyCache ]]
    if v80.dirty then
        return;
    else
        v80.dirty = true;
        task.defer(function() --[[ Line: 256 ]]
            -- upvalues: v80 (copy)
            v80:refresh();
        end);
        return;
    end;
end;
v12.refresh = function(v81) --[[ Line: 261 ]] --[[ Name: refresh ]]
    v81.dirty = false;
    for _, v83 in v81.lists do
        if v83.dirty then
            v81:updateList(v83);
        end;
    end;
    v81.signal:Fire();
end;
v12.updateList = function(v84, v85) --[[ Line: 275 ]] --[[ Name: updateList ]]
    -- upvalues: l_insert_0 (copy), l_sort_0 (copy), v13 (copy)
    v85.dirty = false;
    local v86 = {};
    for _, v88 in v85.pages do
        for _, v90 in v88 do
            local v91 = v84.itemsByKey[v90];
            if v91 then
                l_insert_0(v86, v91);
            end;
        end;
    end;
    if v85.sortFn then
        l_sort_0(v86, v85.sortFn);
    end;
    local v92 = v85.targetCount or 50;
    if v85.targetCount == nil or #v86 < v92 then
        for _ = 1, math.min(6, v92 - #v86) do
            l_insert_0(v86, v13);
        end;
    end;
    v85.items = v86;
end;
v12.use = function(v94, v95, v96, v97) --[[ Line: 304 ]] --[[ Name: use ]]
    -- upvalues: v9 (copy), l_useState_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy)
    local v98 = v9:use();
    local v99 = v94:getList(v96);
    local v100, v101 = l_useState_0(v99.items);
    local v102 = v94.getQueryDetails(v95);
    l_useEffect_0(function() --[[ Line: 310 ]]
        -- upvalues: v100 (copy), v99 (copy), v101 (copy), v94 (copy), v102 (copy), v97 (copy), v95 (copy), v96 (copy), v98 (copy)
        if v100 ~= v99.items then
            v101(v99.items);
        end;
        local v103 = v94.signal:Connect(function() --[[ Line: 316 ]]
            -- upvalues: v101 (ref), v99 (ref)
            v101(v99.items);
        end);
        if v99.targetCount == nil and v99.requestedCount == nil then
            v99.requestedCount = v102.pageSize;
            v99.pageSize = v102.pageSize;
            v99.sortFn = v102.sortFn;
            v97(v95, 0, v96, v98);
        end;
        if v99.dirty then
            v94:refresh();
        end;
        return function() --[[ Line: 334 ]]
            -- upvalues: v103 (copy), v102 (ref), v99 (ref)
            v103:Disconnect();
            if v102.alwaysRefetch then
                v99.pageIndex = 0;
                v99.requestedCount = nil;
                v99.targetCount = nil;
            end;
        end;
    end, {
        v96
    });
    local v109 = l_useCallback_0(function(_, v105) --[[ Line: 348 ]]
        -- upvalues: v99 (copy), v102 (copy), v97 (copy), v95 (copy), v96 (copy), v98 (copy)
        local l_targetCount_0 = v99.targetCount;
        if not l_targetCount_0 then
            return;
        else
            local v107 = math.min(l_targetCount_0, v105);
            if v99.requestedCount ~= nil and v99.requestedCount < v107 then
                v99.requestedCount = math.min(v99.requestedCount + v102.pageSize, l_targetCount_0);
                local l_v99_0 = v99;
                l_v99_0.pageIndex = l_v99_0.pageIndex + 1;
                v97(v95, v99.pageIndex, v96, v98);
            end;
            return;
        end;
    end, {
        v96
    });
    return v100, v99.targetCount, v109;
end;
v12.reset = function(v110) --[[ Line: 366 ]] --[[ Name: reset ]]
    v110.dirty = false;
    v110.itemsByKey = {};
    v110.lists = {};
end;
return v12;