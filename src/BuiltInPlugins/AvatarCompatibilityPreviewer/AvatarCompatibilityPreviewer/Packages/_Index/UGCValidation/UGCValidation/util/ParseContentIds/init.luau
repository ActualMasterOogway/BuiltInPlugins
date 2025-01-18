local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.util.checkForProxyWrap);
local v3 = require(l_Parent_0.util.isProxyWrapParent);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v6 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v8 = game:DefineFastFlag("FixParseProxyWrap", false);
local v9 = {};
local function _(v10) --[[ Line: 24 ]] --[[ Name: getRbxAssetId ]]
    return (string.match(v10, "^rbxassetid://(%d+)$"));
end;
local function v13(v12) --[[ Line: 30 ]] --[[ Name: getAssetUrlId ]]
    v12 = string.match(v12, "^https?://www%.(.+)") or string.match(v12, "^https?://(.+)");
    if not v12 then
        return nil;
    else
        v12 = string.match(v12, "^sitetest%d%.robloxlabs(.+)") or string.match(v12, "^roblox(.+)");
        if not v12 then
            return nil;
        else
            return (string.match(v12, "^%.com/asset/%?id=(%d+)$"));
        end;
    end;
end;
local function v15(v14) --[[ Line: 44 ]] --[[ Name: getAssetDeliveryAssetUrlId ]]
    v14 = string.match(v14, "^https?://assetdelivery%.(.+)");
    if not v14 then
        return nil;
    else
        v14 = string.match(v14, "^sitetest%d%.robloxlabs(.+)") or string.match(v14, "^roblox(.+)");
        if not v14 then
            return nil;
        else
            return (string.match(v14, "^%.com/v1/asset/%?id=(%d+)$"));
        end;
    end;
end;
local function v18(v16) --[[ Line: 58 ]] --[[ Name: tryGetAssetIdFromContentIdInternal ]]
    -- upvalues: v5 (copy), v6 (copy), v13 (copy), v15 (copy)
    local v17 = nil;
    if v5() then
        v17 = tonumber(v16);
        if v17 ~= nil then
            if v6() then
                return (tostring(v17));
            else
                return v17;
            end;
        end;
    end;
    v17 = string.match(v16, "^rbxassetid://(%d+)$");
    if v17 ~= nil then
        return v17;
    else
        v17 = v13(v16);
        if v17 ~= nil then
            return v17;
        else
            v17 = v15(v16);
            if v17 ~= nil then
                return v17;
            else
                return nil;
            end;
        end;
    end;
end;
local function _(v19, v20, v21) --[[ Line: 90 ]] --[[ Name: hasInExpCreatedEditableInstance ]]
    if not v21 then
        return false;
    elseif not v21.allowEditableInstances then
        return false;
    else
        local v22 = v21.editableImages[v19];
        if v22 and v22[v20] then
            return true;
        else
            local v23 = v21.editableMeshes[v19];
            if v23 and v23[v20] then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
local function v37(v25, v26, v27, v28, v29, v30, v31) --[[ Line: 112 ]] --[[ Name: parseContentId ]]
    -- upvalues: v8 (copy), v3 (copy), v7 (copy), v18 (copy)
    local v32 = v28[v29];
    if v32 == "" or v8 and v31.allowEditableInstances and v3(v28) then
        if v7() then
            local v33;
            if not v31 then
                v33 = false;
            elseif not v31.allowEditableInstances then
                v33 = false;
            else
                local v34 = v31.editableImages[v28];
                if v34 and v34[v29] then
                    v33 = true;
                else
                    local v35 = v31.editableMeshes[v28];
                    v33 = v35 and v35[v29] and true or false;
                end;
            end;
            if v33 then
                if v27 then
                    table.insert(v27, {
                        fieldName = v29, 
                        instance = v28
                    });
                end;
            elseif v30 then
                return false, {
                    string.format("%s.%s cannot be empty", v28:GetFullName(), v29)
                };
            end;
        elseif v30 then
            return false, {
                string.format("%s.%s cannot be empty", v28:GetFullName(), v29)
            };
        end;
        return true;
    else
        local v36 = v18(v32);
        if v36 == nil then
            return false, {
                string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", v32, v28:GetFullName(), v29)
            };
        else
            if v26[v36] == nil then
                v26[v36] = {
                    fieldName = v29, 
                    instance = v28
                };
                table.insert(v25, v36);
            end;
            if v27 then
                table.insert(v27, {
                    fieldName = v29, 
                    instance = v28, 
                    id = v36
                });
            end;
            return true;
        end;
    end;
end;
local function v55(v38, v39, v40, v41, v42, v43, v44) --[[ Line: 166 ]] --[[ Name: parseWithErrorCheckInternal ]]
    -- upvalues: v7 (copy), v1 (copy), v4 (copy), v2 (copy), v37 (copy)
    local v45 = if v7() then v44.allowEditableInstances else false;
    v42 = v42 or v1.CONTENT_ID_FIELDS;
    local v46 = v4.new();
    local l_v41_Descendants_0 = v41:GetDescendants();
    table.insert(l_v41_Descendants_0, v41);
    for _, v49 in pairs(l_v41_Descendants_0) do
        if not v45 or not v2(v49) then
            local v50 = v42[v49.ClassName];
            if v50 then
                local v51 = v43 and v43[v49.ClassName];
                for _, v53 in ipairs(v50) do
                    local v54 = v51 and v51[v53];
                    v46:updateReasons(v37(v38, v39, v40, v49, v53, v54, v44));
                end;
            end;
        end;
    end;
    return v46:getFinalResults();
end;
v9.tryGetAssetIdFromContentId = function(v56) --[[ Line: 211 ]] --[[ Name: tryGetAssetIdFromContentId ]]
    -- upvalues: v18 (copy)
    return (v18(v56));
end;
v9.parseWithErrorCheck = function(v57, v58, v59, v60, v61, v62) --[[ Line: 215 ]] --[[ Name: parseWithErrorCheck ]]
    -- upvalues: v55 (copy)
    return v55(v57, v58, nil, v59, v60, v61, v62);
end;
v9.parse = function(v63, v64, v65) --[[ Line: 234 ]] --[[ Name: parse ]]
    -- upvalues: v55 (copy)
    local v66 = {};
    local v67 = {};
    local v68 = {};
    assert((v55(v67, v66, v68, v63, v64, nil, v65)));
    return v68;
end;
return v9;