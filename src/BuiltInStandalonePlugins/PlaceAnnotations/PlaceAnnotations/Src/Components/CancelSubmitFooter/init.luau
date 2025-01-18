local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_Localization_0 = v2.ContextServices.Localization;
local l_fflagAnnotationsMaxTextLength_0 = v3.fflagAnnotationsMaxTextLength;
local l_UserInputService_0 = game:GetService("UserInputService");
return function(v7) --[[ Line: 20 ]] --[[ Name: CancelSubmitFooter ]]
    -- upvalues: l_Localization_0 (copy), l_fflagAnnotationsMaxTextLength_0 (copy), v1 (copy), v3 (copy), l_UserInputService_0 (copy)
    local v8 = l_Localization_0:use();
    local v9 = false;
    if v7.Text ~= "" then
        v9 = not v7.Text:match("^%s*$") and string.len(v7.Text) <= l_fflagAnnotationsMaxTextLength_0;
    end;
    local v11 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v7 (copy)
        local v10 = v7.Text:gsub("^%s*", ""):gsub("%s*$", "");
        v7.OnSubmit(v10);
    end, {
        v7.Text, 
        v7.OnSubmit
    });
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v3 (ref), l_UserInputService_0 (ref), v9 (copy), v11 (copy)
        local v12 = nil;
        if v3.fflagAnnotationsSubmitOnEnter then
            v12 = l_UserInputService_0.InputBegan:Connect(function(v13) --[[ Line: 36 ]]
                -- upvalues: v9 (ref), v11 (ref)
                if v13.KeyCode == Enum.KeyCode.Return and v9 then
                    v11();
                end;
            end);
        end;
        return function() --[[ Line: 42 ]]
            -- upvalues: v3 (ref), v12 (ref)
            if v3.fflagAnnotationsSubmitOnEnter then
                v12:Disconnect();
            end;
        end;
    end);
    return v1.createElement("Frame", {
        LayoutOrder = v7.LayoutOrder, 
        [v1.Tag] = "Component-CancelSubmitFooter X-Right X-RowM X-FitY"
    }, {
        CancelButton = v1.createElement("TextButton", {
            Text = v8:getText("AddAnnotation", "Cancel"), 
            [v1.Event.Activated] = v7.OnCancel
        }), 
        SubmitButton = v1.createElement("TextButton", {
            Text = v8:getText("AddAnnotation", "Submit"), 
            Interactable = v9, 
            Selectable = v9, 
            [v1.Event.Activated] = v11, 
            [v1.Tag] = if v9 then nil else "Disabled"
        })
    });
end;