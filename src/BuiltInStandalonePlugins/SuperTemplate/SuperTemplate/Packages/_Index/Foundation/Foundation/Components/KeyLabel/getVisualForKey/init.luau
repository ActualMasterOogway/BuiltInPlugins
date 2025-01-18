local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = {};
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), l_UserInputService_0 (copy)
    if v1[v2] then
        return v1[v2];
    else
        local v3 = nil;
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v2);
        if l_l_UserInputService_0_ImageForKeyCode_0 and l_l_UserInputService_0_ImageForKeyCode_0 ~= "" then
            return {
                keyVisualType = "Image", 
                size = UDim2.fromScale(0.7, 0.7), 
                key = l_l_UserInputService_0_ImageForKeyCode_0
            };
        else
            l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v2);
            v3 = {
                keyVisualType = "String", 
                size = UDim2.fromScale(0.8, 0.8), 
                key = l_l_UserInputService_0_ImageForKeyCode_0 or ""
            };
            v1[v2] = v3;
            return v3;
        end;
    end;
end;