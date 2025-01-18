local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Dash);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.AddGeneratedMaterials);
local v5 = require(l_Actions_0.SetGenerationError);
local v6 = require(l_Actions_0.UpdateMaterialTextures);
local v7 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v8 = require(l_Parent_0.Src.Thunks.UpdateMaterial);
local l_Util_0 = l_Parent_0.Src.Util;
local v10 = require(l_Util_0.createGeneratedMaterial);
local v11 = require(l_Util_0.generateMaterialMaps);
local l_collectArray_0 = v2.collectArray;
local l_joinDeep_0 = v2.joinDeep;
local l_map_0 = v2.map;
return function(v15, v16, v17, v18) --[[ Line: 23 ]]
    -- upvalues: l_collectArray_0 (copy), l_map_0 (copy), v10 (copy), v4 (copy), v11 (copy), v7 (copy), l_joinDeep_0 (copy), v8 (copy), v6 (copy), v5 (copy)
    return function(v19) --[[ Line: 24 ]]
        -- upvalues: v18 (copy), l_collectArray_0 (ref), l_map_0 (ref), v16 (copy), v10 (ref), v15 (copy), v17 (copy), v4 (ref), v11 (ref), v7 (ref), l_joinDeep_0 (ref), v8 (ref), v6 (ref), v5 (ref)
        local v20 = v18:getServiceInstance("MaterialService");
        local v23 = l_collectArray_0(v20:GetDescendants(), function(_, v22) --[[ Line: 26 ]]
            if v22:IsA("MaterialVariant") then
                return v22.Name;
            else
                return nil;
            end;
        end);
        local v26 = l_map_0(v16, function(v24) --[[ Line: 30 ]]
            -- upvalues: v10 (ref), v15 (ref), v23 (copy), v17 (ref)
            local v25 = v10(v15, v24, v23);
            v25.GenerationId = v17;
            table.insert(v23, v25.Name);
            return v25;
        end);
        v19:dispatch(v4(v26));
        local l_session_0 = v19:getState().MaterialsReducer.session;
        for _, v29 in v26 do
            v11(l_session_0, v29):andThen(function(v30) --[[ Line: 43 ]]
                -- upvalues: v7 (ref), l_joinDeep_0 (ref), v29 (copy), v19 (copy), v8 (ref), v6 (ref)
                if v7() then
                    local v31 = l_joinDeep_0(v29, {
                        Textures = v30
                    });
                    v19:dispatch(v8(v31));
                    return;
                else
                    v19:dispatch(v6(v29, v30));
                    return;
                end;
            end, function(v32) --[[ Line: 50 ]]
                -- upvalues: v19 (copy), v5 (ref)
                v19:dispatch(v5(v32.ErrorType, v32.ErrorMessage));
            end);
        end;
    end;
end;