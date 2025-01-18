local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.AddGeneratedMaterials);
local v6 = require(l_Actions_0.ClearSelectedMaterial);
local v7 = require(l_Actions_0.MarkAsSaved);
local v8 = require(l_Actions_0.RemoveAllMaterials);
local v9 = require(l_Actions_0.DEPRECATED_RemoveMaterial);
local v10 = require(l_Actions_0.SetBaseMaterial);
local v11 = require(l_Actions_0.SetMaterialGenerationSession);
local v12 = require(l_Actions_0.SetMaterials);
local v13 = require(l_Actions_0.SetSelectedMaterial);
local v14 = require(l_Actions_0.UpdateMaterialTextures);
local v15 = require(l_Actions_0.SetInitialImageId);
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local _ = require(l_Parent_0.Src.Util.createGeneratedMaterial);
local l_append_0 = v1.append;
local l_collectArray_0 = v1.collectArray;
local l_join_0 = v1.join;
local _ = v1.map;
local v22 = {
    materials = {}, 
    initialImageId = nil, 
    selectedMaterial = nil, 
    session = nil
};
return (v2.createReducer(v22, {
    [v5.name] = function(v23, v24) --[[ Line: 50 ]]
        -- upvalues: l_join_0 (copy), l_append_0 (copy)
        return l_join_0(v23, {
            materials = l_append_0({}, v24.materials, v23.materials)
        });
    end, 
    [v6.name] = if v16() then nil else function(v25, _) --[[ Line: 58 ]]
        -- upvalues: l_join_0 (copy), v1 (copy)
        return l_join_0(v25, {
            selectedMaterial = v1.None
        });
    end, 
    [v15.name] = function(v27, v28) --[[ Line: 64 ]]
        -- upvalues: l_join_0 (copy), v1 (copy)
        return l_join_0(v27, {
            initialImageId = v28.initialImageId or v1.None
        });
    end, 
    [v7.name] = if v16() then nil else function(v29, v30) --[[ Line: 72 ]]
        -- upvalues: l_collectArray_0 (copy), l_join_0 (copy)
        local v33 = l_collectArray_0(v29.materials, function(_, v32) --[[ Line: 73 ]]
            -- upvalues: v30 (copy)
            if v32.Id == v30.material.Id then
                v32.IsTemporary = false;
                if v32.MaterialVariant then
                    v32.MaterialVariant.Archivable = true;
                end;
            end;
            return v32;
        end);
        return l_join_0(v29, {
            materials = v33
        });
    end, 
    [v8.name] = function(v34, _) --[[ Line: 88 ]]
        -- upvalues: l_join_0 (copy), v1 (copy)
        return l_join_0(v34, {
            materials = {}, 
            selectedMaterial = v1.None
        });
    end, 
    [v9.name] = if v16() then nil else function(v36, v37) --[[ Line: 97 ]]
        -- upvalues: l_collectArray_0 (copy), v1 (copy), l_join_0 (copy)
        local v40 = l_collectArray_0(v36.materials, function(_, v39) --[[ Line: 98 ]]
            -- upvalues: v37 (copy)
            if v39 == v37.material then
                return nil;
            else
                return v39;
            end;
        end);
        local v41 = nil;
        if v36.selectedMaterial == v37.material then
            v41 = v1.None;
        end;
        return l_join_0(v36, {
            materials = v40, 
            selectedMaterial = v41
        });
    end, 
    [v10.name] = if v16() then nil else function(v42, v43) --[[ Line: 119 ]]
        -- upvalues: l_collectArray_0 (copy), l_join_0 (copy)
        local v46 = l_collectArray_0(v42.materials, function(_, v45) --[[ Line: 120 ]]
            -- upvalues: v42 (copy), v43 (copy)
            if v45 == v42.selectedMaterial then
                v45.BaseMaterial = v43.baseMaterial;
                if v45.MaterialVariant then
                    v45.MaterialVariant.BaseMaterial = v43.baseMaterial;
                end;
            end;
            return v45;
        end);
        return l_join_0(v42, {
            materials = v46
        });
    end, 
    [v11.name] = function(v47, v48) --[[ Line: 135 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v47, {
            session = v48.session
        });
    end, 
    [v12.name] = v16() and function(v49, v50) --[[ Line: 145 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v49, {
            materials = v50.materials
        });
    end or nil, 
    [v13.name] = function(v51, v52) --[[ Line: 152 ]]
        -- upvalues: l_join_0 (copy), v1 (copy)
        return l_join_0(v51, {
            selectedMaterial = v52.selectedMaterial or v1.None
        });
    end, 
    [v14.name] = if v16() then nil else function(v53, v54) --[[ Line: 160 ]]
        -- upvalues: l_collectArray_0 (copy), l_join_0 (copy)
        local v59 = l_collectArray_0(v53.materials, function(_, v56) --[[ Line: 161 ]]
            -- upvalues: v54 (copy), l_join_0 (ref)
            if v56 == v54.material then
                v56.Textures = l_join_0(v56.Textures, v54.textures);
                local l_Textures_0 = v56.Textures;
                local l_MaterialVariant_0 = v56.MaterialVariant;
                if l_Textures_0.ColorMap then
                    l_MaterialVariant_0.ColorMap = l_Textures_0.ColorMap;
                end;
                if l_Textures_0.MetalnessMap then
                    l_MaterialVariant_0.MetalnessMap = l_Textures_0.MetalnessMap;
                end;
                if l_Textures_0.NormalMap then
                    l_MaterialVariant_0.NormalMap = l_Textures_0.NormalMap;
                end;
                if l_Textures_0.RoughnessMap then
                    l_MaterialVariant_0.RoughnessMap = l_Textures_0.RoughnessMap;
                end;
            end;
            return v56;
        end);
        return l_join_0(v53, {
            materials = v59
        });
    end
}));