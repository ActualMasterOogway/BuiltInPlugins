local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local _ = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestType);
local v2 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestResult);
local v3 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local l_RequestErrorToUIRequestStatus_0 = require(l_script_FirstAncestor_0.Src.Util.AnnotationRequestUtils).RequestErrorToUIRequestStatus;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v18 = {
    setAnnotationResolved = function(v6, v7, v8) --[[ Line: 13 ]]
        v6:Invoke("ResolveAnnotation", v7.Name, v8);
    end, 
    beginAddAnnotation = function(v9) --[[ Line: 16 ]]
        v9:Invoke("BeginAddAnnotation");
    end, 
    zoomTo = function(v10, v11) --[[ Line: 19 ]]
        v10:Invoke("ZoomTo", v11.Name);
    end, 
    deleteAnnotation = function(v12, v13) --[[ Line: 22 ]]
        v12:Invoke("DeleteAnnotation", v13.Name);
    end, 
    loadResolvedAnnotations = function(v14, v15) --[[ Line: 25 ]]
        v14:Invoke("LoadResolvedAnnotations", v15);
    end, 
    setVisibility = function(v16, v17) --[[ Line: 28 ]]
        v16:Invoke("SetVisibility", v17);
    end
};
local v22 = {
    syncStandaloneAnnotation = function(v19, v20, v21) --[[ Line: 33 ]]
        v19:Invoke("UpdateAnnotation", v20:GetStringUniqueId(), v21);
    end
};
v22.createAnnotation = function(v23, v24) --[[ Line: 36 ]]
    -- upvalues: v22 (copy), v3 (copy), v2 (copy), l_RequestErrorToUIRequestStatus_0 (copy)
    assert(v24.Parent, "Workplace annotations must be the children of another annotation or an instance.");
    local v25 = {
        UniqueId = v24:GetStringUniqueId(), 
        AuthorId = v24.AuthorId, 
        CreationTimeUnix = v24.CreationTimeUnix, 
        LastModifiedTimeUnix = v24.LastModifiedTimeUnix, 
        Contents = v24.Contents, 
        Resolved = v24.Resolved, 
        ParentId = if v24.Parent and v24.Parent:IsA("Annotation") then v24.Parent:GetStringUniqueId() else nil, 
        HeaderInfo = if v24.Adornee then {
            HeaderText = v24.Adornee.Name, 
            AdorneeClass = v24.Adornee.ClassName
        } else nil, 
        ReplyCount = v24.ReplyCount
    };
    if v24.Adornee then
        local v26 = v24.Adornee:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 57 ]]
            -- upvalues: v22 (ref), v23 (copy), v24 (copy)
            v22.syncStandaloneAnnotation(v23, v24, {
                HeaderInfo = {
                    HeaderText = v24.Adornee.Name, 
                    AdorneeClass = v24.Adornee.ClassName
                }
            });
        end);
        do
            local l_v26_0 = v26;
            v24:GetPropertyChangedSignal("Adornee"):Connect(function() --[[ Line: 62 ]]
                -- upvalues: l_v26_0 (ref), v24 (copy), v22 (ref), v23 (copy)
                l_v26_0:Disconnect();
                if v24.Adornee then
                    v22.syncStandaloneAnnotation(v23, v24, {
                        HeaderInfo = {
                            HeaderText = v24.Adornee.Name, 
                            AdorneeClass = v24.Adornee.ClassName
                        }
                    });
                    l_v26_0 = v24.Adornee:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 69 ]]
                        -- upvalues: v22 (ref), v23 (ref), v24 (ref)
                        v22.syncStandaloneAnnotation(v23, v24, {
                            HeaderInfo = {
                                HeaderText = v24.Adornee.Name, 
                                AdorneeClass = v24.Adornee.ClassName
                            }
                        });
                    end);
                end;
            end);
        end;
    end;
    if v24.ReplyCount then
        v24:GetPropertyChangedSignal("ReplyCount"):Connect(function() --[[ Line: 81 ]]
            -- upvalues: v22 (ref), v23 (copy), v24 (copy)
            v22.syncStandaloneAnnotation(v23, v24, {
                ReplyCount = v24.ReplyCount
            });
        end);
    end;
    v24.RequestInitiated:Connect(function(v28, v29) --[[ Line: 87 ]]
        -- upvalues: v22 (ref), v23 (copy), v24 (copy), v3 (ref)
        v22.syncStandaloneAnnotation(v23, v24, {
            RequestInfo = {
                Id = v28, 
                Status = v3.InProgress, 
                Type = v29
            }
        });
    end);
    v24.RequestCompleted:Connect(function(v30, v31, v32) --[[ Line: 97 ]]
        -- upvalues: v22 (ref), v23 (copy), v24 (copy), v2 (ref), v3 (ref), l_RequestErrorToUIRequestStatus_0 (ref)
        v22.syncStandaloneAnnotation(v23, v24, {
            RequestInfo = {
                Id = v30, 
                Status = if v32 == v2.Success then v3.None else l_RequestErrorToUIRequestStatus_0(v31), 
                Type = v31
            }
        });
    end);
    v24.Destroying:Once(function() --[[ Line: 111 ]]
        -- upvalues: v23 (copy), v24 (copy)
        v23:Invoke("AnnotationDeleted", v24:GetStringUniqueId());
    end);
    v23:Invoke("CreateAnnotation", v25);
end;
v22.selectionChanged = function(v33, v34) --[[ Line: 116 ]]
    v33:Invoke("SelectionChanged", if v34 then v34:GetStringUniqueId() else nil);
end;
v22.setAnnotationResolved = function(v35, v36, v37) --[[ Line: 119 ]]
    v35:Invoke("ResolveAnnotation", v36:GetStringUniqueId(), v37);
end;
v22.deleteAnnotation = function(v38, v39) --[[ Line: 122 ]]
    v38:Invoke("DeleteAnnotation", v39:GetStringUniqueId());
end;
v22.zoomTo = function(v40, v41) --[[ Line: 125 ]]
    v40:Invoke("ZoomTo", v41:GetStringUniqueId());
end;
return {
    Standalone = v18, 
    Edit = v22
};