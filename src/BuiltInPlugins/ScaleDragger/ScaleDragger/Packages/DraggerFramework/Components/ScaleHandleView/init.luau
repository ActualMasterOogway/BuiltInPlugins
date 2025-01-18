local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Utility.Math);
local l_Never_0 = Enum.AdornCullingMode.Never;
local v6 = v3.PureComponent:extend("ScaleHandleView");
local v7 = 0.5;
local v8 = 0.75;
local v9 = 0.2;
local v10 = 1.5;
local function _(v11, v12) --[[ Line: 28 ]] --[[ Name: getDebugSettingValue ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v11);
    return l_l_Workspace_0_FirstChild_0 and l_l_Workspace_0_FirstChild_0.Value * v12 or v12;
end;
v6.getLocalHandleOffset = function(v15) --[[ Line: 33 ]] --[[ Name: getLocalHandleOffset ]]
    -- upvalues: v10 (ref)
    return CFrame.new(0, 0, -v10 * v15.Scale);
end;
v6.render = function(v16) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v10 (ref), l_Workspace_0 (copy), v7 (ref), v8 (ref), v9 (ref), v3 (copy), l_Never_0 (copy)
    local l_ScaleHandleOffset_0 = l_Workspace_0:FindFirstChild("ScaleHandleOffset");
    v10 = l_ScaleHandleOffset_0 and l_ScaleHandleOffset_0.Value * 1.5 or 1.5;
    l_ScaleHandleOffset_0 = l_Workspace_0:FindFirstChild("ScaleHandleRadius");
    v7 = l_ScaleHandleOffset_0 and l_ScaleHandleOffset_0.Value * 0.5 or 0.5;
    l_ScaleHandleOffset_0 = l_Workspace_0:FindFirstChild("ScaleHandleTransparencyStart");
    v8 = l_ScaleHandleOffset_0 and l_ScaleHandleOffset_0.Value * 0.75 or 0.75;
    l_ScaleHandleOffset_0 = l_Workspace_0:FindFirstChild("ScaleHandleTransparencyEnd");
    v9 = l_ScaleHandleOffset_0 and l_ScaleHandleOffset_0.Value * 0.2 or 0.2;
    local v18 = {};
    l_ScaleHandleOffset_0 = v16.props.Color;
    local v19 = v16.props.HandleCFrame * CFrame.new(0, 0, -v10 * v16.props.Scale);
    local v20 = v7 * v16.props.Scale;
    if v16.props.Thin then
        v20 = v20 * 0.34;
    end;
    if not v16.props.Hovered then
        v18.HiddenHandle = v3.createElement("SphereHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            AlwaysOnTop = true, 
            CFrame = v19, 
            Color3 = l_ScaleHandleOffset_0, 
            Radius = v20, 
            Transparency = v8, 
            ZIndex = 1, 
            AdornCullingMode = l_Never_0
        });
    end;
    local l_v9_0 = v9;
    if v16.props.Hovered then
        v20 = v20 * 1.15;
        l_v9_0 = 0;
    end;
    v18.Handle = v3.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        AlwaysOnTop = v16.props.Hovered, 
        CFrame = v19, 
        Color3 = l_ScaleHandleOffset_0, 
        Radius = v20, 
        Transparency = l_v9_0, 
        ZIndex = 0, 
        AdornCullingMode = l_Never_0
    });
    return v3.createElement("Folder", {}, v18);
end;
v6.hitTest = function(v22, v23) --[[ Line: 96 ]] --[[ Name: hitTest ]]
    -- upvalues: v7 (ref), v10 (ref), v4 (copy)
    local v24 = v7 * v22.Scale;
    local l_Unit_0 = v23.Unit;
    local v26 = v22.HandleCFrame * Vector3.new(0, 0, -v10 * v22.Scale);
    local v27, v28 = v4.intersectRaySphere(l_Unit_0.Origin, l_Unit_0.Direction, v26, v24);
    if v27 then
        return v28;
    else
        return nil;
    end;
end;
v6.distanceFromHandle = function(v29, v30) --[[ Line: 110 ]] --[[ Name: distanceFromHandle ]]
    -- upvalues: v7 (ref), v10 (ref)
    local v31 = v7 * v29.Scale * 2.5;
    local v32 = v29.HandleCFrame * Vector3.new(0, 0, -v10 * v29.Scale);
    local l_Unit_1 = v30.Direction.Unit;
    local v34 = (v32 - v30.Origin):Dot(l_Unit_1);
    return (v32 - (v30.Origin + l_Unit_1 * v34)).Magnitude - v31;
end;
return v6;