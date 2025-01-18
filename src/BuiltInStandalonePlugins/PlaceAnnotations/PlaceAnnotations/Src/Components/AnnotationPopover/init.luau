local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_Edit_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCommunication).Edit;
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnnotationRequestUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = require(l_script_FirstAncestor_0.Src.Components.PopoverBase);
local v11 = require(l_script_FirstAncestor_0.Src.Components.AnnotationContents);
local v12 = require(l_script_FirstAncestor_0.Src.Components.CancelSubmitFooter);
local v13 = require(l_script_FirstAncestor_0.Src.Components.SizedScrollingFrame);
local v14 = require(l_script_FirstAncestor_0.Src.Components.DropdownButton);
local v15 = require(l_script_FirstAncestor_0.Src.Components.ResolveButton);
local v16 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestResult);
local _ = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestType);
local v18 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local v19 = require(l_script_FirstAncestor_0.Src.Components.ErrorAlert);
local v20 = require(l_script_FirstAncestor_0.Src.Util.rerenderReducer);
local v21 = require(l_script_FirstAncestor_0.Src.Components.SizedTextInput);
local l_IsDraft_0 = v5.IsDraft;
local l_HasRequests_0 = v5.HasRequests;
local l_HasReplyRequests_0 = v5.HasReplyRequests;
local l_RequestErrorToUIRequestStatus_0 = v5.RequestErrorToUIRequestStatus;
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
local l_StudioService_0 = game:GetService("StudioService");
local l_fflagAnnotationsMaxTextLength_0 = v3.fflagAnnotationsMaxTextLength;
local v29 = {};
return function(v30) --[[ Line: 47 ]] --[[ Name: AnnotationPopover ]]
    -- upvalues: v1 (copy), v20 (copy), l_Localization_0 (copy), l_Plugin_0 (copy), l_HasRequests_0 (copy), v18 (copy), l_HasReplyRequests_0 (copy), v16 (copy), l_RequestErrorToUIRequestStatus_0 (copy), v29 (copy), l_IsDraft_0 (copy), v11 (copy), l_fflagAnnotationsMaxTextLength_0 (copy), v10 (copy), v19 (copy), v14 (copy), l_StudioService_0 (copy), l_Edit_0 (copy), v15 (copy), v13 (copy), v21 (copy), v3 (copy), v12 (copy), l_AnnotationsService_0 (copy)
    local _, v32 = v1.useReducer(v20, 0);
    local v33 = l_Localization_0:use();
    local v34 = l_Plugin_0:use():get();
    local v35, v36 = v1.useState(v30.Annotation:GetChildren());
    local v37, v38 = v1.useState("");
    local v39, v40 = v1.useState(false);
    local v41, v42 = v1.useState(if l_HasRequests_0(v30.Annotation) then v18.InProgress else v18.None);
    local v43, v44 = v1.useState(if l_HasReplyRequests_0(v30.Annotation) then v18.InProgress else v18.None);
    local v45 = v37 and v37 ~= "";
    v1.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v36 (copy), v30 (copy), v42 (copy), v18 (ref), v16 (ref), l_RequestErrorToUIRequestStatus_0 (ref), v32 (copy), v38 (copy), v29 (ref), l_HasRequests_0 (ref)
        v36(v30.Annotation:GetChildren());
        local v46 = v30.Annotation.ChildAdded:Connect(function() --[[ Line: 64 ]]
            -- upvalues: v36 (ref), v30 (ref)
            v36(v30.Annotation:GetChildren());
        end);
        local v47 = v30.Annotation.ChildRemoved:Connect(function() --[[ Line: 67 ]]
            -- upvalues: v36 (ref), v30 (ref)
            v36(v30.Annotation:GetChildren());
        end);
        local v48 = v30.Annotation.AncestryChanged:Connect(function() --[[ Line: 70 ]]
            -- upvalues: v30 (ref)
            if not v30.Annotation.Parent then
                v30.OnCancel();
            end;
        end);
        local v49 = v30.Annotation.RequestInitiated:Connect(function() --[[ Line: 75 ]]
            -- upvalues: v42 (ref), v18 (ref)
            v42(v18.InProgress);
        end);
        local v53 = v30.Annotation.RequestCompleted:Connect(function(_, v51, v52) --[[ Line: 79 ]]
            -- upvalues: v16 (ref), v42 (ref), v18 (ref), l_RequestErrorToUIRequestStatus_0 (ref)
            if v52 == v16.Success then
                v42(v18.None);
                return;
            else
                v42(l_RequestErrorToUIRequestStatus_0(v51));
                return;
            end;
        end);
        local v54 = v30.Annotation:GetPropertyChangedSignal("Resolved"):Connect(v32);
        local v55 = nil;
        local v56 = nil;
        if v30.Annotation.Adornee then
            v55 = v30.Annotation.Adornee:GetPropertyChangedSignal("Name"):Connect(v32);
            v56 = v30.Annotation:GetPropertyChangedSignal("Adornee"):Connect(function() --[[ Line: 92 ]]
                -- upvalues: v56 (ref), v55 (ref), v30 (ref), v32 (ref)
                if v56 then
                    v55:Disconnect();
                end;
                if v30.Annotation.Adornee then
                    v55 = v30.Annotation.Adornee:GetPropertyChangedSignal("Name"):Connect(v32);
                end;
            end);
        end;
        v38(v29[v30.Annotation] or "");
        v42(if l_HasRequests_0(v30.Annotation) then v18.InProgress else v18.None);
        return function() --[[ Line: 106 ]]
            -- upvalues: v46 (copy), v47 (copy), v48 (copy), v49 (copy), v53 (copy), v54 (copy), v55 (ref), v56 (ref)
            v46:Disconnect();
            v47:Disconnect();
            v48:Disconnect();
            v49:Disconnect();
            v53:Disconnect();
            v54:Disconnect();
            if v55 then
                v55:Disconnect();
            end;
            if v56 then
                v56:Disconnect();
            end;
        end;
    end, {
        v30.Annotation
    });
    local v57 = {};
    table.sort(v35, function(v58, v59) --[[ Line: 124 ]]
        if not v58:IsA("Annotation") then
            return false;
        elseif not v59:IsA("Annotation") then
            return true;
        else
            return v58.CreationTimeUnix < v59.CreationTimeUnix;
        end;
    end);
    for v60, v61 in ipairs(v35) do
        if v61:IsA("Annotation") then
            if l_IsDraft_0(v61) then
                v61.RequestCompleted:Once(function(_, _, v64) --[[ Line: 137 ]]
                    -- upvalues: v16 (ref), v44 (copy), v18 (ref), v38 (copy), v61 (copy)
                    if v64 == v16.Success then
                        v44(v18.None);
                        v38("");
                        return;
                    else
                        v44(v18.Error);
                        v61:Destroy();
                        return;
                    end;
                end);
            elseif not v61:GetAttribute("IsDraft") then
                table.insert(v57, v1.createElement(v11, {
                    LayoutOrder = v60, 
                    Annotation = v61
                }));
            end;
        end;
    end;
    local v65 = string.len(v37) > l_fflagAnnotationsMaxTextLength_0;
    local v66 = false;
    if v43 ~= v18.InProgress then
        v66 = v41 ~= v18.InProgress;
    end;
    return v1.createElement(v10, {
        Width = 350, 
        Position = v30.Position, 
        OnFocusLost = v30.OnCancel, 
        [v1.Tag] = "Component-AnnotationPopover"
    }, {
        Header = v1.createElement("Frame", {}, {
            Navigation = v1.createElement("Frame", {
                LayoutOrder = 0
            }, {
                ThreadError = if v41 ~= v18.InProgress and v41 ~= v18.None then v1.createElement("Frame", {
                    ZIndex = 100, 
                    Size = UDim2.fromScale(1, 0)
                }, {
                    Alert = v1.createElement(v19, {
                        ZIndex = 100, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0, 8), 
                        IsPopup = true, 
                        Message = (function() --[[ Line: 182 ]]
                            -- upvalues: v41 (copy), v18 (ref), v30 (copy), v33 (copy)
                            if v41 == v18.ErrorResolving then
                                if v30.Annotation.Resolved then
                                    return v33:getText("Error", "Unresolve");
                                else
                                    return v33:getText("Error", "Resolve");
                                end;
                            elseif v41 == v18.ErrorDeleting then
                                return v33:getText("Error", "DeleteThread");
                            else
                                return v33:getText("Error", "Unknown");
                            end;
                        end)(), 
                        OnClose = function() --[[ Line: 195 ]] --[[ Name: OnClose ]]
                            -- upvalues: v42 (copy), v18 (ref)
                            v42(v18.None);
                        end
                    })
                }) else nil, 
                Adornee = v1.createElement("TextLabel", {
                    Text = if v30.Annotation.Adornee then v30.Annotation.Adornee.Name else ("(%*)"):format((v33:getText("Card", "DeletedInstance")))
                }), 
                MoreIcon = v1.createElement(v14, {
                    DropdownItems = {
                        v33:getText("Dropdown", "ZoomTo"), 
                        if v30.Annotation.AuthorId == l_StudioService_0:GetUserId() then v1.createElement("TextButton", {
                            Text = v33:getText("Dropdown", "Delete"), 
                            [v1.Event.Activated] = function() --[[ Line: 212 ]]
                                -- upvalues: l_Edit_0 (ref), v34 (copy), v30 (copy)
                                l_Edit_0.deleteAnnotation(v34, v30.Annotation);
                            end, 
                            [v1.Tag] = "Component-DropdownItem Delete"
                        }) else nil
                    }, 
                    OnSelect = function(v67) --[[ Line: 219 ]] --[[ Name: OnSelect ]]
                        -- upvalues: v33 (copy), l_Edit_0 (ref), v34 (copy), v30 (copy)
                        if v67 == v33:getText("Dropdown", "ZoomTo") then
                            l_Edit_0.zoomTo(v34, v30.Annotation);
                        end;
                    end, 
                    Disabled = v41 == v18.InProgress, 
                    [v1.Tag] = v41 == v18.InProgress and "Disabled" or nil
                }), 
                ResolveButton = v1.createElement(v15, {
                    Resolved = v30.Annotation.Resolved, 
                    Disabled = v41 == v18.InProgress, 
                    OnClick = function() --[[ Line: 230 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_Edit_0 (ref), v34 (copy), v30 (copy)
                        l_Edit_0.setAnnotationResolved(v34, v30.Annotation, not v30.Annotation.Resolved);
                        if not v30.Annotation.Resolved then
                            v30.Annotation:GetPropertyChangedSignal("Resolved"):Once(function() --[[ Line: 233 ]]
                                -- upvalues: v30 (ref)
                                v30.OnCancel();
                            end);
                        end;
                    end
                })
            }), 
            Divider = v1.createElement("Frame", {
                LayoutOrder = 1, 
                [v1.Tag] = "Component-Divider"
            })
        }), 
        ContentWrapper = v1.createElement(v13, {
            LayoutOrder = 1, 
            MaxY = 250
        }, {
            Comment = v1.createElement(v11, {
                LayoutOrder = 0, 
                Annotation = v30.Annotation
            }); 
            table.unpack(v57)
        }), 
        ReplyBox = v1.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            [v1.Tag] = "X-RowM"
        }, {
            Avatar = v1.createElement("ImageLabel", {
                Image = ("rbxthumb://type=AvatarHeadShot&id=%*&filters=circular&w=150&h=150"):format((l_StudioService_0:GetUserId())), 
                LayoutOrder = 0, 
                [v1.Tag] = "Component-Avatar"
            }), 
            TextInput = v1.createElement(v21, {
                Key = if v3.fflagAnnotationsFocusTextBox then v30.Annotation else nil, 
                LayoutOrder = 1, 
                Text = v37, 
                PlaceholderText = v33:getText("Reply", "Placeholder"), 
                OnTextChanged = function(v68) --[[ Line: 272 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v38 (copy), v29 (ref), v30 (copy)
                    v38(v68);
                    v29[v30.Annotation] = v68;
                end, 
                OnFocusChanged = function(v69) --[[ Line: 276 ]] --[[ Name: OnFocusChanged ]]
                    -- upvalues: v40 (copy)
                    v40(v69);
                end, 
                Disabled = not v66
            })
        }), 
        ReplyError = if not (v43 ~= v18.Error) or v65 then v1.createElement("Frame", {
            LayoutOrder = 3
        }, {
            v1.createElement(v19, {
                Message = if v65 then v33:getText("TextInput", "LengthExceeded", {
                    maxLength = tostring(l_fflagAnnotationsMaxTextLength_0)
                }) else v33:getText("Reply", "Failed")
            })
        }) else nil, 
        Footer = if v66 and (v39 or v45) then v1.createElement(v12, {
            LayoutOrder = 4, 
            Text = v37, 
            OnCancel = function() --[[ Line: 299 ]] --[[ Name: OnCancel ]]
                -- upvalues: v38 (copy)
                v38("");
            end, 
            OnSubmit = function(v70) --[[ Line: 302 ]] --[[ Name: OnSubmit ]]
                -- upvalues: v44 (copy), v18 (ref), v30 (copy), l_AnnotationsService_0 (ref)
                v44(v18.InProgress);
                local v71 = v30.DraftAnnotationInstance(nil, v30.Annotation);
                v71.Contents = v70;
                l_AnnotationsService_0:CreateAnnotation(v71);
            end
        }) else nil
    });
end;