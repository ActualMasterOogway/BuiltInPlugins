local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeRuler);
local _ = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeSpecificationUtils);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local function v7(v5) --[[ Line: 30 ]] --[[ Name: AxisRender ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy)
    local v6 = v3.ContextServices.Localization:use();
    if v5.AxisSize < v5.MinSize then
        return v4.createElement(v1, {
            Text = v6:getText("AvatarSizeRuler", "DoesNotCoverMinSize", {
                bodyPart = v5.ItemName, 
                axisName = v5.AxisName, 
                axisSize = v5.AxisSize, 
                minSize = v5.MinSize
            }), 
            TextFace = v5.TextFace, 
            CFrame = v5.CFrame, 
            Size = v5.Size, 
            Axis1 = v5.Axis1, 
            Axis2 = v5.Axis2
        });
    elseif v5.AxisSize > v5.MaxSize then
        return v4.createElement(v1, {
            Text = v6:getText("AvatarSizeRuler", "DoesNotContainMaxSize", {
                bodyPart = v5.ItemName, 
                axisName = v5.AxisName, 
                axisSize = v5.AxisSize, 
                maxSize = v5.MaxSize
            }), 
            TextFace = v5.TextFace, 
            CFrame = v5.CFrame, 
            Size = v5.Size, 
            Axis1 = v5.Axis1, 
            Axis2 = v5.Axis2
        });
    else
        return nil;
    end;
end;
return function(v8) --[[ Line: 66 ]] --[[ Name: AvatarSizeRulerRender ]]
    -- upvalues: v3 (copy), v4 (copy), v7 (copy)
    local v9 = v3.ContextServices.Localization:use();
    local v10 = false;
    if v8.Size.X >= v8.SizeBounds.minSize.X then
        v10 = v8.Size.X <= v8.SizeBounds.maxSize.X;
    end;
    local v11 = false;
    if v8.Size.Y >= v8.SizeBounds.minSize.Y then
        v11 = v8.Size.Y <= v8.SizeBounds.maxSize.Y;
    end;
    local v12 = false;
    if v8.Size.Z >= v8.SizeBounds.minSize.Z then
        v12 = v8.Size.Z <= v8.SizeBounds.maxSize.Z;
    end;
    local v13 = nil;
    if not v11 then
        v13 = "Y";
    elseif not v12 then
        v13 = "Z";
    elseif not v10 then
        v13 = "X";
    end;
    return v4.createElement("Folder", {
        Archivable = false
    }, {
        XAxis = if v13 == "X" then v4.createElement(v7, {
            ItemName = v8.ItemName, 
            AxisName = v9:getText("AvatarSizeRuler", "Width"), 
            Size = v8.Size, 
            TextFace = Enum.NormalId.Front, 
            AxisSize = v8.Size.X, 
            MinSize = v8.SizeBounds.minSize.X, 
            MaxSize = v8.SizeBounds.maxSize.X, 
            Axis1 = v8.CFrame.ZVector, 
            Axis2 = -v8.CFrame.XVector, 
            CFrame = v8.CFrame
        }) else nil, 
        YAxis = if v13 == "Y" then v4.createElement(v7, {
            ItemName = v8.ItemName, 
            AxisName = v9:getText("AvatarSizeRuler", "Height"), 
            Size = v8.Size, 
            AxisSize = v8.Size.Y, 
            TextFace = Enum.NormalId.Front, 
            MinSize = v8.SizeBounds.minSize.Y, 
            MaxSize = v8.SizeBounds.maxSize.Y, 
            Axis1 = v8.CFrame.XVector, 
            Axis2 = -v8.CFrame.YVector, 
            CFrame = v8.CFrame
        }) else nil, 
        ZAxis = if v13 == "Z" then v4.createElement(v7, {
            ItemName = v8.ItemName, 
            AxisName = v9:getText("AvatarSizeRuler", "Depth"), 
            Size = v8.Size, 
            AxisSize = v8.Size.Z, 
            TextFace = Enum.NormalId.Top, 
            MinSize = v8.SizeBounds.minSize.Z, 
            MaxSize = v8.SizeBounds.maxSize.Z, 
            Axis1 = v8.CFrame.XVector, 
            Axis2 = -v8.CFrame.ZVector, 
            CFrame = v8.CFrame
        }) else nil
    });
end;