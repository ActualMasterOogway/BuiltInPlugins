local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local function _(v3) --[[ Line: 7 ]] --[[ Name: getAssetIdUri ]]
    return (("rbxassetid://%*"):format(v3));
end;
local function v8(v5) --[[ Line: 11 ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_status_0, l_result_0 = pcall(l_InsertService_0.LoadAsset, l_InsertService_0, v5.AssetId);
    if l_status_0 and l_result_0 then
        return l_result_0:GetChildren()[1];
    else
        return nil;
    end;
end;
local v9 = {};
for _, v11 in v2.getEnumAsList(v2.AssetType) do
    v9[v11] = v8;
end;
v9[v2.AssetType.Package] = function(v12, v13) --[[ Line: 25 ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: v12 (copy), l_InsertService_0 (ref)
        local v14 = ("rbxassetid://%*"):format(v12.AssetId);
        return l_InsertService_0:LoadPackageAssetAsync(v14);
    end);
    if l_status_1 and l_result_1 then
        local v17 = l_result_1[1];
        if v13 then
            v17.Parent = game.Workspace;
            v17:MoveTo(v13);
            v17.Parent = nil;
        end;
        return v17;
    else
        return nil;
    end;
end;
v9[v2.AssetType.Model] = function(v18, v19) --[[ Line: 43 ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_status_2, l_result_2 = pcall(l_InsertService_0.LoadAsset, l_InsertService_0, v18.AssetId);
    if l_status_2 and l_result_2 then
        if v19 then
            l_result_2.Parent = game.Workspace;
            l_result_2:MoveTo(v19);
            l_result_2.Parent = nil;
        end;
        return l_result_2:GetChildren()[1];
    else
        return nil;
    end;
end;
v9[v2.AssetType.MeshPart] = function(v22, v23) --[[ Line: 57 ]]
    -- upvalues: v9 (copy), v2 (copy)
    return v9[v2.AssetType.Model](v22, v23);
end;
v9[v2.AssetType.Mesh] = function(v24, v25) --[[ Line: 61 ]]
    -- upvalues: v9 (copy), v2 (copy)
    return v9[v2.AssetType.Model](v24, v25);
end;
v9[v2.AssetType.Image] = function(v26) --[[ Line: 65 ]]
    local l_Decal_0 = Instance.new("Decal");
    l_Decal_0.Name = v26.DisplayName;
    l_Decal_0.Texture = ("rbxassetid://%*"):format(v26.AssetId);
    return l_Decal_0;
end;
v9[v2.AssetType.Audio] = function(v28) --[[ Line: 72 ]]
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.Name = v28.DisplayName;
    l_Sound_0.SoundId = ("rbxassetid://%*"):format(v28.AssetId);
    return l_Sound_0;
end;
v9[v2.AssetType.Video] = function(v30) --[[ Line: 79 ]]
    local l_VideoFrame_0 = Instance.new("VideoFrame");
    l_VideoFrame_0.Name = v30.DisplayName;
    l_VideoFrame_0.SourceAssetId = v30.AssetId;
    l_VideoFrame_0.Video = ("rbxassetid://%*"):format(v30.AssetId);
    l_VideoFrame_0.Size = UDim2.new(1, 0, 1, 0);
    return l_VideoFrame_0;
end;
v9[v2.AssetType.Plugin] = function(_) --[[ Line: 88 ]]
    return nil;
end;
v9[v2.AssetType.FontFamily] = function(_) --[[ Line: 93 ]]
    return nil;
end;
return v9;