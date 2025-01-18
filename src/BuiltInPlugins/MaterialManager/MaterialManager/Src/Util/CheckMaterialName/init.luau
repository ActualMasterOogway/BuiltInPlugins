local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
local l_filter_0 = v1.Dash.filter;
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.MapMaterials);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v5 (copy), l_filter_0 (copy)
    local v9 = {};
    v5(v6, v9, function(v10) --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v8 (copy)
        return v10.MaterialVariant and v10.MaterialVariant.Name == v7 and v10.Material == v8;
    end);
    return #l_filter_0(v9, function(v11) --[[ Line: 16 ]]
        return v11 ~= false;
    end) > 1;
end;