local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v3 = require(l_DraggerFramework_0.Utility.BoundingBox);
local v4 = require(l_DraggerFramework_0.Utility.JointMaker);
local v5 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v6 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local v7 = require(l_Parent_0.Src.Utility.getAlignableObjects);
local v8 = require(l_Parent_0.Src.Utility.getDefaultBasisForObjects);
local function _(v9) --[[ Line: 13 ]] --[[ Name: getAxesMask ]]
    return (Vector3.new(v9.X and 1 or 0, v9.Y and 1 or 0, v9.Z and 1 or 0));
end;
local function _() --[[ Line: 17 ]] --[[ Name: areJointsEnabled ]]
    -- upvalues: l_Parent_1 (copy)
    return l_Parent_1:GetJoinMode() ~= Enum.JointCreationMode.None;
end;
return function(v12, v13, v14, v15, v16) --[[ Line: 36 ]]
    -- upvalues: v6 (copy), v8 (copy), v3 (copy), v7 (copy), v4 (copy), v5 (copy), l_Parent_1 (copy)
    if #v12 == 0 then
        return;
    else
        local v17 = nil;
        v17 = if v13 == v6.Local then v8(v16 and {
            v16
        } or v12) else CFrame.new();
        local v18, v19, v20 = v3.fromObjectsComputeAll(v12, v17);
        local v21 = nil;
        local v22 = nil;
        if v16 then
            local v23 = v20[v16];
            assert(v23, "Missing bounding box for target");
            v21 = v17:VectorToWorldSpace(v23.offset);
            v22 = v23.size;
        else
            v21 = v17:VectorToWorldSpace(v18);
            v22 = v19;
        end;
        for _, v25 in ipairs(v12) do
            if v25 ~= v16 then
                local _, v27 = v7({
                    v25
                });
                assert(#v27, "Missing parts for alignable object");
                local v28 = v4.new();
                v28:pickUpParts(v27);
                v28:breakJointsToOutsiders();
                local v29 = v20[v25];
                assert(v29, "Missing bounding box for object");
                local v30 = v17:VectorToObjectSpace(v21 - v17:VectorToWorldSpace(v29.offset));
                if v15 == v5.Min then
                    v30 = v30 - (v22 - v29.size) / 2;
                elseif v15 == v5.Max then
                    v30 = v30 + (v22 - v29.size) / 2;
                end;
                local v31 = v17:VectorToWorldSpace(v30 * Vector3.new(v14.X and 1 or 0, v14.Y and 1 or 0, v14.Z and 1 or 0));
                if v25:IsA("PVInstance") then
                    v25:PivotTo(v25:GetPivot() + v31);
                end;
                if l_Parent_1:GetJoinMode() ~= Enum.JointCreationMode.None then
                    v28:computeJointPairs():createJoints();
                end;
                v28:putDownParts();
            end;
        end;
        return;
    end;
end;