local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Views.types);
local v2 = require(l_Parent_0.Util.Constants);
local v3 = {};
v3.__index = v3;
local l_DefaultColor_0 = v2.ControlPoint.DefaultColor;
local l_HoveredColor_0 = v2.ControlPoint.HoveredColor;
local l_SelectedColor_0 = v2.ControlPoint.SelectedColor;
local l_SelectedColorNoWeight_0 = v2.ControlPoint.SelectedColorNoWeight;
v3.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_DefaultColor_0 (copy), l_SelectedColorNoWeight_0 (copy), l_SelectedColor_0 (copy), l_HoveredColor_0 (copy)
    local v8 = setmetatable({}, v3);
    local function v11(v9) --[[ Line: 17 ]] --[[ Name: _createControlPointPart ]]
        local l_Part_0 = Instance.new("Part");
        l_Part_0.CanCollide = false;
        l_Part_0.Name = v9;
        l_Part_0.Transparency = 1;
        l_Part_0.Archivable = false;
        l_Part_0:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 23 ]]
            -- upvalues: l_Part_0 (copy), v9 (copy)
            if l_Part_0.Name ~= v9 then
                l_Part_0.Name = v9;
            end;
        end);
        return l_Part_0;
    end;
    local function _(v12, v13, v14, v15) --[[ Line: 31 ]] --[[ Name: _setControlPointPartProps ]]
        v12.CFrame = CFrame.new(v13);
        v12.Size = v14;
        v12.Parent = v15;
    end;
    local function v20(v17, v18) --[[ Line: 37 ]] --[[ Name: _createControlPointAdornee ]]
        local v19 = Instance.new(v17 .. "HandleAdornment");
        v19.AlwaysOnTop = false;
        v19.Archivable = false;
        v19.ZIndex = 1;
        v19:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 42 ]]
            -- upvalues: v19 (copy), v18 (copy)
            if v19.Name ~= v18 then
                v19.Name = v18;
            end;
        end);
        return v19;
    end;
    local function _(v21, v22, v23, v24, v25, v26, v27, v28, v29) --[[ Line: 50 ]] --[[ Name: _setControlPointAdorneeProps ]]
        v21.CFrame = CFrame.new(v23);
        v21.Adornee = v24;
        v21.Name = v25;
        v21.Transparency = v26;
        v21.Color3 = v27;
        v21.Parent = v29;
        if v22 == "Box" then
            v21.Size = Vector3.new(v28, v28, v28);
            return;
        else
            if v22 == "Sphere" then
                v21.Radius = v28;
            end;
            return;
        end;
    end;
    v8.render = function(v31, v32) --[[ Line: 65 ]] --[[ Name: render ]]
        -- upvalues: l_DefaultColor_0 (ref), l_SelectedColorNoWeight_0 (ref), l_SelectedColor_0 (ref), l_HoveredColor_0 (ref), v20 (copy), v11 (copy)
        local l_Position_0 = v32.Position;
        local l_Selected_0 = v32.Selected;
        local l_Hovered_0 = v32.Hovered;
        local l_Weight_0 = v32.Weight;
        local l_Transparency_0 = v32.Transparency;
        local l_Size_0 = v32.Size;
        local l_Shape_0 = v32.Shape;
        local v40 = true;
        if l_Shape_0 ~= "Box" then
            v40 = l_Shape_0 == "Sphere";
        end;
        assert(v40, "Shape must be Box or Sphere.");
        local l_PartParent_0 = v32.PartParent;
        v40 = v32.AdornmentParent;
        local l_Name_0 = v32.Name;
        local l_Color_0 = v32.Color;
        local l_Adornee_0 = v32.Adornee;
        local l_MeshOrigin_0 = v32.MeshOrigin;
        if not l_Color_0 then
            l_Color_0 = l_DefaultColor_0;
            if l_Selected_0 then
                l_Color_0 = l_SelectedColorNoWeight_0:lerp(l_SelectedColor_0, l_Weight_0);
            elseif l_Hovered_0 then
                l_Color_0 = l_HoveredColor_0;
            end;
        end;
        if v31.adornment and not v31.adornment:IsA(l_Shape_0 .. "HandleAdornment") then
            v31.adornment:Destroy();
            v31.adornment = nil;
        end;
        if not v31.adornment then
            v31.adornment = v20(l_Shape_0, l_Name_0);
            v31.adornment.MouseEnter:Connect(function() --[[ Line: 102 ]]
                -- upvalues: v31 (copy), v11 (ref), l_Name_0 (copy), l_MeshOrigin_0 (copy), l_Shape_0 (copy), l_PartParent_0 (copy)
                if not v31.controlPoint then
                    v31.controlPoint = v11(l_Name_0);
                end;
                local v46 = l_MeshOrigin_0 * v31.adornment.CFrame.Position;
                local v47 = Vector3.new();
                if l_Shape_0 == "Box" then
                    v47 = v31.adornment.Size;
                elseif l_Shape_0 == "Sphere" then
                    local l_Radius_0 = v31.adornment.Radius;
                    v47 = Vector3.new(l_Radius_0, l_Radius_0, l_Radius_0);
                end;
                local l_controlPoint_0 = v31.controlPoint;
                local l_v47_0 = v47;
                local l_l_PartParent_0_0 = l_PartParent_0;
                l_controlPoint_0.CFrame = CFrame.new(v46);
                l_controlPoint_0.Size = l_v47_0;
                l_controlPoint_0.Parent = l_l_PartParent_0_0;
            end);
            v31.adornment.MouseLeave:Connect(function() --[[ Line: 116 ]]
                -- upvalues: v31 (copy)
                if v31.controlPoint then
                    v31.controlPoint:Destroy();
                    v31.controlPoint = nil;
                end;
            end);
        end;
        local l_adornment_0 = v31.adornment;
        local l_l_Color_0_0 = l_Color_0;
        l_adornment_0.CFrame = CFrame.new(l_Position_0);
        l_adornment_0.Adornee = l_Adornee_0;
        l_adornment_0.Name = l_Name_0;
        l_adornment_0.Transparency = l_Transparency_0;
        l_adornment_0.Color3 = l_l_Color_0_0;
        l_adornment_0.Parent = v40;
        if l_Shape_0 == "Box" then
            l_adornment_0.Size = Vector3.new(l_Size_0, l_Size_0, l_Size_0);
        elseif l_Shape_0 == "Sphere" then
            l_adornment_0.Radius = l_Size_0;
        end;
        if v31.controlPoint then
            l_adornment_0 = v31.controlPoint;
            l_l_Color_0_0 = l_MeshOrigin_0 * l_Position_0;
            local v54 = Vector3.new(l_Size_0, l_Size_0, l_Size_0);
            l_adornment_0.CFrame = CFrame.new(l_l_Color_0_0);
            l_adornment_0.Size = v54;
            l_adornment_0.Parent = l_PartParent_0;
        end;
    end;
    v8.cleanup = function(v55) --[[ Line: 148 ]] --[[ Name: cleanup ]]
        if v55.adornment then
            v55.adornment:Destroy();
            v55.adornment = nil;
        end;
        if v55.controlPoint then
            v55.controlPoint:Destroy();
            v55.controlPoint = nil;
        end;
    end;
    return v8;
end;
return v3;