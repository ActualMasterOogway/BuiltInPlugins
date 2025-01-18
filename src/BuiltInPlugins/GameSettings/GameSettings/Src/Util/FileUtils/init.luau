local v0 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local l_StudioService_0 = game:GetService("StudioService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: image/%s\r\n" .. "Content-Disposition: form-data; filename=\"%s\"; name=\"request.files\"\r\n" .. "\r\n" .. "%s\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Src.Components.Dialog.SimpleDialog);
local v6 = require(l_Parent_0.Src.Components.Dialog.ListDialog);
local v7 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v8 = {};
local function v13(_, v10, v11) --[[ Line: 31 ]] --[[ Name: showSingleImageFailedDialog ]]
    -- upvalues: v5 (copy)
    local v12 = {
        Size = Vector2.new(343, 145), 
        Title = v10:getText("General", "SingleImageDialogHeader"), 
        Header = v10:getText("General", "SingleImageDialogBody"), 
        Buttons = {
            v10:getText("General", "ReplyOK")
        }
    };
    v11(v5, v12):await();
end;
local function v19(_, v15, v16, v17) --[[ Line: 44 ]] --[[ Name: showMultiImageFailedDialog ]]
    -- upvalues: v0 (copy), v6 (copy)
    local v18 = {
        Size = Vector2.new(460, 200 + #v17 * 22), 
        Title = v15:getText("General", "MultiImageDialogHeader"), 
        Header = v15:getText("General", "MultiImageDialogBody", {
            maxThumbnailSize = v0 / 1000000
        }), 
        Entries = v17, 
        Buttons = {
            v15:getText("General", "ReplyOK")
        }, 
        Wrapped = false, 
        Truncate = Enum.TextTruncate.AtEnd
    };
    v16(v6, v18):await();
end;
local function _(v20, v21, v22) --[[ Line: 63 ]] --[[ Name: createConfigDataTable ]]
    return {
        [v20] = {
            type = v21.Name, 
            name = v20, 
            description = v22
        }
    };
end;
local function _(v24, v25, v26, v27) --[[ Line: 73 ]] --[[ Name: createFormDataBody ]]
    return "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: application/json\r\n" .. "Content-Disposition: form-data; name=\"config\"; filename=\"config.json\"\r\n" .. "\r\n" .. v24 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Disposition: form-data; name=\"" .. v25 .. "\"; filename=\"" .. v25 .. "." .. v26 .. "\"\r\n" .. "Content-Type: application/octet-stream\r\n" .. "\r\n" .. v27 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
end;
v8.PromptForGameIcon = function(v29, v30) --[[ Line: 96 ]] --[[ Name: PromptForGameIcon ]]
    -- upvalues: l_StudioService_0 (copy), v7 (copy), v0 (copy), v13 (copy)
    assert(v30);
    local v31 = l_StudioService_0:PromptImportFile(v7.IMAGE_TYPES);
    if v31 then
        if v31.Size > v0 then
            v13(v29, v30);
            return;
        else
            return v31;
        end;
    else
        return;
    end;
end;
v8.PromptForThumbnails = function(v32, v33, v34) --[[ Line: 109 ]] --[[ Name: PromptForThumbnails ]]
    -- upvalues: l_StudioService_0 (copy), v7 (copy), v0 (copy), v19 (copy)
    assert(v33 and v34);
    local v35 = l_StudioService_0:PromptImportFiles(v7.IMAGE_TYPES);
    local v36 = {};
    local v37 = {};
    if v35 and #v35 > 0 then
        for _, v39 in ipairs(v35) do
            if v39.Size > v0 then
                table.insert(v36, v39.Name);
            else
                table.insert(v37, v39);
            end;
        end;
        if next(v36) ~= nil then
            v19(v32, v33, v34, v36);
        end;
        return v37;
    else
        return;
    end;
end;
v8.GetAssetPublishRequestInfo = function(v40, v41) --[[ Line: 130 ]] --[[ Name: GetAssetPublishRequestInfo ]]
    -- upvalues: v3 (copy)
    local l_v40_BinaryContents_0 = v40:GetBinaryContents();
    local v43 = string.lower(v40.Name);
    local v44 = string.sub(v43, string.find(v43, ".", 1, true) + 1);
    local v45 = string.format(v3, v44, v43, l_v40_BinaryContents_0);
    return {
        Url = v41, 
        Method = "POST", 
        Body = v45, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    };
end;
v8.CreatePostV1AssetsUpload = function(v46, v47, _) --[[ Line: 151 ]] --[[ Name: CreatePostV1AssetsUpload ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_v46_BinaryContents_0 = v46:GetBinaryContents();
    local v50 = string.lower(v46.Name);
    local v51 = string.find(v50, ".", 1, true);
    local v52 = string.sub(v50, v51 + 1);
    local v53 = string.sub(v46.Name, 1, v51 - 1);
    local v54 = "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: application/json\r\n" .. "Content-Disposition: form-data; name=\"config\"; filename=\"config.json\"\r\n" .. "\r\n" .. l_HttpService_0:JSONEncode({
        [v53] = {
            type = Enum.AssetType.Image.Name, 
            name = v53, 
            description = ""
        }
    }) .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Disposition: form-data; name=\"" .. v53 .. "\"; filename=\"" .. v53 .. "." .. v52 .. "\"\r\n" .. "Content-Type: application/octet-stream\r\n" .. "\r\n" .. l_v46_BinaryContents_0 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
    print(v54);
    return {
        Url = v47, 
        Method = "POST", 
        Body = v54, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    };
end;
return v8;