local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.MaterialFramework);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_StudioServices_0 = v1.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SetSelectedMaterial);
local v6 = require(l_Actions_0.SetTextPrompt);
local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v9 = require(l_Thunks_0.GenerateImages);
return function() --[[ Line: 27 ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy), l_StudioServices_0 (copy), v9 (copy), v5 (copy)
    local v10 = v2.Store.new(v7, nil, {
        v2.thunkMiddleware
    });
    v10:dispatch(v6("ancient stone wall"));
    local v11 = l_StudioServices_0.new(true);
    v10:dispatch(v9(v11));
    local l_materials_0 = v10:getState().MaterialsReducer.materials;
    v10:dispatch(v5(l_materials_0[1]));
    return v10;
end;