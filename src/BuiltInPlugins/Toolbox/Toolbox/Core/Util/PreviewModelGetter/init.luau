local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v3 = require(l_Parent_0.Core.Util.Urls);
local l_VideoStudioPreviewPermissionFix_0 = game:GetFastFlag("VideoStudioPreviewPermissionFix");
local function v8(v5) --[[ Line: 14 ]] --[[ Name: disableScripts ]]
    for _, v7 in pairs(v5:GetDescendants()) do
        if v7:IsA("Script") then
            v7.Disabled = true;
        end;
    end;
end;
local function v17(v9) --[[ Line: 24 ]] --[[ Name: getPreviewModel ]]
    -- upvalues: v3 (copy), v8 (copy)
    local v10 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: v3 (ref), v9 (copy), v10 (ref)
        local v11 = v3.constructAssetIdString(v9);
        v10 = game:GetObjectsAsync(v11);
    end);
    if not l_status_0 then
        return l_status_0, l_result_0;
    else
        local v14 = nil;
        if #v10 == 1 then
            v14 = v10[1];
        else
            v14 = Instance.new("Model");
            v14.Name = "Preview";
            for _, v16 in ipairs(v10) do
                v16.Parent = v14;
                if not v16.Parent then
                    v16:Destroy();
                end;
            end;
        end;
        v8(v14);
        return l_status_0, v14;
    end;
end;
return function(v18, v19) --[[ Line: 54 ]]
    -- upvalues: l_Promise_0 (copy), l_VideoStudioPreviewPermissionFix_0 (copy), v3 (copy), v17 (copy)
    return (l_Promise_0.new(function(v20, v21) --[[ Line: 55 ]]
        -- upvalues: v19 (copy), v18 (copy), l_VideoStudioPreviewPermissionFix_0 (ref), v3 (ref), v17 (ref)
        spawn(function() --[[ Line: 56 ]]
            -- upvalues: v19 (ref), v18 (ref), l_VideoStudioPreviewPermissionFix_0 (ref), v3 (ref), v17 (ref), v21 (copy), v20 (copy)
            local v22 = nil;
            local v23 = true;
            if v19 == Enum.AssetType.Audio.Value then
                local l_Sound_0 = Instance.new("Sound");
                l_Sound_0.SoundId = ("rbxassetid://%d"):format(v18);
                v22 = l_Sound_0;
            elseif v19 == Enum.AssetType.Video.Value then
                local l_VideoFrame_0 = Instance.new("VideoFrame");
                if l_VideoStudioPreviewPermissionFix_0 then
                    l_VideoFrame_0:SetStudioPreview(true);
                end;
                l_VideoFrame_0.Video = v3.constructAssetIdString(v18);
                v22 = l_VideoFrame_0;
            else
                local v26, v27 = v17(v18);
                v23 = v26;
                v22 = v27;
            end;
            if not v23 then
                v21(v22);
                return;
            else
                v20(v22);
                return;
            end;
        end);
    end));
end;