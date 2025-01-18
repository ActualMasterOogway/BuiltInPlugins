local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
local l_filter_0 = v1.Dash.filter;
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v5 = require(l_Constants_0.getMaterialName);
local v6 = require(l_Constants_0.getMaterialPath);
local l_Util_0 = l_Parent_0.Src.Util;
local v8 = require(l_Util_0.ContainsPath);
local v9 = require(l_Util_0.DamerauLevenshteinDistance);
local v10 = require(l_Util_0.MapMaterials);
local l_getFFlagFixMaterialSearchCrash_0 = require(l_Parent_0.Src.Flags).getFFlagFixMaterialSearchCrash;
return function(v12, v13, v14) --[[ Line: 19 ]]
    -- upvalues: v10 (copy), l_filter_0 (copy), v5 (copy), l_getFFlagFixMaterialSearchCrash_0 (copy), v9 (copy), v8 (copy), v6 (copy)
    assert(v12, "Tried to get materials for path which does not exist");
    local v15 = {};
    v10(v12, v15);
    local v17 = l_filter_0(v15, function(v16) --[[ Line: 26 ]]
        return not v16.MaterialVariant;
    end);
    local v19 = l_filter_0(v15, function(v18) --[[ Line: 29 ]]
        return v18.MaterialVariant;
    end);
    table.sort(v17, function(v20, v21) --[[ Line: 33 ]]
        -- upvalues: v5 (ref)
        return v5(v20.Material) < v5(v21.Material);
    end);
    table.sort(v19, function(v22, v23) --[[ Line: 37 ]]
        return v22.MaterialVariant.Name < v23.MaterialVariant.Name;
    end);
    local v24 = {};
    for _, v26 in v19 do
        if not v24[v26.Material] then
            v24[v26.Material] = {};
        end;
        table.insert(v24[v26.Material], v26);
    end;
    local v27 = {};
    for _, v29 in v17 do
        table.insert(v27, v29);
        if v24[v29.Material] then
            for _, v31 in v24[v29.Material] do
                table.insert(v27, v31);
            end;
        end;
    end;
    v15 = v27;
    if v14 and v14 ~= "" then
        local v32 = 0;
        v14 = string.lower(v14);
        do
            local l_v32_0 = v32;
            local function v37(v34) --[[ Line: 68 ]] --[[ Name: searchFilter ]]
                -- upvalues: v5 (ref), l_getFFlagFixMaterialSearchCrash_0 (ref), v14 (ref), v9 (ref), l_v32_0 (ref), v13 (copy), v8 (ref), v6 (ref)
                local v35 = nil;
                v35 = if v34.MaterialVariant then string.lower(v34.MaterialVariant.Name) else string.lower(v5(v34.Material));
                local _ = nil;
                return (if l_getFFlagFixMaterialSearchCrash_0() then string.find(v35, v14, 1, true) or v9(v35, v14) == l_v32_0 else string.find(v35, v14) or v9(v35, v14) == l_v32_0) and (#v13 == 0 or v8(v13, v6(v34.Material)));
            end;
            local v38 = l_filter_0(v15, v37);
            if #v38 == 0 then
                l_v32_0 = 1;
                v15 = l_filter_0(v15, v37);
            else
                v15 = v38;
            end;
        end;
    else
        v15 = l_filter_0(v15, function(v39) --[[ Line: 92 ]] --[[ Name: pathFilter ]]
            -- upvalues: v13 (copy), v8 (ref), v6 (ref)
            local v40 = true;
            if #v13 ~= 0 then
                v40 = v8(v13, v6(v39.Material));
            end;
            return v40;
        end);
    end;
    return v15;
end;