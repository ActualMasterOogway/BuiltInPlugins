local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationEditingMode);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.zoomToAnnotation);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
return {
    registerStandaloneCallbacks = function(v5) --[[ Line: 14 ]] --[[ Name: registerStandaloneCallbacks ]]
        -- upvalues: l_AnnotationsService_0 (copy)
        if v5:GetAttribute("DidInitStandalone") then
            return;
        else
            v5:SetAttribute("DidInitStandalone", true);
            local v9 = v5:OnInvoke("CreateAnnotation", function(v6) --[[ Line: 21 ]]
                -- upvalues: l_AnnotationsService_0 (ref)
                local l_l_AnnotationsService_0_0 = l_AnnotationsService_0;
                if v6.ParentId then
                    l_l_AnnotationsService_0_0 = l_AnnotationsService_0:FindFirstChild(v6.ParentId, true);
                    assert(l_l_AnnotationsService_0_0, (("Parent annotation %* not found."):format(v6.ParentId)));
                end;
                local l_Annotation_0 = Instance.new("Annotation");
                l_Annotation_0.Parent = l_l_AnnotationsService_0_0;
                l_Annotation_0.Name = v6.UniqueId;
                l_Annotation_0.AuthorId = v6.AuthorId;
                l_Annotation_0.CreationTimeUnix = v6.CreationTimeUnix;
                l_Annotation_0.LastModifiedTimeUnix = v6.LastModifiedTimeUnix;
                l_Annotation_0.Contents = v6.Contents;
                l_Annotation_0.Resolved = v6.Resolved;
                if v6.HeaderInfo then
                    l_Annotation_0:SetAttribute("HeaderText", v6.HeaderInfo.HeaderText);
                    l_Annotation_0:SetAttribute("AdorneeClass", v6.HeaderInfo.AdorneeClass);
                end;
                l_Annotation_0.ReplyCount = v6.ReplyCount;
            end);
            local v13 = v5:OnInvoke("UpdateAnnotation", function(v10, v11) --[[ Line: 43 ]]
                -- upvalues: l_AnnotationsService_0 (ref)
                local l_l_AnnotationsService_0_FirstChild_0 = l_AnnotationsService_0:FindFirstChild(v10, true);
                if not l_l_AnnotationsService_0_FirstChild_0 then
                    return;
                else
                    if v11.Resolved ~= nil then
                        l_l_AnnotationsService_0_FirstChild_0.Resolved = v11.Resolved;
                    end;
                    if v11.HeaderInfo ~= nil then
                        l_l_AnnotationsService_0_FirstChild_0:SetAttribute("HeaderText", v11.HeaderInfo.HeaderText);
                        l_l_AnnotationsService_0_FirstChild_0:SetAttribute("AdorneeClass", v11.HeaderInfo.AdorneeClass);
                    end;
                    if v11.Contents ~= nil then
                        l_l_AnnotationsService_0_FirstChild_0.Contents = v11.Contents;
                    end;
                    if v11.ReplyCount ~= nil then
                        l_l_AnnotationsService_0_FirstChild_0.ReplyCount = v11.ReplyCount;
                    end;
                    return;
                end;
            end);
            local v16 = v5:OnInvoke("AnnotationDeleted", function(v14) --[[ Line: 64 ]]
                -- upvalues: l_AnnotationsService_0 (ref)
                local l_l_AnnotationsService_0_FirstChild_1 = l_AnnotationsService_0:FindFirstChild(v14, true);
                if not l_l_AnnotationsService_0_FirstChild_1 then
                    return;
                else
                    l_l_AnnotationsService_0_FirstChild_1:Destroy();
                    return;
                end;
            end);
            local v17 = if v5.MultipleDocumentInterfaceInstance then v5.MultipleDocumentInterfaceInstance.DataModelSessionEnded:Connect(function() --[[ Line: 72 ]]
                -- upvalues: l_AnnotationsService_0 (ref)
                l_AnnotationsService_0:ClearAllChildren();
            end) else nil;
            v5.Unloading:Once(function() --[[ Line: 77 ]]
                -- upvalues: l_AnnotationsService_0 (ref), v9 (copy), v13 (copy), v16 (copy), v17 (copy)
                l_AnnotationsService_0:ClearAllChildren();
                v9:Disconnect();
                v13:Disconnect();
                v16:Disconnect();
                if v17 then
                    v17:Disconnect();
                end;
            end);
            return;
        end;
    end, 
    registerEditCallbacks = function(v18) --[[ Line: 89 ]] --[[ Name: registerEditCallbacks ]]
        -- upvalues: l_AnnotationsService_0 (copy), v1 (copy), v3 (copy)
        v18:OnInvoke("BeginAddAnnotation", function() --[[ Line: 90 ]]
            -- upvalues: v18 (copy), l_AnnotationsService_0 (ref), v1 (ref)
            if not v18:IsActivated() then
                v18:Activate(true);
                v18:GetMouse().Icon = "rbxasset://studio_svg_textures/Lua/PlaceAnnotations/Light/Large/CommentPointer.png";
                l_AnnotationsService_0.Selected = nil;
                l_AnnotationsService_0.Mode = v1.PlacingNew;
            end;
        end);
        v18:OnInvoke("ResolveAnnotation", function(v19, v20) --[[ Line: 99 ]]
            -- upvalues: l_AnnotationsService_0 (ref)
            local l_l_AnnotationsService_0_FirstChild_2 = l_AnnotationsService_0:FindFirstChild(v19);
            if not l_l_AnnotationsService_0_FirstChild_2 then
                return;
            else
                l_AnnotationsService_0:ResolveAnnotation(l_l_AnnotationsService_0_FirstChild_2, v20);
                return;
            end;
        end);
        v18:OnInvoke("ZoomTo", function(v22) --[[ Line: 106 ]]
            -- upvalues: l_AnnotationsService_0 (ref), v3 (ref)
            local l_l_AnnotationsService_0_FirstChild_3 = l_AnnotationsService_0:FindFirstChild(v22);
            if not l_l_AnnotationsService_0_FirstChild_3 then
                return;
            else
                v3(l_l_AnnotationsService_0_FirstChild_3);
                return;
            end;
        end);
        v18:OnInvoke("DeleteAnnotation", function(v24) --[[ Line: 113 ]]
            -- upvalues: l_AnnotationsService_0 (ref)
            local l_l_AnnotationsService_0_FirstChild_4 = l_AnnotationsService_0:FindFirstChild(v24);
            if not l_l_AnnotationsService_0_FirstChild_4 then
                return;
            else
                l_AnnotationsService_0:DeleteAnnotation(l_l_AnnotationsService_0_FirstChild_4);
                return;
            end;
        end);
        v18:OnInvoke("LoadResolvedAnnotations", function(v26) --[[ Line: 120 ]]
            -- upvalues: l_AnnotationsService_0 (ref)
            l_AnnotationsService_0:LoadResolvedAnnotations(v26);
        end);
        v18:OnInvoke("SetVisibility", function(v27) --[[ Line: 123 ]]
            -- upvalues: l_AnnotationsService_0 (ref)
            l_AnnotationsService_0.AnnotationsVisible = v27;
            for _, v29 in game.CoreGui:FindFirstChild("PlaceAnnotations"):GetChildren() do
                if v29:IsA("BillboardGui") and not v29:GetAttribute("IsDraft") then
                    v29.Enabled = v27;
                end;
            end;
        end);
    end
};