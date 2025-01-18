local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local _ = require(l_DraggerFramework_0.Utility.Math);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local function _(v9, v10, v11, v12) --[[ Line: 12 ]] --[[ Name: isValidJoint ]]
    -- upvalues: v8 (copy)
    return v10:IsDescendantOf(v9) and v10:IsA("BasePart") and (v11[v10.Name] ~= nil or v8() and v12[v10.Name] ~= nil);
end;
return function(v14, v15, v16) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), l_Workspace_0 (copy), v5 (copy), v8 (copy)
    if not v14.RootInstance then
        return nil;
    else
        local v17 = nil;
        local v18 = nil;
        local v19 = RaycastParams.new();
        v19.FilterType = Enum.RaycastFilterType.Blacklist;
        v19.FilterDescendantsInstances = {
            v4.findRootPart(v14.RootInstance)
        };
        v19.BruteForceAllSlow = true;
        local v20 = l_Workspace_0:Raycast(v15.Origin, v15.Direction, v19);
        if v20 then
            v17 = v20.Instance;
            v18 = v20.Distance;
            v19.FilterType = Enum.RaycastFilterType.Whitelist;
            v19.FilterDescendantsInstances = v16;
            local v21 = l_Workspace_0:raycast(v15.Origin, v15.Direction, v19);
            if v21 and v21.Position:FuzzyEq(v20.Position) then
                v17 = v21.Instance;
            end;
        end;
        local v22 = v14:gizmoRaycast(v15.Origin, v15.Direction, RaycastParams.new());
        if v22 and (v14:shouldDrawConstraintsOnTop() or v20 and v22.Distance < v20.Distance) then
            v17 = v22.Instance;
            v18 = v22.Distance;
        end;
        if v14.VisualizeBones then
            local v23, v24 = v5.getBoneHit(v15, v14.RootInstance);
            if v23 then
                return v23, v23, v24;
            end;
        end;
        if v17 then
            local l_v17_0 = v17;
            local v26 = v4.getRigInfo(v14.RootInstance);
            local l_PartNameToMotor_0 = v26.PartNameToMotor;
            local l_PartNameToAnimConstraint_0 = v26.PartNameToAnimConstraint;
            local _ = v26.BoneNameToBone;
            local v30 = l_v17_0:IsDescendantOf(v14.RootInstance) and l_v17_0:IsA("BasePart") and (l_PartNameToMotor_0[l_v17_0.Name] ~= nil or v8() and l_PartNameToAnimConstraint_0[l_v17_0.Name] ~= nil);
            if l_v17_0 and v30 then
                return l_v17_0, v17, v18;
            else
                return;
            end;
        else
            return nil;
        end;
    end;
end;