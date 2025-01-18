local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.MarkAsSaved);
local v5 = require(l_Actions_0.SetIsSavingMaterial);
local v6 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v7 = require(l_Parent_0.Src.Thunks.UpdateMaterial);
local v8 = require(l_Parent_0.Src.Util.createMaterialVariant);
local l_join_0 = v1.join;
return function(v10, v11) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), v8 (copy), v6 (copy), v7 (copy), l_join_0 (copy), v4 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: v10 (copy), v5 (ref), v8 (ref), v6 (ref), v7 (ref), l_join_0 (ref), v4 (ref), v11 (copy)
        if not v10.IsTemporary then
            return;
        else
            local l_session_0 = v12:getState().MaterialsReducer.session;
            local l_Id_0 = v10.Id;
            v12:dispatch(v5(true));
            task.spawn(function() --[[ Line: 29 ]]
                -- upvalues: l_session_0 (copy), l_Id_0 (copy), v10 (ref), v8 (ref), v6 (ref), v12 (copy), v7 (ref), l_join_0 (ref), v4 (ref), v5 (ref), v11 (ref)
                local v15 = l_session_0:UploadMaterialAsync(l_Id_0);
                local l_MaterialVariant_0 = v10.MaterialVariant;
                if l_MaterialVariant_0 then
                    l_MaterialVariant_0.ColorMap = v15.ColorMap;
                    if v15.NormalMap then
                        l_MaterialVariant_0.NormalMap = v15.NormalMap;
                    end;
                    if v15.MetalnessMap then
                        l_MaterialVariant_0.MetalnessMap = v15.MetalnessMap;
                    end;
                    if v15.RoughnessMap then
                        l_MaterialVariant_0.RoughnessMap = v15.RoughnessMap;
                    end;
                else
                    v10.MaterialVariant = v8(v10);
                end;
                if v6() then
                    v12:dispatch(v7(l_join_0(v10, {
                        IsTemporary = false
                    })));
                else
                    v12:dispatch(v4(v10));
                end;
                v12:dispatch(v5(false));
                v11:report("saveButtonClicked", v10.MaterialVariant, v10.GenerationId);
            end);
            return;
        end;
    end;
end;