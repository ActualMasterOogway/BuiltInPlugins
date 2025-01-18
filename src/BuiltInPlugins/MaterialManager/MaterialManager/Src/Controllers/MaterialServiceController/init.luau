local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local _ = require(l_Parent_0.Src.Reducers.MaterialBrowserReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.ClearMaterialWrapper);
local v8 = require(l_Actions_0.SetMaterialOverride);
local v9 = require(l_Actions_0.SetMaterialOverrides);
local v10 = require(l_Actions_0.SetMaterial);
local v11 = require(l_Actions_0.SetMaterialList);
local v12 = require(l_Actions_0.SetMaterialStatus);
local v13 = require(l_Actions_0.SetMaterialWrapper);
local v14 = require(l_Actions_0.SetPath);
local v15 = require(l_Actions_0.SetSearch);
local v16 = require(l_Actions_0.SetUse2022Materials);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v18 = require(l_Constants_0.getCategoryDefault);
local v19 = require(l_Constants_0.getMaterialPath);
local v20 = require(l_Constants_0.getMaterialType);
local v21 = require(l_Constants_0.getMaterialName);
local v22 = require(l_Constants_0.getSupportedMaterials);
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.CheckMaterialName);
local v25 = require(l_Util_0.ContainsPath);
local v26 = require(l_Util_0.getMaterials);
local v27 = require(l_Util_0.getOverrides);
local l_MaterialGeneratorHideTempMaterialVariants_0 = game:GetFastFlag("MaterialGeneratorHideTempMaterialVariants");
local v29 = v22();
local v30 = l_ContextItem_0:extend("MaterialServiceController");
v30.new = function(v31, v32) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: l_ServiceWrapper_0 (copy), v30 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (copy), v19 (copy), v13 (copy), v12 (copy), v16 (copy), v29 (copy), v21 (copy)
    local v33 = setmetatable({
        _materialChangedListeners = {}, 
        _overrideChangedListeners = {}, 
        _changeHistoryService = l_ServiceWrapper_0.new("ChangeHistoryService", v32), 
        _rootCategory = {
            Categories = {}, 
            CategoryNames = {}, 
            Materials = {}
        }, 
        _materialPaths = {}, 
        _materialWrappers = {}, 
        _materialStatuses = {}, 
        _materialServiceWrapper = l_ServiceWrapper_0.new("MaterialService", v32), 
        _nameToEnum = {}, 
        _store = v31, 
        _mock = v32
    }, v30);
    v33._materialServiceAdded = v33._materialServiceWrapper:asInstance().DescendantAdded:Connect(function(v34) --[[ Line: 71 ]]
        -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref), v33 (copy), v19 (ref), v13 (ref)
        if v34:IsA("MaterialVariant") then
            if l_MaterialGeneratorHideTempMaterialVariants_0 then
                if not v34:FindFirstAncestor("Material Generator") then
                    v33:addMaterial(v34.BaseMaterial, v34, v19(v34.BaseMaterial));
                    return;
                end;
            else
                v33:addMaterial(v34.BaseMaterial, v34, v19(v34.BaseMaterial));
                return;
            end;
        elseif v34:IsA("TerrainDetail") and v34.Parent and v34.Parent:IsA("MaterialVariant") then
            local l_Parent_1 = v34.Parent;
            local v36 = v33:getMaterialWrapper(l_Parent_1.BaseMaterial, l_Parent_1);
            v33._materialChangedListeners[v34] = v34.Changed:Connect(function(_) --[[ Line: 83 ]]
                -- upvalues: v33 (ref), l_Parent_1 (copy), v13 (ref)
                local v38 = v33:getMaterialWrapper(l_Parent_1.BaseMaterial, l_Parent_1);
                v33._store:dispatch(v13(v38));
            end);
            v33._store:dispatch(v13(v36));
        end;
    end);
    v33._materialServiceRemoved = v33._materialServiceWrapper:asInstance().DescendantRemoving:Connect(function(v39) --[[ Line: 93 ]]
        -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref), v33 (copy), v13 (ref)
        if v39:IsA("MaterialVariant") then
            if l_MaterialGeneratorHideTempMaterialVariants_0 then
                if not v39:FindFirstAncestor("Material Generator") and v33._materialPaths[v39] then
                    v33:removeMaterial(v39);
                    return;
                end;
            else
                v33:removeMaterial(v39);
                return;
            end;
        elseif v39:IsA("TerrainDetail") and v39.Parent and v39.Parent:IsA("MaterialVariant") then
            local l_Parent_2 = v39.Parent;
            local v41 = v33:getMaterialWrapper(l_Parent_2.BaseMaterial, l_Parent_2);
            v33._materialChangedListeners[v39] = nil;
            v33._store:dispatch(v13(v41));
        end;
    end);
    v33._materialServiceChanged = v33._materialServiceWrapper:asInstance().Changed:Connect(function(v42) --[[ Line: 112 ]]
        -- upvalues: v33 (copy)
        if v33._nameToEnum[v42] then
            v33._overrideChangedSignal:Fire(v33._nameToEnum[v42]);
        end;
    end);
    v33._materialServiceStatus = v33._materialServiceWrapper:asService().OverrideStatusChanged:Connect(function(v43) --[[ Line: 120 ]]
        -- upvalues: v33 (copy), v12 (ref)
        v33._store:dispatch(v12(v43, v33._materialServiceWrapper:asService():GetOverrideStatus(v43)));
    end);
    if not v32 then
        v33._uses2022MaterialsChanged = v33._materialServiceWrapper:asInstance():GetPropertyChangedSignal("Use2022Materials"):Connect(function() --[[ Line: 130 ]]
            -- upvalues: v33 (copy), v16 (ref)
            v33._store:dispatch(v16(v33._materialServiceWrapper:asService().Use2022Materials));
        end);
        v33._store:dispatch(v16(v33._materialServiceWrapper:asService().Use2022Materials));
    end;
    for v44, v45 in pairs(v29) do
        v33:addMaterial(v44, nil, v19(v44));
        if v45 then
            v33._overrideChangedListeners[v44] = v33._materialServiceWrapper:asService():GetMaterialOverrideChanged(v44):Connect(function() --[[ Line: 143 ]]
                -- upvalues: v33 (copy), v44 (copy)
                v33:updateOverrides(v44);
            end);
        end;
    end;
    for _, v47 in ipairs(v33._materialServiceWrapper:asInstance():GetDescendants()) do
        if v47:IsA("MaterialVariant") then
            if l_MaterialGeneratorHideTempMaterialVariants_0 then
                if not v47:FindFirstAncestor("Material Generator") then
                    v33:addMaterial(v47.BaseMaterial, v47, v19(v47.BaseMaterial));
                end;
            else
                v33:addMaterial(v47.BaseMaterial, v47, v19(v47.BaseMaterial));
            end;
        end;
    end;
    for v48, _ in ipairs(v29) do
        local v50 = v21(v48) .. "Name";
        v33._nameToEnum[v50] = v48;
    end;
    return v33;
end;
v30.mock = function(v51) --[[ Line: 169 ]] --[[ Name: mock ]]
    -- upvalues: v30 (copy)
    return v30.new(v51, true);
end;
v30.destroy = function(v52) --[[ Line: 173 ]] --[[ Name: destroy ]]
    v52._materialServiceAdded:Disconnect();
    v52._materialServiceRemoved:Disconnect();
    v52._materialServiceChanged:Disconnect();
    v52._materialServiceStatus:Disconnect();
    if not v52._mock then
        v52._uses2022MaterialsChanged:Disconnect();
    end;
    v52._materialServiceWrapper:destroy();
    for v53, _ in ipairs(v52._materialChangedListeners) do
        v52._materialChangedListeners[v53]:Disconnect();
        v52._materialChangedListeners[v53] = nil;
    end;
end;
v30.getRootCategory = function(v55) --[[ Line: 191 ]] --[[ Name: getRootCategory ]]
    return v55._rootCategory;
end;
v30.getMaterialWrapper = function(_, v57, v58) --[[ Line: 195 ]] --[[ Name: getMaterialWrapper ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        Material = v57, 
        MaterialPath = v19(v57), 
        MaterialType = v20(v57), 
        MaterialVariant = v58
    };
end;
v30.addCategory = function(v59, v60, v61) --[[ Line: 207 ]] --[[ Name: addCategory ]]
    return v59:findCategory(v60, v61, true);
end;
v30.findCategory = function(v62, v63, v64, v65) --[[ Line: 211 ]] --[[ Name: findCategory ]]
    local v66 = true;
    if #v63 <= 0 then
        v66 = not v65;
    end;
    assert(v66, "Can't add root category");
    local l__rootCategory_0 = v62._rootCategory;
    for _, v69 in ipairs(v63) do
        if l__rootCategory_0.Categories[v69] then
            l__rootCategory_0 = l__rootCategory_0.Categories[v69];
        elseif v65 then
            l__rootCategory_0.Categories[v69] = {
                Builtin = v64, 
                Categories = {}, 
                CategoryNames = {}, 
                Materials = {}
            };
            table.insert(l__rootCategory_0.CategoryNames, v69);
            table.sort(l__rootCategory_0.CategoryNames);
            l__rootCategory_0 = l__rootCategory_0.Categories[v69];
        else
            return nil;
        end;
    end;
    return l__rootCategory_0;
end;
v30.addMaterial = function(v70, v71, v72, _) --[[ Line: 237 ]] --[[ Name: addMaterial ]]
    -- upvalues: v19 (copy), v13 (copy), v12 (copy), v29 (copy), v25 (copy)
    local v74 = v19(v71);
    local v75 = v70:getMaterialWrapper(v71, v72);
    local v76 = v70:addCategory(v74, not v75.MaterialVariant);
    assert(v76, "Category to which a Material is added should exist, or be created");
    table.insert(v76.Materials, v75);
    if v72 then
        v70._materialPaths[v72] = v74;
        v70._materialWrappers[v72] = v75;
        for _, v78 in ipairs(v72:GetChildren()) do
            assert(not v70._materialChangedListeners[v78], "Already connected to material changed");
            v70._materialChangedListeners[v78] = v78.Changed:Connect(function(_) --[[ Line: 255 ]]
                -- upvalues: v70 (copy), v72 (copy), v13 (ref)
                local v80 = v70:getMaterialWrapper(v72.BaseMaterial, v72);
                v70._store:dispatch(v13(v80));
            end);
        end;
        if v70._materialChangedListeners[v72] then
            v70._materialChangedListeners[v72]:disconnect();
        end;
        v70._materialChangedListeners[v72] = v72.Changed:Connect(function(v81) --[[ Line: 266 ]]
            -- upvalues: v70 (copy), v72 (copy), v13 (ref)
            local v82 = v70:getMaterialWrapper(v72.BaseMaterial, v72);
            if v81 == "BaseMaterial" or v81 == "Name" then
                v70:moveMaterial(v82);
            end;
            v70._store:dispatch(v13(v82));
        end);
    else
        v70._store:dispatch(v12(v71, v70._materialServiceWrapper:asService():GetOverrideStatus(v71)));
    end;
    if v29[v71] then
        v70:updateOverrides(v71);
    end;
    v70._store:dispatch(v13(v75));
    local l_Path_0 = v70._store:getState().MaterialBrowserReducer.Path;
    if v25(l_Path_0, v74) then
        v70:updateMaterialList();
    end;
end;
v30.removeMaterial = function(v84, v85, _) --[[ Line: 294 ]] --[[ Name: removeMaterial ]]
    -- upvalues: v7 (copy), v25 (copy)
    local v87 = v84._materialPaths[v85];
    assert(v87, "Cannot remove material that does not exist");
    local v88 = v84:findCategory(v87);
    assert(v88, "Cannot remove material from category that does not exist");
    for v89, v90 in ipairs(v88.Materials) do
        if v90.MaterialVariant == v85 then
            table.remove(v88.Materials, v89);
            break;
        end;
    end;
    if v84._materialChangedListeners[v85] then
        v84._materialChangedListeners[v85]:Disconnect();
        v84._materialChangedListeners[v85] = nil;
    end;
    for _, v92 in pairs(v85:GetChildren()) do
        if v84._materialChangedListeners[v92] then
            v84._materialChangedListeners[v92]:Disconnect();
            v84._materialChangedListeners[v92] = nil;
        end;
    end;
    v84._store:dispatch(v7(v84._store:getState().MaterialBrowserReducer.Materials[v85]));
    v84:updateOverrides(v85.BaseMaterial);
    local l_Path_1 = v84._store:getState().MaterialBrowserReducer.Path;
    if v25(l_Path_1, v87) then
        v84:updateMaterialList();
    end;
end;
v30.moveMaterial = function(v94, v95) --[[ Line: 328 ]] --[[ Name: moveMaterial ]]
    -- upvalues: v19 (copy), v25 (copy)
    assert(v94._materialPaths[v95.MaterialVariant], "Tried to move material that wasn't registered.");
    local v96 = v94._materialPaths[v95.MaterialVariant];
    assert(v96, "Cannot remove material that does not exist");
    local v97 = v94:findCategory(v96);
    assert(v97, "Cannot remove material from category that does not exist");
    for v98, v99 in ipairs(v97.Materials) do
        if v99.MaterialVariant == v95.MaterialVariant then
            table.remove(v97.Materials, v98);
            v94:updateOverrides(v99.Material);
            break;
        end;
    end;
    v94._materialPaths[v95.MaterialVariant] = v19(v95.Material);
    v97 = v94:addCategory(v94._materialPaths[v95.MaterialVariant], not v95.MaterialVariant);
    assert(v97, "Category to which a Material is added should exist, or be created");
    table.insert(v97.Materials, v95);
    v94:updateOverrides(v95.Material);
    local l_Path_2 = v94._store:getState().MaterialBrowserReducer.Path;
    if v25(l_Path_2, v96) or v25(v94._materialPaths[v95.MaterialVariant], v95.MaterialPath) then
        v94:updateMaterialList();
    end;
end;
v30.updateOverrides = function(v101, v102) --[[ Line: 358 ]] --[[ Name: updateOverrides ]]
    -- upvalues: v27 (copy), v9 (copy), v8 (copy)
    local v103, v104 = v27(v101._materialServiceWrapper:asService():GetBaseMaterialOverride(v102), v101:findCategory({}), v102);
    v101._store:dispatch(v9(v102, v103));
    v101._store:dispatch(v8(v102, v104));
end;
v30.setMaterialOverride = function(v105, v106, v107) --[[ Line: 369 ]] --[[ Name: setMaterialOverride ]]
    v105._materialServiceWrapper:asService():SetBaseMaterialOverride(v106, v107 or "");
end;
v30.updateMaterialList = function(v108, v109, v110) --[[ Line: 373 ]] --[[ Name: updateMaterialList ]]
    -- upvalues: v26 (copy), v11 (copy)
    local l_MaterialBrowserReducer_0 = v108._store:getState().MaterialBrowserReducer;
    local v112 = v109 or l_MaterialBrowserReducer_0.Path;
    local v113 = v110 or l_MaterialBrowserReducer_0.Search;
    local v114 = v108:findCategory(v112);
    local v115 = v26(v114, v112, v113);
    v108._store:dispatch(v11(v115));
end;
v30.setPath = function(v116, v117) --[[ Line: 383 ]] --[[ Name: setPath ]]
    -- upvalues: v14 (copy)
    v116:updateMaterialList(v117);
    v116._store:dispatch(v14(v117));
end;
v30.setSearch = function(v118, v119) --[[ Line: 388 ]] --[[ Name: setSearch ]]
    -- upvalues: v15 (copy)
    v118:updateMaterialList(nil, v119);
    v118._store:dispatch(v15(v119));
end;
v30.setMaterial = function(v120, v121) --[[ Line: 393 ]] --[[ Name: setMaterial ]]
    -- upvalues: v10 (copy)
    local v122 = v120._materialWrappers[v121];
    v120._store:dispatch(v10(v122));
end;
v30.hasDefaultMaterial = function(v123, v124, v125) --[[ Line: 398 ]] --[[ Name: hasDefaultMaterial ]]
    -- upvalues: v21 (copy)
    if v125 == "None" then
        v125 = "";
    end;
    return (not (v21(v124) ~= v125) or v125 == "") and not v123._materialServiceWrapper:asService():GetMaterialVariant(v124, v125);
end;
v30.checkMaterialName = function(v126, v127, v128) --[[ Line: 407 ]] --[[ Name: checkMaterialName ]]
    -- upvalues: v24 (copy)
    local v129 = v126:findCategory({});
    assert(v129, "Tried to get materials for path which does not exist");
    return (v24(v129, v127, v128));
end;
v30.getCategoryDefaultMaterial = function(v130, v131) --[[ Line: 415 ]] --[[ Name: getCategoryDefaultMaterial ]]
    -- upvalues: v18 (copy)
    local v132 = v18(v131);
    if not v132 then
        local v133 = v130:findCategory(v131);
        if #v133.Materials > 0 then
            return v133.Materials[1].Material;
        else
            v132 = Enum.Material.Plastic;
        end;
    end;
    return v132;
end;
return v30;