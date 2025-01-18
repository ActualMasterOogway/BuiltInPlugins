local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_AssetTypeAttachmentInfo_0 = v1.Util.AccessoryAndBodyToolShared.AssetTypeAttachmentInfo;
return function() --[[ Line: 22 ]] --[[ Name: getChoosableAssetTypes ]]
    -- upvalues: l_AssetTypeAttachmentInfo_0 (copy), v3 (copy), v2 (copy)
    local v5 = {};
    local v6 = {};
    local v7 = {};
    for _, v9 in l_AssetTypeAttachmentInfo_0 do
        for _, v11 in v9 do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                -- upvalues: v11 (copy)
                return Enum.AssetType[v11.AssetType];
            end);
            if l_status_0 and v3.ASSET_TYPE_TO_ACCESSORY_TYPE[l_result_0] ~= nil and not v7[v11.AssetType] then
                v7[v11.AssetType] = true;
                table.insert(v5, {
                    Id = l_result_0.Name, 
                    Label = v11.AssetType
                });
                v6[l_result_0] = v2.collectArray(v11.Attachments, function(v14, v15) --[[ Line: 60 ]]
                    return {
                        label = v14, 
                        attachmentName = v15.Name
                    };
                end);
            end;
        end;
    end;
    return v5, v6;
end;