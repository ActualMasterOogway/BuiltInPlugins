local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v3.ContextServices.ContextItem;
local l_ServiceWrapper_0 = v3.TestHelpers.ServiceWrapper;
local v6 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v7 = l_ContextItem_0:extend("MaterialPreviewController");
v7.new = function(v8, v9) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_ServiceWrapper_0 (copy), v7 (copy)
    assert(not v6(), "Expected FFlagMaterialGeneratorNewUI to be false");
    local v10 = l_ServiceWrapper_0.new("MaterialService", v9):asInstance();
    local v11 = l_ServiceWrapper_0.new("Selection", v9):asService();
    return (setmetatable({
        _store = v8, 
        _mock = v9, 
        _materialService = v10, 
        _selectionService = v11, 
        _partMaterialsToRestore = {}, 
        _previousSelection = {}
    }, v7));
end;
v7.mock = function(v12) --[[ Line: 37 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy)
    return v7.new(v12, true);
end;
v7.clear = function(v13) --[[ Line: 41 ]] --[[ Name: clear ]]
    if not v13._material then
        return;
    else
        v13:restoreOriginalPartMaterials();
        if v13._selectionChangedConnection then
            v13._selectionChangedConnection:Disconnect();
            v13._selectionChangedConnection = nil;
        end;
        if v13._materialVariantChangedConnection then
            v13._materialVariantChangedConnection:Disconnect();
            v13._materialVariantChangedConnection = nil;
        end;
        if v13._material.IsTemporary then
            v13._material.MaterialVariant.Parent = nil;
        end;
        v13._material = nil;
        return;
    end;
end;
v7.setMaterial = function(v14, v15) --[[ Line: 65 ]] --[[ Name: setMaterial ]]
    if v14._material == v15 then
        return;
    else
        if v14._materialVariantChangedConnection then
            v14._materialVariantChangedConnection:Disconnect();
        end;
        v14._material = v15;
        local l_MaterialVariant_0 = v14._material.MaterialVariant;
        v14._materialVariantChangedConnection = l_MaterialVariant_0.Changed:Connect(function(v17) --[[ Line: 77 ]]
            -- upvalues: v14 (copy)
            if v17 == "Name" or v17 == "BaseMaterial" then
                v14:update();
            end;
        end);
        if not v14._selectionChangedConnection then
            v14._selectionChangedConnection = v14._selectionService.SelectionChanged:Connect(function() --[[ Line: 84 ]]
                -- upvalues: v14 (copy)
                v14:restoreOriginalPartMaterials();
                v14:savePartMaterialsAndUpdate();
            end);
        end;
        if not l_MaterialVariant_0.Parent then
            l_MaterialVariant_0.Parent = v14._materialService;
        end;
        v14:savePartMaterialsAndUpdate();
        return;
    end;
end;
v7.restoreOriginalPartMaterials = function(v18) --[[ Line: 97 ]] --[[ Name: restoreOriginalPartMaterials ]]
    for v19, v20 in v18._partMaterialsToRestore do
        v19.Material = v20.OriginalMaterial;
        v19.MaterialVariant = v20.OriginalMaterialVariant;
    end;
    v18._partMaterialsToRestore = {};
end;
v7.savePartMaterialsAndUpdate = function(v21) --[[ Line: 106 ]] --[[ Name: savePartMaterialsAndUpdate ]]
    v21._partMaterialsToRestore = {};
    local l_MaterialVariant_1 = v21._material.MaterialVariant;
    for _, v24 in v21._selectionService:Get() do
        if v24:IsA("BasePart") then
            v21._partMaterialsToRestore[v24] = {
                OriginalMaterial = v24.Material, 
                OriginalMaterialVariant = v24.MaterialVariant
            };
            v24.Material = l_MaterialVariant_1.BaseMaterial;
            v24.MaterialVariant = l_MaterialVariant_1.Name;
        end;
    end;
end;
v7.preserveCurrentSelection = function(v25) --[[ Line: 123 ]] --[[ Name: preserveCurrentSelection ]]
    v25._partMaterialsToRestore = {};
end;
v7.plotWaypoint = function(v26) --[[ Line: 127 ]] --[[ Name: plotWaypoint ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    v26:restoreOriginalPartMaterials();
    l_ChangeHistoryService_0:SetWaypoint("Original materials before application");
    v26:savePartMaterialsAndUpdate();
end;
v7.update = function(v27) --[[ Line: 135 ]] --[[ Name: update ]]
    local l_MaterialVariant_2 = v27._material.MaterialVariant;
    for _, v30 in v27._selectionService:Get() do
        if v30:IsA("BasePart") then
            v30.Material = l_MaterialVariant_2.BaseMaterial;
            v30.MaterialVariant = l_MaterialVariant_2.Name;
        end;
    end;
end;
v7.destroy = function(v31) --[[ Line: 146 ]] --[[ Name: destroy ]]
    v31:clear();
end;
return v7;