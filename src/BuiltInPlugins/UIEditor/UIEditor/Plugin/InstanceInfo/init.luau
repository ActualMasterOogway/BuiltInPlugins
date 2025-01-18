local function v0(v1) --[[ Line: 1 ]] --[[ Name: areAncestorsEnabledAndVisible ]]
    -- upvalues: v0 (copy)
    if not v1 or not v1.Parent then
        return false;
    elseif v1.Parent:IsA("ScreenGui") and v1.Parent.Enabled == true then
        return true;
    elseif v1.Parent:IsA("GuiObject") and v1.Parent.Visible == true then
        return v0(v1.Parent);
    elseif v1.Parent:IsA("Folder") then
        return v0(v1.Parent);
    else
        return false;
    end;
end;
return {
    isVisible = function(_, v3, _) --[[ Line: 28 ]] --[[ Name: isVisible ]]
        -- upvalues: v0 (copy)
        if not v3:IsA("GuiObject") then
            return false;
        elseif not v3.Visible then
            return false;
        elseif not v0(v3) then
            return false;
        elseif v3.BackgroundTransparency >= 1 then
            if v3:IsA("ImageLabel") or v3:IsA("ImageButton") then
                local v5 = false;
                if v3.Image ~= "" then
                    v5 = v3.ImageTransparency < 1;
                end;
                return v5;
            elseif v3:IsA("TextLabel") or v3:IsA("TextButton") then
                local v6 = false;
                if v3.Text ~= "" then
                    v6 = v3.TextTransparency < 1;
                end;
                return v6;
            else
                return false;
            end;
        else
            return true;
        end;
    end, 
    canSeeThrough = function(_, v8) --[[ Line: 56 ]] --[[ Name: canSeeThrough ]]
        -- upvalues: v0 (copy)
        if not v8:IsA("GuiObject") or not v8.Visible or not v0(v8) or v8.BackgroundTransparency > 0 then
            return true;
        else
            return false;
        end;
    end
};