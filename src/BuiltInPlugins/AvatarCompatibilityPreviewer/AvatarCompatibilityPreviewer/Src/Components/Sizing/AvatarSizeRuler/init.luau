local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_RulerView_0 = require(l_script_FirstAncestor_0.Packages.DraggerFramework).Components.RulerView;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v7) --[[ Line: 23 ]] --[[ Name: AvatarSizeRuler ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), l_RulerView_0 (copy), l_CoreGui_0 (copy)
    local v8 = v2.ContextServices.Stylizer:use("AvatarSizeRuler");
    local v9, v10 = v3.useState(nil);
    local l_Axis1_0 = v7.Axis1;
    local v12 = v7.Axis2:Cross(l_Axis1_0);
    local v13 = CFrame.fromMatrix(v7.CFrame.Position, l_Axis1_0, v12);
    local v14 = Vector3.new((v7.Size * v7.Axis1).Magnitude, 0, (v7.Size * v7.Axis2).Magnitude);
    v13 = v13 + v13:VectorToWorldSpace(v14 * Vector3.new(-0.5, 0, -0.5, 0));
    v13 = v13 + v13:VectorToWorldSpace((Vector3.new(0, (v7.Size * v12).Magnitude * -0.5, 0)));
    v13 = v13 + v13:VectorToWorldSpace(v14 * Vector3.new(-0.5, 0, 0, 0));
    return v4.createPortal(v3.createElement("Part", {
        Anchored = true, 
        CanQuery = false, 
        CanCollide = false, 
        CanTouch = false, 
        Archivable = false, 
        ref = v10, 
        CFrame = v7.CFrame + v13:VectorToWorldSpace(v14 * Vector3.new(-1.5, 0, 0, 0)), 
        TopSurface = Enum.SurfaceType.Smooth, 
        BottomSurface = Enum.SurfaceType.Smooth, 
        Size = v7.Size, 
        Transparency = 1
    }, {
        Ruler = v3.createElement(l_RulerView_0, {
            Color3 = v8.RulerColor, 
            MainTransparency = v8.MainTransparency, 
            DimTransparency = v8.DimTransparency, 
            GridSize = v8.GridSize, 
            MajorStep = v8.MajorStep, 
            CFrame = v13, 
            Size = Vector3.new(0, 0, v14.Z), 
            ExtraSize = nil
        }), 
        SurfaceGui = v3.createElement("SurfaceGui", {
            Adornee = v9, 
            AlwaysOnTop = true, 
            Face = v7.TextFace, 
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, 
            PixelsPerStud = v8.PixelsPerStud
        }, {
            Container = v3.createElement(v2.UI.Container, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Padding = {
                    Left = v8.Padding
                }
            }, {
                SizeLabel = v3.createElement(v2.UI.TextLabel, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v7.Text, 
                    TextSize = v8.TextSize
                })
            })
        })
    }), v7.Container or l_CoreGui_0, "AvatarSizeRuler");
end;