local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Framework);
local v5 = require(l_Parent_1.React);
local l_withForwardRef_0 = v4.Wrappers.withForwardRef;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_prioritize_0 = v4.Util.prioritize;
local l_UI_0 = v4.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local _ = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local v13 = require(l_Parent_0.Context.StudioServices);
local v14 = require(l_Parent_0.Enums.MaterialPreviewGeometryType);
local l_Util_0 = l_Parent_0.Util;
local v16 = require(l_Util_0.getMaterialColor);
local l_Constants_0 = l_Parent_0.Constants;
local v18 = require(l_Constants_0.BASE_MATERIALS_WITH_METALNESS);
local v19 = require(l_Parent_0.Flags.getFFlagMaterialPickerUIChanges);
local v20 = require(l_Parent_0.Flags.getFFlagEnableSkyForMetalBalls);
local v21 = require(l_Parent_0.Flags.getFFlagMaterialGeneratorTempMaterialVariantsFix);
local v22 = {};
local l_Model_0 = Instance.new("Model");
local function v28(v24, v25) --[[ Line: 113 ]] --[[ Name: DEPRECATED_getLocalMeshPartTemplate ]]
    -- upvalues: l_Model_0 (copy), v21 (copy), v22 (copy)
    if not v25 then
        return l_Model_0;
    else
        assert(type(v25) == "string", "Bad assetId");
        if not v21() and v22[v25] then
            return v22[v25];
        else
            local v26 = v24:getService("InsertService"):LoadLocalAsset(v25);
            if v26 then
                local l_MeshPart_0 = v26:FindFirstChild("MeshPart");
                if l_MeshPart_0 then
                    l_MeshPart_0.CFrame = CFrame.new(0, 0, 0);
                    if not FFlagMaterialGeneratorTempMaterialVariantsFix then
                        v22[v25] = l_MeshPart_0;
                    end;
                    return l_MeshPart_0;
                else
                    return l_Model_0;
                end;
            else
                return l_Model_0;
            end;
        end;
    end;
end;
local function v39(v29, v30, v31, v32, v33) --[[ Line: 146 ]] --[[ Name: getLocalMeshPartTemplate ]]
    -- upvalues: l_Model_0 (copy), l_prioritize_0 (copy), v21 (copy), v22 (copy)
    if not v30 then
        return l_Model_0;
    else
        assert(type(v30) == "string", "Bad assetId");
        local v34 = l_prioritize_0(v32, v33);
        local v35 = v30 .. tostring(v34) .. tostring(v31);
        if not v21() and v22[v35] then
            return v22[v35];
        else
            local v36 = v29:getService("InsertService"):LoadLocalAsset(v30);
            if v36 then
                local l_MeshPart_1 = v36:FindFirstChild("MeshPart");
                if l_MeshPart_1 then
                    l_MeshPart_1.CFrame = CFrame.new(0, 0, 0);
                    if v31 then
                        local l_Part_0 = Instance.new("Part");
                        l_Part_0.Shape = Enum.PartType.Ball;
                        l_Part_0.Size = l_MeshPart_1.Size + Vector3.new(v31, v31, v31);
                        l_Part_0.Color = Color3.fromRGB(38, 38, 38);
                        l_Part_0.Material = Enum.Material.Neon;
                        l_Part_0.CFrame = CFrame.fromMatrix(Vector3.zero, Vector3.xAxis, Vector3.yAxis, -Vector3.zAxis);
                        l_Part_0.Parent = l_MeshPart_1;
                    end;
                    if v32 or v31 then
                        backgroundSphere = Instance.new("Part");
                        backgroundSphere.Shape = Enum.PartType.Ball;
                        backgroundSphere.Size = l_MeshPart_1.size;
                        backgroundSphere.Color = v34;
                        backgroundSphere.Material = Enum.Material.Neon;
                        backgroundSphere.CFrame = CFrame.fromMatrix(Vector3.zero, Vector3.xAxis, Vector3.yAxis, -Vector3.zAxis);
                        backgroundSphere.Parent = l_MeshPart_1;
                    end;
                    if not v21() then
                        v22[v35] = l_MeshPart_1;
                    end;
                    return l_MeshPart_1;
                else
                    return l_Model_0;
                end;
            else
                return l_Model_0;
            end;
        end;
    end;
end;
local function v41() --[[ Line: 213 ]] --[[ Name: getCubeTemplate ]]
    -- upvalues: v21 (copy), v22 (copy)
    if not v21() and v22.Cube then
        return v22.Cube;
    else
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Size = Vector3.new(3.535533905029297, 3.535533905029297, 3.535533905029297, 0);
        if not v21() then
            v22.Cube = l_Part_1;
        end;
        return l_Part_1;
    end;
end;
local function v43() --[[ Line: 231 ]] --[[ Name: getPlaneTemplate ]]
    -- upvalues: v21 (copy), v22 (copy)
    if not v21() and v22.Plane then
        return v22.Plane;
    else
        local l_Part_2 = Instance.new("Part");
        l_Part_2.TopSurface = Enum.SurfaceType.Smooth;
        l_Part_2.BottomSurface = Enum.SurfaceType.Smooth;
        l_Part_2.Size = Vector3.new(100, 100, 0, 0);
        l_Part_2.CFrame = CFrame.new(0, 0, -1.7677669529663689);
        if not v21() then
            v22.Plane = l_Part_2;
        end;
        return l_Part_2;
    end;
end;
local function v50(v44, v45) --[[ Line: 253 ]] --[[ Name: getMeshPartAsync ]]
    -- upvalues: v21 (copy), v22 (copy), l_Model_0 (copy)
    if not v21() and v22[v45] then
        return v22[v45];
    else
        local v46 = v44:getService("InsertService");
        local v47 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 263 ]]
            -- upvalues: v47 (ref), v46 (copy), v45 (copy)
            v47 = v46:CreateMeshPartAsync(v45, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Automatic);
            v47.Size = v47.Size.unit * 1.4142135623730951 * 5;
        end);
        if not l_status_0 then
            warn(l_result_0);
            return l_Model_0;
        else
            if not v21() then
                v22[v45] = v47;
            end;
            return v47;
        end;
    end;
end;
return l_withForwardRef_0(function(v51) --[[ Line: 280 ]] --[[ Name: MaterialPreview ]]
    -- upvalues: v13 (copy), l_Stylizer_0 (copy), l_prioritize_0 (copy), v5 (copy), l_Model_0 (copy), v18 (copy), v14 (copy), v41 (copy), v43 (copy), v50 (copy), v19 (copy), v39 (copy), v28 (copy), v16 (copy), v21 (copy), v3 (copy), l_Pane_0 (copy), l_AssetRenderModel_0 (copy), v20 (copy)
    local v52 = v13:use();
    local v53 = l_Stylizer_0:use("MaterialPreview", v51);
    local v54 = l_prioritize_0(v51.BackgroundColor, v53.BackgroundColor);
    local v55 = l_prioritize_0(v51.InitialDistance, v53.InitialDistance);
    local v56 = l_prioritize_0(v51.RecenterCameraOnUpdate, v53.RecenterCameraOnUpdate);
    local v57, v58 = v5.useState(l_Model_0);
    local v59, v60 = v5.useState(nil);
    local v61, v62 = v5.useState(Enum.Material.SmoothPlastic);
    local v63, v64 = v5.useState(Color3.new(1, 1, 1));
    local v65, v66 = v5.useState("");
    local _, v68 = v5.useState("");
    local v69 = v18[v61] and v65 == "";
    v5.useEffect(function() --[[ Line: 301 ]]
        -- upvalues: v51 (copy), v14 (ref), v58 (copy), v41 (ref), v43 (ref), v50 (ref), v52 (copy), v19 (ref), v39 (ref), v54 (copy), v28 (ref)
        if v51.MaterialPreviewGeometryType == v14.Cube then
            v58((v41()));
            return nil;
        elseif v51.MaterialPreviewGeometryType == v14.Plane then
            v58((v43()));
            return nil;
        elseif v51.MaterialPreviewGeometryType == v14.Dominus then
            local v70 = task.spawn(function() --[[ Line: 309 ]]
                -- upvalues: v58 (ref), v50 (ref), v52 (ref)
                v58((v50(v52, "rbxassetid://1484148960")));
            end);
            return function() --[[ Line: 313 ]]
                -- upvalues: v70 (copy)
                task.cancel(v70);
            end;
        else
            if v19() then
                v58((v39(v52, "rbxasset://models/MaterialManager/smooth_material_model.rbxm", v51.MeshPartBorderThickness, v51.MeshPartBackgroundColor, v54)));
            else
                v58((v28(v52, "rbxasset://models/MaterialManager/smooth_material_model.rbxm")));
            end;
            return nil;
        end;
    end, {
        v51.MaterialPreviewGeometryType
    });
    v5.useEffect(function() --[[ Line: 340 ]]
        -- upvalues: l_prioritize_0 (ref), v51 (copy), v53 (copy), v64 (copy), v16 (ref), v62 (copy), v66 (copy), v68 (copy)
        local v71 = l_prioritize_0(v51.Use2022Materials, v53.Use2022Materials);
        if typeof(v51.Material) == "EnumItem" then
            v64(v16(v51.Material, v71));
            v62(v51.Material);
            v66("");
            v68("");
            return nil;
        elseif typeof(v51.Material) == "Instance" and v51.Material:IsA("MaterialVariant") then
            v64(Color3.new(1, 1, 1));
            v62(v51.Material.BaseMaterial);
            v66(v51.Material.Name);
            v68(v51.Material.ColorMap);
            local v72 = v51.Material:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 355 ]]
                -- upvalues: v66 (ref), v51 (ref)
                v66(v51.Material.Name);
            end);
            local v73 = v51.Material:GetPropertyChangedSignal("BaseMaterial"):Connect(function() --[[ Line: 359 ]]
                -- upvalues: v62 (ref), v51 (ref)
                v62(v51.Material.BaseMaterial);
            end);
            return function() --[[ Line: 363 ]]
                -- upvalues: v73 (copy), v72 (copy)
                v73:Disconnect();
                v72:Disconnect();
            end;
        else
            v64(Color3.new(1, 1, 1));
            v62(Enum.Material.SmoothPlastic);
            v66("");
            v68("");
            return nil;
        end;
    end, {
        v51.Material, 
        v51.Use2022Materials, 
        v53.Use2022Materials
    });
    if v21() and v51.Static and typeof(v51.Material) == "Instance" and v51.Material:IsA("MaterialVariant") then
        if v57:IsA("Part") then
            v57.Size = Vector3.new(10, 10, 0.0010000000474974513, 0);
            local l_Decal_0 = v57:FindFirstChildWhichIsA("Decal");
            if l_Decal_0 == nil then
                l_Decal_0 = Instance.new("Decal");
            end;
            l_Decal_0.Texture = v51.Material.ColorMap;
            l_Decal_0.Parent = v57;
        end;
        if v57:IsA("MeshPart") then
            local l_SurfaceAppearance_0 = v57:FindFirstChildWhichIsA("SurfaceAppearance");
            if l_SurfaceAppearance_0 == nil then
                l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
            end;
            l_SurfaceAppearance_0.ColorMap = v51.Material.ColorMap;
            l_SurfaceAppearance_0.MetalnessMap = v51.Material.MetalnessMap;
            l_SurfaceAppearance_0.NormalMap = v51.Material.NormalMap;
            l_SurfaceAppearance_0.RoughnessMap = v51.Material.RoughnessMap;
            l_SurfaceAppearance_0.Parent = v57;
        end;
    end;
    v5.useEffect(function() --[[ Line: 408 ]]
        -- upvalues: v59 (copy), v63 (copy), v61 (copy), v65 (copy), v51 (copy), v14 (ref)
        if not v59 or not v59:IsA("BasePart") then
            return;
        else
            v59.Color = v63;
            v59.Material = v61;
            v59.MaterialVariant = v65;
            if v51.MaterialPreviewGeometryType == v14.Dominus then
                v59.CFrame = CFrame.Angles(0, 0.5235987755982988, 0) * CFrame.Angles(0.2617993877991494, 0, 0);
            end;
            return;
        end;
    end, {
        v59, 
        v61, 
        v65, 
        v63, 
        v51.MaterialPreviewGeometryType
    });
    local v76 = v3.join({
        AnchorPoint = v51.AnchorPoint, 
        BackgroundColor = if not v51.Transparent then v54 else nil, 
        LayoutOrder = v51.LayoutOrder, 
        Position = v51.Position, 
        Size = v51.Size
    }, v51.WrapperProps);
    local v77 = l_prioritize_0(v51.CornerRadius, v53.CornerRadius);
    return v5.createElement(l_Pane_0, v76, {
        AssetRenderModel = v5.createElement(l_AssetRenderModel_0, {
            BackgroundColor3 = v54, 
            CornerRadius = v77, 
            DisablePan = true, 
            EnableSky = if v20() then v69 else nil, 
            RecenterModelOnUpdate = false, 
            DisableZoom = v51.DisableZoom, 
            InitialDistance = v55, 
            FocusDirection = Vector3.new(0, 0, -1, 0), 
            LightDirection = v53.LightDirection, 
            Ambient = v53.AmbientColor, 
            LightColor = v53.LightColor, 
            OnViewModelLoaded = function(v78) --[[ Line: 445 ]] --[[ Name: OnViewModelLoaded ]]
                -- upvalues: v60 (copy)
                v60(v78);
            end, 
            Model = v57, 
            RecenterCameraOnUpdate = v56, 
            Size = UDim2.fromScale(1, 1), 
            Static = v51.Static, 
            ref = v51.ForwardRef
        }), 
        UICorner = if v77 then v5.createElement("UICorner", {
            CornerRadius = v77
        }) else nil
    });
end);