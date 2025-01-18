local _ = game.Workspace;
local l_PublishService_0 = game:GetService("PublishService");
local v2 = require(script.Parent.getDeformerToPartMap);
local v3 = require(script.Parent.ItemCharacteristics);
local v4 = {};
local function v16(v5, v6) --[[ Line: 13 ]] --[[ Name: publishCageEdits ]]
    -- upvalues: v2 (copy), l_PublishService_0 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = v2(v5, not v6);
    if v6 then
        for _, v11 in pairs(v9) do
            v7[v11] = l_PublishService_0:PublishCageMeshAsync(v11, Enum.CageType.Inner);
        end;
    end;
    for _, v13 in pairs(v9) do
        v8[v13] = l_PublishService_0:PublishCageMeshAsync(v13, Enum.CageType.Outer);
    end;
    for _, v15 in ipairs(v5:GetDescendants()) do
        if v7[v15] then
            v15.ReferenceMeshId = v7[v15];
        end;
        if v8[v15] then
            v15.CageMeshId = v8[v15];
        end;
    end;
end;
v4.SetPreviewAsCharacter = function(_, v18, v19) --[[ Line: 38 ]] --[[ Name: SetPreviewAsCharacter ]]
    -- upvalues: v3 (copy), v16 (copy)
    if not v18 then
        return false;
    else
        v18:SetAttribute("wasArchivable", v18.Archivable);
        v18.Archivable = true;
        for _, v21 in ipairs(v18:GetDescendants()) do
            v21:SetAttribute("wasArchivable", v21.Archivable);
            v21.Archivable = true;
        end;
        local v22 = v18:Clone();
        local l_StarterPlayer_0 = game:GetService("StarterPlayer");
        local l_l_StarterPlayer_0_Children_0 = l_StarterPlayer_0:GetChildren();
        for _, v26 in pairs(l_l_StarterPlayer_0_Children_0) do
            if v26.Name == "StarterCharacter" then
                v26:Destroy();
            end;
        end;
        v22.Parent = l_StarterPlayer_0;
        v22.Name = "StarterCharacter";
        v18.Archivable = v18:GetAttribute("wasArchivable");
        v18:SetAttribute("wasArchivable", nil);
        for _, v28 in ipairs(v18:GetDescendants()) do
            v28.Archivable = v28:GetAttribute("wasArchivable");
            v28:SetAttribute("wasArchivable", nil);
        end;
        local v29 = v19:findFirstChildWhichIsA("WrapLayer", true);
        if v3.isClothes(v19) and v29 then
            local l_v22_FirstChild_0 = v22:FindFirstChild(v19.Name, true);
            if l_v22_FirstChild_0 and v3.isClothes(l_v22_FirstChild_0) then
                v16(l_v22_FirstChild_0, true);
                l_v22_FirstChild_0.Anchored = false;
            end;
        end;
        return;
    end;
end;
return v4;