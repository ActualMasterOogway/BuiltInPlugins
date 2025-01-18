local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Standalone_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCommunication).Standalone;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = v2.ContextServices;
local l_joinTags_0 = v2.Styling.joinTags;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = require(l_script_FirstAncestor_0.Src.Components.AnnotationContents);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ResolveButton);
local v11 = require(l_script_FirstAncestor_0.Src.Components.DropdownButton);
local v12 = require(l_script_FirstAncestor_0.Src.Components.ErrorAlert);
local v13 = require(l_script_FirstAncestor_0.Src.Contexts.InputListenerContext);
local v14 = require(l_script_FirstAncestor_0.Src.Util.rerenderReducer);
local v15 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local l_StudioService_0 = game:GetService("StudioService");
return function(v17) --[[ Line: 29 ]] --[[ Name: AnnotationListCard ]]
    -- upvalues: l_Plugin_0 (copy), l_Localization_0 (copy), v13 (copy), v1 (copy), v15 (copy), v14 (copy), l_joinTags_0 (copy), l_Standalone_0 (copy), l_StudioService_0 (copy), v11 (copy), v10 (copy), v12 (copy), v9 (copy)
    local v18 = l_Plugin_0:use():get();
    local v19 = l_Localization_0:use();
    local v20 = v13:use();
    local v21, v22 = v1.useState(false);
    local v23, v24 = v1.useState(false);
    local v25, v26 = v1.useState(v15.None);
    local _, v28 = v1.useReducer(v14, 0);
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v18 (copy), v24 (copy), v17 (copy), v22 (copy), v28 (copy), v26 (copy)
        local v30 = v18:OnInvoke("SelectionChanged", function(v29) --[[ Line: 39 ]]
            -- upvalues: v24 (ref), v17 (ref), v22 (ref)
            v24(v29 == v17.Annotation.Name);
            if v29 ~= v17.Annotation.Name then
                v22(false);
            end;
        end);
        local v31 = v17.Annotation:GetAttributeChangedSignal("HeaderText"):Connect(v28);
        local v32 = v17.Annotation:GetPropertyChangedSignal("Resolved"):Connect(v28);
        local v33 = v17.Annotation:GetPropertyChangedSignal("ReplyCount"):Connect(v28);
        local v36 = v18:OnInvoke("UpdateAnnotation", function(v34, v35) --[[ Line: 50 ]]
            -- upvalues: v17 (ref), v26 (ref)
            if v35.RequestInfo and v34 == v17.Annotation.Name then
                v26(v35.RequestInfo.Status);
            end;
        end);
        return function() --[[ Line: 57 ]]
            -- upvalues: v30 (copy), v31 (copy), v32 (copy), v33 (copy), v36 (copy)
            v30:Disconnect();
            v31:Disconnect();
            v32:Disconnect();
            v33:Disconnect();
            v36:Disconnect();
        end;
    end, {
        v17.Annotation
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-AnnotationListCard", v23 and "Selected" or nil)
    }, {
        v1.createElement("Frame", {}, {
            v1.createElement("TextButton", {
                LayoutOrder = v17.LayoutOrder, 
                Text = "", 
                [v1.Event.MouseButton1Click] = function() --[[ Line: 73 ]]
                    -- upvalues: v20 (copy), v24 (copy), l_Standalone_0 (ref), v18 (copy), v17 (copy)
                    if not v20:GetFocusedElement() then
                        v24(true);
                        l_Standalone_0.zoomTo(v18, v17.Annotation);
                    end;
                end, 
                [v1.Event.MouseEnter] = function() --[[ Line: 79 ]]
                    -- upvalues: v20 (copy), v22 (copy)
                    if not v20:GetFocusedElement() then
                        v22(true);
                    end;
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 84 ]]
                    -- upvalues: v22 (copy)
                    v22(false);
                end, 
                [v1.Tag] = l_joinTags_0("X-Center X-ColumnM", v21 and "Hovered" or nil, v23 and "Selected" or nil)
            }, {
                Header = v1.createElement("Frame", {}, {
                    Navigation = v1.createElement("Frame", {
                        LayoutOrder = 0
                    }, {
                        Adornee = v1.createElement("TextLabel", {
                            Text = v17.Annotation:GetAttribute("HeaderText") or ("(%*)"):format((v19:getText("Card", "DeletedInstance")))
                        }), 
                        MoreIcon = if v17.Annotation.AuthorId == l_StudioService_0:GetUserId() then v1.createElement(v11, {
                            DropdownItems = {
                                v1.createElement("TextButton", {
                                    Text = v19:getText("Dropdown", "Delete"), 
                                    [v1.Event.Activated] = function() --[[ Line: 106 ]]
                                        -- upvalues: l_Standalone_0 (ref), v18 (copy), v17 (copy)
                                        l_Standalone_0.deleteAnnotation(v18, v17.Annotation);
                                    end, 
                                    [v1.Tag] = "Component-DropdownItem Delete"
                                })
                            }, 
                            Disabled = v25 == v15.InProgress
                        }) else nil, 
                        ResolveButton = v1.createElement(v10, {
                            Resolved = v17.Annotation.Resolved, 
                            OnClick = function() --[[ Line: 117 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Standalone_0 (ref), v18 (copy), v17 (copy)
                                l_Standalone_0.setAnnotationResolved(v18, v17.Annotation, not v17.Annotation.Resolved);
                            end, 
                            Disabled = v25 == v15.InProgress
                        }), 
                        ThreadError = if v25 ~= v15.InProgress and v25 ~= v15.None then v1.createElement("Frame", {
                            ZIndex = 100, 
                            Size = UDim2.fromScale(1, 0)
                        }, {
                            Alert = v1.createElement(v12, {
                                ZIndex = 100, 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Position = UDim2.new(0.5, 0, 0, 8), 
                                IsPopup = true, 
                                Message = (function() --[[ Line: 133 ]]
                                    -- upvalues: v25 (copy), v15 (ref), v17 (copy), v19 (copy)
                                    if v25 == v15.ErrorResolving then
                                        if v17.Annotation.Resolved then
                                            return v19:getText("Error", "Unresolve");
                                        else
                                            return v19:getText("Error", "Resolve");
                                        end;
                                    elseif v25 == v15.ErrorDeleting then
                                        return v19:getText("Error", "DeleteThread");
                                    else
                                        return v19:getText("Error", "Unknown");
                                    end;
                                end)(), 
                                OnClose = function() --[[ Line: 146 ]] --[[ Name: OnClose ]]
                                    -- upvalues: v26 (copy), v15 (ref)
                                    v26(v15.None);
                                end
                            })
                        }) else nil
                    }), 
                    Divider = v1.createElement("Frame", {
                        LayoutOrder = 1, 
                        [v1.Tag] = "Component-Divider"
                    })
                }), 
                Comment = v1.createElement(v9, {
                    LayoutOrder = 0, 
                    Annotation = v17.Annotation
                }), 
                ReplyCount = if v17.Annotation.ReplyCount ~= 0 then v1.createElement("TextLabel", {
                    Text = if v17.Annotation.ReplyCount == 1 then v19:getText("Card", "SingleReply") else v19:getText("Card", "ManyReplies", {
                        replyCount = if v17.Annotation.ReplyCount < 100 then string.format("%d", v17.Annotation.ReplyCount) else "99+"
                    }), 
                    LayoutOrder = 2
                }) else nil
            })
        })
    });
end;