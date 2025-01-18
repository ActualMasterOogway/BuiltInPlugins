local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_InsertService_0 = game:GetService("InsertService");
local l_StudioService_0 = game:GetService("StudioService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Button_0 = plugin:CreateToolbar("ViewSelector"):CreateButton("ViewSelector", "Show View Selector", "");
l_Button_0.ClickableWhenViewportHidden = false;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = {};
local v34 = {
    Normal = {}, 
    Hover = {}
};
local function v47() --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v15 (ref), l_CoreGui_0 (copy), l_RunService_0 (copy), l_InsertService_0 (copy), v16 (ref), v17 (ref), v18 (ref), v28 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v26 (ref), v27 (ref), v14 (ref), l_StudioService_0 (copy), v34 (copy), v33 (copy), v23 (ref), v24 (ref), v25 (ref), v9 (ref), l_Button_0 (copy)
    v15 = l_CoreGui_0:FindFirstChild("ViewSelectorScreenGui");
    if v15 then
        v15:Destroy();
        l_RunService_0:UnbindFromRenderStep("ViewSelectorAfterCamera");
    end;
    v15 = l_InsertService_0:LoadLocalAsset("rbxasset://models/ViewSelector/ViewSelector.rbxm");
    v15.Parent = l_CoreGui_0;
    v15.Enabled = false;
    v16 = v15:WaitForChild("Panel");
    v17 = v16:WaitForChild("Viewport");
    v18 = v17.AbsoluteSize.x;
    v28 = v17:WaitForChild("EventReceiver");
    v19 = v17:WaitForChild("Model");
    v20 = v16:WaitForChild("X");
    v21 = v16:WaitForChild("Y");
    v22 = v16:WaitForChild("Z");
    v26 = v16:WaitForChild("ArrowButtons");
    v26.Visible = false;
    v27 = false;
    v14 = Instance.new("Camera");
    v14.Parent = v17;
    v14.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -1, 0)));
    v14.FieldOfView = 70;
    v17.CurrentCamera = v14;
    local l_LocalizedStrings_0 = script.Parent.LocalizedStrings;
    local l_l_LocalizedStrings_0_Translator_0 = l_LocalizedStrings_0:GetTranslator(l_StudioService_0.StudioLocaleId);
    local l_l_LocalizedStrings_0_Translator_1 = l_LocalizedStrings_0:GetTranslator("en-us");
    local l_v19_Children_0 = v19:GetChildren();
    for v39 = 1, #l_v19_Children_0 do
        local v40 = l_v19_Children_0[v39];
        if v40.ClassName == "Part" or v40.ClassName == "MeshPart" then
            v40.CFrame = v19.CFrame:ToObjectSpace(v40.CFrame);
        elseif v40.ClassName == "Decal" then
            local l_Name_0 = v40.Name;
            local v42 = v40.Name .. "_hover";
            if not pcall(function() --[[ Line: 91 ]]
                -- upvalues: v34 (ref), v40 (copy), l_l_LocalizedStrings_0_Translator_0 (copy), l_Name_0 (copy), v42 (copy)
                v34.Normal[v40.Name] = l_l_LocalizedStrings_0_Translator_0:FormatByKey(l_Name_0);
                v34.Hover[v40.Name] = l_l_LocalizedStrings_0_Translator_0:FormatByKey(v42);
            end) then
                v34.Normal[v40.Name] = l_l_LocalizedStrings_0_Translator_1:FormatByKey(l_Name_0);
                v34.Hover[v40.Name] = l_l_LocalizedStrings_0_Translator_1:FormatByKey(v42);
            end;
            v40.Texture = v34.Normal[v40.Name];
        end;
    end;
    v19.CFrame = CFrame.new();
    local v43 = {
        "n", 
        "0", 
        "p"
    };
    for v44 = -1, 1 do
        for v45 = -1, 1 do
            for v46 = -1, 1 do
                v33[v43[v44 + 2] .. v43[v45 + 2] .. v43[v46 + 2]] = CFrame.new(Vector3.new(), Vector3.new(-v44, -v45, -v46).Unit);
            end;
        end;
    end;
    v33["0p0"] = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, 3.141592653589793, 0);
    v33["0n0"] = CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 3.141592653589793, 0);
    v23 = Vector3.new(0.5759999752044678, -0.47999998927116394, -0.47999998927116394, 0);
    v24 = Vector3.new(-0.47999998927116394, 0.5759999752044678, -0.47999998927116394, 0);
    v25 = Vector3.new(-0.47999998927116394, -0.47999998927116394, 0.5759999752044678, 0);
    v9 = plugin:GetSetting("ViewSelector_Active");
    if v9 == nil then
        v9 = true;
    end;
    l_Button_0:SetActive(v9);
end;
local function _() --[[ Line: 129 ]] --[[ Name: isInvalidCameraType ]]
    local l_CameraType_0 = game.Workspace.CurrentCamera.CameraType;
    if l_CameraType_0 == Enum.CameraType.Attach or l_CameraType_0 == Enum.CameraType.Scriptable then
        return true;
    else
        return false;
    end;
end;
local function v61(v50, v51) --[[ Line: 137 ]] --[[ Name: getIntersectionPoint ]]
    local v52 = -100;
    local v53 = 100;
    local v54 = -v50;
    local function v60(v55, v56) --[[ Line: 140 ]] --[[ Name: axis ]]
        -- upvalues: v52 (ref), v53 (ref)
        if math.abs(v56) > 0.001 then
            local v57 = (v55 + 0.48) / v56;
            local v58 = (v55 - 0.48) / v56;
            if v58 < v57 then
                local l_v58_0 = v58;
                v58 = v57;
                v57 = l_v58_0;
            end;
            if v52 < v57 then
                v52 = v57;
            end;
            if v58 < v53 then
                v53 = v58;
            end;
            if v53 < v52 then
                return 0;
            elseif v53 < 0 then
                return 0;
            end;
        elseif -v55 - 0.48 > 0 or -v55 + 0.48 < 0 then
            return 0;
        end;
    end;
    if v60(v54.X, v51.X) == 0 then
        return;
    elseif v60(v54.Y, v51.Y) == 0 then
        return;
    elseif v60(v54.Z, v51.Z) == 0 then
        return;
    elseif v52 > 0 then
        return v50 + v51 * v52;
    else
        return v50 + v51 * v53;
    end;
end;
local function _(v62) --[[ Line: 179 ]] --[[ Name: enableHighlight ]]
    -- upvalues: v34 (copy)
    if not v62 then
        return;
    elseif v62.ClassName == "Decal" then
        v62.Texture = v34.Hover[v62.Name];
        return;
    else
        v62.Transparency = 0.3;
        return;
    end;
end;
local function _(v64) --[[ Line: 190 ]] --[[ Name: cancelHighlight ]]
    -- upvalues: v34 (copy)
    if not v64 then
        return;
    elseif v64.ClassName == "Decal" then
        v64.Texture = v34.Normal[v64.Name];
        return;
    else
        v64.Transparency = 1;
        return;
    end;
end;
local function v72(v66) --[[ Line: 201 ]] --[[ Name: getNameFromIntersectionPoint ]]
    local v67 = math.abs(v66.x);
    local v68 = math.abs(v66.y);
    local v69 = math.abs(v66.z);
    local function _(v70) --[[ Line: 203 ]] --[[ Name: getFaceName ]]
        if v70 >= 0 then
            return "p";
        else
            return "n";
        end;
    end;
    if v67 + v68 + v69 > 1.056 then
        return (v66.x >= 0 and "p" or "n") .. (v66.y >= 0 and "p" or "n") .. (v66.z >= 0 and "p" or "n");
    elseif v68 < v67 and v69 < v67 then
        return (v66.x >= 0 and "p" or "n") .. "00";
    elseif v67 < v68 and v69 < v68 then
        return "0" .. (v66.y >= 0 and "p" or "n") .. "0";
    else
        return "00" .. (v66.z >= 0 and "p" or "n");
    end;
end;
local function _(v73, v74) --[[ Line: 225 ]] --[[ Name: screenPointToViewport ]]
    -- upvalues: l_GuiService_0 (copy), v17 (ref)
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    return v73 - v17.AbsolutePosition.X - l_l_GuiService_0_GuiInset_0.x, v74 - v17.AbsolutePosition.Y - l_l_GuiService_0_GuiInset_0.y;
end;
local function v85(v77, v78) --[[ Line: 232 ]] --[[ Name: onMouseMove ]]
    -- upvalues: l_GuiService_0 (copy), v17 (ref), v14 (ref), v18 (ref), v61 (copy), v72 (copy), v19 (ref), v13 (ref), v34 (copy)
    local l_CameraType_1 = game.Workspace.CurrentCamera.CameraType;
    if l_CameraType_1 == Enum.CameraType.Attach or l_CameraType_1 == Enum.CameraType.Scriptable then
        return;
    else
        local l_l_GuiService_0_GuiInset_1 = l_GuiService_0:GetGuiInset();
        local v81 = v77 - v17.AbsolutePosition.X - l_l_GuiService_0_GuiInset_1.x;
        local v82 = v78 - v17.AbsolutePosition.Y - l_l_GuiService_0_GuiInset_1.y;
        l_l_GuiService_0_GuiInset_1 = v14:ViewportPointToRay(v81 / v18, v82 / v18, 0);
        v81 = v61(l_l_GuiService_0_GuiInset_1.Origin, l_l_GuiService_0_GuiInset_1.Direction);
        if v81 then
            local v83 = v19[v72(v81)];
            if v13 ~= v83 then
                local l_v13_0 = v13;
                if l_v13_0 then
                    if l_v13_0.ClassName == "Decal" then
                        l_v13_0.Texture = v34.Normal[l_v13_0.Name];
                    else
                        l_v13_0.Transparency = 1;
                    end;
                end;
                if v83 then
                    if v83.ClassName == "Decal" then
                        v83.Texture = v34.Hover[v83.Name];
                    else
                        v83.Transparency = 0.3;
                    end;
                end;
                v13 = v83;
                return;
            end;
        else
            v82 = v13;
            if v82 then
                if v82.ClassName == "Decal" then
                    v82.Texture = v34.Normal[v82.Name];
                else
                    v82.Transparency = 1;
                end;
            end;
            v13 = nil;
        end;
        return;
    end;
end;
local function v89() --[[ Line: 254 ]] --[[ Name: updateArrowButtons ]]
    -- upvalues: v27 (ref), v10 (ref), v26 (ref)
    if not v27 then
        return;
    else
        local l_LookVector_0 = v10.LookVector;
        local function _(v87) --[[ Line: 260 ]] --[[ Name: parallel ]]
            -- upvalues: l_LookVector_0 (copy)
            return math.abs(math.abs((l_LookVector_0:Dot(v87))) - 1) < 0.001;
        end;
        v26.Visible = math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(1, 0, 0, 0))))) - 1) < 0.001 or math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(0, 1, 0, 0))))) - 1) < 0.001 or math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(0, 0, 1, 0))))) - 1) < 0.001;
        return;
    end;
end;
local function v90() --[[ Line: 268 ]] --[[ Name: onMouseEnter ]]
    -- upvalues: v27 (ref), v89 (copy)
    v27 = true;
    v89();
end;
local function v92() --[[ Line: 273 ]] --[[ Name: onMouseLeave ]]
    -- upvalues: v13 (ref), v34 (copy), v26 (ref), v27 (ref)
    local l_v13_1 = v13;
    if l_v13_1 then
        if l_v13_1.ClassName == "Decal" then
            l_v13_1.Texture = v34.Normal[l_v13_1.Name];
        else
            l_v13_1.Transparency = 1;
        end;
    end;
    v13 = nil;
    v26.Visible = false;
    v27 = false;
end;
local function v98(v93) --[[ Line: 280 ]] --[[ Name: onInputChanged ]]
    -- upvalues: v11 (ref), v12 (ref), v16 (ref)
    if not v11 then
        return;
    else
        if v93.UserInputType == Enum.UserInputType.MouseMovement then
            local l_x_0 = v93.Position.x;
            local l_y_0 = v93.Position.y;
            if math.abs(v11.x - l_x_0) + math.abs(v11.y - l_y_0) > 5 then
                local v96 = v12.X.Offset + l_x_0 - v11.x;
                local v97 = v12.Y.Offset + l_y_0 - v11.y;
                v16.Position = UDim2.new(v12.X.Scale, v96, v12.Y.Scale, v97);
            end;
        end;
        return;
    end;
end;
local function v112() --[[ Line: 296 ]] --[[ Name: loadPosition ]]
    -- upvalues: v18 (ref), v16 (ref)
    local function _(v99, v100) --[[ Line: 297 ]] --[[ Name: loadAxis ]]
        -- upvalues: v18 (ref)
        local v101 = game.Workspace.CurrentCamera.ViewportSize[v99];
        local v102 = 0.5;
        local v103 = 0.5;
        if v18 < v101 then
            v102 = plugin:GetSetting("ViewSelector_Position" .. v99) or v100;
            v103 = (v102 * (v101 - v18) + v102 * v18) / v101;
        end;
        return v102, v103;
    end;
    local l_X_0 = game.Workspace.CurrentCamera.ViewportSize.X;
    local v106 = 0.5;
    local v107 = 0.5;
    if v18 < l_X_0 then
        v106 = plugin:GetSetting("ViewSelector_Position" .. "X") or 1;
        v107 = (v106 * (l_X_0 - v18) + v106 * v18) / l_X_0;
    end;
    local l_v106_0 = v106;
    local l_v107_0 = v107;
    v107 = game.Workspace.CurrentCamera.ViewportSize.Y;
    local v110 = 0.5;
    local v111 = 0.5;
    if v18 < v107 then
        v110 = plugin:GetSetting("ViewSelector_Position" .. "Y") or 0;
        v111 = (v110 * (v107 - v18) + v110 * v18) / v107;
    end;
    l_X_0 = v110;
    v106 = v111;
    v16.AnchorPoint = Vector2.new(l_v106_0, l_X_0);
    v16.Position = UDim2.new(l_v107_0, 0, v106, 0);
end;
local function v128() --[[ Line: 313 ]] --[[ Name: clampAndSavePosition ]]
    -- upvalues: v18 (ref), v16 (ref)
    local function _(v113) --[[ Line: 314 ]] --[[ Name: saveAxis ]]
        -- upvalues: v18 (ref), v16 (ref)
        local v114 = game.Workspace.CurrentCamera.ViewportSize[v113];
        local v115 = 0.5;
        local v116 = 0.5;
        if v18 < v114 then
            local v117 = math.clamp(v16.AbsolutePosition[v113], 0, v114 - v18);
            v115 = v117 / (v114 - v18);
            v116 = (v117 + v115 * v18) / v114;
        end;
        plugin:SetSetting("ViewSelector_Position" .. v113, v115);
        return v115, v116;
    end;
    local l_X_1 = game.Workspace.CurrentCamera.ViewportSize.X;
    local v120 = 0.5;
    local v121 = 0.5;
    if v18 < l_X_1 then
        local v122 = math.clamp(v16.AbsolutePosition.X, 0, l_X_1 - v18);
        v120 = v122 / (l_X_1 - v18);
        v121 = (v122 + v120 * v18) / l_X_1;
    end;
    plugin:SetSetting("ViewSelector_Position" .. "X", v120);
    local l_v120_0 = v120;
    local l_v121_0 = v121;
    v121 = game.Workspace.CurrentCamera.ViewportSize.Y;
    local v125 = 0.5;
    local v126 = 0.5;
    if v18 < v121 then
        local v127 = math.clamp(v16.AbsolutePosition.Y, 0, v121 - v18);
        v125 = v127 / (v121 - v18);
        v126 = (v127 + v125 * v18) / v121;
    end;
    plugin:SetSetting("ViewSelector_Position" .. "Y", v125);
    l_X_1 = v125;
    v120 = v126;
    v16.AnchorPoint = Vector2.new(l_v120_0, l_X_1);
    v16.Position = UDim2.new(l_v121_0, 0, v120, 0);
end;
local function v130(v129) --[[ Line: 331 ]] --[[ Name: onInputEnded ]]
    -- upvalues: v11 (ref), v128 (copy)
    if v129.UserInputType == Enum.UserInputType.MouseButton1 and v11 then
        v11 = nil;
        v128();
    end;
end;
local function v133(v131, v132) --[[ Line: 338 ]] --[[ Name: onMouseButton1Down ]]
    -- upvalues: v11 (ref), v12 (ref), v16 (ref)
    v11 = Vector2.new(v131, v132);
    v12 = v16.Position;
end;
local function _(v134) --[[ Line: 343 ]] --[[ Name: tweenCameraToDirection ]]
    -- upvalues: v32 (ref), v31 (ref), v30 (ref), v29 (ref)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_Position_0 = l_CurrentCamera_0.Focus.Position;
    local l_Magnitude_0 = (l_Position_0 - l_CurrentCamera_0.CFrame.Position).Magnitude;
    local v138 = l_Position_0 - v134.LookVector * l_Magnitude_0;
    v32 = l_Position_0;
    v31 = v134 + v138;
    v30 = l_CurrentCamera_0.CFrame;
    v29 = 0;
end;
local function v148(v140, v141) --[[ Line: 354 ]] --[[ Name: onMouseButton1Up ]]
    -- upvalues: v11 (ref), v13 (ref), v33 (copy), v32 (ref), v31 (ref), v30 (ref), v29 (ref), v128 (copy)
    if not v11 then
        return;
    else
        local v142 = math.abs(v11.x - v140) + math.abs(v11.y - v141);
        v11 = nil;
        if v142 <= 5 then
            if v13 then
                local v143 = v33[v13.Name];
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local l_Position_1 = l_CurrentCamera_1.Focus.Position;
                local l_Magnitude_1 = (l_Position_1 - l_CurrentCamera_1.CFrame.Position).Magnitude;
                local v147 = l_Position_1 - v143.LookVector * l_Magnitude_1;
                v32 = l_Position_1;
                v31 = v143 + v147;
                v30 = l_CurrentCamera_1.CFrame;
                v29 = 0;
                return;
            end;
        else
            v128();
        end;
        return;
    end;
end;
local function _() --[[ Line: 369 ]] --[[ Name: updateXYZLabelPosition ]]
    -- upvalues: v19 (ref), v10 (ref), v17 (ref), v14 (ref), v18 (ref), v20 (ref), v23 (ref), v21 (ref), v24 (ref), v22 (ref), v25 (ref)
    local function v154(v149, v150) --[[ Line: 370 ]] --[[ Name: updatePosition ]]
        -- upvalues: v19 (ref), v10 (ref), v17 (ref), v14 (ref), v18 (ref)
        local v151 = v19.CFrame * v150;
        if v150:Dot(v10.LookVector) < 0 then
            v149.ZIndex = v17.ZIndex + 1;
        else
            v149.ZIndex = v17.ZIndex - 1;
        end;
        local v152, v153 = v14:WorldToViewportPoint(v151);
        if v153 then
            v149.Visible = true;
            v149.Position = UDim2.new(0, v152.x * v18, 0, v152.y * v18);
            return;
        else
            v149.Visible = false;
            return;
        end;
    end;
    v154(v20, v23);
    v154(v21, v24);
    v154(v22, v25);
end;
local function v165(v156) --[[ Line: 392 ]] --[[ Name: afterCamera ]]
    -- upvalues: v29 (ref), v31 (ref), v32 (ref), v30 (ref), v14 (ref), v10 (ref), v17 (ref), v19 (ref), v18 (ref), v20 (ref), v23 (ref), v21 (ref), v24 (ref), v22 (ref), v25 (ref), v89 (copy)
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    if v29 then
        v29 = v29 + v156;
        if v29 > 0.2 then
            l_CurrentCamera_2.CFrame = v31;
            l_CurrentCamera_2.Focus = CFrame.new(v32);
            v29 = nil;
        else
            l_CurrentCamera_2.CFrame = v30:Lerp(v31, v29 / 0.2);
        end;
    end;
    local l_CFrame_0 = l_CurrentCamera_2.CFrame;
    v14.CFrame = CFrame.fromMatrix(-l_CFrame_0.LookVector * 1.9, l_CFrame_0.RightVector, l_CFrame_0.UpVector, -l_CFrame_0.LookVector);
    if v14.CFrame ~= v10 then
        v10 = v14.CFrame;
        v17.LightDirection = (v10 - v10.Position):ToWorldSpace(CFrame.new(-1, -1, -1)).Position;
        local function v164(v159, v160) --[[ Line: 370 ]] --[[ Name: updatePosition ]]
            -- upvalues: v19 (ref), v10 (ref), v17 (ref), v14 (ref), v18 (ref)
            local v161 = v19.CFrame * v160;
            if v160:Dot(v10.LookVector) < 0 then
                v159.ZIndex = v17.ZIndex + 1;
            else
                v159.ZIndex = v17.ZIndex - 1;
            end;
            local v162, v163 = v14:WorldToViewportPoint(v161);
            if v163 then
                v159.Visible = true;
                v159.Position = UDim2.new(0, v162.x * v18, 0, v162.y * v18);
                return;
            else
                v159.Visible = false;
                return;
            end;
        end;
        v164(v20, v23);
        v164(v21, v24);
        v164(v22, v25);
        v89();
    end;
end;
local function v167(v166) --[[ Line: 416 ]] --[[ Name: showViewSelector ]]
    -- upvalues: v15 (ref), l_ContentProvider_0 (copy), v165 (copy), l_RunService_0 (copy), v112 (copy), l_Button_0 (copy)
    if v15.Enabled == v166 then
        return;
    else
        plugin:SetSetting("ViewSelector_Active", v166);
        if v166 then
            pcall(function() --[[ Line: 422 ]]
                -- upvalues: l_ContentProvider_0 (ref), v15 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v15
                });
            end);
            v165(0);
            l_RunService_0:BindToRenderStep("ViewSelectorAfterCamera", Enum.RenderPriority.Camera.Value + 1, v165);
            v112();
        else
            l_RunService_0:UnbindFromRenderStep("ViewSelectorAfterCamera");
        end;
        l_Button_0:SetActive(v166);
        v15.Enabled = v166;
        return;
    end;
end;
local function v168() --[[ Line: 436 ]] --[[ Name: onToolBarButtonClicked ]]
    -- upvalues: v9 (ref), v167 (copy)
    v9 = not v9;
    v167(v9);
end;
local function v182(v169, v170) --[[ Line: 441 ]] --[[ Name: bindArrowButtonEvents ]]
    -- upvalues: v10 (ref), v61 (copy), v72 (copy), v33 (copy), v32 (ref), v31 (ref), v30 (ref), v29 (ref), v148 (copy)
    v169.MouseButton1Click:connect(function() --[[ Line: 442 ]]
        -- upvalues: v10 (ref), v170 (copy), v61 (ref), v72 (ref), v33 (ref), v32 (ref), v31 (ref), v30 (ref), v29 (ref)
        local l_RightVector_0 = v10.RightVector;
        local l_UpVector_0 = v10.UpVector;
        local v173 = -l_RightVector_0 * v170.y + l_UpVector_0 * v170.x;
        local v174 = CFrame.fromAxisAngle(v173, 1.5707963267948966) * v10.LookVector;
        local v175 = -v174 * 2;
        local v176 = v61(v175, v174);
        if v176 then
            local v177 = v33[v72(v176)];
            local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
            local l_Position_2 = l_CurrentCamera_3.Focus.Position;
            local l_Magnitude_2 = (l_Position_2 - l_CurrentCamera_3.CFrame.Position).Magnitude;
            local v181 = l_Position_2 - v177.LookVector * l_Magnitude_2;
            v32 = l_Position_2;
            v31 = v177 + v181;
            v30 = l_CurrentCamera_3.CFrame;
            v29 = 0;
        end;
    end);
    v169.MouseButton1Up:connect(v148);
    v169.MouseEnter:Connect(function() --[[ Line: 456 ]]
        -- upvalues: v169 (copy)
        v169.ImageColor3 = Color3.fromRGB(79, 178, 229);
        v169.ImageTransparency = 0;
    end);
    v169.MouseLeave:Connect(function() --[[ Line: 460 ]]
        -- upvalues: v169 (copy)
        v169.ImageColor3 = Color3.fromRGB(247, 249, 255);
        v169.ImageTransparency = 0.6;
    end);
end;
if not l_RunService_0:IsEdit() and not l_RunService_0:IsServer() then
    l_Button_0.Enabled = false;
    return;
else
    v47();
    v167(v9);
    l_Button_0.Click:connect(v168);
    v28.MouseMoved:connect(v85);
    v28.MouseEnter:connect(v90);
    v28.MouseLeave:connect(v92);
    v28.MouseButton1Down:connect(v133);
    v28.MouseButton1Up:connect(v148);
    l_UserInputService_0.InputChanged:connect(v98);
    l_UserInputService_0.InputEnded:connect(v130);
    v182(v26:WaitForChild("RightArrow"), Vector2.new(1, 0));
    v182(v26:WaitForChild("LeftArrow"), Vector2.new(-1, 0));
    v182(v26:WaitForChild("UpArrow"), Vector2.new(0, 1));
    v182(v26:WaitForChild("DownArrow"), Vector2.new(0, -1));
    if game:GetEngineFeature("NewCameraControls") then
        local v183 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
        local l_CamSpeed_0 = v16:WaitForChild("CamSpeed");
        local l_UIStroke_0 = l_CamSpeed_0:WaitForChild("UIStroke");
        local l_Slider_0 = l_CamSpeed_0:WaitForChild("Slider");
        local l_X_2 = l_CamSpeed_0.AbsoluteSize.X;
        local v188 = l_TweenService_0:Create(l_CamSpeed_0, v183, {
            TextTransparency = 1, 
            BackgroundTransparency = 1
        });
        local v189 = l_TweenService_0:Create(l_Slider_0, v183, {
            BackgroundTransparency = 1
        });
        local v190 = nil;
        local v191 = {
            mouseOverViewSelector = false, 
            mouseOverSlider = false, 
            isDraggingSlider = false
        };
        do
            local l_v190_0 = v190;
            local function v193() --[[ Line: 514 ]] --[[ Name: onInteract ]]
                -- upvalues: v188 (copy), v189 (copy), l_v190_0 (ref), l_CamSpeed_0 (copy), l_Slider_0 (copy), v191 (copy), l_UIStroke_0 (copy)
                v188:Cancel();
                v189:Cancel();
                if l_v190_0 then
                    task.cancel(l_v190_0);
                end;
                l_CamSpeed_0.TextTransparency = 0.1;
                l_Slider_0.BackgroundTransparency = 0.1;
                if v191.isDraggingSlider then
                    l_CamSpeed_0.BackgroundTransparency = 0.4;
                else
                    l_CamSpeed_0.BackgroundTransparency = 0.6;
                end;
                if v191.mouseOverSlider or v191.isDraggingSlider then
                    l_UIStroke_0.Transparency = 0.1;
                else
                    l_UIStroke_0.Transparency = 1;
                end;
                if not v191.mouseOverViewSelector and not v191.mouseOverSlider and not v191.isDraggingSlider then
                    l_v190_0 = task.delay(3.5, function() --[[ Line: 543 ]]
                        -- upvalues: v188 (ref), v189 (ref)
                        v188:Play();
                        v189:Play();
                    end);
                end;
            end;
            local function v196() --[[ Line: 550 ]] --[[ Name: refreshValues ]]
                -- upvalues: l_CamSpeed_0 (copy), l_X_2 (copy), l_Slider_0 (copy)
                local v194 = settings().Studio["Camera Speed"];
                l_CamSpeed_0.Text = string.format("%.1f", v194);
                local v195 = math.max(10, (math.min(v194 / 20 * l_X_2, l_X_2)));
                l_Slider_0.Size = UDim2.new(0, v195, 1, 0);
            end;
            settings().Studio:GetPropertyChangedSignal("Camera Speed"):Connect(function() --[[ Line: 559 ]]
                -- upvalues: v196 (copy), v193 (copy)
                v196();
                v193();
            end);
            v28.MouseEnter:Connect(function() --[[ Line: 565 ]]
                -- upvalues: v191 (copy), v193 (copy)
                v191.mouseOverViewSelector = true;
                v193();
            end);
            v28.MouseLeave:Connect(function() --[[ Line: 569 ]]
                -- upvalues: v191 (copy), v193 (copy)
                v191.mouseOverViewSelector = false;
                v193();
            end);
            l_CamSpeed_0.MouseEnter:Connect(function() --[[ Line: 575 ]]
                -- upvalues: v191 (copy), v193 (copy)
                v191.mouseOverSlider = true;
                v193();
            end);
            l_CamSpeed_0.MouseLeave:Connect(function() --[[ Line: 579 ]]
                -- upvalues: v191 (copy), v193 (copy)
                v191.mouseOverSlider = false;
                v193();
            end);
            l_CamSpeed_0.MouseButton1Down:Connect(function() --[[ Line: 585 ]]
                -- upvalues: v191 (copy), v193 (copy), l_UserInputService_0 (copy), l_CamSpeed_0 (copy), l_X_2 (copy), l_RunService_0 (copy)
                v191.isDraggingSlider = true;
                v193();
                repeat
                    local v197 = (l_UserInputService_0:GetMouseLocation().X - l_CamSpeed_0.AbsolutePosition.X) / l_X_2;
                    settings().Studio["Camera Speed"] = math.min(20, (math.max(0.1, v197 * 20)));
                    l_RunService_0.RenderStepped:Wait();
                until not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
                v191.isDraggingSlider = false;
                v193();
            end);
            v196();
            l_CamSpeed_0.BackgroundTransparency = 1;
            l_CamSpeed_0.TextTransparency = 1;
            l_UIStroke_0.Transparency = 1;
            l_Slider_0.BackgroundTransparency = 1;
        end;
    else
        v16:WaitForChild("CamSpeed"):Destroy();
    end;
    return;
end;