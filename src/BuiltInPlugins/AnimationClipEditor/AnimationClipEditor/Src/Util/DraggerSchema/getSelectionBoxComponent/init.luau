local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if v4.parent.Name == v1.FOLDERS.Microbones and v3.VisualizeBones then
        if v4 and v4:FindFirstChild("Cone") and v4.Cone.Color3 ~= v1.BONE_COLOR_SELECTED then
            v4.Cone.Color3 = v1.BONE_COLOR_HOVER;
            v4.Cone.Transparency = v1.BONE_TRANSPARENCY_HOVER;
        end;
        if v4 and v4:FindFirstChild("Sphere") and v4.Sphere.Color3 ~= v1.BONE_COLOR_SELECTED then
            v4.Sphere.Color3 = v1.BONE_COLOR_HOVER;
            v4.Sphere.Transparency = v1.BONE_TRANSPARENCY_HOVER;
        end;
        return nil;
    else
        return "SelectionBox";
    end;
end;