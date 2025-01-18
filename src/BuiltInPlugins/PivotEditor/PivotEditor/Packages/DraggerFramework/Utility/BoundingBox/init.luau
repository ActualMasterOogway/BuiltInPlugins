local l_Workspace_0 = game:GetService("Workspace");
local function v26(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: getBoundingBoxInternal ]]
    local v4 = v3 and v3 * v1 or v1;
    local l_X_0 = v2.X;
    local l_Y_0 = v2.Y;
    local l_Z_0 = v2.Z;
    local _, _, _, v11, v12, v13, v14, v15, v16, v17, v18, v19 = v4:GetComponents();
    local v20 = 0.5 * (math.abs(l_X_0 * v11) + math.abs(l_Y_0 * v12) + math.abs(l_Z_0 * v13));
    local v21 = 0.5 * (math.abs(l_X_0 * v14) + math.abs(l_Y_0 * v15) + math.abs(l_Z_0 * v16));
    local v22 = 0.5 * (math.abs(l_X_0 * v17) + math.abs(l_Y_0 * v18) + math.abs(l_Z_0 * v19));
    local l_X_1 = v4.X;
    local l_Y_1 = v4.Y;
    local l_Z_1 = v4.Z;
    return l_X_1 - v20, l_X_1 + v20, l_Y_1 - v21, l_Y_1 + v21, l_Z_1 - v22, l_Z_1 + v22;
end;
return {
    fromObjects = function(v27, v28) --[[ Line: 38 ]] --[[ Name: fromObjects ]]
        -- upvalues: l_Workspace_0 (copy), v26 (copy)
        local v29 = v28 and v28:Inverse() or nil;
        local v30 = 1e999;
        local v31 = -1e999;
        local v32 = 1e999;
        local v33 = -1e999;
        local v34 = 1e999;
        local v35 = -1e999;
        local l_Terrain_0 = l_Workspace_0.Terrain;
        for _, v38 in ipairs(v27) do
            local v39 = v38:IsA("Model");
            if v39 or v38:IsA("BasePart") and v38 ~= l_Terrain_0 then
                local v40 = nil;
                local v41 = nil;
                if v39 then
                    local l_v38_BoundingBox_0, v43 = v38:GetBoundingBox();
                    v40 = l_v38_BoundingBox_0;
                    v41 = v43;
                else
                    v40 = v38.CFrame;
                    v41 = v38.Size;
                end;
                local v44, v45, v46, v47, v48, v49 = v26(v40, v41, v29);
                v30 = math.min(v30, v44);
                v31 = math.max(v31, v45);
                v32 = math.min(v32, v46);
                v33 = math.max(v33, v47);
                v34 = math.min(v34, v48);
                v35 = math.max(v35, v49);
            elseif v38:IsA("Attachment") then
                local v50 = v28:PointToObjectSpace(v38.WorldPosition);
                local l_X_2 = v50.X;
                local l_Y_2 = v50.Y;
                local l_Z_2 = v50.Z;
                v30 = math.min(v30, l_X_2);
                v31 = math.max(v31, l_X_2);
                v32 = math.min(v32, l_Y_2);
                v33 = math.max(v33, l_Y_2);
                v34 = math.min(v34, l_Z_2);
                v35 = math.max(v35, l_Z_2);
            end;
        end;
        return Vector3.new(0.5 * (v30 + v31), 0.5 * (v32 + v33), 0.5 * (v34 + v35)), (Vector3.new(v31 - v30, v33 - v32, v35 - v34));
    end, 
    fromObjectsComputeAll = function(v54, v55) --[[ Line: 97 ]] --[[ Name: fromObjectsComputeAll ]]
        -- upvalues: l_Workspace_0 (copy), v26 (copy)
        local v56 = v55 and v55:Inverse() or nil;
        local v57 = 1e999;
        local v58 = -1e999;
        local v59 = 1e999;
        local v60 = -1e999;
        local v61 = 1e999;
        local v62 = -1e999;
        local l_Terrain_1 = l_Workspace_0.Terrain;
        local v64 = {};
        for _, v66 in ipairs(v54) do
            local v67 = v66:IsA("Model");
            if v67 or v66:IsA("BasePart") and v66 ~= l_Terrain_1 then
                local v68 = nil;
                local v69 = nil;
                if v67 then
                    local l_v66_BoundingBox_0, v71 = v66:GetBoundingBox();
                    v68 = l_v66_BoundingBox_0;
                    v69 = v71;
                else
                    v68 = v66.CFrame;
                    v69 = v66.Size;
                end;
                local v72, v73, v74, v75, v76, v77 = v26(v68, v69, v56);
                v57 = math.min(v57, v72);
                v58 = math.max(v58, v73);
                v59 = math.min(v59, v74);
                v60 = math.max(v60, v75);
                v61 = math.min(v61, v76);
                v62 = math.max(v62, v77);
                v64[v66] = {
                    offset = Vector3.new(0.5 * (v72 + v73), 0.5 * (v74 + v75), 0.5 * (v76 + v77)), 
                    size = Vector3.new(v73 - v72, v75 - v74, v77 - v76)
                };
            elseif v66:IsA("Attachment") then
                local v78 = v55:PointToObjectSpace(v66.WorldPosition);
                local l_X_3 = v78.X;
                local l_Y_3 = v78.Y;
                local l_Z_3 = v78.Z;
                v57 = math.min(v57, l_X_3);
                v58 = math.max(v58, l_X_3);
                v59 = math.min(v59, l_Y_3);
                v60 = math.max(v60, l_Y_3);
                v61 = math.min(v61, l_Z_3);
                v62 = math.max(v62, l_Z_3);
            end;
        end;
        return Vector3.new(0.5 * (v57 + v58), 0.5 * (v59 + v60), 0.5 * (v61 + v62)), Vector3.new(v58 - v57, v60 - v59, v62 - v61), v64;
    end, 
    fromPartsAndAttachments = function(v82, v83, v84) --[[ Line: 153 ]] --[[ Name: fromPartsAndAttachments ]]
        -- upvalues: l_Workspace_0 (copy), v26 (copy)
        local v85 = v84 and v84:Inverse() or nil;
        local v86 = 1e999;
        local v87 = -1e999;
        local v88 = 1e999;
        local v89 = -1e999;
        local v90 = 1e999;
        local v91 = -1e999;
        local l_Terrain_2 = l_Workspace_0.Terrain;
        for _, v94 in ipairs(v82) do
            if v94 ~= l_Terrain_2 then
                local v95, v96, v97, v98, v99, v100 = v26(v94.CFrame, v94.Size, v85);
                v86 = math.min(v86, v95);
                v87 = math.max(v87, v96);
                v88 = math.min(v88, v97);
                v89 = math.max(v89, v98);
                v90 = math.min(v90, v99);
                v91 = math.max(v91, v100);
            end;
        end;
        for _, v102 in ipairs(v83) do
            local v103 = v84:PointToObjectSpace(v102.WorldPosition);
            local l_X_4 = v103.X;
            local l_Y_4 = v103.Y;
            local l_Z_4 = v103.Z;
            v86 = math.min(v86, l_X_4);
            v87 = math.max(v87, l_X_4);
            v88 = math.min(v88, l_Y_4);
            v89 = math.max(v89, l_Y_4);
            v90 = math.min(v90, l_Z_4);
            v91 = math.max(v91, l_Z_4);
        end;
        return Vector3.new(0.5 * (v86 + v87), 0.5 * (v88 + v89), 0.5 * (v90 + v91)), (Vector3.new(v87 - v86, v89 - v88, v91 - v90));
    end
};