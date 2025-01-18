local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Edit_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCommunication).Edit;
local l_ContextServices_0 = v2.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createAnnotationBillboard);
local v8 = require(l_script_FirstAncestor_0.Src.Util.doSelectionRaycast);
local v9 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationEditingMode);
local v10 = require(l_script_FirstAncestor_0.Src.CoreGuiComponents.TargetHighlight);
local v11 = require(l_script_FirstAncestor_0.Src.Components.AddAnnotationPopup);
local v12 = require(l_script_FirstAncestor_0.Src.Components.AnnotationPopover);
local l_StudioService_0 = game:GetService("StudioService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
local function v19(v16, v17) --[[ Line: 26 ]] --[[ Name: draftAnnotationInstance ]]
    -- upvalues: l_StudioService_0 (copy)
    assert(v16 or v17, "Top-level annotations must be placed at a mouse position, and replies must have a parent.");
    local l_WorkspaceAnnotation_0 = Instance.new("WorkspaceAnnotation");
    l_WorkspaceAnnotation_0.AuthorId = l_StudioService_0:GetUserId();
    l_WorkspaceAnnotation_0:SetAttribute("IsDraft", true);
    l_WorkspaceAnnotation_0:SetAttribute("Parent", if v17 then v17:GetStringUniqueId() else nil);
    if v16 then
        l_WorkspaceAnnotation_0.Adornee = v16.Instance;
        l_WorkspaceAnnotation_0:SetAdorneeOffsetFromAbsolutePosition(v16.Position);
    end;
    return l_WorkspaceAnnotation_0;
end;
return function(_) --[[ Line: 44 ]] --[[ Name: AnnotationPlacementManager ]]
    -- upvalues: v1 (copy), l_AnnotationsService_0 (copy), l_Mouse_0 (copy), l_Plugin_0 (copy), v7 (copy), l_Edit_0 (copy), v9 (copy), v8 (copy), v19 (copy), v10 (copy), v11 (copy), v12 (copy)
    local _, v22 = v1.useState({});
    local v23, v24 = v1.useState(l_AnnotationsService_0.Mode);
    local v25, v26 = v1.useState(nil);
    local v27 = v1.useRef(nil);
    local v28 = l_Mouse_0:use():get();
    local v29 = l_Plugin_0:use():get();
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_AnnotationsService_0 (ref), v7 (ref), l_Edit_0 (ref), v29 (copy), v22 (copy), v24 (copy), v26 (copy), v28 (copy), v9 (ref), v8 (ref), v19 (ref), v27 (copy)
        local l_l_AnnotationsService_0_AnnotationThreads_0 = l_AnnotationsService_0:GetAnnotationThreads();
        for _, v32 in l_l_AnnotationsService_0_AnnotationThreads_0 do
            if not v32:GetAttribute("IsDraft") then
                if not v32.Resolved and v32.Adornee then
                    v7(v32);
                end;
                l_Edit_0.createAnnotation(v29, v32);
            end;
        end;
        v22(l_l_AnnotationsService_0_AnnotationThreads_0);
        local v33 = l_AnnotationsService_0:GetPropertyChangedSignal("Mode"):Connect(function() --[[ Line: 67 ]]
            -- upvalues: v24 (ref), l_AnnotationsService_0 (ref)
            v24(l_AnnotationsService_0.Mode);
        end);
        local v38 = l_AnnotationsService_0.AnnotationAdded:Connect(function(_, v35, v36) --[[ Line: 75 ]]
            -- upvalues: v7 (ref), l_Edit_0 (ref), v29 (ref), v22 (ref), l_AnnotationsService_0 (ref)
            local l_Parent_0 = v35.Parent;
            v35.Parent = nil;
            v35.Parent = l_Parent_0;
            if not v35.Resolved and v36 == "" then
                v7(v35);
            end;
            l_Edit_0.createAnnotation(v29, v35);
            v22(l_AnnotationsService_0:GetAnnotationThreads());
        end);
        local v39 = l_AnnotationsService_0.AnnotationDeleted:Connect(function() --[[ Line: 92 ]]
            -- upvalues: v22 (ref), l_AnnotationsService_0 (ref)
            v22(l_AnnotationsService_0:GetAnnotationThreads());
        end);
        local v43 = l_AnnotationsService_0.AnnotationResolved:Connect(function(_, v41, v42) --[[ Line: 97 ]]
            -- upvalues: v7 (ref), l_Edit_0 (ref), v29 (ref)
            if not v42 and v41.Adornee then
                v7(v41);
            end;
            l_Edit_0.syncStandaloneAnnotation(v29, v41, {
                Resolved = v42
            });
        end);
        local v44 = l_AnnotationsService_0:GetPropertyChangedSignal("Selected"):Connect(function() --[[ Line: 105 ]]
            -- upvalues: l_Edit_0 (ref), v29 (ref), l_AnnotationsService_0 (ref), v26 (ref)
            l_Edit_0.selectionChanged(v29, l_AnnotationsService_0.Selected);
            v26(l_AnnotationsService_0.Selected);
        end);
        local v47 = v28.Button1Down:Connect(function() --[[ Line: 110 ]]
            -- upvalues: l_AnnotationsService_0 (ref), v9 (ref), v8 (ref), v28 (ref), v19 (ref), v27 (ref), v7 (ref)
            if l_AnnotationsService_0.Mode == v9.PlacingNew then
                local v45 = v8(v28);
                if v45 then
                    local v46 = v19(v45, nil);
                    v27.current = v46;
                    v7(v46);
                    v28.Icon = "";
                    l_AnnotationsService_0.Mode = v9.WritingNew;
                end;
            end;
        end);
        local v48 = v29.Deactivation:Connect(function() --[[ Line: 125 ]]
            -- upvalues: v28 (ref)
            v28.Icon = "";
        end);
        return function() --[[ Line: 129 ]]
            -- upvalues: v33 (copy), v38 (copy), v39 (copy), v43 (copy), v44 (copy), v47 (copy), v48 (copy)
            v33:Disconnect();
            v38:Disconnect();
            v39:Disconnect();
            v43:Disconnect();
            v44:Disconnect();
            v47:Disconnect();
            v48:Disconnect();
        end;
    end, {});
    local function v51() --[[ Line: 140 ]]
        -- upvalues: v23 (copy), v9 (ref), v1 (ref), v10 (ref), v27 (copy), v11 (ref), v25 (copy), v12 (ref), v19 (ref), l_AnnotationsService_0 (ref)
        if v23 == v9.PlacingNew then
            return v1.createElement(v10);
        elseif v23 == v9.WritingNew then
            if v27.current then
                local v49 = workspace.CurrentCamera:WorldToScreenPoint(v27.current:GetAbsolutePosition());
                return v1.createElement(v11, {
                    Annotation = v27.current, 
                    Position = UDim2.fromOffset(v49.X, v49.Y)
                });
            else
                return nil;
            end;
        elseif v25 and v23 == v9.None then
            assert(v25, "A selected annotation must exist.");
            local v50 = nil;
            v50 = if v25.Adornee then workspace.CurrentCamera:WorldToScreenPoint(v25:GetAbsolutePosition()) else Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2);
            return (v1.createElement(v12, {
                Position = UDim2.fromOffset(v50.X, v50.Y), 
                Annotation = v25, 
                DraftAnnotationInstance = v19, 
                OnCancel = function() --[[ Line: 167 ]] --[[ Name: OnCancel ]]
                    -- upvalues: l_AnnotationsService_0 (ref), v25 (ref)
                    if l_AnnotationsService_0.Hovered == v25 then
                        l_AnnotationsService_0.Selected = nil;
                        return;
                    else
                        l_AnnotationsService_0.Selected = l_AnnotationsService_0.Hovered;
                        return;
                    end;
                end
            }));
        else
            return nil;
        end;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1
    }, {
        Element = v51()
    });
end;