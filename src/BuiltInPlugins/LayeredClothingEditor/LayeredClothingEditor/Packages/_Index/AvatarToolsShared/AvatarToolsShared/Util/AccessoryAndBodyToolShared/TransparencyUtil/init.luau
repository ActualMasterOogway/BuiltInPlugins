local v0 = require(script.Parent.Constants);
local v1 = {};
v1.getTransparency = function(v2) --[[ Line: 5 ]] --[[ Name: getTransparency ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return 0;
    elseif v2:IsA("MeshPart") then
        return v1.transparencyFromPropertyToLCEditor(v2.Transparency);
    elseif v2:IsA("Model") then
        local l_MeshPart_0 = v2:FindFirstChildWhichIsA("MeshPart");
        if l_MeshPart_0 then
            return v1.transparencyFromPropertyToLCEditor(l_MeshPart_0.Transparency);
        else
            warn("Avatar does not have a MeshPart as child");
            return 0;
        end;
    elseif v2:IsA("Folder") then
        for _, v5 in pairs(v2:GetDescendants()) do
            if v5:IsA("BasePart") then
                return v1.transparencyFromPropertyToLCEditor(v5.Transparency);
            end;
        end;
        warn("folder does not have a Part as child");
        return 0;
    else
        warn("Try to modify transparency on inavlid item " .. v2.Name);
        return 0;
    end;
end;
v1.setTransparency = function(v6, v7) --[[ Line: 36 ]] --[[ Name: setTransparency ]]
    v7 = tonumber(v7);
    if not v6 then
        warn("Try to modify transparency on nil");
        return;
    elseif not v6.Parent then
        warn("Item isn't parented to anything.");
        return;
    else
        if v6:IsA("MeshPart") then
            if v6.Parent:IsA("Model") then
                v6 = v6.Parent;
            else
                v6.Transparency = v7;
                return;
            end;
        end;
        if v6:IsA("Model") then
            for _, v9 in pairs(v6:GetChildren()) do
                if v9:IsA("BasePart") and v9.Name ~= "HumanoidRootPart" then
                    v9.Transparency = v7;
                end;
            end;
            for _, v11 in pairs(v6:GetDescendants()) do
                if v11:IsA("Decal") and v11.Name == "face" then
                    v11.Transparency = v7;
                end;
            end;
            return;
        else
            warn("Try to modify transparency on inavlid item " .. v6.Name);
            return;
        end;
    end;
end;
v1.transparencyFromPropertyToLCEditor = function(v12) --[[ Line: 73 ]] --[[ Name: transparencyFromPropertyToLCEditor ]]
    -- upvalues: v0 (copy)
    local v13 = v12 and v12 or 0;
    return v0.MAX_TRANSPARENCY_PERCENT - v13 * v0.MAX_TRANSPARENCY_PERCENT;
end;
v1.transparencyFromLCEditorToProperty = function(v14) --[[ Line: 78 ]] --[[ Name: transparencyFromLCEditorToProperty ]]
    -- upvalues: v0 (copy)
    return 1 - (v14 and v14 or 0) / v0.MAX_TRANSPARENCY_PERCENT;
end;
return v1;