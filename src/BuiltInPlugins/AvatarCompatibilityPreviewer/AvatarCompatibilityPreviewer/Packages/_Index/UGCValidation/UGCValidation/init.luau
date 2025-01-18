local l_script_0 = script;
local v1 = require(l_script_0.flags.getFFlagUGCValidationShouldYield);
local v2 = require(l_script_0.flags.getEngineFeatureUGCValidationRequiredFolderContext);
local v3 = require(l_script_0.flags.getEngineFeatureEngineUGCValidateRigidMeshPartAccessories);
local v4 = require(l_script_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v5 = require(l_script_0.flags.getFFlagUGCValidateUseDataCache);
local v6 = require(l_script_0.Analytics);
local v7 = require(l_script_0.Constants);
local v8 = require(l_script_0.util.BundlesMetadata);
local v9 = require(l_script_0.util.canUploadBundlesAsync);
local v10 = require(l_script_0.util.createUGCBodyPartFolders);
local v11 = require(l_script_0.util.isLayeredClothing);
local v12 = require(l_script_0.util.RigidOrLayeredAllowed);
local _ = require(l_script_0.util.Types);
local v14 = require(l_script_0.util.createEditableInstancesForContext);
local v15 = require(l_script_0.util.destroyEditableInstances);
local v16 = require(l_script_0.util.ValidationHints);
local v17 = require(l_script_0.validation.validateInternal);
local v18 = require(l_script_0.validation.validateLayeredClothingAccessoryMeshPartAssetFormat);
local v19 = require(l_script_0.validation.validateLegacyAccessoryMeshPartAssetFormat);
local v20 = require(l_script_0.validation.validateFullBody);
local v21 = require(l_script_0.validation.validateBundleReadyForUpload);
local v22 = require(l_script_0.validation.validateDynamicHeadMeshPartFormat);
local v94 = {
    validate = function(v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) --[[ Line: 36 ]] --[[ Name: validate ]]
        -- upvalues: v6 (copy), v4 (copy), v14 (copy), v3 (copy), v2 (copy), v1 (copy), v17 (copy), v15 (copy)
        local v35 = tick();
        v6.setMetadata({
            entrypoint = "validate", 
            assetType = v24.Name, 
            isServer = v25
        });
        local v36 = nil;
        local v37 = nil;
        if v4() then
            local v38, v39 = v14(v23, v30);
            v36 = v38;
            v37 = v39;
            if not v36 then
                if v25 then
                    error(v37[1]);
                else
                    return v36, v37;
                end;
            end;
        end;
        local v40 = {
            instances = v23, 
            assetTypeEnum = v24, 
            allowUnreviewedAssets = v26, 
            restrictedUserIds = v27, 
            isServer = v25, 
            token = v28, 
            universeId = v29, 
            isAsync = false, 
            allowEditableInstances = v30, 
            bypassFlags = v31, 
            validateMeshPartAccessories = v3() and v33 and true or false
        };
        if v2() then
            v40.requireAllFolders = v34 == nil or v34;
        else
            v40.requireAllFolders = false;
        end;
        if v1() then
            v40.lastTickSeconds = tick();
            v40.shouldYield = v32;
        end;
        if v4() then
            v40.editableMeshes = v37.editableMeshes;
            v40.editableImages = v37.editableImages;
        end;
        local v41, v42 = v17(v40);
        if v4() then
            v15(v40.editableMeshes, v40.editableImages);
        end;
        if v41 then
            v6.recordScriptTime(script.Name, v35, v40);
            v6.reportScriptTimes(v40);
        end;
        v6.reportCounter(v41, v24 == Enum.AssetType.DynamicHead and "Head" or "BodyPart", v40);
        return v41, v42;
    end, 
    validateAsync = function(v43, v44, v45, v46, v47, v48) --[[ Line: 123 ]] --[[ Name: validateAsync ]]
        -- upvalues: v6 (copy), v4 (copy), v14 (copy), v17 (copy), v15 (copy)
        v6.setMetadata({
            entrypoint = "validateAsync", 
            assetType = v44.Name, 
            isServer = v46
        });
        local v49 = nil;
        local v50 = nil;
        if v4() then
            local v51, v52 = v14(v43);
            v49 = v51;
            v50 = v52;
            if not v49 then
                if v46 then
                    error(v50[1]);
                else
                    v45(v49, v50);
                end;
            end;
        end;
        local v53 = {
            instances = v43, 
            assetTypeEnum = v44, 
            allowUnreviewedAssets = v47, 
            restrictedUserIds = v48, 
            isServer = v46, 
            token = "", 
            isAsync = true, 
            validateMeshPartAccessories = false
        };
        if v4() then
            v53.editableMeshes = v50.editableMeshes;
            v53.editableImages = v50.editableImages;
        end;
        coroutine.wrap(function() --[[ Line: 165 ]]
            -- upvalues: v45 (copy), v17 (ref), v53 (copy), v4 (ref), v15 (ref)
            v45(v17(v53));
            if v4() then
                v15(v53.editableMeshes, v53.editableImages);
            end;
        end)();
    end, 
    validateMeshPartFormat = function(v54, v55, v56, v57, v58) --[[ Line: 173 ]] --[[ Name: validateMeshPartFormat ]]
        -- upvalues: v6 (copy), v4 (copy), v14 (copy), v22 (copy), v15 (copy)
        v6.setMetadata({
            entrypoint = "validateMeshPartFormat", 
            assetType = v55.Name, 
            isServer = v56
        });
        assert(Enum.AssetType.DynamicHead == v55);
        local v59 = nil;
        local v60 = nil;
        if v4() then
            local v61, v62 = v14(v54);
            v59 = v61;
            v60 = v62;
            if not v59 then
                if v56 then
                    error(v60[1]);
                else
                    return v59, v60;
                end;
            end;
        end;
        local v63 = {
            instances = v54, 
            assetTypeEnum = v55, 
            allowUnreviewedAssets = v57, 
            restrictedUserIds = v58, 
            isServer = v56, 
            validateMeshPartAccessories = false
        };
        if v4() then
            v63.editableMeshes = v60.editableMeshes;
            v63.editableImages = v60.editableImages;
        end;
        local v64, v65 = v22(v63);
        if v4() then
            v15(v63.editableMeshes, v63.editableImages);
        end;
        return v64, v65;
    end, 
    validateAsyncMeshPartFormat = function(v66, v67, v68, v69, v70, v71) --[[ Line: 225 ]] --[[ Name: validateAsyncMeshPartFormat ]]
        -- upvalues: v6 (copy), v4 (copy), v14 (copy), v22 (copy), v15 (copy)
        v6.setMetadata({
            entrypoint = "validateAsyncMeshPartFormat", 
            assetType = v67.Name, 
            isServer = v69
        });
        assert(Enum.AssetType.DynamicHead == v67);
        local v72 = nil;
        local v73 = nil;
        if v4() then
            local v74, v75 = v14(v66);
            v72 = v74;
            v73 = v75;
            if not v72 then
                if v69 then
                    error(v73[1]);
                else
                    v68(v72, v73);
                end;
            end;
        end;
        local v76 = {
            instances = v66, 
            assetTypeEnum = v67, 
            allowUnreviewedAssets = v70, 
            restrictedUserIds = v71, 
            isServer = v69, 
            validateMeshPartAccessories = false
        };
        if v4() then
            v76.editableMeshes = v73.editableMeshes;
            v76.editableImages = v73.editableImages;
        end;
        coroutine.wrap(function() --[[ Line: 269 ]]
            -- upvalues: v68 (copy), v22 (ref), v76 (copy), v4 (ref), v15 (ref)
            v68(v22(v76));
            if v4() then
                v15(v76.editableMeshes, v76.editableImages);
            end;
        end)();
    end, 
    validateMeshPartAssetFormat2 = function(v77, v78, v79, v80, v81, _) --[[ Line: 277 ]] --[[ Name: validateMeshPartAssetFormat2 ]]
        -- upvalues: v6 (copy), v4 (copy), v14 (copy), v11 (copy), v18 (copy), v19 (copy), v15 (copy)
        v6.setMetadata({
            entrypoint = "validateMeshPartAssetFormat2", 
            assetType = v79.Name, 
            isServer = v80
        });
        local v83 = nil;
        local v84 = nil;
        if v4() then
            local v85, v86 = v14(v77);
            v83 = v85;
            v84 = v86;
            if not v83 then
                if v80 then
                    error(v84[1]);
                else
                    return v83, v84;
                end;
            end;
        end;
        local v87 = {
            instances = v77, 
            assetTypeEnum = v79, 
            allowUnreviewedAssets = v81, 
            isServer = v80, 
            validateMeshPartAccessories = false
        };
        if v4() then
            v87.editableMeshes = v84.editableMeshes;
            v87.editableImages = v84.editableImages;
        end;
        local v88 = nil;
        local v89 = nil;
        if v11(v77[1]) then
            local v90, v91 = v18(v78, v87);
            v88 = v90;
            v89 = v91;
        else
            local v92, v93 = v19(v78, v87);
            v88 = v92;
            v89 = v93;
        end;
        if v4() then
            v15(v87.editableMeshes, v87.editableImages);
        end;
        return v88, v89;
    end, 
    validateBundleReadyForUpload = v21, 
    util = {
        BundlesMetadata = v8, 
        createUGCBodyPartFolders = v10, 
        canUploadBundlesAsync = v9
    }
};
v94.util.isLayeredClothingAllowed = v12.isLayeredClothingAllowed;
v94.util.isRigidAccessoryAllowed = v12.isRigidAccessoryAllowed;
v94.validateFullBody = function(v95, v96, v97, v98, v99, v100) --[[ Line: 384 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v6 (copy), v4 (copy), v14 (copy), v2 (copy), v1 (copy), v20 (copy), v15 (copy)
    v6.setMetadata({
        entrypoint = "validateFullBody", 
        assetType = "", 
        isServer = v96
    });
    local v101 = tick();
    local v102 = nil;
    local v103 = nil;
    if v4() then
        local v104 = {};
        for _, v106 in v95 do
            for _, v108 in v106.allSelectedInstances do
                table.insert(v104, v108);
            end;
        end;
        local v109, v110 = v14(v104, v97);
        v102 = v109;
        v103 = v110;
        if not v102 then
            if v96 then
                error(v103[1]);
            else
                return v102, v103;
            end;
        end;
    end;
    local v111 = {
        fullBodyData = v95, 
        isServer = v96, 
        allowEditableInstances = v97, 
        bypassFlags = v98, 
        validateMeshPartAccessories = false
    };
    if v2() then
        v111.requireAllFolders = v100 == nil or v100;
    else
        v111.requireAllFolders = false;
    end;
    if v1() then
        v111.lastTickSeconds = tick();
        v111.shouldYield = v99;
    end;
    if v4() then
        v111.editableMeshes = v103.editableMeshes;
        v111.editableImages = v103.editableImages;
    end;
    local v112, v113 = v20(v111);
    if v4() then
        v15(v111.editableMeshes, v111.editableImages);
    end;
    if v112 then
        v6.recordScriptTime(script.Name, v101, v111);
        v6.reportScriptTimes(v111);
    end;
    v6.reportCounter(v112, "FullBody", v111);
    return v112, v113;
end;
v94.preprocessDataAsync = function(v114, v115, v116, v117, v118) --[[ Line: 459 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v6 (copy), v4 (copy), v14 (copy), v1 (copy), v16 (copy), v15 (copy)
    v6.setMetadata({
        entrypoint = "preprocessDataAsync", 
        assetType = "", 
        isServer = v115
    });
    local v119 = tick();
    local v120 = nil;
    if v4() then
        local v121 = {};
        for _, v123 in v114 do
            table.insert(v121, v123);
        end;
        local v124 = nil;
        local v125, v126 = v14(v121, v116);
        v124 = v125;
        v120 = v126;
        if not v124 then
            if v115 then
                error(v120[1]);
            else
                return {
                    ok = false, 
                    errors = v120
                };
            end;
        end;
    end;
    local v127 = {
        isServer = v115, 
        allowEditableInstances = v116, 
        bypassFlags = v117, 
        validateMeshPartAccessories = false
    };
    if v1() then
        v127.lastTickSeconds = tick();
        v127.shouldYield = v118;
    end;
    if v4() then
        v127.editableMeshes = v120.editableMeshes;
        v127.editableImages = v120.editableImages;
    end;
    local v128 = v16.preprocessDataAsync(v114, v127);
    if v4() then
        v15(v127.editableMeshes, v127.editableImages);
    end;
    if v128.ok then
        v6.recordScriptTime("preprocessDataAsync", v119, v127);
        v6.reportScriptTimes(v127);
    end;
    return v128;
end;
v94.isPreprocessDataCached = function(v129, v130, v131) --[[ Line: 527 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v6 (copy), v16 (copy)
    v6.setMetadata({
        entrypoint = "isPreprocessDataCached", 
        assetType = "", 
        isServer = v131
    });
    local v132 = tick();
    local v133 = v16.isPreprocessDataCached(v129, v130);
    local v134 = {
        isServer = v131
    };
    v6.recordScriptTime("isPreprocessDataCached", v132, v134);
    v6.reportScriptTimes(v134);
    return v133;
end;
v94.calculateScaleToValidateBoundsAsync = function(v135, v136, v137, v138, v139, v140) --[[ Line: 552 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), v14 (copy), v1 (copy), v16 (copy), v15 (copy)
    v6.setMetadata({
        entrypoint = "calculateScaleToValidateBoundsAsync", 
        assetType = "", 
        isServer = v136
    });
    local v141 = tick();
    local v142 = nil;
    if (not v5() or not v140) and v4() then
        local v143 = {};
        for _, v145 in v135 do
            table.insert(v143, v145);
        end;
        local v146 = nil;
        local v147, v148 = v14(v143, v137);
        v146 = v147;
        v142 = v148;
        if not v146 then
            if v136 then
                error(v142[1]);
            else
                return {
                    ok = false, 
                    errors = v142
                };
            end;
        end;
    end;
    local v149 = {
        isServer = v136, 
        allowEditableInstances = v137, 
        bypassFlags = v138, 
        validateMeshPartAccessories = false
    };
    if v1() then
        v149.lastTickSeconds = tick();
        v149.shouldYield = v139;
    end;
    if (not v5() or not v140) and v4() then
        v149.editableMeshes = v142.editableMeshes;
        v149.editableImages = v142.editableImages;
    end;
    local v150 = v16.calculateScaleToValidateBoundsAsync(v135, v149, v140);
    if (not v5() or not v140) and v4() then
        v15(v149.editableMeshes, v149.editableImages);
    end;
    if v150.ok then
        v6.recordScriptTime("calculateScaleToValidateBoundsAsync", v141, v149);
        v6.reportScriptTimes(v149);
    end;
    return v150;
end;
v94.GUIDAttributeName = v7.GUIDAttributeName;
return v94;