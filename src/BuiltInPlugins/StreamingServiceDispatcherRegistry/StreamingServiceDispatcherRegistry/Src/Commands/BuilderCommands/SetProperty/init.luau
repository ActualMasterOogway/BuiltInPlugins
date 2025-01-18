local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ScriptEditorService");
local v3 = v1.GetService("ChatbotUIService");
local v4 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v7 = require(l_script_FirstAncestor_0.Src.ContextCollectors.RecentInstancesContext);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixCurrentCameraPlacement);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoNormalizeBoundingBoxesForInsertedAssets);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConversationalAIScriptDiff);
local function _(v11, v12) --[[ Line: 19 ]] --[[ Name: applyColorToInstance ]]
    if v11:IsA("BasePart") then
        if typeof(v12) == "string" then
            v11.Color = Color3.fromHex(v12);
            return;
        else
            v11.Color = Color3.fromRGB(v12.r, v12.g, v12.b);
        end;
    end;
end;
local function v19(v14, v15) --[[ Line: 29 ]] --[[ Name: getParentInstanceFromId ]]
    -- upvalues: v6 (copy)
    if v14 then
        local v16 = v6.get(v14, v15);
        if v16 then
            return v16;
        else
            local l_status_0, l_result_0 = pcall(game.GetService, game, v14);
            if l_status_0 and l_result_0 then
                return l_result_0;
            elseif v14 == "workspace" then
                return workspace;
            elseif v14 == "StarterPlayerScripts" then
                return game:GetService("StarterPlayer"):FindFirstChildWhichIsA("StarterPlayerScripts");
            elseif v14 == "StarterCharacterScripts" then
                return game:GetService("StarterPlayer"):FindFirstChildWhichIsA("StarterCharacterScripts");
            end;
        end;
    end;
end;
return function(v20) --[[ Line: 50 ]] --[[ Name: setProperties ]]
    -- upvalues: v6 (copy), v9 (copy), v19 (copy), v4 (copy), v10 (copy), v3 (copy), v2 (copy), v8 (copy), v7 (copy)
    local l_requestId_0 = v20.requestId;
    local l_arguments_0 = v20.arguments;
    local l_direct_instance_0 = l_arguments_0.direct_instance;
    local v24 = l_arguments_0.newInstanceId or l_arguments_0.instanceId;
    local v25 = l_direct_instance_0 or v6.get(v24, l_requestId_0);
    if not v25 then
        error("Failed to find instance to set properties on");
    end;
    assert(v25, "Luau");
    if not l_direct_instance_0 then
        v6.StartRecordingActions(l_requestId_0);
    end;
    local v26 = l_arguments_0.properties or {};
    if v26.instanceName then
        v25.Name = v26.instanceName;
    end;
    if not v9() then
        local v27 = v19(v26.parentInstanceId, l_requestId_0);
        if v27 then
            v25.Parent = v27;
        end;
    end;
    if v26.size and v25:IsA("BasePart") then
        v25.Size = Vector3.new(v26.size.x, v26.size.y, v26.size.z);
    end;
    if v25:IsA("Model") then
        if v26.scale and v26.scale > 0 then
            v25:ScaleTo(v25:GetScale() * v26.scale);
        elseif v26.height and v26.height > 0.1 then
            local _, v29 = v4.getWorldBoundingBox(v25);
            if v29.Y > 0.1 then
                v25:ScaleTo(v26.height / v29.Y);
            end;
        elseif v26.size and v26.size.y > 0.1 then
            local _, v31 = v4.getWorldBoundingBox(v25);
            if v31.Y > 0.1 and v26.size.y > 0.1 then
                v25:ScaleTo(v26.size.y / v31.Y);
            end;
        end;
    end;
    if v26.source and (v25:IsA("Script") or v25:IsA("ModuleScript")) then
        if v10() and v3:GetSettings().ScriptDiffTreatment then
            v3:DisplayContent("UpdateScriptSource", {
                requestId = l_requestId_0, 
                instanceId = v24, 
                script = v25, 
                source = v26.source
            });
        else
            v2:UpdateSourceAsync(v25, function(_) --[[ Line: 112 ]]
                -- upvalues: v26 (copy)
                return v26.source;
            end);
        end;
    end;
    if v26.color then
        local l_color_0 = v26.color;
        if v25:IsA("BasePart") then
            if typeof(l_color_0) == "string" then
                v25.Color = Color3.fromHex(l_color_0);
            else
                v25.Color = Color3.fromRGB(l_color_0.r, l_color_0.g, l_color_0.b);
            end;
        end;
        for _, v35 in v25:GetDescendants() do
            local l_color_1 = v26.color;
            if v35:IsA("BasePart") then
                if typeof(l_color_1) == "string" then
                    v35.Color = Color3.fromHex(l_color_1);
                else
                    v35.Color = Color3.fromRGB(l_color_1.r, l_color_1.g, l_color_1.b);
                end;
            end;
        end;
    end;
    if v26.material and v25:IsA("BasePart") then
        v25.Material = Enum.Material[v26.material];
    end;
    if l_direct_instance_0 or v26.position or v26.elevation or v26.rotation or v26.referenceInstance then
        v4.getWorldBoundingBox(v25, function(v37) --[[ Line: 138 ]]
            -- upvalues: v26 (copy), v6 (ref), l_requestId_0 (copy), v4 (ref), v8 (ref), v9 (ref)
            local v38 = nil;
            v38 = if v26.position then CFrame.new(v26.position.x or 0, 0, v26.position.z or 0) else CFrame.new(0, 0, 0);
            local l_positionOrigin_0 = v26.positionOrigin;
            local v40 = v6.get(v26.referenceInstance, l_requestId_0);
            local v41, v42 = v4.getWorldBoundingBox(v40);
            local v43 = CFrame.new();
            local v44 = nil;
            local v45 = nil;
            if l_positionOrigin_0 == "absolute" then
                v43 = CFrame.new();
            elseif l_positionOrigin_0 == "relative" and v40 then
                v43 = CFrame.new(v41.Position);
            elseif l_positionOrigin_0 == "onTop" and v40 then
                v43 = CFrame.new(v41.Position);
                v44 = v40;
            elseif v8() and l_positionOrigin_0 == "currentCamera" then
                local v46, v47, _, _, _ = v4.getCurrentLookingCFrame();
                v43 = v46;
                v45 = v47;
            else
                local v51, v52 = v4.getRequestCFrame(l_requestId_0);
                v43 = v51;
                v45 = v52;
            end;
            local v53 = v43:ToWorldSpace(v38);
            local v54 = v4.getGroundLevelAt(v53.Position, v44, v42, v45);
            local v55 = -v53.Position.Y + v54 + v37:GetExtentsSize().Y / 2;
            if v26.elevation then
                v55 = v55 + v26.elevation;
            end;
            v53 = v53 + Vector3.new(0, v55, 0);
            if v26.rotation then
                v53 = CFrame.fromEulerAngles(0, math.rad(v26.rotation), 0) * v53.Rotation + v53.Position;
            end;
            if v9() and v26.offsetCFrame then
                v53 = v53 * v26.offsetCFrame;
            end;
            v37:PivotTo(v53);
        end);
    end;
    if v9() then
        local v56 = v19(v26.parentInstanceId, l_requestId_0);
        if v56 then
            v25.Parent = v56;
        end;
    end;
    if not l_direct_instance_0 then
        v6.EndRecordingActions(l_requestId_0);
    end;
    local v57 = v7.getInstanceTypes();
    v7.registerInstanceV2(v25, l_requestId_0, v57.Created);
end;