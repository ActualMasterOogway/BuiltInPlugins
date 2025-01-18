local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_script_FirstAncestor_0.Src.Components.PopoverBase);
local v8 = require(l_script_FirstAncestor_0.Src.Components.ErrorAlert);
local v9 = require(l_script_FirstAncestor_0.Src.Components.SizedTextInput);
local v10 = require(l_script_FirstAncestor_0.Src.Components.CancelSubmitFooter);
local v11 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestResult);
local v12 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
local l_StudioService_0 = game:GetService("StudioService");
local l_fflagAnnotationsMaxTextLength_0 = v3.fflagAnnotationsMaxTextLength;
return function(v17) --[[ Line: 31 ]] --[[ Name: AddAnnotationPopup ]]
    -- upvalues: l_Plugin_0 (copy), l_Localization_0 (copy), v1 (copy), v12 (copy), v11 (copy), l_fflagAnnotationsMaxTextLength_0 (copy), v7 (copy), l_StudioService_0 (copy), v9 (copy), v8 (copy), v10 (copy), l_AnnotationsService_0 (copy)
    local v18 = l_Plugin_0:use():get();
    local v19 = l_Localization_0:use();
    local v20, v21 = v1.useState("");
    local v22, v23 = v1.useState(v12.None);
    v1.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v17 (copy), v23 (copy), v12 (ref), v11 (ref), v18 (copy)
        local v24 = v17.Annotation.RequestInitiated:Connect(function() --[[ Line: 38 ]]
            -- upvalues: v23 (ref), v12 (ref)
            v23(v12.InProgress);
        end);
        local v28 = v17.Annotation.RequestCompleted:Connect(function(_, _, v27) --[[ Line: 42 ]]
            -- upvalues: v11 (ref), v23 (ref), v12 (ref), v18 (ref)
            if v27 == v11.Success then
                v23(v12.None);
                v18:Deactivate();
                return;
            else
                v23(v12.Error);
                return;
            end;
        end);
        return function() --[[ Line: 51 ]]
            -- upvalues: v24 (copy), v28 (copy)
            v24:Disconnect();
            v28:Disconnect();
        end;
    end, {
        v17.Annotation
    });
    local v29 = v1.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v12 (ref), v17 (copy), v18 (copy)
        if v22 ~= v12.InProgress then
            v17.Annotation:Destroy();
        end;
        v18:Deactivate();
    end, {
        v17.Annotation, 
        v22
    });
    local v30 = string.len(v20) > l_fflagAnnotationsMaxTextLength_0;
    return v1.createElement(v7, {
        Width = 350, 
        Position = v17.Position, 
        OnFocusLost = v29, 
        DebounceFocusLost = v22 ~= v12.InProgress, 
        [v1.Tag] = "Component-AddAnnotationPopup"
    }, {
        InputArea = v1.createElement("Frame", {
            LayoutOrder = 1, 
            [v1.Tag] = "X-RowM X-Top"
        }, {
            Avatar = v1.createElement("ImageLabel", {
                Image = ("rbxthumb://type=AvatarHeadShot&id=%*&filters=circular&w=150&h=150"):format((l_StudioService_0:GetUserId())), 
                LayoutOrder = 0, 
                [v1.Tag] = "Component-Avatar"
            }), 
            TextInput = v1.createElement(v9, {
                LayoutOrder = 1, 
                Text = v20, 
                OnTextChanged = function(v31) --[[ Line: 84 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v21 (copy)
                    v21(v31);
                end, 
                PlaceholderText = v19:getText("AddAnnotation", "PlaceholderText"), 
                Disabled = v22 == v12.InProgress
            })
        }), 
        ErrorWrapper = if not (v22 ~= v12.Error) or v30 then v1.createElement("Frame", {
            LayoutOrder = 2
        }, {
            Error = v1.createElement(v8, {
                Message = if v30 then v19:getText("TextInput", "LengthExceeded", {
                    maxLength = tostring(l_fflagAnnotationsMaxTextLength_0)
                }) else v19:getText("AddAnnotation", "Failed")
            })
        }) else nil, 
        Footer = if v22 ~= v12.InProgress then v1.createElement(v10, {
            Text = v20, 
            OnSubmit = function(v32) --[[ Line: 107 ]] --[[ Name: OnSubmit ]]
                -- upvalues: v17 (copy), l_AnnotationsService_0 (ref)
                v17.Annotation.Contents = v32;
                l_AnnotationsService_0:CreateAnnotation(v17.Annotation);
            end, 
            OnCancel = v29, 
            LayoutOrder = 3
        }) else nil
    });
end;