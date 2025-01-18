local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v1.AssetInfoField;
local v3 = {};
local function _(v4, v5, v6) --[[ Line: 13 ]] --[[ Name: compareImpl ]]
    if v4 == v5 then
        return 0;
    else
        local v7 = v6 and 1 or -1;
        if v4 < v5 then
            return v7;
        else
            return -v7;
        end;
    end;
end;
local function _(v9, v10, v11, v12) --[[ Line: 22 ]] --[[ Name: defaultCompare ]]
    local v13 = v9[v12];
    local v14 = v10[v12];
    if v13 == v14 then
        return 0;
    else
        local v15 = v11 and 1 or -1;
        if v13 < v14 then
            return v15;
        else
            return -v15;
        end;
    end;
end;
v3[l_AssetInfoField_0.DisplayName] = function(v17, v18, v19) --[[ Line: 31 ]]
    local v20 = string.lower(v17.DisplayName);
    local v21 = string.lower(v18.DisplayName);
    if v20 == v21 then
        return 0;
    else
        local v22 = v19 and 1 or -1;
        if v20 < v21 then
            return v22;
        else
            return -v22;
        end;
    end;
end;
v3[l_AssetInfoField_0.Created] = function(v23, v24, v25) --[[ Line: 39 ]]
    local l_UnixTimestamp_0 = v23.Created.UnixTimestamp;
    local l_UnixTimestamp_1 = v24.Created.UnixTimestamp;
    if l_UnixTimestamp_0 == l_UnixTimestamp_1 then
        return 0;
    else
        local v28 = v25 and 1 or -1;
        if l_UnixTimestamp_0 < l_UnixTimestamp_1 then
            return v28;
        else
            return -v28;
        end;
    end;
end;
v3[l_AssetInfoField_0.Modified] = function(v29, v30, v31) --[[ Line: 47 ]]
    local l_UnixTimestamp_2 = v29.Modified.UnixTimestamp;
    local l_UnixTimestamp_3 = v30.Modified.UnixTimestamp;
    if l_UnixTimestamp_2 == l_UnixTimestamp_3 then
        return 0;
    else
        local v34 = v31 and 1 or -1;
        if l_UnixTimestamp_2 < l_UnixTimestamp_3 then
            return v34;
        else
            return -v34;
        end;
    end;
end;
v3[l_AssetInfoField_0.Creator] = function(v35, v36, v37) --[[ Line: 55 ]]
    local v38 = string.lower(v35.Creator.Name);
    local v39 = string.lower(v36.Creator.Name);
    if v38 == v39 then
        return 0;
    else
        local v40 = v37 and 1 or -1;
        if v38 < v39 then
            return v40;
        else
            return -v40;
        end;
    end;
end;
for _, v42 in v1.getEnumAsList(l_AssetInfoField_0) do
    if not v3[v42] then
        v3[v42] = function(v43, v44, v45) --[[ Line: 66 ]]
            -- upvalues: v42 (copy)
            local l_v42_0 = v42;
            local v47 = v43[l_v42_0];
            local v48 = v44[l_v42_0];
            if v47 == v48 then
                return 0;
            else
                local v49 = v45 and 1 or -1;
                if v47 < v48 then
                    return v49;
                else
                    return -v49;
                end;
            end;
        end;
    end;
end;
return v3;