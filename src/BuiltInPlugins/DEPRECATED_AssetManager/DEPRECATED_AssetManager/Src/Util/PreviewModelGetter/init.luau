local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_AssetManagerVideoPreviewFix_0 = game:GetFastFlag("AssetManagerVideoPreviewFix");
local function v6(v3) --[[ Line: 12 ]] --[[ Name: disableScripts ]]
    for _, v5 in pairs(v3:GetDescendants()) do
        if v5:IsA("Script") then
            v5.Disabled = true;
        end;
    end;
end;
local function v15(v7) --[[ Line: 22 ]] --[[ Name: getPreviewModel ]]
    -- upvalues: v6 (copy)
    local v8 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v8 (ref)
        local v9 = ("rbxassetid://%d"):format(v7);
        v8 = game:GetObjectsAsync(v9);
    end);
    if not l_status_0 then
        return l_result_0;
    else
        local v12 = nil;
        if #v8 == 1 then
            v12 = v8[1];
        else
            v12 = Instance.new("Model");
            v12.Name = "Preview";
            for _, v14 in ipairs(v8) do
                v14.Parent = v12;
                if not v14.Parent then
                    v14:Destroy();
                end;
            end;
        end;
        v6(v12);
        return v12;
    end;
end;
return function(v16, v17) --[[ Line: 53 ]]
    -- upvalues: l_Promise_0 (copy), l_AssetManagerVideoPreviewFix_0 (copy), v15 (copy)
    return (l_Promise_0.new(function(v18, v19) --[[ Line: 54 ]]
        -- upvalues: v17 (copy), v16 (copy), l_AssetManagerVideoPreviewFix_0 (ref), v15 (ref)
        spawn(function() --[[ Line: 55 ]]
            -- upvalues: v17 (ref), v16 (ref), l_AssetManagerVideoPreviewFix_0 (ref), v15 (ref), v19 (copy), v18 (copy)
            local v20 = nil;
            if v17 == Enum.AssetType.Audio.Value then
                local l_Sound_0 = Instance.new("Sound");
                l_Sound_0.SoundId = ("rbxassetid://%d"):format(v16);
                v20 = l_Sound_0;
            elseif v17 == Enum.AssetType.Image.Value then
                local l_Decal_0 = Instance.new("Decal");
                l_Decal_0.Texture = ("rbxassetid://%d"):format(v16);
                v20 = l_Decal_0;
            elseif l_AssetManagerVideoPreviewFix_0 and v17 == Enum.AssetType.Video.Value then
                local l_VideoFrame_0 = Instance.new("VideoFrame");
                l_VideoFrame_0.Video = ("rbxassetid://%d"):format(v16);
                v20 = l_VideoFrame_0;
            else
                v20 = v15(v16);
            end;
            if type(v20) == "string" then
                v19(v20);
                return;
            else
                v18(v20);
                return;
            end;
        end);
    end));
end;