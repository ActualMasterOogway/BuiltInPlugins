local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationEditingMode);
local v3 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestResult);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
local function v14(v5, v6) --[[ Line: 9 ]] --[[ Name: attachListeners ]]
    -- upvalues: l_AnnotationsService_0 (copy), v2 (copy)
    local l_Highlight_0 = v6:FindFirstChild("Highlight");
    local v8 = v6.MouseEnter:Connect(function() --[[ Line: 12 ]]
        -- upvalues: l_AnnotationsService_0 (ref), v2 (ref), v5 (copy)
        if l_AnnotationsService_0.Mode ~= v2.None then
            return;
        else
            if v5.Contents and v5.Contents ~= "" then
                l_AnnotationsService_0.Hovered = v5;
            end;
            return;
        end;
    end);
    local v9 = v6.MouseLeave:Connect(function() --[[ Line: 22 ]]
        -- upvalues: l_AnnotationsService_0 (ref), v2 (ref)
        if l_AnnotationsService_0.Mode ~= v2.None then
            return;
        else
            l_AnnotationsService_0.Hovered = nil;
            return;
        end;
    end);
    local v10 = l_AnnotationsService_0:GetPropertyChangedSignal("Hovered"):Connect(function() --[[ Line: 28 ]]
        -- upvalues: l_Highlight_0 (copy), l_AnnotationsService_0 (ref), v5 (copy)
        l_Highlight_0.Visible = l_AnnotationsService_0.Hovered == v5;
    end);
    local v11 = v6.MouseButton1Click:Connect(function() --[[ Line: 31 ]]
        -- upvalues: l_AnnotationsService_0 (ref), v2 (ref), v5 (copy)
        if l_AnnotationsService_0.Mode ~= v2.None then
            return;
        else
            if l_AnnotationsService_0.Selected ~= v5 and l_AnnotationsService_0.Hovered == v5 then
                l_AnnotationsService_0.Selected = v5;
                if not v5.LoadingReplies and #v5:GetChildren() ~= v5.ReplyCount then
                    l_AnnotationsService_0:LoadAnnotationReplies(v5);
                end;
            end;
            return;
        end;
    end);
    local v12 = l_AnnotationsService_0:GetPropertyChangedSignal("Selected"):Connect(function() --[[ Line: 43 ]]
        -- upvalues: l_Highlight_0 (copy), l_AnnotationsService_0 (ref), v5 (copy)
        l_Highlight_0.Visible = l_AnnotationsService_0.Selected == v5;
    end);
    local v13 = v5:GetPropertyChangedSignal("Resolved"):Connect(function() --[[ Line: 46 ]]
        -- upvalues: v5 (copy), v6 (copy)
        if v5.Resolved and v6.Parent then
            v6.Parent:Destroy();
        end;
    end);
    v5.Destroying:Once(function() --[[ Line: 52 ]]

    end);
    v6.Destroying:Connect(function() --[[ Line: 56 ]]
        -- upvalues: v12 (copy), v10 (copy), v8 (copy), v9 (copy), v11 (copy), v13 (copy)
        v12:Disconnect();
        v10:Disconnect();
        v8:Disconnect();
        v9:Disconnect();
        v11:Disconnect();
        v13:Disconnect();
    end);
end;
return function(v15) --[[ Line: 67 ]] --[[ Name: createAnnotationBillboard ]]
    -- upvalues: v3 (copy), l_AnnotationsService_0 (copy), v14 (copy)
    assert(v15.Adornee and v15.AdorneeOffset, "Billboards are only created for top-level annotations.");
    local l_PlaceAnnotations_0 = game.CoreGui:FindFirstChild("PlaceAnnotations");
    if l_PlaceAnnotations_0:FindFirstChild(v15:GetStringUniqueId(), true) then
        return nil, nil;
    else
        local l_BillboardGui_0 = Instance.new("BillboardGui");
        l_BillboardGui_0.Name = v15:GetStringUniqueId();
        l_BillboardGui_0.Adornee = v15.Adornee;
        l_BillboardGui_0.StudsOffsetWorldSpace = v15.AdorneeOffset;
        l_BillboardGui_0.AlwaysOnTop = true;
        l_BillboardGui_0.Size = UDim2.fromScale(3, 3);
        l_BillboardGui_0.SizeOffset = Vector2.new(0.5, 0.5);
        l_BillboardGui_0.Active = true;
        l_BillboardGui_0.Parent = l_PlaceAnnotations_0;
        if v15:GetAttribute("IsDraft") then
            l_BillboardGui_0.Enabled = true;
            l_BillboardGui_0:SetAttribute("IsDraft", true);
            v15.RequestCompleted:Once(function(_, _, v20) --[[ Line: 86 ]]
                -- upvalues: v3 (ref), l_BillboardGui_0 (copy), l_AnnotationsService_0 (ref)
                if v20 == v3.Success then
                    l_BillboardGui_0.Enabled = l_AnnotationsService_0.AnnotationsVisible;
                    l_BillboardGui_0:SetAttribute("IsDraft", nil);
                end;
            end);
        else
            l_BillboardGui_0.Enabled = l_AnnotationsService_0.AnnotationsVisible;
        end;
        v15.Destroying:Connect(function() --[[ Line: 95 ]]
            -- upvalues: l_BillboardGui_0 (copy)
            l_BillboardGui_0:Destroy();
        end);
        local v21 = Instance.new("ImageButton", l_BillboardGui_0);
        v21.Name = "Indicator";
        v21.Image = "rbxasset://textures/PlaceAnnotations/AnnotationSingle.png";
        v21.BorderSizePixel = 0;
        v21.BackgroundTransparency = 1;
        v21.ImageTransparency = 0.2;
        v21.Size = UDim2.fromScale(1, 1);
        v21.AnchorPoint = Vector2.new(0, 1);
        v21.Position = UDim2.fromScale(0, 1);
        Instance.new("UISizeConstraint", v21).MaxSize = Vector2.new(48, 48);
        local v22 = Instance.new("ImageLabel", v21);
        v22.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&filters=circular&w=150&h=150"):format(v15.AuthorId);
        v22.BorderSizePixel = 0;
        v22.BackgroundTransparency = 0;
        v22.BackgroundColor3 = Color3.fromHex("#989898");
        v22.Size = UDim2.fromScale(0.8, 0.8);
        v22.Position = UDim2.fromScale(0.5, 0.5);
        v22.AnchorPoint = Vector2.new(0.5, 0.5);
        Instance.new("UICorner", v22).CornerRadius = UDim.new(1, 0);
        local v23 = Instance.new("ImageLabel", v21);
        v23.Name = "Highlight";
        v23.Image = "rbxasset://textures/PlaceAnnotations/AnnotationSingleHighlight.png";
        v23.BorderSizePixel = 0;
        v23.BackgroundTransparency = 1;
        v23.Size = UDim2.fromScale(1, 1);
        v23.ImageColor3 = Color3.fromRGB(69, 153, 255);
        v23.Visible = false;
        v14(v15, v21);
        return v21, v23;
    end;
end;