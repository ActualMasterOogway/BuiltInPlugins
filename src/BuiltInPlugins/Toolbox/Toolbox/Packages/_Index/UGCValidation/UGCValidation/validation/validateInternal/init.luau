local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidMeshPartAccessories);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.util.isMeshPartAccessory);
local v6 = require(l_Parent_0.util.isLayeredClothing);
local v7 = require(l_Parent_0.validation.validateLayeredClothingAccessory);
local v8 = require(l_Parent_0.validation.validateLegacyAccessory);
local v9 = require(l_Parent_0.validation.validateMeshPartAccessory);
local v10 = require(l_Parent_0.validation.validateLimbsAndTorso);
local v11 = require(l_Parent_0.validation.validateDynamicHeadMeshPartFormat);
local v12 = require(l_Parent_0.validation.validatePackage);
local function v15(v13) --[[ Line: 21 ]] --[[ Name: validateBodyPartInternal ]]
    -- upvalues: v4 (copy), v11 (copy), v10 (copy)
    local l_assetTypeEnum_0 = v13.assetTypeEnum;
    assert(v4.isBodyPart(l_assetTypeEnum_0));
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v11(v13);
    else
        return v10(v13);
    end;
end;
return function(v16) --[[ Line: 31 ]] --[[ Name: validateInternal ]]
    -- upvalues: v4 (copy), v15 (copy), v2 (copy), v12 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v8 (copy)
    local l_instances_0 = v16.instances;
    local l_assetTypeEnum_1 = v16.assetTypeEnum;
    local l_validateMeshPartAccessories_0 = v16.validateMeshPartAccessories;
    if v4.isBodyPart(l_assetTypeEnum_1) then
        return v15(v16);
    elseif v2() and l_assetTypeEnum_1 == Enum.AssetType.Model then
        return v12(v16);
    elseif v3() and l_validateMeshPartAccessories_0 then
        local v20 = l_instances_0[1];
        if v5(v20) then
            if v6(v20) then
                return v7(v16);
            else
                return v9(v16);
            end;
        else
            return v8(v16);
        end;
    elseif v6(l_instances_0[1]) then
        return v7(v16);
    else
        return v8(v16);
    end;
end;