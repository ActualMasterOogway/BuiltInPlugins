local l_Parent_0 = script.Parent.Parent;
local l_AssetService_0 = game:GetService("AssetService");
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.destroyEditableInstances);
local v4 = require(l_Parent_0.util.checkForProxyWrap);
local function _(v5, v6, v7, v8, v9) --[[ Line: 12 ]] --[[ Name: addEditableInstance ]]
    local l_editableMeshes_0 = v5.editableMeshes;
    if v9 == "EditableImage" then
        l_editableMeshes_0 = v5.editableImages;
    end;
    if not l_editableMeshes_0[v6] then
        l_editableMeshes_0[v6] = {};
    end;
    l_editableMeshes_0[v6][v7] = v8;
end;
local function v17(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: createEditableInstanceFromId ]]
    -- upvalues: l_AssetService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: v14 (copy), l_AssetService_0 (ref), v12 (copy)
        if v14 == "EditableMesh" then
            return (l_AssetService_0:CreateEditableMeshStripSkinningAsync(v12.Uri));
        else
            return (l_AssetService_0:CreateEditableImageAsync(v12));
        end;
    end);
    if not l_status_0 then
        return l_status_0, l_result_0;
    else
        v13[v12.Uri] = l_result_0;
        return true, {
            created = true, 
            instance = l_result_0
        };
    end;
end;
local function v24(v18, v19, v20, v21) --[[ Line: 45 ]] --[[ Name: getEditableInstanceInfo ]]
    -- upvalues: v17 (copy)
    local v22 = nil;
    if v21 then
        v22 = v18.Object;
    end;
    if not v22 then
        local l_Uri_0 = v18.Uri;
        if l_Uri_0 and l_Uri_0 ~= "" then
            v22 = v19[l_Uri_0];
            if not v22 then
                return v17(v18, v19, v20);
            end;
        end;
    end;
    return true, {
        instance = v22, 
        created = false
    };
end;
local function _(v25, v26, v27, v28) --[[ Line: 66 ]] --[[ Name: addContent ]]
    v25[v26] = {
        content = v27, 
        contentType = v28
    };
end;
local function v32(v30, v31) --[[ Line: 73 ]] --[[ Name: getTextureContentMap ]]
    if v30:IsA("MeshPart") then
        v31.TextureID = {
            content = v30.TextureContent, 
            contentType = "EditableImage"
        };
        return;
    elseif v30:IsA("SpecialMesh") then
        v31.TextureId = {
            content = Content.fromUri(v30.TextureId), 
            contentType = "EditableImage"
        };
        return;
    else
        if v30:IsA("SurfaceAppearance") then
            v31.ColorMap = {
                content = Content.fromUri(v30.ColorMap), 
                contentType = "EditableImage"
            };
            v31.MetalnessMap = {
                content = Content.fromUri(v30.MetalnessMap), 
                contentType = "EditableImage"
            };
            v31.NormalMap = {
                content = Content.fromUri(v30.NormalMap), 
                contentType = "EditableImage"
            };
            v31.RoughnessMap = {
                content = Content.fromUri(v30.RoughnessMap), 
                contentType = "EditableImage"
            };
        end;
        return;
    end;
end;
local function _(v33, v34) --[[ Line: 116 ]] --[[ Name: getCageMeshContent ]]
    -- upvalues: v4 (copy)
    local l_WrapProxy_0 = v33:FindFirstChild("WrapProxy");
    if l_WrapProxy_0 and v34 and v4(l_WrapProxy_0) then
        return l_WrapProxy_0.MeshContent;
    else
        return v33.CageMeshContent;
    end;
end;
local function v42(v37, v38, v39) --[[ Line: 125 ]] --[[ Name: getMeshContentMap ]]
    -- upvalues: v4 (copy)
    if v37:IsA("MeshPart") and not v4(v37) then
        v38.MeshId = {
            content = v37.MeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v37:IsA("WrapTarget") then
        local l_WrapProxy_1 = v37:FindFirstChild("WrapProxy");
        v38.CageMeshId = {
            content = if l_WrapProxy_1 and v39 and v4(l_WrapProxy_1) then l_WrapProxy_1.MeshContent else v37.CageMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v37:IsA("WrapLayer") then
        local l_WrapProxy_2 = v37:FindFirstChild("WrapProxy");
        v38.CageMeshId = {
            content = if l_WrapProxy_2 and v39 and v4(l_WrapProxy_2) then l_WrapProxy_2.MeshContent else v37.CageMeshContent, 
            contentType = "EditableMesh"
        };
        v38.ReferenceMeshId = {
            content = v37.ReferenceMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    else
        if v37:IsA("SpecialMesh") then
            v38.MeshId = {
                content = Content.fromUri(v37.MeshId), 
                contentType = "EditableMesh"
            };
        end;
        return;
    end;
end;
local function v54(v43, v44, v45, v46) --[[ Line: 149 ]] --[[ Name: getOrCreateEditableInstances ]]
    -- upvalues: v42 (copy), v32 (copy), v24 (copy)
    local v47 = {};
    v42(v43, v47, v46);
    v32(v43, v47);
    for v48, v49 in v47 do
        local l_contentType_0 = v49.contentType;
        local v51, v52 = v24(v49.content, v44, l_contentType_0, v46);
        if not v51 then
            return v51, v52;
        else
            local l_editableMeshes_1 = v45.editableMeshes;
            if l_contentType_0 == "EditableImage" then
                l_editableMeshes_1 = v45.editableImages;
            end;
            if not l_editableMeshes_1[v43] then
                l_editableMeshes_1[v43] = {};
            end;
            l_editableMeshes_1[v43][v48] = v52;
        end;
    end;
    return true;
end;
return function(v55, v56) --[[ Line: 173 ]]
    -- upvalues: v54 (copy), v3 (copy)
    local v57 = {
        editableMeshes = {}, 
        editableImages = {}
    };
    local v58 = {};
    for _, v60 in v55 do
        local l_v60_Descendants_0 = v60:GetDescendants();
        table.insert(l_v60_Descendants_0, v60);
        for _, v63 in pairs(l_v60_Descendants_0) do
            local v64, v65 = v54(v63, v58, v57, v56);
            if not v64 then
                v3(v57.editableMeshes, v57.editableImages);
                return false, {
                    v65
                };
            end;
        end;
    end;
    return true, v57;
end;