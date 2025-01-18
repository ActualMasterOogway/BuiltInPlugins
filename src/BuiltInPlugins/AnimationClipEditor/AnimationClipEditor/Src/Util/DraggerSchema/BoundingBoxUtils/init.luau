local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_DraggerFramework_0.Utility.shouldDragAsFace);
local v117 = {
    computeBoundingBox = function(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: computeBoundingBox ]]
        -- upvalues: l_Workspace_0 (copy)
        local v9 = v6:Inverse();
        local v10 = 1e999;
        local v11 = -1e999;
        local v12 = 1e999;
        local v13 = -1e999;
        local v14 = 1e999;
        local v15 = -1e999;
        local l_Terrain_0 = l_Workspace_0.Terrain;
        for _, v18 in ipairs(v7) do
            if v18 ~= l_Terrain_0 then
                local l_CFrame_0 = v18.CFrame;
                local l_Size_0 = v18.Size;
                local l_X_0 = l_Size_0.X;
                local l_Y_0 = l_Size_0.Y;
                local l_Z_0 = l_Size_0.Z;
                local v24 = v9 * l_CFrame_0;
                local _, _, _, v28, v29, v30, v31, v32, v33, v34, v35, v36 = v24:components();
                local v37 = 0.5 * (math.abs(l_X_0 * v28) + math.abs(l_Y_0 * v29) + math.abs(l_Z_0 * v30));
                local v38 = 0.5 * (math.abs(l_X_0 * v31) + math.abs(l_Y_0 * v32) + math.abs(l_Z_0 * v33));
                local v39 = 0.5 * (math.abs(l_X_0 * v34) + math.abs(l_Y_0 * v35) + math.abs(l_Z_0 * v36));
                local l_X_1 = v24.X;
                local l_Y_1 = v24.Y;
                local l_Z_1 = v24.Z;
                v10 = math.min(v10, l_X_1 - v37);
                v11 = math.max(v11, l_X_1 + v37);
                v12 = math.min(v12, l_Y_1 - v38);
                v13 = math.max(v13, l_Y_1 + v38);
                v14 = math.min(v14, l_Z_1 - v39);
                v15 = math.max(v15, l_Z_1 + v39);
            end;
        end;
        for _, v44 in ipairs(v8) do
            local v45 = v6:PointToObjectSpace(v44.WorldPosition);
            local l_X_2 = v45.X;
            local l_Y_2 = v45.Y;
            local l_Z_2 = v45.Z;
            v10 = math.min(v10, l_X_2);
            v11 = math.max(v11, l_X_2);
            v12 = math.min(v12, l_Y_2);
            v13 = math.max(v13, l_Y_2);
            v14 = math.min(v14, l_Z_2);
            v15 = math.max(v15, l_Z_2);
        end;
        return Vector3.new(0.5 * (v10 + v11), 0.5 * (v12 + v13), 0.5 * (v14 + v15)), (Vector3.new(v11 - v10, v13 - v12, v15 - v14));
    end, 
    computeTwoBoundingBoxes = function(v49, v50, v51) --[[ Line: 62 ]] --[[ Name: computeTwoBoundingBoxes ]]
        -- upvalues: l_Workspace_0 (copy)
        local l_X_3 = v49.X;
        local l_Y_3 = v49.Y;
        local l_Z_3 = v49.Z;
        local v55 = v49:Inverse();
        local v56 = 1e999;
        local v57 = -1e999;
        local v58 = 1e999;
        local v59 = -1e999;
        local v60 = 1e999;
        local v61 = -1e999;
        local v62 = 1e999;
        local v63 = -1e999;
        local v64 = 1e999;
        local v65 = -1e999;
        local v66 = 1e999;
        local v67 = -1e999;
        local l_Terrain_1 = l_Workspace_0.Terrain;
        for _, v70 in ipairs(v50) do
            if v70 ~= l_Terrain_1 then
                local l_CFrame_1 = v70.CFrame;
                local l_Size_1 = v70.Size;
                local l_X_4 = l_Size_1.X;
                local l_Y_4 = l_Size_1.Y;
                local l_Z_4 = l_Size_1.Z;
                local v76 = v55 * l_CFrame_1;
                local _, _, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88 = v76:components();
                local v89 = 0.5 * (math.abs(l_X_4 * v80) + math.abs(l_Y_4 * v81) + math.abs(l_Z_4 * v82));
                local v90 = 0.5 * (math.abs(l_X_4 * v83) + math.abs(l_Y_4 * v84) + math.abs(l_Z_4 * v85));
                local v91 = 0.5 * (math.abs(l_X_4 * v86) + math.abs(l_Y_4 * v87) + math.abs(l_Z_4 * v88));
                local l_X_5 = v76.X;
                local l_Y_5 = v76.Y;
                local l_Z_5 = v76.Z;
                v56 = math.min(v56, l_X_5 - v89);
                v57 = math.max(v57, l_X_5 + v89);
                v58 = math.min(v58, l_Y_5 - v90);
                v59 = math.max(v59, l_Y_5 + v90);
                v60 = math.min(v60, l_Z_5 - v91);
                v61 = math.max(v61, l_Z_5 + v91);
                local v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106 = l_CFrame_1:components();
                v79 = v95;
                v79 = v96;
                v79 = v97;
                v80 = v98;
                v81 = v99;
                v82 = v100;
                v83 = v101;
                v84 = v102;
                v85 = v103;
                v86 = v104;
                v87 = v105;
                v88 = v106;
                v95 = 0.5 * (math.abs(l_X_4 * v80) + math.abs(l_Y_4 * v81) + math.abs(l_Z_4 * v82));
                v96 = 0.5 * (math.abs(l_X_4 * v83) + math.abs(l_Y_4 * v84) + math.abs(l_Z_4 * v85));
                v97 = 0.5 * (math.abs(l_X_4 * v86) + math.abs(l_Y_4 * v87) + math.abs(l_Z_4 * v88));
                v98 = l_CFrame_1.X;
                v99 = l_CFrame_1.Y;
                v100 = l_CFrame_1.Z;
                v62 = math.min(v62, v98 - v95);
                v63 = math.max(v63, v98 + v95);
                v64 = math.min(v64, v99 - v96);
                v65 = math.max(v65, v99 + v96);
                v66 = math.min(v66, v100 - v97);
                v67 = math.max(v67, v100 + v97);
            end;
        end;
        for _, v108 in ipairs(v51) do
            local l_WorldPosition_0 = v108.WorldPosition;
            local v110 = v55 * l_WorldPosition_0;
            local l_X_6 = v110.X;
            local l_Y_6 = v110.Y;
            local l_Z_6 = v110.Z;
            v56 = math.min(v56, l_X_6);
            v57 = math.max(v57, l_X_6);
            v58 = math.min(v58, l_Y_6);
            v59 = math.max(v59, l_Y_6);
            v60 = math.min(v60, l_Z_6);
            v61 = math.max(v61, l_Z_6);
            local l_X_7 = l_WorldPosition_0.X;
            local l_Y_7 = l_WorldPosition_0.Y;
            local l_Z_7 = l_WorldPosition_0.Z;
            v62 = math.min(v62, l_X_7);
            v63 = math.max(v63, l_X_7);
            v64 = math.min(v64, l_Y_7);
            v65 = math.max(v65, l_Y_7);
            v66 = math.min(v66, l_Z_7);
            v67 = math.max(v67, l_Z_7);
        end;
        return Vector3.new(0.5 * (v56 + v57), 0.5 * (v58 + v59), 0.5 * (v60 + v61)), Vector3.new(v57 - v56, v59 - v58, v61 - v60), Vector3.new(0.5 * (v62 + v63) - l_X_3, 0.5 * (v64 + v65) - l_Y_3, 0.5 * (v66 + v67) - l_Z_3), (Vector3.new(v63 - v62, v65 - v64, v67 - v66));
    end
};
v117.markBoneRecursive = function(v118, v119, v120) --[[ Line: 143 ]] --[[ Name: markBoneRecursive ]]
    -- upvalues: v117 (copy)
    if v119[v118] then
        v120[v118] = nil;
        return;
    else
        v119[v118] = true;
        for _, v122 in ipairs(v118:GetChildren()) do
            v117.markBoneRecursive(v122, v119, v120);
        end;
        return;
    end;
end;
v117.findRootBoneMap = function(v123) --[[ Line: 154 ]] --[[ Name: findRootBoneMap ]]
    -- upvalues: v117 (copy)
    local v124 = {};
    local v125 = {};
    for _, v127 in ipairs(v123) do
        if not v125[v127] then
            v124[v127] = v127:FindFirstAncestorWhichIsA("BasePart");
            v117.markBoneRecursive(v127, v125, v124);
        end;
    end;
    return v124;
end;
v117.computeInfo = function(v128, v129) --[[ Line: 166 ]] --[[ Name: computeInfo ]]
    -- upvalues: l_Workspace_0 (copy), v5 (copy), v117 (copy)
    local _ = v128:isSimulating();
    local v131 = v128:shouldUseLocalSpace();
    local v132 = table.create(64);
    local v133 = {};
    local v134 = {};
    local v135 = {};
    local v136 = {};
    local v137 = nil;
    local l_Terrain_2 = l_Workspace_0.Terrain;
    for _, v140 in ipairs(v129) do
        if v140:IsA("Model") then
            local l_v140_BoundingBox_0, v142 = v140:GetBoundingBox();
            if v142 ~= Vector3.new() then
                v137 = l_v140_BoundingBox_0;
            end;
        elseif v140:IsA("BasePart") then
            if not v133[v140] and v140 ~= l_Terrain_2 then
                table.insert(v132, v140);
                v133[v140] = true;
                v137 = v140.CFrame;
                local l_BoneRef_0 = v140:FindFirstChild("BoneRef");
                if l_BoneRef_0 and l_BoneRef_0.Value then
                    table.insert(v135, l_BoneRef_0.Value);
                end;
            end;
        elseif v5(v140) then
            table.insert(v136, v140);
        elseif v140:IsA("Attachment") then
            if v140:IsA("Bone") then
                table.insert(v135, v140);
            else
                table.insert(v134, v140);
            end;
        end;
    end;
    if not v137 then
        v137 = if #v134 > 0 then v134[1].WorldCFrame else if #v135 > 0 then v135[1].WorldCFrame else CFrame.new();
    end;
    if #v129 == 1 and (v129[1]:IsA("BasePart") or v129[1]:IsA("Model")) then
        local l_Pivot_0 = v129[1]:GetPivot();
        if l_Pivot_0 then
            v137 = l_Pivot_0;
        end;
    end;
    local v145 = {};
    for _, v147 in ipairs(v134) do
        if not v133[v147.Parent] then
            table.insert(v145, v147);
        end;
    end;
    local v148 = v117.findRootBoneMap(v135);
    for v149, v150 in pairs(v148) do
        if not v133[v150] then
            table.insert(v145, v149);
        end;
    end;
    for _, v152 in ipairs(v135) do
        table.insert(v134, v152);
    end;
    local l_v137_0 = v137;
    local v154 = nil;
    local v155 = nil;
    local v156 = nil;
    local v157 = nil;
    local v158 = nil;
    if v131 then
        local v159, v160 = v117.computeBoundingBox(l_v137_0, v132, v134);
        v154 = v159;
        v155 = v160;
        v156 = l_v137_0;
        v157 = v154;
        v158 = v155;
    else
        local v161, v162, v163, v164 = v117.computeTwoBoundingBoxes(l_v137_0, v132, v134);
        v154 = v161;
        v155 = v162;
        v157 = v163;
        v158 = v164;
        v156 = CFrame.new(v137.Position);
    end;
    return {
        basisCFrame = v156, 
        boundingBoxSize = v158, 
        boundingBoxOffset = v157, 
        localBasisCFrame = l_v137_0, 
        localBoundingBoxSize = v155, 
        localBoundingBoxOffset = v154, 
        parts = v132, 
        partSet = v133, 
        attachments = v145, 
        allAttachments = v134, 
        bones = v135, 
        instancesWithConfigurableFace = v136, 
        draggerContext = v128
    };
end;
return v117;