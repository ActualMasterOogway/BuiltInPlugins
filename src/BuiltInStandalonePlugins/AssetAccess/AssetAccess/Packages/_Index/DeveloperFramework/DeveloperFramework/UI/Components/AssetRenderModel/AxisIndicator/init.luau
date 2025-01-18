local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.UI.ContextServices.Stylizer);
local v3 = require(l_Parent_0.Util.prioritize);
local v4 = CFrame.new(0, 0, 4);
local function _(v5) --[[ Line: 20 ]] --[[ Name: computeAxisCameraCFrame ]]
    -- upvalues: v4 (copy)
    return (v5.CFrame - v5.CFrame.Position):ToWorldSpace(v4);
end;
local v7 = Color3.new(1, 0, 0);
local v8 = Color3.new(0, 1, 0);
local v9 = Color3.new(0, 0, 1);
local function v20() --[[ Line: 29 ]] --[[ Name: createAxisIndicator ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy)
    local function _(v10, v11, v12) --[[ Line: 30 ]] --[[ Name: makeAxisFor ]]
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Shape = Enum.PartType.Cylinder;
        l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
        l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
        l_Part_0.Parent = v10;
        l_Part_0.Size = Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0);
        l_Part_0.Color = v11;
        l_Part_0.Name = v12;
        return l_Part_0;
    end;
    local l_Model_0 = Instance.new("Model");
    local l_v7_0 = v7;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Shape = Enum.PartType.Cylinder;
    l_Part_1.TopSurface = Enum.SurfaceType.Smooth;
    l_Part_1.BottomSurface = Enum.SurfaceType.Smooth;
    l_Part_1.Parent = l_Model_0;
    l_Part_1.Size = Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0);
    l_Part_1.Color = l_v7_0;
    l_Part_1.Name = "XAxis";
    l_Part_1.CFrame = CFrame.new(Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0).X / 2, 0, 0);
    l_Part_1 = v8;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Shape = Enum.PartType.Cylinder;
    l_Part_2.TopSurface = Enum.SurfaceType.Smooth;
    l_Part_2.BottomSurface = Enum.SurfaceType.Smooth;
    l_Part_2.Parent = l_Model_0;
    l_Part_2.Size = Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0);
    l_Part_2.Color = l_Part_1;
    l_Part_2.Name = "YAxis";
    l_Part_2.CFrame = CFrame.new(0, Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0).X / 2, 0) * CFrame.Angles(0, 0, 1.5707963267948966);
    l_Part_2 = v9;
    local l_Part_3 = Instance.new("Part");
    l_Part_3.Shape = Enum.PartType.Cylinder;
    l_Part_3.TopSurface = Enum.SurfaceType.Smooth;
    l_Part_3.BottomSurface = Enum.SurfaceType.Smooth;
    l_Part_3.Parent = l_Model_0;
    l_Part_3.Size = Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0);
    l_Part_3.Color = l_Part_2;
    l_Part_3.Name = "ZAxis";
    l_Part_3.CFrame = CFrame.new(0, 0, Vector3.new(2, 0.10000000149011612, 0.10000000149011612, 0).X / 2) * CFrame.Angles(0, 1.5707963267948966, 0);
    return l_Model_0;
end;
return function(v21) --[[ Line: 56 ]] --[[ Name: AxisIndicator ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), v4 (copy), v20 (copy)
    local v22 = v2:use("AssetRenderModel", v21);
    local v23 = v3(v21.AnchorPoint, v22.AxisIndicator.AnchorPoint);
    local v24 = v3(v21.Position, v22.AxisIndicator.Position);
    local v25 = v3(v21.Size, v22.AxisIndicator.Size);
    local v26 = v3(v21.ZIndex, v22.AxisIndicator.ZIndex);
    local v27 = v1.useRef(nil);
    local v28 = v1.useRef(Instance.new("Camera"));
    local l_ReferenceCamera_0 = v21.ReferenceCamera;
    v1.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v27 (copy), v28 (copy), l_ReferenceCamera_0 (copy), v4 (ref), v20 (ref)
        assert(v27.current ~= nil, "ViewportFrame was not mounted by useEffect");
        local l_current_0 = v28.current;
        l_current_0.Name = "AxisCamera";
        local l_l_ReferenceCamera_0_0 = l_ReferenceCamera_0;
        l_current_0.CFrame = (l_l_ReferenceCamera_0_0.CFrame - l_l_ReferenceCamera_0_0.CFrame.Position):ToWorldSpace(v4);
        local v32 = v20();
        l_l_ReferenceCamera_0_0 = v27.current;
        if l_l_ReferenceCamera_0_0 then
            l_l_ReferenceCamera_0_0:ClearAllChildren();
            v32.Parent = l_l_ReferenceCamera_0_0;
        end;
        local v35 = l_ReferenceCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 88 ]]
            -- upvalues: l_current_0 (copy), l_ReferenceCamera_0 (ref), v4 (ref)
            local l_l_current_0_0 = l_current_0;
            local l_l_ReferenceCamera_0_1 = l_ReferenceCamera_0;
            l_l_current_0_0.CFrame = (l_l_ReferenceCamera_0_1.CFrame - l_l_ReferenceCamera_0_1.CFrame.Position):ToWorldSpace(v4);
        end);
        return function() --[[ Line: 92 ]]
            -- upvalues: v35 (copy), v32 (copy), v28 (ref)
            v35:Disconnect();
            v32:Destroy();
            if v28.current then
                v28.current:Destroy();
            end;
        end;
    end, {
        l_ReferenceCamera_0
    });
    return v1.createElement("ViewportFrame", {
        AnchorPoint = v23, 
        BackgroundColor3 = v21.BackgroundColor, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        CurrentCamera = v28.current, 
        LayoutOrder = v21.LayoutOrder, 
        Position = v24, 
        Size = v25, 
        ZIndex = v26, 
        ref = v27
    });
end;