local _ = game:GetService("AssetService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_MouseService_0 = game:GetService("MouseService");
local _ = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.Dash).join;
local v10 = require(script.Parent.VertexToolBase);
local l_Views_0 = l_Parent_0.Views;
local v12 = require(l_Views_0.RadiusUIView);
local l_Util_0 = l_Parent_0.Util;
local _ = require(l_Util_0.TransformPointsHelpers);
local v15 = require(l_Util_0.Constants);
local _ = require(l_Util_0.deepCopy);
local _ = require(l_Util_0.softSelectPoints);
local v18 = setmetatable({}, {
    __index = v10
});
v18.__index = v18;
v18.new = function() --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v18 (copy), v12 (copy), l_Workspace_0 (copy), l_CoreGui_0 (copy), v15 (copy), l_UserInputService_0 (copy), l_MouseService_0 (copy)
    local v19 = setmetatable(v10.new(), v18);
    local _ = v19.render;
    local _ = v19.shouldRender;
    local l_addContext_0 = v19.addContext;
    local l_cleanup_0 = v19.cleanup;
    local l_setSelected_0 = v19.setSelected;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = true;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = v12.new();
    local v34 = nil;
    local function v58(v35) --[[ Line: 60 ]] --[[ Name: findClosestVertexToMouse ]]
        -- upvalues: l_Workspace_0 (ref), l_CoreGui_0 (ref), v15 (ref), v19 (copy)
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v15.ControlPointsAdornmentsFolderName);
        local v38 = v19:getMannequin();
        local v39 = {};
        for _, v41 in v38:GetChildren() do
            if v41:IsA("MeshPart") then
                table.insert(v39, v41);
            end;
        end;
        local v42 = nil;
        local v43 = nil;
        local v44 = Vector2.new(v35.X, v35.Y);
        local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
        for _, v47 in l_l_CoreGui_0_FirstChild_0:GetChildren() do
            for _, v49 in v47:GetChildren() do
                local l_Position_1 = v49.Adornee.CFrame:ToWorldSpace(v49.CFrame).Position;
                local v51, v52 = l_CurrentCamera_0:WorldToScreenPoint(l_Position_1);
                local v53 = Vector2.new(v51.X, v51.Y);
                local l_Z_0 = v51.Z;
                local l_Magnitude_0 = (v44 - v53).Magnitude;
                if v52 and (v43 == nil or l_Magnitude_0 < v43) then
                    local v56 = RaycastParams.new();
                    v56.FilterDescendantsInstances = v39;
                    v56.FilterType = Enum.RaycastFilterType.Include;
                    local v57 = l_Workspace_0:Raycast(l_Position_0, l_Position_1 - l_Position_0, v56);
                    if v57 == nil or l_Z_0 - v57.Distance < 0.08 then
                        v42 = v49;
                        v43 = l_Magnitude_0;
                    end;
                end;
            end;
        end;
        return v42;
    end;
    local function v67(v59, v60, v61) --[[ Line: 107 ]] --[[ Name: getAllVerticesInRadius ]]
        -- upvalues: v19 (copy)
        local v62 = v19:getCurrentContext():getVertexData()[v59];
        local v63 = {};
        local v64 = v62[tonumber(v61)];
        for v65, v66 in v62 do
            if (v66 - v64).Magnitude < v60 then
                table.insert(v63, v65);
            end;
        end;
        return v63;
    end;
    local function v77(v68) --[[ Line: 121 ]] --[[ Name: getSelectedPoint ]]
        -- upvalues: v58 (copy), v19 (copy), v15 (ref), v67 (copy)
        local v69 = v58(v68);
        if v69 == nil then
            v19:setHoveredPoint();
            return {};
        else
            v19:setHoveredPoint(v69);
            local v70 = {};
            local v71 = math.max(v19:getRadius() - v15.FalloffCursorAdjustment * v19:getFalloff(), v15.MinimumBrushRadius);
            for _, v73 in (v67(v69.Parent.Name, v71, v69.Name)) do
                table.insert(v70, (setmetatable({
                    MeshName = v69.Parent.Name, 
                    Index = tonumber(v73), 
                    __eq = function(v74, v75) --[[ Line: 149 ]] --[[ Name: __eq ]]
                        local v76 = false;
                        if v74.MeshName == v75.MeshName then
                            v76 = v74.Index == v75.Index;
                        end;
                        return v76;
                    end
                }, nil)));
            end;
            return v70;
        end;
    end;
    local function _(v78, v79) --[[ Line: 158 ]] --[[ Name: calculateCircleRadius ]]
        -- upvalues: l_Workspace_0 (ref)
        local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
        local v81 = v79 * math.tan((math.rad(l_CurrentCamera_1.FieldOfView / 2)));
        local l_ViewportSize_0 = l_CurrentCamera_1.ViewportSize;
        return v78 * (l_ViewportSize_0.X + l_ViewportSize_0.Y) / (v81 * 2);
    end;
    local function v100() --[[ Line: 170 ]] --[[ Name: updateCursor ]]
        -- upvalues: v25 (ref), v19 (copy), v33 (ref), v12 (ref), l_Workspace_0 (ref), l_UserInputService_0 (ref), v28 (ref)
        if v25 then
            v19:setSelected();
        end;
        local v84 = v19:getRadius();
        if v84 == nil then
            return;
        else
            local v85 = v19:getFalloff();
            if v85 == nil then
                return;
            else
                if v33 == nil then
                    v33 = v12.new();
                end;
                local v86 = if v19:getHoveredPoint() ~= nil then v19:getHoveredPoint().Adornee.CFrame:ToWorldSpace(v19:getHoveredPoint().CFrame).Position else Vector3.new();
                local _ = function() --[[ Line: 195 ]]
                    -- upvalues: v19 (ref), l_Workspace_0 (ref), v86 (copy)
                    if v19:getHoveredPoint() == nil then
                        return Vector2.new(0, 0);
                    else
                        local v87, _ = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v86);
                        return Vector2.new(v87.X, v87.Y);
                    end;
                end;
                local v90;
                if l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    if v19:getHoveredPoint() == nil then
                        v90 = Vector2.new(0, 0);
                    else
                        local v91, _ = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v86);
                        v90 = Vector2.new(v91.X, v91.Y);
                    end;
                else
                    v90 = l_UserInputService_0:GetMouseLocation();
                end;
                local l_Magnitude_1 = (l_Workspace_0.CurrentCamera.CFrame.Position - v86).Magnitude;
                local l_CurrentCamera_2 = l_Workspace_0.CurrentCamera;
                local v95 = l_Magnitude_1 * math.tan((math.rad(l_CurrentCamera_2.FieldOfView / 2)));
                local l_ViewportSize_1 = l_CurrentCamera_2.ViewportSize;
                local v97 = v84 * (l_ViewportSize_1.X + l_ViewportSize_1.Y) / (v95 * 2);
                local l_CurrentCamera_3 = l_Workspace_0.CurrentCamera;
                l_ViewportSize_1 = l_Magnitude_1 * math.tan((math.rad(l_CurrentCamera_3.FieldOfView / 2)));
                local l_ViewportSize_2 = l_CurrentCamera_3.ViewportSize;
                l_CurrentCamera_2 = v85 * (l_ViewportSize_2.X + l_ViewportSize_2.Y) / (l_ViewportSize_1 * 2);
                v33:render({
                    CurrRadius = v97, 
                    CurrFalloff = l_CurrentCamera_2, 
                    Mouse = v90, 
                    Shown = v28 and v19:getHoveredPoint() ~= nil
                });
                return;
            end;
        end;
    end;
    local function v103(v101, _) --[[ Line: 220 ]] --[[ Name: InputChanged ]]
        -- upvalues: v100 (copy)
        if v101.UserInputType == Enum.UserInputType.MouseMovement then
            v100();
        end;
    end;
    local function v108(v104, _) --[[ Line: 226 ]] --[[ Name: InputBegan ]]
        -- upvalues: v100 (copy), v19 (copy), l_Workspace_0 (ref)
        if v104.UserInputType == Enum.UserInputType.MouseButton1 then
            v100();
            local v106 = v19:getMouse();
            local v107 = l_Workspace_0.CurrentCamera:ScreenPointToRay(v106.X, v106.Y);
            v19:setMouseStartPosition(v107);
        end;
    end;
    local function v111(v109, _) --[[ Line: 237 ]] --[[ Name: InputEnded ]]
        -- upvalues: v100 (copy)
        if v109.UserInputType == Enum.UserInputType.MouseButton1 then
            v100();
        end;
    end;
    v19.addContext = function(v112, v113) --[[ Line: 244 ]] --[[ Name: addContext ]]
        -- upvalues: v26 (ref), l_UserInputService_0 (ref), v103 (copy), v27 (ref), l_Workspace_0 (ref), v100 (copy), v29 (ref), l_MouseService_0 (ref), v19 (copy), v28 (ref), v30 (ref), l_setSelected_0 (copy), v31 (ref), v108 (copy), v32 (ref), v111 (copy), l_addContext_0 (copy)
        if not v113 then
            error("Could not add context: Context was nil.");
            return;
        else
            if not v26 then
                v26 = l_UserInputService_0.InputChanged:Connect(v103);
            end;
            if v27 == nil then
                v27 = l_Workspace_0.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 255 ]]
                    -- upvalues: v100 (ref)
                    v100();
                end);
            end;
            if not v29 then
                v29 = l_MouseService_0.MouseEnterStudioViewport:Connect(function() --[[ Line: 261 ]]
                    -- upvalues: v19 (ref), v28 (ref), v100 (ref)
                    v19:setHovered(true);
                    v28 = true;
                    v100();
                end);
            end;
            if not v30 then
                v30 = l_MouseService_0.MouseLeaveStudioViewport:Connect(function() --[[ Line: 268 ]]
                    -- upvalues: v19 (ref), v28 (ref), l_setSelected_0 (ref), v112 (copy), v100 (ref)
                    v19:setHovered(false);
                    v28 = false;
                    v19:setHoveredPoint(nil);
                    l_setSelected_0(v112, {});
                    v100();
                end);
            end;
            if not v31 then
                v31 = l_UserInputService_0.InputBegan:Connect(v108);
            end;
            if not v32 then
                v32 = l_UserInputService_0.InputEnded:Connect(v111);
            end;
            local v114 = v19:getDedupedPositionsFromContext(v113);
            l_addContext_0(v112, v113, v114);
            return;
        end;
    end;
    v19.getVertexWeights = function(_) --[[ Line: 288 ]] --[[ Name: getVertexWeights ]]
        -- upvalues: v19 (copy)
        return v19:_getSelectedControlWeights();
    end;
    v19.setSelected = function(v116, _) --[[ Line: 292 ]] --[[ Name: setSelected ]]
        -- upvalues: v19 (copy), v77 (copy), v34 (ref), l_setSelected_0 (copy)
        local v118 = v19:getMouse();
        local v119 = v77(v118);
        if v19:getHoveredPoint() == v34 then
            return;
        else
            v34 = v19:getHoveredPoint();
            l_setSelected_0(v116, v119);
            return;
        end;
    end;
    v19.setHovered = function(_, v121) --[[ Line: 303 ]] --[[ Name: setHovered ]]
        -- upvalues: v25 (ref), l_UserInputService_0 (ref)
        if v121 == true or v121 == false then
            v25 = v121;
            return;
        else
            v25 = not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
            return;
        end;
    end;
    v19.cleanup = function(v122) --[[ Line: 311 ]] --[[ Name: cleanup ]]
        -- upvalues: l_cleanup_0 (copy), v33 (ref), v26 (ref), v27 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref)
        l_cleanup_0();
        if v122.Heartbeat then
            v122.Heartbeat:Disconnect();
        end;
        if v33 then
            v33:cleanup();
            v33 = nil;
        end;
        if v26 then
            v26:Disconnect();
            v26 = nil;
        end;
        if v27 ~= nil then
            v27:Disconnect();
            v27 = nil;
        end;
        if v29 ~= nil then
            v29:Disconnect();
            v29 = nil;
        end;
        if v30 ~= nil then
            v30:Disconnect();
            v30 = nil;
        end;
        if v31 ~= nil then
            v31:Disconnect();
            v31 = nil;
        end;
        if v32 ~= nil then
            v32:Disconnect();
            v32 = nil;
        end;
    end;
    return v19;
end;
return v18;