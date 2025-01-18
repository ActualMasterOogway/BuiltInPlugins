local v0 = game:DefineFastFlag("UGCValidateCageMeshInfosFix", false);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.util.getEditableMeshFromContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = {
    "InnerCage", 
    "OuterCage"
};
local v7 = {
    "ReferenceMeshId", 
    "CageMeshId"
};
local v8 = {
    v3.ErrorType.validateLayeredClothingAccessory_NoInnerCageId, 
    v3.ErrorType.validateLayeredClothingAccessory_NoOuterCageId
};
return function(v9, v10) --[[ Line: 23 ]] --[[ Name: getCageMeshInfos ]]
    -- upvalues: v7 (copy), v6 (copy), v3 (copy), v8 (copy), v5 (copy), v4 (copy), v0 (copy)
    local l_Handle_0 = v9:FindFirstChild("Handle");
    local l_WrapLayer_0 = l_Handle_0:FindFirstChildOfClass("WrapLayer");
    local v13 = {};
    local v14 = {};
    if not l_WrapLayer_0 then
        return false, {
            "Missing wraplayer"
        }, nil;
    else
        local v15 = {
            l_WrapLayer_0.ReferenceMeshId, 
            l_WrapLayer_0.CageMeshId
        };
        for v16, v17 in v7 do
            local v18 = {
                fullName = string.format("%s %s", l_WrapLayer_0:GetFullName(), v6[v16]), 
                fieldName = v17, 
                contentId = v15[v16], 
                context = v9.Name
            };
            local v19 = false;
            if v18.contentId ~= "" then
                v19 = v18.contentId ~= nil;
            end;
            if not v19 then
                v3.reportFailure(v8[v16], nil, v10);
                table.insert(v14, string.format("Missing %s (i.e. invalid %s) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v6[v16], v17, v9.Name));
            else
                if v5() then
                    local v20, v21 = v4(if v0 then l_WrapLayer_0 else l_Handle_0, v17, v10);
                    if not v20 then
                        table.insert(v14, string.format("Failed to %s for layered clothing accessory '%s'. Make sure mesh exists and try again.", v6[v16], v9.Name));
                        continue;
                    else
                        v18.editableMesh = v21;
                    end;
                end;
                table.insert(v13, v18);
            end;
        end;
        if #v14 > 0 then
            return false, v14, nil;
        else
            return true, nil, v13;
        end;
    end;
end;