local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.validation.getCageMeshInfos);
local v2 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateLCCagesVerticesSimilarity);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateMeshInsideMesh);
local v4 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateLCCagingRelevancy);
local v5 = require(l_Parent_0.flags.getFStringLCCageQualityDocumentationLink);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateCageMeshDistance);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateImportOrigin);
local v8 = require(l_Parent_0.flags.getFIntUGCValidateImportOriginMax);
local v9 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationCageUVDuplicates);
local v10 = require(l_Parent_0.validation.validateVerticesSimilarity);
local v11 = require(l_Parent_0.validation.validateLCCagingRelevancy);
local v12 = require(l_Parent_0.validation.validateRenderMeshInsideOuterCageMesh);
local v13 = require(l_Parent_0.validation.validateCageMeshDistance);
local v14 = require(l_Parent_0.validation.validateCageUVDuplicates);
local _ = require(l_Parent_0.util.Types);
return function(v16, v17, v18) --[[ Line: 28 ]] --[[ Name: validateLCCageQuality ]]
    -- upvalues: v1 (copy), v2 (copy), v10 (copy), v4 (copy), v11 (copy), v3 (copy), v12 (copy), v7 (copy), v8 (copy), v6 (copy), v13 (copy), v9 (copy), v14 (copy), v5 (copy)
    local v19 = true;
    local v20 = {};
    local l_WrapLayer_0 = v16:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer");
    assert(l_WrapLayer_0, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer");
    local v22, v23, v24 = v1(v16, v18);
    if not v22 or v24 == nil then
        return false, v23;
    else
        local v25 = {
            v24[1], 
            v24[2]
        };
        local v26, v27 = unpack(v25);
        if v2() then
            for _, v29 in v25 do
                local v30, v31 = v10(v29, v18, Vector3.new(1, 1, 1, 0), v29.fullName);
                if not v30 and v31 ~= nil then
                    v19 = false;
                    for _, v33 in v31 do
                        table.insert(v20, v33);
                    end;
                end;
            end;
        end;
        if v4() then
            local v34, v35 = v11(v26, v27, v17, l_WrapLayer_0.ReferenceOrigin.Position, l_WrapLayer_0.CageOrigin.Position, v18);
            if not v34 and v35 ~= nil then
                v19 = false;
                for _, v37 in v35 do
                    table.insert(v20, v37);
                end;
            end;
        end;
        if v3() then
            local v38, v39 = v12(l_WrapLayer_0, v27, v17, v18);
            if not v38 then
                table.insert(v20, table.concat(v39, "\n"));
                v19 = false;
            end;
        end;
        if v7() then
            local l_Magnitude_0 = l_WrapLayer_0.ImportOrigin.Position.Magnitude;
            local v41 = v8() / 100;
            if v41 < l_Magnitude_0 then
                table.insert(v20, string.format("WrapLayer ImportOrigin.Position is %.2f from the origin. The max is %.2f. You should move the Position closer to the origin", l_Magnitude_0, v41));
                v19 = false;
            end;
        end;
        if v6() then
            local v42, v43 = v13(v26, v27, v17, l_WrapLayer_0.ReferenceOrigin, l_WrapLayer_0.CageOrigin, v18);
            if not v42 then
                table.insert(v20, table.concat(v43, "\n"));
                v19 = false;
            end;
        end;
        if v9() then
            local v44, v45 = v14(v26, v27, v17, v18);
            if not v44 then
                table.insert(v20, table.concat(v45, "\n"));
                v19 = false;
            end;
        end;
        if not v19 then
            if v5() ~= "" then
                table.insert(v20, string.format("To better understand caging requirements, please visit %s", v5()));
            end;
            return false, v20;
        else
            return true;
        end;
    end;
end;