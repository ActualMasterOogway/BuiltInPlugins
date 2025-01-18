local function v3(v0, v1) --[[ Line: 2 ]] --[[ Name: itemExistsInList ]]
    for v2 = 1, #v1 do
        if v1[v2] == v0 then
            return true;
        end;
    end;
    return false;
end;
local function v12(v4, v5) --[[ Line: 11 ]] --[[ Name: filterOutItems ]]
    local v6 = false;
    if not v4 then
        return v5;
    else
        local v7 = {};
        for v8 = 1, #v5 do
            local v9 = v5[v8];
            local v10;
            for v11 = 1, #v4 do
                if v4[v11] == v9 then
                    v10 = true;
                    v6 = true;
                end;
                if v6 then
                    break;
                end;
            end;
            if not v6 then
                v10 = false;
            end;
            v6 = false;
            if not v10 then
                table.insert(v7, v5[v8]);
            end;
        end;
        return v7;
    end;
end;
local function v18(v13, v14) --[[ Line: 26 ]] --[[ Name: listContainsAnyItems ]]
    local v15 = {};
    for v16 = 1, #v14 do
        v15[v14[v16]] = true;
    end;
    for v17 = 1, #v13 do
        if v15[v13[v17]] then
            return true;
        end;
    end;
    return false;
end;
local function v24(v19, v20) --[[ Line: 40 ]] --[[ Name: itemsHasItemNotInList ]]
    if not v20 and v19 then
        return true;
    elseif not v20 and not v19 then
        return false;
    else
        local v21 = {};
        for v22 = 1, #v20 do
            v21[v20[v22]] = true;
        end;
        for v23 = 1, #v19 do
            if not v21[v19[v23]] then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v29(v25, v26) --[[ Line: 61 ]] --[[ Name: combineLists ]]
    for _, v28 in ipairs(v26) do
        table.insert(v25, v28);
    end;
    return v25;
end;
local function v30(v31, v32) --[[ Line: 68 ]] --[[ Name: createIgnoreListGivenWhiteList ]]
    -- upvalues: v30 (copy)
    local v33 = false;
    local l_v31_Children_0 = v31:GetChildren();
    local v35 = {};
    for _, v37 in ipairs(l_v31_Children_0) do
        if v37:IsA("PartInstance") then
            local v38;
            for v39 = 1, #v32 do
                if v32[v39] == v37 then
                    v38 = true;
                    v33 = true;
                end;
                if v33 then
                    break;
                end;
            end;
            if not v33 then
                v38 = false;
            end;
            v33 = false;
            if not v38 then
                table.insert(v35, v37);
            end;
        end;
        if v37:IsA("PVInstance") and not v37:IsA("Workspace") then
            local l_v35_0 = v35;
            local v41 = v30(v37, v32);
            for _, v43 in ipairs(v41) do
                table.insert(l_v35_0, v43);
            end;
            v35 = l_v35_0;
        end;
    end;
    return v35;
end;
return {
    itemExistsInList = v3, 
    filterOutItems = v12, 
    combineLists = v29, 
    createIgnoreListGivenWhiteList = v30, 
    removeDuplicates = function(v44) --[[ Line: 82 ]] --[[ Name: removeDuplicates ]]
        local v45 = {};
        local v46 = {};
        for v47 = 1, #v44 do
            if not v46[v44[v47]] then
                v46[v44[v47]] = true;
                table.insert(v45, v44[v47]);
            end;
        end;
        return v45;
    end, 
    listDoesNotContainType = function(v48, v49) --[[ Line: 95 ]] --[[ Name: listDoesNotContainType ]]
        for v50 = 1, #v48 do
            if v48[v50]:IsA(v49) then
                return false;
            end;
        end;
        return true;
    end, 
    listContainsAnyItems = v18, 
    itemsHasItemNotInList = v24
};