local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_AssetRenderModel_0 = v1.UI.AssetRenderModel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local function v13(v8) --[[ Line: 16 ]] --[[ Name: getPrimaryPart ]]
    -- upvalues: v4 (copy)
    if v8:IsA("Model") then
        return v8.PrimaryPart;
    else
        if v8:IsA("Accessory") then
            local l_Handle_0 = v8:FindFirstChild("Handle");
            if v4() then
                if l_Handle_0 and l_Handle_0:IsA("BasePart") then
                    return l_Handle_0;
                end;
            elseif l_Handle_0:IsA("BasePart") then
                return l_Handle_0;
            end;
        elseif v8:IsA("BasePart") then
            return v8;
        elseif v8:IsA("Folder") then
            local l_Accessory_0 = v8:FindFirstChildWhichIsA("Accessory");
            if v4() then
                local v11 = l_Accessory_0 and l_Accessory_0:FindFirstChild("Handle");
                if v11 and v11:IsA("BasePart") then
                    return v11;
                end;
            else
                local l_Handle_1 = l_Accessory_0:FindFirstChild("Handle");
                if l_Handle_1:IsA("BasePart") then
                    return l_Handle_1;
                end;
            end;
        end;
        return nil;
    end;
end;
return function(v14) --[[ Line: 50 ]] --[[ Name: ItemDataPreviewModel ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), v5 (copy), v13 (copy), v4 (copy), l_AssetRenderModel_0 (copy)
    local v15 = l_Stylizer_0:use("ItemDataPreviewModel");
    local v19 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v14 (copy), v5 (ref), v13 (ref), v4 (ref)
        local v16 = v14.Instance:Clone();
        if v5() and v16 == nil then
            return nil;
        else
            local v17 = v13(v16);
            if v4() and v17 == nil then
                return nil;
            else
                local l_Model_0 = Instance.new("Model");
                v16.Parent = l_Model_0;
                assert(v17:IsDescendantOf(l_Model_0), "The primary part we're about to use should have been moved");
                l_Model_0.PrimaryPart = v17;
                return l_Model_0;
            end;
        end;
    end, {
        v14.Instance
    });
    if v5() and v19 == nil then
        return nil;
    else
        return v2.createElement(l_AssetRenderModel_0, {
            FocusDirection = v19.PrimaryPart and v19.PrimaryPart.CFrame.LookVector, 
            Model = v19, 
            Static = true, 
            Ambient = v15.InstanceAmbient, 
            LightColor = Color3.new(1, 1, 1), 
            LightDirection = v19.PrimaryPart and -v19.PrimaryPart.CFrame.LookVector, 
            ImageTransparency = v14.Transparency
        });
    end;
end;