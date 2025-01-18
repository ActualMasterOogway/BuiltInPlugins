local function v4(v0, v1) --[[ Line: 1 ]] --[[ Name: findFirstChildWithText ]]
    if v0 == nil then
        return nil;
    else
        for _, v3 in ipairs(v0:GetDescendants()) do
            if (v3:IsA("TextLabel") or v3:IsA("TextButton") or v3:IsA("TextBox")) and string.find(v3.Text, v1) then
                return v3;
            end;
        end;
        return nil;
    end;
end;
local function v5(v6) --[[ Line: 17 ]] --[[ Name: isVisible ]]
    -- upvalues: v5 (copy)
    if v6:IsA("GuiObject") then
        if not v6.Visible then
            return false;
        elseif v6.Parent and v6.Parent:IsA("GuiObject") then
            return v5(v6.Parent);
        else
            return true;
        end;
    else
        return false;
    end;
end;
return {
    findFirstChildWithText = v4, 
    isVisible = v5
};