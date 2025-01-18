local v0 = {};
v0.__index = v0;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v3 = v2.GetService("ChangeHistoryService");
local v4 = v2.GetService("MemStorageService");
local v5 = v2.GetService("StreamingService");
local v6 = v2.GetService("ChatbotUIService");
local v7 = v2.GetService("TweenService");
local v8 = v2.GetService("HttpService");
local v9 = v2.GetService("Selection");
local v10 = v2.GetService("ConversationalAIAcceptanceService");
local v11 = require(l_script_FirstAncestor_0.Packages.Dash);
local v12 = require(l_script_FirstAncestor_0.SharedPluginConstants);
local v13 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v16 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v17 = require(l_script_FirstAncestor_0.Src.Commands.DisplayError);
local v18 = require(l_script_FirstAncestor_0.Src.ContextCollectors.RecentInstancesContext);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFirstVariationFix);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAI_ConditionalDropdown);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixStreamCreationTiming);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixCurrentCameraPlacement);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixEmptyBubbleBug);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoNormalizeBoundingBoxesForInsertedAssets);
local v25 = false;
handleCachedPacketsForStream = function(v26, v27, v28) --[[ Line: 38 ]] --[[ Name: handleCachedPacketsForStream ]]
    -- upvalues: v21 (copy), v25 (ref), v23 (copy)
    local v29 = require(script.Parent.Parent.Cache.StreamCache);
    if v27 == v29.activeStreamId() then
        if v21() then
            if v25 and (v28 or 1) == 1 then
                return;
            else
                v25 = true;
            end;
        end;
        local v30 = v29.packetExists(v26, v27);
        while v30 do
            local v31 = v29.handleEarliestPacketForStream(v26, v27);
            v30 = v29.packetExists(v26, v27);
            if v31.isFinal == true then
                local v32 = v29.activeStreamEnded(v26, v27);
                if v32 then
                    if v21() then
                        handleCachedPacketsForStream(v26, v32, (v28 or 1) + 1);
                        break;
                    else
                        handleCachedPacketsForStream(v26, v32);
                    end;
                end;
            end;
        end;
        if v23() and v29.isRequestEnded(v26) and v29.activeStreamId() == v27 then
            local v33 = v29.activeStreamEnded(v26, v27);
            if v33 then
                handleCachedPacketsForStream(v26, v33, (v28 or 1) + 1);
                return;
            end;
        end;
        if v21() then
            v25 = false;
        end;
    end;
end;
local function v47(v34) --[[ Line: 85 ]] --[[ Name: zoomToInstances ]]
    -- upvalues: v13 (copy), v7 (copy)
    local v35, v36 = v13.getPositionAndSize(v34);
    if v35 then
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v38 = l_CurrentCamera_0.ViewportSize * 0.5;
        local v39 = l_CurrentCamera_0:ViewportPointToRay(v38.X, v38.Y);
        local v40 = l_CurrentCamera_0:ViewportPointToRay(v38.X, 0);
        local v41 = l_CurrentCamera_0:ViewportPointToRay(0, v38.Y);
        local v42 = math.min(math.acos((v39.Direction.Unit:Dot(v40.Direction.Unit))), (math.acos((v39.Direction.Unit:Dot(v41.Direction.Unit)))));
        local v43 = math.max(0.5 * (math.max(v36.X, v36.Y, v36.Z) * 1) / math.tan(v42 / 2), 20);
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local v45 = v35 - l_CFrame_0.LookVector * v43;
        local v46 = CFrame.new(v45) * l_CFrame_0.Rotation;
        v7:Create(l_CurrentCamera_0, TweenInfo.new(0.22, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            CFrame = v46, 
            Focus = CFrame.new(v35)
        }):Play();
    end;
end;
v0.getActionInstance = function(v48, v49, v50) --[[ Line: 116 ]] --[[ Name: getActionInstance ]]
    -- upvalues: v15 (copy)
    local _, _, v53 = string.find(v49, "studio://instance/(.+)");
    if v53 and v15.activeDraftGuids and v15.activeDraftGuids[v53] then
        return {};
    else
        if not v53 then
            local _, _, v56 = string.find(v49, "studio://instanceid/(.+)");
            if v56 then
                local v57 = v15.get(v56);
                if not v57 then
                    local _, _, v60 = string.find(v56, "Instance_(.+)");
                    if v60 then
                        v53 = v15.g2g[v60] or v60;
                        v57 = v15.guid2instance[v53];
                    end;
                end;
                if v57 then
                    return {
                        v57
                    }, v53, {
                        v53
                    };
                end;
            end;
        end;
        return v48:getActionInstanceFromGuid(v53, v50);
    end;
end;
v0.getActionInstanceFromGuid = function(v61, v62, v63) --[[ Line: 141 ]] --[[ Name: getActionInstanceFromGuid ]]
    -- upvalues: v15 (copy), v20 (copy)
    if not v62 then
        return {};
    else
        local v64 = v15.guidToInfo[v62];
        if not v64 then
            return {};
        else
            local v65 = {
                v62
            };
            local v66 = {
                v64.instance
            };
            local l_chatBulletGroupId_0 = v64.chatBulletGroupId;
            if l_chatBulletGroupId_0 and v15.chatBulletMap[l_chatBulletGroupId_0] and (v20() or #v15.chatBulletMap[l_chatBulletGroupId_0] > 0) then
                table.clear(v66);
                table.clear(v65);
                for _, v69 in v15.chatBulletMap[l_chatBulletGroupId_0] do
                    local v70 = v15.guidToInfo[v69];
                    if v70 and if v20() then v70.instance.Parent ~= nil else v70.instance:IsDescendantOf(workspace) then
                        table.insert(v66, v70.instance);
                        table.insert(v65, v69);
                    end;
                end;
            end;
            if #v66 == 0 then
                return {};
            else
                if not v61.actionClickCursor or v62 ~= v61.lastGroupSelected then
                    v61.actionClickCursor = 0;
                elseif v63 then
                    v61.actionClickCursor = (v61.actionClickCursor + v63) % (#v66 + 1);
                end;
                if v61.actionClickCursor ~= 0 then
                    return {
                        v66[v61.actionClickCursor]
                    }, v62, {
                        v65[v61.actionClickCursor]
                    };
                else
                    return v66, v62, v65;
                end;
            end;
        end;
    end;
end;
v0.onShiftAssetToId = function(v71, v72, v73) --[[ Line: 189 ]] --[[ Name: onShiftAssetToId ]]
    -- upvalues: v19 (copy), v15 (copy)
    if v19() then
        v71:onShiftAssetVariant(v72, nil, v73);
        return;
    else
        local v74 = tostring(v73);
        local v75, v76, v77 = v71:getActionInstance(v72);
        if #v75 > 0 then
            local v78 = v15.altDataMap[v76];
            if #v77 == 1 then
                v78 = v15.altDataMap[v77[1]];
            end;
            if v78.altAssets and #v78.altAssets > 0 then
                local v79 = -1;
                local v80 = -1;
                for v81, v82 in v78.altAssets do
                    if v82 == v78.assetId then
                        v79 = v81;
                    elseif v82 == v74 then
                        v80 = v81;
                    end;
                end;
                if v79 == -1 then
                    table.insert(v78.altAssets, v78.assetId);
                    v79 = #v78.altAssets;
                end;
                if v79 ~= -1 and v80 ~= -1 then
                    v71:onShiftAssetVariant(v72, v80 - v79);
                end;
            end;
        end;
        return;
    end;
end;
v0.onShiftAssetVariant = function(v83, v84, v85, v86) --[[ Line: 223 ]] --[[ Name: onShiftAssetVariant ]]
    -- upvalues: v19 (copy), v15 (copy), v13 (copy), v3 (copy), v22 (copy), v24 (copy), v5 (copy), v9 (copy), v10 (copy), v47 (copy)
    local v87, v88, v89 = v83:getActionInstance(v84);
    if #v87 > 0 then
        if not v19() then
            v86 = nil;
        end;
        if not v19() or not v86 and v85 then
            local v90 = v15.altDataMap[v88];
            if #v89 == 1 then
                v90 = v15.altDataMap[v89[1]];
            end;
            if v90.altAssets and #v90.altAssets > 0 then
                for v91, v92 in v90.altAssets do
                    if v92 == v90.assetId then
                        v86 = v90.altAssets[(v91 - 1 + v85) % #v90.altAssets + 1];
                        break;
                    end;
                end;
                if not v86 then
                    table.insert(v90.altAssets, v90.assetId);
                    v86 = v90.altAssets[1];
                end;
            end;
        end;
        if not v86 then
            return;
        else
            if not v13.isAssetCached(v86) then
                v13.loadAssetAsync(v86);
            end;
            local v93 = 0;
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v95 = v3:TryBeginRecording("Assistant Variation Swap");
            do
                local l_v93_0 = v93;
                for v97, v98 in v87 do
                    local v99 = v89[v97];
                    local v100 = v15.altDataMap[v99];
                    if v100 then
                        l_v93_0 = l_v93_0 + 1;
                        task.defer(function() --[[ Line: 260 ]]
                            -- upvalues: v100 (copy), v13 (ref), v98 (copy), v22 (ref), v24 (ref), v99 (copy), v86 (ref), v83 (copy), v5 (ref), v15 (ref), v9 (ref), v10 (ref), l_v93_0 (ref), l_BindableEvent_0 (copy)
                            local l_request_0 = v100.request;
                            local l_arguments_0 = l_request_0.arguments;
                            if l_arguments_0 then
                                local l_properties_0 = l_arguments_0.properties;
                                if not l_properties_0 then
                                    l_properties_0 = {};
                                    l_arguments_0.properties = l_properties_0;
                                end;
                                local v104 = v13.getWorldBoundingBox(v98);
                                if v22() then
                                    l_properties_0.positionOrigin = "absolute";
                                    l_properties_0.position = {
                                        x = v104.Position.X, 
                                        z = v104.Position.Z
                                    };
                                    if v24() then
                                        local l_v98_Pivot_0 = v98:GetPivot();
                                        l_properties_0.offsetCFrame = l_v98_Pivot_0 - l_v98_Pivot_0.Position;
                                    end;
                                else
                                    local v106 = v13.getRequestCFrame(l_request_0.requestId):PointToObjectSpace(v104.Position);
                                    l_properties_0.position = {
                                        x = v106.X, 
                                        z = v106.Z
                                    };
                                end;
                                l_arguments_0.altDataId = v99;
                            end;
                            v100.assetId = v86;
                            v83.deferedSelection = true;
                            if not v13.isAssetCached(v86) then
                                v13.loadAssetAsync(v86);
                            end;
                            v5:ExecuteCommandAsync(l_request_0.requestId, "InsertAsset", l_request_0.arguments);
                            local l_instance_0 = v15.guidToInfo[v99].instance;
                            local v108 = v9:Get();
                            local v109 = false;
                            for v110 = 1, #v108 do
                                if v108[v110] == v98 then
                                    v109 = true;
                                    v108[v110] = l_instance_0;
                                end;
                            end;
                            if v109 then
                                v9:Set(v108);
                            end;
                            local l_v98_Attribute_0 = v98:GetAttribute("AssetId");
                            local l_l_instance_0_Attribute_0 = l_instance_0:GetAttribute("AssetId");
                            v10:AlternativeAssetSelected(l_request_0.requestId, l_v98_Attribute_0, l_l_instance_0_Attribute_0);
                            v98.Parent = nil;
                            v83.deferedSelection = false;
                            l_v93_0 = l_v93_0 - 1;
                            l_BindableEvent_0:Fire();
                        end);
                    end;
                end;
                if l_v93_0 > 0 then
                    task.spawn(function() --[[ Line: 324 ]]
                        -- upvalues: l_v93_0 (ref), l_BindableEvent_0 (copy), v95 (copy), v3 (ref), v89 (copy), v15 (ref), v47 (ref)
                        while l_v93_0 > 0 do
                            l_BindableEvent_0.Event:Wait();
                        end;
                        l_BindableEvent_0:Destroy();
                        if v95 then
                            v3:FinishRecording(v95, Enum.FinishRecordingOperation.Commit);
                        end;
                        local v113 = {};
                        for _, v115 in v89 do
                            table.insert(v113, v15.guidToInfo[v115].instance);
                        end;
                        v47(v113);
                    end);
                end;
            end;
        end;
    end;
end;
local function _(v116) --[[ Line: 342 ]] --[[ Name: openToolboxAndSearchForString ]]
    -- upvalues: v4 (copy), v12 (copy)
    v4:Fire(v12.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, v116);
end;
local function v126(v118) --[[ Line: 346 ]] --[[ Name: getSelectedBaseParts ]]
    local v119 = {};
    local function v123(v120) --[[ Line: 349 ]] --[[ Name: addOption ]]
        -- upvalues: v119 (copy)
        if v120:IsA("BasePart") then
            table.insert(v119, v120);
        end;
        for _, v122 in v120:GetDescendants() do
            if v122:IsA("BasePart") then
                table.insert(v119, v122);
            end;
        end;
    end;
    for _, v125 in v118 do
        v123(v125);
    end;
    return v119;
end;
local function v135(v127) --[[ Line: 368 ]] --[[ Name: applyMaterialVariant ]]
    -- upvalues: v0 (copy), v9 (copy), v126 (copy), v3 (copy)
    local v128 = v0:getActionInstanceFromGuid(v127);
    local v129 = v128[1];
    if not v129 or not v129:IsA("MaterialVariant") then
        return;
    else
        local v130 = v9:Get();
        local v131 = v126(v130);
        if v130[1] == v129 then
            v9:Set({});
            return;
        elseif #v131 == 0 then
            v9:Set(v128);
            return;
        else
            local v132 = v3:TryBeginRecording("AssistantSetMaterials");
            for _, v134 in v131 do
                v134.Material = v129.BaseMaterial;
                v134.MaterialVariant = v129.Name;
            end;
            if v132 then
                v3:FinishRecording(v132, Enum.FinishRecordingOperation.Commit);
            end;
            return;
        end;
    end;
end;
v0.onAction = function(v136, v137) --[[ Line: 399 ]] --[[ Name: onAction ]]
    -- upvalues: v9 (copy), v11 (copy), v47 (copy), v135 (copy), v6 (copy)
    local v138, v139 = v136:getActionInstance(v137, 1);
    if #v138 > 0 then
        v136.lastSelectedInstances = v138;
        v136.lastGroupSelected = v139;
        v9:Set(v138);
        if not v136._selectionListener then
            v136._selectionListener = v9.SelectionChanged:Connect(function() --[[ Line: 406 ]]
                -- upvalues: v136 (copy), v9 (ref), v138 (copy), v11 (ref)
                if v136.deferedSelection then
                    return;
                else
                    v136.deferedSelection = true;
                    task.defer(function() --[[ Line: 411 ]]
                        -- upvalues: v136 (ref), v9 (ref), v138 (ref), v11 (ref)
                        v136.deferedSelection = false;
                        local v140 = v9:Get();
                        if #v140 == 0 and #v136.lastSelectedInstances == 1 and not v136.lastSelectedInstances[1]:IsDescendantOf(workspace) then
                            v136.actionClickCursor = (v136.actionClickCursor - 1) % (#v138 + 1);
                            return;
                        else
                            if not v11.shallowEqual(v140, v136.lastSelectedInstances) then
                                v136._selectionListener:Disconnect();
                                v136._selectionListener = nil;
                                table.clear(v136.lastSelectedInstances);
                                v136.lastSelectedInstances = nil;
                                v136.actionClickCursor = nil;
                            end;
                            return;
                        end;
                    end);
                    return;
                end;
            end);
        end;
        v47(v138);
        return;
    elseif string.match(v137, "^studio://apply_material_variant/.+") then
        local v141 = string.match(v137, "^studio://apply_material_variant/(.+)");
        if not v141 then
            return;
        else
            v135(v141);
            return;
        end;
    else
        if string.match(v137, "^https://") then
            v6:DisplayContent("ExternalURL", {
                url = v137
            });
        end;
        return;
    end;
end;
v0.getPluginInfo = function(v142, v143, v144) --[[ Line: 445 ]] --[[ Name: getPluginInfo ]]
    -- upvalues: v15 (copy), v13 (copy), v16 (copy)
    if v143 == "attribution" then
        local v145, v146, v147 = v142:getActionInstance(v144);
        if #v145 > 0 then
            local v148 = v15.altDataMap[v146];
            if #v147 == 1 then
                v148 = v15.altDataMap[v147[1]];
            end;
            local v149 = v13.getAssetAttributionInfo(v148 and v148.assetId);
            if v149 then
                local l_Name_0 = v149.Name;
                local v151 = v149.Creator and v149.Creator.Name;
                if l_Name_0 and v151 then
                    return v16:getText("Message", "AuthoredBy", {
                        asset = l_Name_0, 
                        creator = v151
                    });
                end;
            end;
        end;
    elseif v143 == "assetId" then
        local v152, v153, v154 = v142:getActionInstance(v144);
        if #v152 > 0 then
            local v155 = v15.altDataMap[v153];
            if #v154 == 1 then
                v155 = v15.altDataMap[v154[1]];
            end;
            if v155 and v155.assetId then
                return v155.assetId;
            end;
        end;
    end;
    return nil;
end;
local function v190(v156, v157, v158, v159) --[[ Line: 477 ]] --[[ Name: setUpConnections ]]
    -- upvalues: v5 (copy), v8 (copy), v6 (copy), v18 (copy), v4 (copy), v12 (copy), v15 (copy), v17 (copy), v13 (copy)
    v157 = v157 or v5;
    v159 = v159 or v8;
    v158 = v158 or v6;
    local v160 = require(script.Parent.Parent.Cache.StreamCache);
    v156._streamConn = v157.Stream:Connect(function(v161, v162, v163) --[[ Line: 486 ]]
        -- upvalues: v159 (ref), v160 (copy)
        local v164 = v159:JSONDecode(v163);
        local v165 = v164.streamId or v164.arguments and v164.arguments.syncStreamId;
        v164.command = v162;
        v160.storeStreamPacket(v161, v165, v164);
        handleCachedPacketsForStream(v161, v165);
    end);
    v156._requestStartedConn = v157.RequestStarted:Connect(function(v166) --[[ Line: 498 ]]
        -- upvalues: v160 (copy)
        v160.newRequest(v166);
    end);
    v156._requestEndedConn = v157.RequestEnded:Connect(function(v167) --[[ Line: 502 ]]
        -- upvalues: v160 (copy)
        v160.requestEnded(v167);
    end);
    v156._conversationClearedConn = v157.ConversationCleared:Connect(function() --[[ Line: 506 ]]
        -- upvalues: v18 (ref)
        v18.clear();
    end);
    v156._commandsFinished = v157.SequentialCommandsFinished:Connect(function(v168) --[[ Line: 510 ]]
        -- upvalues: v158 (ref)
        v158:DisplayContent("EndRequest", {
            requestId = v168
        });
    end);
    v156._findVariations = v158.FindVariationsSignal:Connect(function(v169) --[[ Line: 514 ]]
        -- upvalues: v156 (copy), v4 (ref), v12 (ref)
        local v170 = v156:getActionInstance(v169);
        if #v170 > 0 then
            local l_Name_1 = v170[1].Name;
            v4:Fire(v12.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, l_Name_1);
            return;
        else
            print("Find Variations called:", v169);
            return;
        end;
    end);
    v156._setMaterialSettings = v158.SetMaterialSettingsSignal:Connect(function(v172, v173, v174) --[[ Line: 524 ]]
        -- upvalues: v156 (copy)
        local v175 = v156:getActionInstanceFromGuid(v172);
        if #v175 > 0 then
            local v176 = v175[1];
            v176.StudsPerTile = v173;
            v176.MaterialPattern = if v174 then Enum.MaterialPattern.Organic else Enum.MaterialPattern.Regular;
        end;
    end);
    v156._onActionConnection = v158.ActionActivatedSignal:Connect(function(v177) --[[ Line: 536 ]]
        -- upvalues: v156 (copy)
        v156:onAction(v177);
    end);
    v156._onShiftAssetVariation = v158.ShiftVariationSignal:Connect(function(...) --[[ Line: 540 ]]
        -- upvalues: v156 (copy)
        v156:onShiftAssetVariant(...);
    end);
    v156._onShiftAssetToId = v158.ShiftToAssetIdSignal:Connect(function(...) --[[ Line: 544 ]]
        -- upvalues: v156 (copy)
        v156:onShiftAssetToId(...);
    end);
    v156._requestStartedConnection = v157.RequestStarted:Connect(function(v178, v179) --[[ Line: 549 ]]
        -- upvalues: v15 (ref)
        table.clear(v15.assetCacheMap);
        v15.SetRequestMetadata(v178, "Query", v179);
    end);
    v156._requestErrorConnection = v157.RequestError:Connect(function(v180, v181, v182) --[[ Line: 556 ]]
        -- upvalues: v17 (ref), v15 (ref)
        local v183 = {
            requestId = v180, 
            arguments = {
                errorId = "StreamingServiceError", 
                errorType = v181, 
                errorMessage = v182
            }
        };
        v17(v183);
        v15.SetRequestMetadata(v180, "ErrorMessage", v182);
    end);
    v156._requestEndedConnection = v157.RequestEnded:Connect(function(v184) --[[ Line: 570 ]]
        -- upvalues: v15 (ref)
        local v185 = v15.GetRequestMetadata(v184, "Time_Start");
        local v186 = os.clock();
        v15.SetRequestMetadata(v184, "Time_End", v186);
        v15.SetRequestMetadata(v184, "Time_Run", v186 - v185);
    end);
    v156._sequentialCommandsFinishedConnection = v157.SequentialCommandsFinished:Connect(function(v187) --[[ Line: 578 ]]
        -- upvalues: v15 (ref), v13 (ref)
        for _, v189 in v15.assetCacheMap do
            if v189 and v189.Parent then
                v189:Destroy();
            end;
        end;
        table.clear(v15.assetCacheMap);
        v13.endConstraintVisualization(v187);
        v13.disableDraftMode(v187);
    end);
    v157:SetPluginInfoCallback(function(...) --[[ Line: 590 ]]
        -- upvalues: v156 (copy)
        return v156:getPluginInfo(...);
    end);
end;
v0.destroy = function(v191) --[[ Line: 595 ]] --[[ Name: destroy ]]
    -- upvalues: v5 (copy)
    if v191._streamConn then
        v191._streamConn:Disconnect();
        v191._streamConn = nil;
    end;
    if v191._requestStartedConn then
        v191._requestStartedConn:Disconnect();
        v191._requestStartedConn = nil;
    end;
    if v191._requestEndedConn then
        v191._requestEndedConn:Disconnect();
        v191._requestEndedConn = nil;
    end;
    if v191._conversationClearedConn then
        v191._conversationClearedConn:Disconnect();
        v191._conversationClearedConn = nil;
    end;
    if v191._commandsFinished then
        v191._commandsFinished:Disconnect();
        v191._commandsFinished = nil;
    end;
    if v191._findVariations then
        v191._findVariations:Disconnect();
        v191._findVariations = nil;
    end;
    if v191._setMaterialSettings then
        v191._setMaterialSettings:Disconnect();
        v191._setMaterialSettings = nil;
    end;
    if v191._onActionConnection then
        v191._onActionConnection:Disconnect();
        v191._onActionConnection = nil;
    end;
    if v191._onShiftAssetVariation then
        v191._onShiftAssetVariation:Disconnect();
        v191._onShiftAssetVariation = nil;
    end;
    if v191._onShiftAssetToId then
        v191._onShiftAssetToId:Disconnect();
        v191._onShiftAssetToId = nil;
    end;
    if v191._selectionListener then
        v191._selectionListener:Disconnect();
        v191._selectionListener = nil;
    end;
    if v191._requestStartedConnection then
        v191._requestStartedConnection:Disconnect();
        v191._requestStartedConnection = nil;
    end;
    if v191._requestErrorConnection then
        v191._requestErrorConnection:Disconnect();
        v191._requestErrorConnection = nil;
    end;
    if v191._requestEndedConnection then
        v191._requestEndedConnection:Disconnect();
        v191._requestEndedConnection = nil;
    end;
    if v191._sequentialCommandsFinishedConnection then
        v191._sequentialCommandsFinishedConnection:Disconnect();
        v191._sequentialCommandsFinishedConnection = nil;
    end;
    v5:SetPluginInfoCallback();
end;
v0.new = function(v192, v193, v194) --[[ Line: 669 ]] --[[ Name: new ]]
    -- upvalues: v190 (copy), v0 (copy)
    local v195 = {};
    v190(v195, v192, v193, v194);
    setmetatable(v195, v0);
    return v195;
end;
return v0;