local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Localization_0 = v2.ContextServices.Localization;
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnnotationRequestUtils);
local l_HasRequests_0 = v5.HasRequests;
local l_RequestErrorToUIRequestStatus_0 = v5.RequestErrorToUIRequestStatus;
local v8 = require(l_script_FirstAncestor_0.Src.Components.DropdownButton);
local v9 = require(l_script_FirstAncestor_0.Src.Components.ErrorAlert);
local v10 = require(l_script_FirstAncestor_0.Src.Contexts.UsernameContext);
local v11 = require(l_script_FirstAncestor_0.Src.Enums.UIRequestStatus);
local _ = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestType);
local v13 = require(l_script_FirstAncestor_0.Src.Enums.AnnotationRequestResult);
local l_StudioService_0 = game:GetService("StudioService");
local function _(v15, v16) --[[ Line: 27 ]] --[[ Name: getFormattedDateTime ]]
    return DateTime.fromUnixTimestamp(v15):FormatLocalTime("LT MMM D", v16);
end;
return function(v18) --[[ Line: 33 ]] --[[ Name: AnnotationContents ]]
    -- upvalues: v1 (copy), l_Localization_0 (copy), v10 (copy), l_HasRequests_0 (copy), v11 (copy), v13 (copy), l_RequestErrorToUIRequestStatus_0 (copy), l_StudioService_0 (copy), v8 (copy), v9 (copy)
    local v19, v20 = v1.useState(false);
    local v21 = l_Localization_0:use();
    local v22 = v10:use():getUsername(v18.Annotation.AuthorId);
    local v23, v24 = v1.useState(if l_HasRequests_0(v18.Annotation) then v11.InProgress else v11.None);
    v1.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v24 (copy), l_HasRequests_0 (ref), v11 (ref), v13 (ref), l_RequestErrorToUIRequestStatus_0 (ref)
        if v18.Annotation.Parent and v18.Annotation.Parent:IsA("Annotation") then
            v24(if l_HasRequests_0(v18.Annotation) then v11.InProgress else v11.None);
            local v25 = v18.Annotation.RequestInitiated:Connect(function() --[[ Line: 45 ]]
                -- upvalues: v24 (ref), v11 (ref)
                v24(v11.InProgress);
            end);
            local v29 = v18.Annotation.RequestCompleted:Connect(function(_, v27, v28) --[[ Line: 49 ]]
                -- upvalues: v13 (ref), v24 (ref), v11 (ref), l_RequestErrorToUIRequestStatus_0 (ref)
                if v28 == v13.Success then
                    v24(v11.None);
                    return;
                else
                    v24(l_RequestErrorToUIRequestStatus_0(v27));
                    return;
                end;
            end);
            return function() --[[ Line: 57 ]]
                -- upvalues: v25 (copy), v29 (copy)
                v25:Disconnect();
                v29:Disconnect();
            end;
        else
            return function() --[[ Line: 62 ]]

            end;
        end;
    end, {
        v18.Annotation
    });
    local v30 = {
        if v18.Annotation.Parent and v18.Annotation.Parent:IsA("Annotation") and v18.Annotation.AuthorId == l_StudioService_0:GetUserId() then v1.createElement("TextButton", {
            Text = v21:getText("Dropdown", "Delete"), 
            [v1.Event.Activated] = function() --[[ Line: 71 ]]
                -- upvalues: v18 (copy)
                game:GetService("AnnotationsService"):DeleteAnnotation(v18.Annotation);
            end, 
            [v1.Tag] = "Component-DropdownItem Delete"
        }) else nil
    };
    local l_createElement_0 = v1.createElement;
    local v32 = "Frame";
    local v33 = {
        LayoutOrder = v18.LayoutOrder, 
        [v1.Event.MouseEnter] = function() --[[ Line: 84 ]]
            -- upvalues: v20 (copy)
            v20(true);
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 87 ]]
            -- upvalues: v20 (copy)
            v20(false);
        end, 
        [v1.Tag] = "Component-AnnotationContents X-RowM"
    };
    local v34 = {
        Avatar = v1.createElement("ImageLabel", {
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&filters=circular&w=150&h=150"):format(v18.Annotation.AuthorId), 
            LayoutOrder = 0, 
            [v1.Tag] = "Component-Avatar"
        })
    };
    local l_createElement_1 = v1.createElement;
    local v36 = "Frame";
    local v37 = {
        LayoutOrder = 1, 
        [v1.Tag] = "X-ColumnM"
    };
    local v38 = {};
    local l_createElement_2 = v1.createElement;
    local v40 = "Frame";
    local v41 = {
        LayoutOrder = 0
    };
    local v42 = {};
    local l_createElement_3 = v1.createElement;
    local v44 = "Frame";
    local v45 = {
        [v1.Tag] = "X-RowM X-Middle"
    };
    local v46 = {
        Username = v1.createElement("TextLabel", {
            Text = v22, 
            LayoutOrder = 0, 
            [v1.Tag] = v23 == v11.InProgress and "Disabled" or nil
        })
    };
    local l_createElement_4 = v1.createElement;
    local v48 = "TextLabel";
    local v49 = {};
    local l_CreationTimeUnix_0 = v18.Annotation.CreationTimeUnix;
    local v51 = v21:getLocale();
    v49.Text = DateTime.fromUnixTimestamp(l_CreationTimeUnix_0):FormatLocalTime("LT MMM D", v51);
    v49.LayoutOrder = 1;
    v49[v1.Tag] = v23 == v11.InProgress and "Disabled" or nil;
    v46.CreationTime = l_createElement_4(v48, v49);
    v42.LeftAligned = l_createElement_3(v44, v45, v46);
    v42.MoreIcon = if #v30 ~= 0 and v19 then v1.createElement(v8, {
        DropdownItems = v30, 
        Disabled = v23 == v11.InProgress
    }) else nil;
    v38.UsernameRow = l_createElement_2(v40, v41, v42);
    v38.Contents = v1.createElement("TextLabel", {
        LayoutOrder = 1, 
        Text = v18.Annotation.Contents, 
        [v1.Tag] = v23 == v11.InProgress and "Disabled" or nil
    });
    v38.ErrorAlert = if v23 ~= v11.None and v23 ~= v11.InProgress then v1.createElement(v9, {
        Message = if v23 == v11.ErrorDeleting then v21:getText("Error", "DeleteReply") else v21:getText("Error", "Unknown"), 
        LayoutOrder = 2
    }) else nil;
    v34.TextColumn = l_createElement_1(v36, v37, v38);
    return l_createElement_0(v32, v33, v34);
end;