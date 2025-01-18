local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetMaterials);
local v5 = require(l_Actions_0.SetSelectedMaterial);
local l_filter_0 = v1.filter;
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), l_filter_0 (copy), v4 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v7 (copy), v5 (ref), l_filter_0 (ref), v4 (ref)
        local l_MaterialsReducer_0 = v8:getState().MaterialsReducer;
        if l_MaterialsReducer_0.selectedMaterial == v7 then
            v8:dispatch(v5(nil));
        end;
        local v11 = l_filter_0(l_MaterialsReducer_0.materials, function(v10) --[[ Line: 20 ]]
            -- upvalues: v7 (ref)
            return v10 ~= v7;
        end);
        v8:dispatch(v4(v11));
    end;
end;