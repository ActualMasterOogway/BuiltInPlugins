local v0 = {
    commandsEnded = nil
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v3 = v2.GetService("MarketplaceService");
local v4 = v2.GetService("ChatbotUIService");
local v5 = v2.GetService("StreamingService");
local v6 = v2.GetService("TweenService");
local v7 = v2.GetService("CoreGui");
local v8 = v2.GetService("Workspace");
local v9 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagRemoveHintsAndMessagesFromInsertion);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoUnlockInsertedAssets);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIMenu_Attrib);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvoAIDisableAssetScripts);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoNormalizeBoundingBoxesForInsertedAssets);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAssetCreditAttributes);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxRequestAreaSizeRatio);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxRegionFenceHeight);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPDMHierarchyIncludeAttributes);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyMaxAttributesSize);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixCurrentCameraPlacement);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixSSDRUtilsDelayIndexError);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixOnlyInsertFirstVariation);
local l_game_0 = v2.Globals.game;
local v24 = {
    BasePart = "BasePart", 
    Model = "Model", 
    Attachment = "Attachment", 
    Bone = "Bone", 
    FaceInstance = "FaceInstance", 
    SurfaceGui = "FaceInstance"
};
local function v28(v25) --[[ Line: 47 ]] --[[ Name: collectTransformablesRemapClass ]]
    -- upvalues: v24 (copy)
    for v26, v27 in v24 do
        if v27 and v25:IsA(v26) then
            v24[v25.ClassName] = v27;
            return v27;
        end;
    end;
    v24[v25.ClassName] = false;
    return false;
end;
local function v29(v30, v31) --[[ Line: 70 ]] --[[ Name: collectTransformablesRecursive ]]
    -- upvalues: v24 (copy), v28 (copy), v29 (copy)
    local v32 = v24[v30.ClassName];
    if v32 == nil then
        v32 = v28(v30);
    end;
    local v33 = nil;
    if v32 == "BasePart" then
        v33 = true;
        local l_PartSet_0 = v31.PartSet;
        if l_PartSet_0[v30] then
            return;
        else
            l_PartSet_0[v30] = true;
            v31.PartToRootMap[v30] = v30;
            v31.BasisObject = v30;
        end;
    elseif v32 == "Model" then
        v33 = true;
        local l_ModelSet_0 = v31.ModelSet;
        if l_ModelSet_0[v30] then
            return;
        else
            l_ModelSet_0[v30] = true;
            v31.BasisObject = v30;
        end;
    elseif v32 == "Attachment" then
        v31.AttachmentSet[v30] = true;
    elseif v32 == "Bone" then
        v31.BoneSet[v30] = true;
    elseif v32 == "FaceInstance" then
        v31.FaceInstanceSet[v30] = true;
    end;
    if v33 then
        local l_ModelSet_1 = v31.ModelSet;
        local l_PartSet_1 = v31.PartSet;
        local l_PartToRootMap_0 = v31.PartToRootMap;
        local v39 = 0;
        for _, v41 in v30:GetDescendants() do
            local v42 = v24[v41.ClassName];
            if v42 == nil then
                v42 = v28(v41);
            end;
            if v42 == "BasePart" then
                l_PartSet_1[v41] = true;
                v39 = v39 + 1;
                l_PartToRootMap_0[v41] = v30;
            elseif v42 == "Model" then
                l_ModelSet_1[v41] = true;
                v39 = v39 + 1;
            elseif v42 == "Attachment" then
                v31.AttachmentSet[v41] = true;
            elseif v42 == "Bone" then
                v31.BoneSet[v41] = true;
            elseif v42 == "FaceInstance" then
                v31.FaceInstanceSet[v41] = true;
            end;
        end;
        v31.RootToDescendantCountMap[v30] = v39;
        return;
    else
        for _, v44 in v30:GetChildren() do
            v29(v44, v31);
        end;
        return;
    end;
end;
local function v49(v45) --[[ Line: 161 ]] --[[ Name: collectTransformables ]]
    -- upvalues: v29 (copy)
    local v46 = {
        RootToDescendantCountMap = {}, 
        PartToRootMap = {}, 
        PartSet = {}, 
        ModelSet = {}, 
        AttachmentSet = {}, 
        BoneSet = {}, 
        FaceInstanceSet = {}, 
        BasisObject = nil
    };
    for _, v48 in v45 do
        v29(v48, v46);
    end;
    return v46;
end;
local function _(v50) --[[ Line: 178 ]] --[[ Name: setToList ]]
    local v51 = {};
    for v52 in v50 do
        table.insert(v51, v52);
    end;
    return v51;
end;
local function v97(v54, v55, v56) --[[ Line: 186 ]] --[[ Name: computeBoundingBox ]]
    -- upvalues: v8 (copy)
    local v57 = v54:Inverse();
    local v58 = 1e999;
    local v59 = -1e999;
    local v60 = 1e999;
    local v61 = -1e999;
    local v62 = 1e999;
    local v63 = -1e999;
    local l_Terrain_0 = v8.Terrain;
    for _, v66 in ipairs(v55) do
        if v66 ~= l_Terrain_0 then
            local v67 = nil;
            local v68 = nil;
            v67 = v66.CFrame;
            v68 = v66.Size;
            local l_X_0 = v68.X;
            local l_Y_0 = v68.Y;
            local l_Z_0 = v68.Z;
            local v72 = v57 * v67;
            local _, _, _, v76, v77, v78, v79, v80, v81, v82, v83, v84 = v72:components();
            local v85 = 0.5 * (math.abs(l_X_0 * v76) + math.abs(l_Y_0 * v77) + math.abs(l_Z_0 * v78));
            local v86 = 0.5 * (math.abs(l_X_0 * v79) + math.abs(l_Y_0 * v80) + math.abs(l_Z_0 * v81));
            local v87 = 0.5 * (math.abs(l_X_0 * v82) + math.abs(l_Y_0 * v83) + math.abs(l_Z_0 * v84));
            local l_X_1 = v72.X;
            local l_Y_1 = v72.Y;
            local l_Z_1 = v72.Z;
            v58 = math.min(v58, l_X_1 - v85);
            v59 = math.max(v59, l_X_1 + v85);
            v60 = math.min(v60, l_Y_1 - v86);
            v61 = math.max(v61, l_Y_1 + v86);
            v62 = math.min(v62, l_Z_1 - v87);
            v63 = math.max(v63, l_Z_1 + v87);
        end;
    end;
    for _, v92 in ipairs(v56) do
        local v93 = v54:PointToObjectSpace(v92.WorldPosition);
        local l_X_2 = v93.X;
        local l_Y_2 = v93.Y;
        local l_Z_2 = v93.Z;
        v58 = math.min(v58, l_X_2);
        v59 = math.max(v59, l_X_2);
        v60 = math.min(v60, l_Y_2);
        v61 = math.max(v61, l_Y_2);
        v62 = math.min(v62, l_Z_2);
        v63 = math.max(v63, l_Z_2);
    end;
    return Vector3.new(0.5 * (v58 + v59), 0.5 * (v60 + v61), 0.5 * (v62 + v63)), (Vector3.new(v59 - v58, v61 - v60, v63 - v62));
end;
v0.getPositionAndSize = function(v98, v99) --[[ Line: 233 ]] --[[ Name: getPositionAndSize ]]
    -- upvalues: v49 (copy), v97 (copy)
    if type(v98) ~= "table" then
        v98 = {
            v98
        };
    end;
    assert(type(v98) == "table", "Failed to convert selectedObjects to table");
    local l_PartSet_2 = v49(v98).PartSet;
    local v101 = {};
    for v102 in l_PartSet_2 do
        table.insert(v101, v102);
    end;
    local v103;
    v101, v103 = v97(v99 or CFrame.new(), v101, {});
    if v101 and v103 and v101 == v101 and v103 == v103 then
        return v101, v103;
    else
        return;
    end;
end;
local v104 = {};
local v105 = {};
local function v106(v107, v108) --[[ Line: 251 ]] --[[ Name: updateChatBulletCount ]]
    -- upvalues: v105 (copy), v104 (copy), v4 (copy), v9 (copy), v21 (copy), v106 (copy)
    if v105[v107] then
        v104[v107] = {
            isFinal = v108
        };
        return;
    else
        v105[v107] = true;
        v4:DisplayContent("TransformContent", {
            requestId = v107, 
            transformFunction = function(v109) --[[ Line: 259 ]] --[[ Name: transformFunction ]]
                -- upvalues: v9 (ref), v108 (copy)
                local v110 = {};
                for _, v112 in v109 do
                    for v113, v114 in pairs(v9.chatBulletMap) do
                        if #v114 > 1 then
                            v112 = v112:gsub(("<a id=\"%*\"/>.-</a>"):format(v113), (("<a id=\"%*\"/> x%*</a>"):format(v113, #v114)));
                        elseif #v114 == 0 and v108 then
                            v112 = v112:gsub(("<span id=\"%*\">(.-)</span>"):format(v113), (("<span id=\"%*\" style=\"color:#646464\">%%1</span>"):format(v113)));
                        end;
                    end;
                    table.insert(v110, v112);
                end;
                return v110;
            end, 
            completeCallback = function(v115) --[[ Line: 274 ]] --[[ Name: completeCallback ]]
                -- upvalues: v104 (ref), v107 (copy), v105 (ref), v21 (ref), v106 (ref)
                if v115 and not v104[v107] then
                    v105[v107] = nil;
                    return;
                else
                    task.delay(0.25, function() --[[ Line: 278 ]]
                        -- upvalues: v104 (ref), v107 (ref), v21 (ref), v105 (ref), v106 (ref)
                        local v116 = v104[v107];
                        if not v21() or v116 then
                            v104[v107] = nil;
                            v105[v107] = nil;
                            v106(v107, v116.isFinal);
                        end;
                    end);
                    return;
                end;
            end
        });
        return;
    end;
end;
local function v133(v117) --[[ Line: 291 ]] --[[ Name: getWhereCameraIsPointing ]]
    local l_Position_0 = v117.Position;
    local l_Unit_0 = v117.LookVector.Unit;
    local l_Y_3 = l_Position_0.Y;
    local v121 = math.max(l_Y_3 * 3, 50);
    local v122 = math.sqrt(l_Y_3 * l_Y_3 + v121 * v121);
    local v123 = {};
    local l_Terrain_1 = workspace.Terrain;
    if l_Terrain_1 and l_Terrain_1:CountCells() > 0 then
        table.insert(v123, l_Terrain_1);
    end;
    local l_Baseplate_0 = workspace:FindFirstChild("Baseplate");
    if l_Baseplate_0 then
        table.insert(v123, l_Baseplate_0);
    end;
    if #v123 > 0 then
        local v126 = RaycastParams.new();
        v126.FilterDescendantsInstances = v123;
        v126.FilterType = Enum.RaycastFilterType.Include;
        v126.IgnoreWater = true;
        local v127 = workspace:Raycast(l_Position_0, l_Unit_0 * v122, v126);
        if v127 then
            return v127.Position, nil;
        else
            v127 = workspace:Raycast(l_Position_0 + l_Unit_0 * v121, -Vector3.yAxis * v121, v126);
            if v127 then
                return v127.Position, nil;
            else
                v127 = workspace:Raycast(l_Position_0 + l_Unit_0 * v121, Vector3.yAxis * v121, v126);
                if v127 then
                    return v127.Position, nil;
                end;
            end;
        end;
    else
        local v128 = l_Unit_0:Dot(-Vector3.yAxis);
        if v128 > 0 and v128 < 1 and l_Position_0.Y > 0 then
            local v129 = l_Y_3 / v128;
            local v130 = Vector3.new(l_Position_0.X, 0, l_Position_0.Z);
            local v131 = v129 * l_Unit_0 + l_Position_0;
            if v129 < v122 then
                return v131, v131.Y;
            else
                return Vector3.new(l_Unit_0.X, 0, l_Unit_0.Z).Unit * v121 + v130, 0;
            end;
        end;
    end;
    local v132 = l_Position_0 + l_Unit_0 * v121;
    return v132, v132.Y;
end;
v0.getCurrentLookingCFrame = function() --[[ Line: 354 ]] --[[ Name: getCurrentLookingCFrame ]]
    -- upvalues: v20 (copy), v133 (copy), v16 (copy)
    assert(v20(), "getCurrentLookingCFrame should only be called when FFlagFixCurrentCameraPlacement is enabled");
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Position_1 = l_CFrame_0.Position;
    local v137, v138 = v133(l_CFrame_0);
    local v139 = l_CurrentCamera_0:ViewportPointToRay(l_CurrentCamera_0.ViewportSize.X, l_CurrentCamera_0.ViewportSize.Y);
    local v140 = -(v139.Origin - v137):Dot(Vector3.yAxis) / v139.Direction:Dot(Vector3.yAxis);
    local v141 = v139.Origin + v139.Direction * v140;
    v141 = Vector3.new(v141.X, v137.Y, v141.Z);
    local v142 = v137 - Vector3.new(l_Position_1.X, v137.Y, l_Position_1.Z);
    local v143 = CFrame.new(v137, v137 + v142);
    local v144 = v143:ToObjectSpace(CFrame.new(v141)).Position * 2;
    local l_X_3 = v144.X;
    local l_Z_3 = v144.Z;
    local v147 = l_X_3 / l_Z_3;
    local v148 = v16() * 0.01;
    if v148 > 0 then
        if v148 < v147 then
            l_X_3 = l_Z_3 * v148;
        elseif v147 < 1 / v148 then
            local l_l_Z_3_0 = l_Z_3;
            l_Z_3 = l_X_3 * v148;
            local v150 = Vector3.new(0, 0, (l_l_Z_3_0 - l_Z_3) * 0.5);
            v143 = v143:ToWorldSpace(CFrame.new(v150));
        end;
    end;
    return v143, v138, l_CFrame_0, l_X_3, l_Z_3;
end;
v0.getRequestCFrame = function(v151) --[[ Line: 394 ]] --[[ Name: getRequestCFrame ]]
    -- upvalues: v9 (copy), v20 (copy), v0 (copy), v133 (copy), v16 (copy)
    local v152 = v9.GetRequestMetadata(v151, "RequestCFrame");
    if v152 then
        return v152, v9.GetRequestMetadata(v151, "PlacementForcedY");
    else
        local v153 = nil;
        local v154 = nil;
        local v155 = nil;
        local v156 = nil;
        local v157 = nil;
        if v20() then
            local v158, v159, v160, v161, v162 = v0.getCurrentLookingCFrame();
            v153 = v158;
            v154 = v159;
            v155 = v160;
            v156 = v161;
            v157 = v162;
        else
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            v155 = l_CurrentCamera_1.CFrame;
            local l_Position_2 = v155.Position;
            local v165 = nil;
            local v166, v167 = v133(v155);
            v165 = v166;
            v154 = v167;
            v166 = l_CurrentCamera_1:ViewportPointToRay(l_CurrentCamera_1.ViewportSize.X, l_CurrentCamera_1.ViewportSize.Y);
            v167 = -(v166.Origin - v165):Dot(Vector3.yAxis) / v166.Direction:Dot(Vector3.yAxis);
            local v168 = v166.Origin + v166.Direction * v167;
            v168 = Vector3.new(v168.X, v165.Y, v168.Z);
            local v169 = v165 - Vector3.new(l_Position_2.X, v165.Y, l_Position_2.Z);
            v153 = CFrame.new(v165, v165 + v169);
            local v170 = v153:ToObjectSpace(CFrame.new(v168)).Position * 2;
            v156 = v170.X;
            v157 = v170.Z;
            local v171 = v156 / v157;
            local v172 = v16() * 0.01;
            if v172 > 0 then
                if v172 < v171 then
                    v156 = v157 * v172;
                elseif v171 < 1 / v172 then
                    local l_v157_0 = v157;
                    v157 = v156 * v172;
                    local v174 = Vector3.new(0, 0, (l_v157_0 - v157) * 0.5);
                    v153 = v153:ToWorldSpace(CFrame.new(v174));
                end;
            end;
        end;
        local v175 = Vector3.new(math.ceil(v156), 0, (math.ceil(v157)));
        v9.SetRequestMetadata(v151, "RequestCFrame", v153);
        v9.SetRequestMetadata(v151, "CameraCFrame", v155);
        v9.SetRequestMetadata(v151, "PlacementSize", v175);
        v9.SetRequestMetadata(v151, "PlacementForcedY", v154);
        return v153, v154;
    end;
end;
toHexy = function(v176) --[[ Line: 448 ]] --[[ Name: toHexy ]]
    return v176:gsub(".", function(v177) --[[ Line: 449 ]]
        return string.format("%x", v177:byte());
    end);
end;
v0.getChatBulletId = function(v178, v179) --[[ Line: 454 ]] --[[ Name: getChatBulletId ]]
    -- upvalues: v22 (copy)
    assert(v22(), "getChatBulletId should only be called when FFlagConvAIFixOnlyInsertFirstVariation is enabled");
    return "a" .. toHexy(v178 .. v179);
end;
v0.modifyChatWithInstanceLink = function(v180, v181, v182, v183, v184) --[[ Line: 462 ]] --[[ Name: modifyChatWithInstanceLink ]]
    -- upvalues: v22 (copy), v0 (copy), v9 (copy), v4 (copy), v106 (copy), v5 (copy)
    if v183 then
        v183 = if v22() then v0.getChatBulletId(v180, v183) else "a" .. toHexy(v180 .. v183);
    end;
    v184 = v184 or {};
    local l_v181_DebugId_0 = v181:GetDebugId();
    if v184.guid then
        v9.altDataMap[v184.guid].assetId = v184.assetId;
        v9.guidToInfo[v184.guid].instance = v181;
        v9.g2g[l_v181_DebugId_0] = v184.guid;
        return;
    else
        v184.guid = l_v181_DebugId_0;
        v9.altDataMap[l_v181_DebugId_0] = v184;
        if v9.activeDraftGuids then
            v9.activeDraftGuids[l_v181_DebugId_0] = true;
        end;
        local v186 = nil;
        local v187 = nil;
        if v183 then
            v186 = not v9.chatBulletMap[v183];
            v187 = v9.chatBulletMap[v183] or {};
            v9.chatBulletMap[v183] = v187;
            if not v9.activeDraftGuids then
                table.insert(v187, l_v181_DebugId_0);
            end;
        end;
        v9.guidToInfo[l_v181_DebugId_0] = {
            instance = v181, 
            chatBulletGroupId = v183
        };
        if not v187 then
            v4:DisplayContent("StreamTextInNewMessage", {
                requestId = v180 or "", 
                content = ("* %* [![](image://instance/%*) <span id=\"%*\">%*</span>](studio://instance/%*)"):format(v182, v181.ClassName, v183, v181.Name, l_v181_DebugId_0)
            });
        elseif v186 then
            v4:DisplayContent("StreamTextInNewMessage", {
                requestId = v180 or "", 
                content = ("* %* <span class=\"instanceLink\"><a href=\"studio://instance/%*\"> <img src=\"image://instance/%*\" alt=\"%*\"/> <span id=\"%*\">%*</span><a id=\"%*\"/></a></span>"):format(v182, l_v181_DebugId_0, v181.ClassName, v181.ClassName, v183, v181.Name, v183)
            });
            v4:DisplayContent("AddAssetIterationDropdown", {
                requestId = v180 or "", 
                assetIds = v184.altAssets or {}, 
                actionString = "studio://instance/" .. l_v181_DebugId_0
            });
        elseif #v187 > 1 then
            v106(v180, false);
        end;
        if not v0.commandsEnded then
            v0.commandsEnded = v5.SequentialCommandsFinished:Connect(function(v188) --[[ Line: 517 ]]
                -- upvalues: v106 (ref)
                v106(v188, true);
            end);
        end;
        return;
    end;
end;
v0.destroy = function() --[[ Line: 523 ]] --[[ Name: destroy ]]
    -- upvalues: v0 (copy)
    if v0.commandsEnded then
        v0.commandsEnded:Disconnect();
        v0.commandsEnded = nil;
    end;
end;
v0.streamText = function(v189, v190, v191) --[[ Line: 530 ]] --[[ Name: streamText ]]
    -- upvalues: v4 (copy)
    v4:DisplayContent("StreamText", {
        requestId = v189 or "", 
        content = v190, 
        streamId = v191
    });
end;
v0.endConstraintVisualization = function(v192) --[[ Line: 538 ]] --[[ Name: endConstraintVisualization ]]
    -- upvalues: v9 (copy)
    local v193 = v9.requestRegionAdornments[v192];
    if v193 then
        local l_Parent_0 = v193.Parent;
        if l_Parent_0 then
            l_Parent_0:Destroy();
        end;
        local l_ToggleVisibilityEvent_0 = v193.ToggleVisibilityEvent;
        if l_ToggleVisibilityEvent_0 then
            l_ToggleVisibilityEvent_0:Destroy();
        end;
        v9.requestRegionAdornments[v192] = nil;
    end;
end;
v0.getGroundLevelAt = function(v196, v197, v198, v199) --[[ Line: 553 ]] --[[ Name: getGroundLevelAt ]]
    if v199 then
        return v199;
    else
        if v197 and v198 then
            local v200 = RaycastParams.new();
            v200.FilterDescendantsInstances = {
                v197
            };
            v200.FilterType = Enum.RaycastFilterType.Include;
            local v201 = workspace:Raycast(v196 + Vector3.new(0, v198.Y + 5, 0), -Vector3.yAxis * 2 * (v198.Y + 5), v200);
            if v201 then
                return v201.Position.Y;
            end;
        end;
        local v202 = {};
        local l_Terrain_2 = workspace.Terrain;
        if l_Terrain_2 and l_Terrain_2:CountCells() > 0 then
            table.insert(v202, l_Terrain_2);
        end;
        local l_Baseplate_1 = workspace:FindFirstChild("Baseplate");
        if l_Baseplate_1 then
            table.insert(v202, l_Baseplate_1);
        end;
        if #v202 > 0 then
            local v205 = RaycastParams.new();
            v205.FilterDescendantsInstances = v202;
            v205.FilterType = Enum.RaycastFilterType.Include;
            v205.IgnoreWater = true;
            local v206 = workspace:Raycast(v196 + Vector3.new(0, 10000, 0, 0), -Vector3.yAxis * 20000, v205);
            if v206 then
                return v206.Position.Y;
            end;
        end;
        return v196.Y;
    end;
end;
getDraftModeModel = function(v207) --[[ Line: 599 ]] --[[ Name: getDraftModeModel ]]
    -- upvalues: v9 (copy)
    return v9.draftModeModels[v207];
end;
v0.enableDraftMode = function(v208) --[[ Line: 603 ]] --[[ Name: enableDraftMode ]]
    -- upvalues: v9 (copy), v6 (copy)
    if v9.draftModeModels[v208] then
        warn("Attempted to enable draft mode when it's already running!");
        return;
    else
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Archivable = false;
        l_Model_0.Parent = v9.GetRequestFolder(v208);
        v9.draftModeModels[v208] = l_Model_0;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.FillColor = Color3.new(1, 1, 1);
        l_Highlight_0.FillTransparency = 0.45;
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.Parent = l_Model_0;
        local v211 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0);
        local v212 = v6:Create(l_Highlight_0, v211, {
            FillTransparency = 0.6
        });
        v212:Play();
        l_Model_0.Destroying:Once(function() --[[ Line: 631 ]]
            -- upvalues: v212 (copy)
            v212:Cancel();
        end);
        l_Model_0.ChildAdded:Connect(function(v213) --[[ Line: 635 ]]
            if v213:IsA("BasePart") then
                v213.Locked = true;
                v213.CastShadow = false;
                if v213.Transparency < 0.75 then
                    v213.Transparency = 0;
                end;
            end;
            for _, v215 in v213:GetDescendants() do
                if v215:IsA("BasePart") then
                    v215.Locked = true;
                    v215.CastShadow = false;
                    if v215.Transparency < 0.75 then
                        v215.Transparency = 0;
                    end;
                end;
                if v215:IsA("PackageLink") then
                    v215:Destroy();
                end;
            end;
        end);
        return;
    end;
end;
v0.disableDraftMode = function(v216) --[[ Line: 658 ]] --[[ Name: disableDraftMode ]]
    -- upvalues: v9 (copy)
    local v217 = v9.draftModeModels[v216];
    if not v217 then
        return;
    else
        v217:Destroy();
        v9.draftModeModels[v216] = nil;
        return;
    end;
end;
v0.isDraftModeEnabled = function(v218) --[[ Line: 667 ]] --[[ Name: isDraftModeEnabled ]]
    -- upvalues: v9 (copy)
    if v9.draftModeModels[v218] then
        return true;
    else
        return false;
    end;
end;
v0.getRequestParent = function(v219, v220) --[[ Line: 671 ]] --[[ Name: getRequestParent ]]
    -- upvalues: v9 (copy)
    return v9.activeDraftGuids and getDraftModeModel(v220) or v219.Parent or v9.GetRequestFolder(v220) or workspace;
end;
v0.addConstraintVisualization = function(v221, v222, v223, v224, v225) --[[ Line: 678 ]] --[[ Name: addConstraintVisualization ]]
    -- upvalues: v9 (copy), v7 (copy), v17 (copy), v0 (copy), v6 (copy)
    v225 = v225 or Color3.fromRGB(255, 255, 255);
    local v226 = v9.requestRegionAdornments[v221];
    if not v226 then
        v226 = {
            Parent = nil, 
            ToggleVisibilityEvent = Instance.new("BoolValue")
        };
        v226.ToggleVisibilityEvent.Value = false;
        v9.requestRegionAdornments[v221] = v226;
    end;
    local l_ToggleVisibilityEvent_1 = v226.ToggleVisibilityEvent;
    local v228 = v226.Parent or Instance.new("Folder");
    v228.Archivable = false;
    v228.Parent = v7;
    v228.Name = "AssistantArea";
    v226.Parent = v228;
    local v229 = {};
    local v230 = {};
    local v231 = nil;
    local v232 = v223.Y == 0;
    local v233 = if v223.Y > 0 then v223.Y else 10000;
    if v232 then
        v233 = math.min(v17() * 0.01, v223.Z * 0.62, v223.X * 0.62);
        local v234 = v9.GetRequestMetadata(v221, "PlacementForcedY");
        local l_v234_0 = v234 --[[ copy: 13 -> 32 ]];
        v231 = function(v236) --[[ Line: 714 ]]
            -- upvalues: v0 (ref), l_v234_0 (copy)
            return v0.getGroundLevelAt(v236, nil, nil, l_v234_0);
        end;
    end;
    for v237 = 1, 4 do
        local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_0.Parent = v228;
        l_BoxHandleAdornment_0.Adornee = nil;
        l_BoxHandleAdornment_0.Name = ("Edge_%*"):format(v237);
        l_BoxHandleAdornment_0.ZIndex = 0;
        l_BoxHandleAdornment_0.Size = Vector3.new(0.2, v233, 0.2);
        l_BoxHandleAdornment_0.Color3 = v225;
        l_BoxHandleAdornment_0.Transparency = 0.6;
        table.insert(v230, l_BoxHandleAdornment_0);
        local l_BoxHandleAdornment_1 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_1.Parent = v228;
        l_BoxHandleAdornment_1.Adornee = nil;
        l_BoxHandleAdornment_1.Name = ("Face_%*"):format(v237);
        l_BoxHandleAdornment_0.ZIndex = 0;
        l_BoxHandleAdornment_1.Color3 = v225;
        l_BoxHandleAdornment_1.Transparency = 0.87;
        table.insert(v229, l_BoxHandleAdornment_1);
    end;
    l_ToggleVisibilityEvent_1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 740 ]]
        -- upvalues: v230 (copy), l_ToggleVisibilityEvent_1 (copy), v229 (ref)
        for _, v241 in v230 do
            v241.Adornee = l_ToggleVisibilityEvent_1.Value and workspace.Terrain or nil;
        end;
        for _, v243 in v229 do
            v243.Adornee = l_ToggleVisibilityEvent_1.Value and workspace.Terrain or nil;
        end;
    end);
    local v244 = v223.X * 0.5;
    local v245 = v223.Z * 0.5;
    local v246 = {
        Vector3.new(v244, 0, v245), 
        Vector3.new(v244, 0, -v245), 
        Vector3.new(-v244, 0, -v245), 
        (Vector3.new(-v244, 0, v245))
    };
    local v247 = {
        Vector3.new(v223.X, v233, 0), 
        (Vector3.new(0, v233, v223.Z))
    };
    for v248 = 1, 4 do
        v230[v248].CFrame = v222:ToWorldSpace(CFrame.new(v246[v248]));
        v229[v248].Size = v247[v248 % 2 + 1];
        v229[v248].CFrame = v222:ToWorldSpace(CFrame.new((v246[v248] + v246[v248 % 4 + 1]) * 0.5));
    end;
    if v232 then
        local l_v229_0 = v229;
        v229 = {};
        for v250, v251 in l_v229_0 do
            if v250 % 2 == 0 then
                local l_X_4 = v251.Size.X;
                local v253 = v231(v251.CFrame:ToWorldSpace(CFrame.new(-l_X_4 * 0.5, 0, 0)).Position);
                local v254 = math.ceil(l_X_4 / 4);
                local v255 = l_X_4 / v254;
                for v256 = 0, v254 - 1 do
                    local v257 = v251:Clone();
                    v257.Parent = v228;
                    v257.Name = v251.Name .. "_" .. v256;
                    v257.Size = Vector3.new(v255, v251.Size.Y, v251.Size.Z);
                    v257.CFrame = v251.CFrame:ToWorldSpace(CFrame.new(-v251.Size.X * 0.5 + (v256 + 0.5) * v255, 0, 0));
                    local v258 = v231(v257.CFrame:ToWorldSpace(CFrame.new(v255 * 0.5, 0, 0)).Position);
                    v257.CFrame = v257.CFrame + Vector3.new(0, (v258 + v253) * 0.5 - v257.CFrame.Position.Y, 0);
                    v257.CFrame = v257.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, (v258 - v253) * 0.25, 1, 0, 0, 0, 1);
                    v253 = v258;
                    table.insert(v229, v257);
                end;
            else
                local l_Z_4 = v251.Size.Z;
                local v260 = v231(v251.CFrame:ToWorldSpace(CFrame.new(0, 0, -l_Z_4 * 0.5)).Position);
                local v261 = math.ceil(l_Z_4 / 4);
                local v262 = l_Z_4 / v261;
                for v263 = 0, v261 - 1 do
                    local v264 = v251:Clone();
                    v264.Parent = v228;
                    v264.Name = v251.Name .. "_" .. v263;
                    v264.Size = Vector3.new(v251.Size.X, v251.Size.Y, v262);
                    v264.CFrame = v251.CFrame:ToWorldSpace(CFrame.new(0, 0, -v251.Size.Z * 0.5 + (v263 + 0.5) * v262));
                    local v265 = v231(v264.CFrame:ToWorldSpace(CFrame.new(0, 0, v262 * 0.5)).Position);
                    v264.CFrame = v264.CFrame + Vector3.new(0, (v265 + v260) * 0.5 - v264.CFrame.Position.Y, 0);
                    v264.CFrame = v264.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, (v265 - v260) * 0.25, 0, 0, 1);
                    v260 = v265;
                    table.insert(v229, v264);
                end;
            end;
            v251:Destroy();
        end;
        for _, v267 in v230 do
            v267.CFrame = v267.CFrame + Vector3.new(0, v231(v267.CFrame.Position) - v267.CFrame.Position.Y, 0);
        end;
    end;
    if v224 then
        local v268 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0);
        local function v271(v269) --[[ Line: 845 ]] --[[ Name: assignTween ]]
            -- upvalues: v6 (ref), v268 (copy), v228 (copy)
            local v270 = v6:Create(v269, v268, {
                Transparency = 0.99
            });
            v270.Parent = v228;
            v270.Name = ("Tweening_%*"):format(v269.Name);
            v270:Play();
            v228.Destroying:Once(function() --[[ Line: 852 ]]
                -- upvalues: v270 (copy)
                v270:Cancel();
            end);
        end;
        for _, v273 in v230 do
            v271(v273);
        end;
        for _, v275 in v229 do
            v271(v275);
        end;
    end;
end;
v0.startConstraintVisualization = function(v276, v277) --[[ Line: 865 ]] --[[ Name: startConstraintVisualization ]]
    -- upvalues: v9 (copy)
    local v278 = v9.requestRegionAdornments[v276];
    if v278 and v278.ToggleVisibilityEvent then
        v278.ToggleVisibilityEvent.Value = v277;
    end;
end;
local function v281(v279) --[[ Line: 872 ]] --[[ Name: alignModelBoundingBoxToWorld ]]
    if not v279:IsA("Model") then
        return;
    else
        assert(v279:IsA("Model"), "Bad model check");
        v279.WorldPivot = CFrame.new(v279.WorldPivot.Position);
        local l_v279_BoundingBox_0 = v279:GetBoundingBox();
        v279.WorldPivot = CFrame.new(l_v279_BoundingBox_0.Position);
        return;
    end;
end;
v0.getWorldBoundingBox = function(v282, v283) --[[ Line: 882 ]] --[[ Name: getWorldBoundingBox ]]
    -- upvalues: v281 (copy)
    if not v282 then
        return CFrame.new(), (Vector3.new());
    else
        assert(v282, "Luau");
        local l_Model_1 = Instance.new("Model");
        local l_Parent_1 = v282.Parent;
        v282.Parent = l_Model_1;
        v281(l_Model_1);
        local l_l_Model_1_Pivot_0 = l_Model_1:GetPivot();
        local l_l_Model_1_ExtentsSize_0 = l_Model_1:GetExtentsSize();
        if v283 then
            v283(l_Model_1);
        end;
        v282.Parent = l_Parent_1;
        l_Model_1:Destroy();
        return l_l_Model_1_Pivot_0, l_l_Model_1_ExtentsSize_0;
    end;
end;
local function v296(v288) --[[ Line: 908 ]] --[[ Name: convertFolderToModel ]]
    if v288:IsA("Folder") then
        local l_Model_2 = Instance.new("Model");
        l_Model_2.Name = v288.Name;
        l_Model_2.Archivable = v288.Archivable;
        for _, v291 in pairs(v288:GetTags()) do
            l_Model_2:AddTag(v291);
        end;
        for v292, v293 in pairs(v288:GetAttributes()) do
            l_Model_2:SetAttribute(v292, v293);
        end;
        for _, v295 in pairs(v288:GetChildren()) do
            v295.Parent = l_Model_2;
        end;
        l_Model_2.Parent = v288.Parent;
        v288:Destroy();
        return l_Model_2;
    else
        return v288;
    end;
end;
local function v300(v297) --[[ Line: 929 ]] --[[ Name: removeUnwantedDescendants ]]
    for _, v299 in v297:GetDescendants() do
        if v299:IsA("Message") then
            v299:Destroy();
        end;
    end;
end;
local function v304(v301) --[[ Line: 937 ]] --[[ Name: deepUnlockDescendants ]]
    if v301:IsA("BasePart") then
        v301.Locked = false;
    end;
    for _, v303 in v301:GetDescendants() do
        if v303:IsA("BasePart") then
            v303.Locked = false;
        end;
    end;
end;
local function v308(v305) --[[ Line: 948 ]] --[[ Name: disableAssetScripts ]]
    if v305:IsA("Script") then
        v305.Enabled = false;
    end;
    for _, v307 in v305:GetDescendants() do
        if v307:IsA("Script") then
            v307.Enabled = false;
        end;
    end;
end;
local function v316(v309, v310) --[[ Line: 959 ]] --[[ Name: applyAssetAttributions ]]
    -- upvalues: v15 (copy), v12 (copy), v0 (copy), v3 (copy)
    assert(v15(), "FFlagConvAIAssetCreditAttributes is not enabled!");
    if v12() then
        local function v312() --[[ Line: 962 ]] --[[ Name: doGetSetAttributions ]]
            -- upvalues: v0 (ref), v310 (copy), v309 (copy)
            local v311 = v0.getAssetAttributionInfo(v310);
            v309:SetAttribute("OriginalName", v309.Name);
            v309:SetAttribute("AssetId", v310);
            if v311 then
                v309:SetAttribute("AssetName", v311.Name);
                if v311.Creator then
                    v309:SetAttribute("CreatorType", v311.Creator.CreatorType);
                    v309:SetAttribute("CreatorId", v311.Creator.Id);
                    v309:SetAttribute("CreatorName", v311.Creator.Name);
                end;
            end;
        end;
        task.spawn(v312);
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 980 ]]
            -- upvalues: v310 (copy), v3 (ref)
            local v313 = tonumber(v310);
            if not v313 then
                error("Invalid assetId: " .. v310);
            end;
            return v3:GetProductInfo(v313, Enum.InfoType.Asset);
        end);
        v309:SetAttribute("OriginalName", v309.Name);
        v309:SetAttribute("AssetId", v310);
        if l_status_0 then
            v309:SetAttribute("AssetName", l_result_0.Name);
            v309:SetAttribute("CreatorType", l_result_0.Creator.CreatorType);
            v309:SetAttribute("CreatorId", l_result_0.Creator.Id);
            v309:SetAttribute("CreatorName", l_result_0.Creator.Name);
        end;
        return;
    end;
end;
prepareInsertedAsset = function(v317, v318) --[[ Line: 1000 ]] --[[ Name: prepareInsertedAsset ]]
    -- upvalues: v14 (copy), v296 (copy), v10 (copy), v300 (copy), v11 (copy), v304 (copy), v13 (copy), v4 (copy), v308 (copy), v281 (copy), v15 (copy), v316 (copy)
    if not v14() then
        v317 = v296(v317);
    end;
    v317.SourceAssetId = tonumber(v318) or v317.SourceAssetId;
    if v10() then
        v300(v317);
    end;
    if v11() then
        v304(v317);
    end;
    if v13() and v4:GetSettings().DisableAssetScripts then
        v308(v317);
    end;
    if v14() then
        v281(v317);
    end;
    if v15() then
        v316(v317, v318);
    end;
    return v317;
end;
v0.isAssetCached = function(v319) --[[ Line: 1026 ]] --[[ Name: isAssetCached ]]
    -- upvalues: v9 (copy)
    return v9.assetCacheMap[v319] ~= nil;
end;
v0.loadAssetAsync = function(v320) --[[ Line: 1030 ]] --[[ Name: loadAssetAsync ]]
    -- upvalues: v9 (copy), l_game_0 (copy), v14 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 1031 ]]
        -- upvalues: v9 (ref), v320 (copy), l_game_0 (ref), v14 (ref)
        local v321 = v9.assetCacheMap[v320];
        if v321 then
            return v321:Clone();
        else
            local l_l_game_0_ObjectsAsync_0 = l_game_0:GetObjectsAsync("rbxassetid://" .. v320);
            local v323 = nil;
            if v14() then
                v323 = Instance.new("Model");
                for _, v325 in l_l_game_0_ObjectsAsync_0 do
                    v325.Parent = v323;
                end;
            else
                v323 = l_l_game_0_ObjectsAsync_0[1];
                if #l_l_game_0_ObjectsAsync_0 > 1 or not v323:IsA("PVInstance") then
                    v323 = Instance.new("Model");
                    for _, v327 in l_l_game_0_ObjectsAsync_0 do
                        v327.Parent = v323;
                    end;
                end;
            end;
            v323 = prepareInsertedAsset(v323, v320);
            v9.assetCacheMap[v320] = v323;
            return v323:Clone();
        end;
    end);
    if not l_status_1 then
        warn(l_result_1);
        return;
    else
        return l_result_1;
    end;
end;
v0.getAssetAttributionInfo = function(v330) --[[ Line: 1064 ]] --[[ Name: getAssetAttributionInfo ]]
    -- upvalues: v9 (copy), v3 (copy)
    if v9.cachedAssetAttributionInfo[v330] then
        return v9.cachedAssetAttributionInfo[v330];
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 1069 ]]
            -- upvalues: v330 (copy), v3 (ref)
            local v331 = tonumber(v330);
            if not v331 then
                error("Invalid assetId: " .. v330);
            end;
            return v3:GetProductInfo(v331, Enum.InfoType.Asset);
        end);
        if l_status_2 then
            v9.cachedAssetAttributionInfo[v330] = l_result_2;
            return l_result_2;
        else
            return nil;
        end;
    end;
end;
v0.getInstanceAttributes = function(v334) --[[ Line: 1083 ]] --[[ Name: getInstanceAttributes ]]
    -- upvalues: v18 (copy), v19 (copy)
    if not v18() then
        return nil;
    else
        local v335 = {};
        local v336 = v19();
        local v337 = 0;
        for v338, v339 in pairs(v334:GetAttributes()) do
            if v336 > v337 then
                v335[v338] = v339;
                v337 = v337 + 1;
            else
                break;
            end;
        end;
        return v335;
    end;
end;
return v0;