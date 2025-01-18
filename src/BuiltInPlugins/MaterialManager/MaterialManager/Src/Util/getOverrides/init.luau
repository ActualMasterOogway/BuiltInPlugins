local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_filter_0 = require(l_Parent_0.Packages.Framework).Dash.filter;
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v4 = require(l_Constants_0.getMaterialName);
local l_Util_0 = l_Parent_0.Src.Util;
local v6 = require(l_Util_0.MapMaterials);
return function(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), v4 (copy), l_filter_0 (copy)
    local v10 = 0;
    local v11 = {};
    local v12 = {};
    v6(v8, v11, function(v13) --[[ Line: 20 ]]
        -- upvalues: v9 (copy)
        if v13.MaterialVariant and v13.Material == v9 then
            return v13.MaterialVariant.Name;
        else
            return "";
        end;
    end);
    table.insert(v11, v4(v9));
    table.sort(v11);
    v11 = l_filter_0(v11, function(v14) --[[ Line: 31 ]]
        -- upvalues: v12 (copy), v7 (copy), v10 (ref)
        if v14 == "" or v12[v14] then
            return false;
        else
            if not v12[v7] then
                v10 = v10 + 1;
            end;
            v12[v14] = true;
            return true;
        end;
    end);
    table.insert(v11, 1, "None");
    if v7 == "" or not v12[v7] then
        return v11, 1;
    else
        return v11, v10 + 1;
    end;
end;