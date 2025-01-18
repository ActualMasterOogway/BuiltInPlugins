local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureUGCValidationRequiredFolderContext);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v5 = require(l_Parent_0.validation.validateTags);
local v6 = require(l_Parent_0.validation.validateProperties);
local v7 = require(l_Parent_0.validation.validateAttributes);
local v8 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v9 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local _ = require(l_Parent_0.util.Types);
local _ = function(v11, v12) --[[ Line: 20 ]] --[[ Name: getInstance ]]
    for _, v14 in pairs(v11) do
        if v14.Name == v12 then
            return v14;
        end;
    end;
    return nil;
end;
local function v24(v16, v17) --[[ Line: 29 ]] --[[ Name: areTopLevelFoldersCorrect ]]
    local v18 = false;
    if not (#v16 == #v17) then
        return false;
    else
        for _, v20 in v17 do
            local v21;
            for _, v23 in pairs(v16) do
                if v23.Name == v20 then
                    v21 = v23;
                    v18 = true;
                end;
                if v18 then
                    break;
                end;
            end;
            if not v18 then
                v21 = nil;
            end;
            v18 = false;
            if not v21 or v21.ClassName ~= "Folder" then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v25, v26) --[[ Line: 43 ]] --[[ Name: getFullNameWithoutRootFolder ]]
    local l_v25_FullName_0 = v25:GetFullName();
    local v28, v29 = string.find(l_v25_FullName_0, v26 .. "%.");
    assert(v28 and v29);
    return (string.sub(l_v25_FullName_0, v29 + 1, #l_v25_FullName_0));
end;
local function v37(v31, v32, v33) --[[ Line: 50 ]] --[[ Name: compareFolderInfo ]]
    -- upvalues: v8 (copy), v2 (copy)
    local v34 = v8.new();
    for v35, v36 in v31 do
        if v32[v35] == nil or v32[v35] ~= v36 then
            v2.reportFailure(v2.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, v33);
            v34:updateReasons(false, {
                (("Attribute %* has a different values in different children folders. You need to use the same value in all folders."):format(v35))
            });
        end;
    end;
    return v34:getFinalResults();
end;
local function v58(v38, v39, v40) --[[ Line: 72 ]] --[[ Name: validateFolderAssetIdsMatch ]]
    -- upvalues: v8 (copy), v3 (copy), v37 (copy)
    local v41 = false;
    if #v39 == 1 then
        return true;
    else
        local v42 = nil;
        local v43 = v8.new();
        for _, v45 in v39 do
            if v45 ~= v3.FOLDER_NAMES.R6 then
                local v46;
                for _, v48 in pairs(v38) do
                    if v48.Name == v45 then
                        v46 = v48;
                        v41 = true;
                    end;
                    if v41 then
                        break;
                    end;
                end;
                if not v41 then
                    v46 = nil;
                end;
                v41 = false;
                assert(v46);
                local v49 = {};
                for _, v51 in v46:GetDescendants() do
                    local v52 = v3.CONTENT_ID_FIELDS[v51.ClassName];
                    if v52 then
                        for _, v54 in v52 do
                            local l_v51_FullName_0 = v51:GetFullName();
                            local v56, v57 = string.find(l_v51_FullName_0, v45 .. "%.");
                            assert(v56 and v57);
                            v49[string.sub(l_v51_FullName_0, v57 + 1, #l_v51_FullName_0) .. "." .. v54] = v51[v54];
                        end;
                    end;
                end;
                if not v42 then
                    v42 = v49;
                else
                    v43:updateReasons(v37(v42, v49, v40));
                    v43:updateReasons(v37(v49, v42, v40));
                end;
            end;
        end;
        return v43:getFinalResults();
    end;
end;
local function v63(v59, v60, v61) --[[ Line: 115 ]] --[[ Name: validateR6Folder ]]
    -- upvalues: v8 (copy), v2 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v62 = v8.new();
    if #v59:GetChildren() > 0 then
        v2.reportFailure(v2.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, v61);
        v62:updateReasons(false, {
            string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", v60.Name)
        });
    end;
    v62:updateReasons(v5(v59, v61));
    v62:updateReasons(v6(v59, v60, v61));
    v62:updateReasons(v7(v59, v61));
    return v62:getFinalResults();
end;
return function(v64) --[[ Line: 141 ]] --[[ Name: validateLimbsAndTorso ]]
    -- upvalues: v3 (copy), v1 (copy), v24 (copy), v2 (copy), v63 (copy), v4 (copy), v9 (copy), v58 (copy)
    local v65 = false;
    assert(v64.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso");
    local l_instances_0 = v64.instances;
    assert(v64.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso");
    local l_requireAllFolders_0 = v64.requireAllFolders;
    local l_assetTypeEnum_0 = v64.assetTypeEnum;
    local l_isServer_0 = v64.isServer;
    local v70 = {
        v3.FOLDER_NAMES.R15ArtistIntent
    };
    if v1() then
        if l_requireAllFolders_0 then
            table.insert(v70, v3.FOLDER_NAMES.R15Fixed);
            table.insert(v70, v3.FOLDER_NAMES.R6);
        end;
    elseif l_isServer_0 then
        table.insert(v70, v3.FOLDER_NAMES.R15Fixed);
        table.insert(v70, v3.FOLDER_NAMES.R6);
    end;
    if not v24(l_instances_0, v70) then
        v2.reportFailure(v2.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, v64);
        return false, {
            "Incorrect hierarchy for asset with the following missing folders: " .. table.concat(v70, ", ")
        };
    else
        for _, v72 in v70 do
            local v73;
            for _, v75 in pairs(l_instances_0) do
                if v75.Name == v72 then
                    v73 = v75;
                    v65 = true;
                end;
                if v65 then
                    break;
                end;
            end;
            if not v65 then
                v73 = nil;
            end;
            v65 = false;
            local v76 = nil;
            local v77 = nil;
            if v72 == v3.FOLDER_NAMES.R6 then
                local v78, v79 = v63(v73, l_assetTypeEnum_0, v64);
                v76 = v78;
                v77 = v79;
            else
                local v80, v81 = v4(v73, v9(l_assetTypeEnum_0, v72, v64), v64);
                v76 = v80;
                v77 = v81;
            end;
            if not v76 then
                return v76, v77;
            end;
        end;
        return v58(l_instances_0, v70, v64);
    end;
end;