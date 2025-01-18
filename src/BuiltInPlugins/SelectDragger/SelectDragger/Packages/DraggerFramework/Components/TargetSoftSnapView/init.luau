local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v4 = require(l_Parent_0.Components.SphereMajorLines);
local v5 = require(l_Parent_0.Components.CylinderMajorLines);
local function v12(v6) --[[ Line: 17 ]] --[[ Name: SingleSoftSnap ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_From_0 = v6.From;
    local l_To_0 = v6.To;
    if l_From_0 == l_To_0 then
        return v2.createElement("BoxHandleAdornment", {
            CFrame = CFrame.new(l_From_0), 
            Adornee = workspace.Terrain, 
            Size = Vector3.one * (0.3 * v6.Scale), 
            Color3 = v6.Color3, 
            ZIndex = 0, 
            AlwaysOnTop = true
        });
    else
        local v9 = (l_To_0 - l_From_0).Unit * (1.5 * v6.Scale);
        l_From_0 = l_From_0 - v9;
        l_To_0 = l_To_0 + v9;
        return v2.createFragment({
            Bottom = v2.createElement(v3, {
                Color3 = v6.Color3, 
                AlwaysOnTop = false, 
                Render = function(v10) --[[ Line: 39 ]] --[[ Name: Render ]]
                    -- upvalues: l_From_0 (ref), l_To_0 (ref)
                    v10:AddLine(l_From_0, l_To_0);
                end
            }), 
            Top = v2.createElement(v3, {
                Color3 = v6.Color3, 
                AlwaysOnTop = true, 
                Transparency = 0.6, 
                Render = function(v11) --[[ Line: 47 ]] --[[ Name: Render ]]
                    -- upvalues: l_From_0 (ref), l_To_0 (ref)
                    v11:AddLine(l_From_0, l_To_0);
                end
            })
        });
    end;
end;
local function _(v13) --[[ Line: 55 ]] --[[ Name: getSpecialPartShape ]]
    if v13 and v13:IsA("Part") then
        if v13.Shape == Enum.PartType.Ball then
            return Enum.PartType.Ball;
        elseif v13.Shape == Enum.PartType.Cylinder then
            return Enum.PartType.Cylinder;
        end;
    end;
    return nil;
end;
return function(v15) --[[ Line: 66 ]]
    -- upvalues: v2 (copy), v12 (copy), v4 (copy), v5 (copy)
    local l_DraggerContext_0 = v15.DraggerContext;
    local v17 = l_DraggerContext_0:getChosenColor();
    local v18 = {};
    local l_DragTarget_0 = v15.DragTarget;
    for v20, v21 in l_DragTarget_0.softSnaps do
        local l_a_0 = v21.a;
        local l_b_0 = v21.b;
        v18[v20] = v2.createElement(v12, {
            From = l_a_0, 
            To = l_b_0, 
            Scale = l_DraggerContext_0:getHandleScale(0.5 * (l_a_0 + l_b_0)), 
            Color3 = v17
        });
    end;
    local v24 = l_DraggerContext_0:getGridColor();
    local l_targetPart_0 = l_DragTarget_0.targetPart;
    local v26 = if l_targetPart_0 and l_targetPart_0:IsA("Part") then if l_targetPart_0.Shape == Enum.PartType.Ball then Enum.PartType.Ball else if l_targetPart_0.Shape == Enum.PartType.Cylinder then Enum.PartType.Cylinder else nil else nil;
    if v26 == Enum.PartType.Ball then
        v18.MajorLines = v2.createElement(v4, {
            Part = l_DragTarget_0.targetPart, 
            Color3 = v24
        });
    elseif v26 == Enum.PartType.Cylinder then
        v18.MajorLines = v2.createElement(v5, {
            Part = l_DragTarget_0.targetPart, 
            Color3 = v24
        });
    end;
    return v2.createFragment(v18);
end;