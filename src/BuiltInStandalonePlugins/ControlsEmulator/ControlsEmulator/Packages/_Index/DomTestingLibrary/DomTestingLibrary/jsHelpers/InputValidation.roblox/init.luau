local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local function v2(v1) --[[ Line: 6 ]] --[[ Name: getGuiObject ]]
    if v1:IsA("GuiObject") then
        return v1;
    else
        error(("expected instance to be a GuiObject, but got `%s`"):format(v1.ClassName));
        return;
    end;
end;
local function v6(v3) --[[ Line: 13 ]] --[[ Name: getCenter ]]
    local l_AbsolutePosition_0 = v3.AbsolutePosition;
    local l_AbsoluteSize_0 = v3.AbsoluteSize;
    return Vector2.new(l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2);
end;
local function v8(v7) --[[ Line: 24 ]] --[[ Name: describeInstance ]]
    return string.format("%s (%s)", v7:GetFullName(), v7.ClassName);
end;
local function v12(v9) --[[ Line: 32 ]] --[[ Name: describeBounds ]]
    local l_AbsolutePosition_1 = v9.AbsolutePosition;
    local l_AbsoluteSize_1 = v9.AbsoluteSize;
    return string.format("(%s) (%s)", tostring(l_AbsolutePosition_1), (tostring(l_AbsoluteSize_1 + l_AbsolutePosition_1)));
end;
local function v14(v13) --[[ Line: 43 ]] --[[ Name: describeGuiBase2d ]]
    -- upvalues: v12 (copy)
    return string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v13:GetFullName(), v13.ClassName), v12(v13));
end;
local function v18(v15, v16) --[[ Line: 47 ]] --[[ Name: isPointOutsideViewport ]]
    local v17 = {};
    if v15.Y < v16.AbsolutePosition.Y then
        table.insert(v17, "top");
    end;
    if v15.Y > v16.AbsolutePosition.Y + v16.AbsoluteSize.Y then
        table.insert(v17, "bottom");
    end;
    if v15.X < v16.AbsolutePosition.X then
        table.insert(v17, "left");
    end;
    if v15.X > v16.AbsolutePosition.X + v16.AbsoluteSize.X then
        table.insert(v17, "right");
    end;
    if #v17 > 0 then
        return true, table.concat(v17, "-");
    else
        return false;
    end;
end;
local function v25(v19, v20) --[[ Line: 69 ]] --[[ Name: isPointClippedByAncestor ]]
    -- upvalues: v18 (copy)
    local l_Parent_0 = v19.Parent;
    while true do
        if l_Parent_0 ~= nil then
            if l_Parent_0:IsA("GuiBase2d") then
                local v22 = not l_Parent_0:IsA("GuiObject") or l_Parent_0.ClipsDescendants;
                local v23, v24 = v18(v20, l_Parent_0);
                if v22 and v23 then
                    return true, l_Parent_0, v24;
                end;
            end;
            l_Parent_0 = l_Parent_0.Parent;
        else
            return false;
        end;
    end;
end;
local function v34(v26, v27) --[[ Line: 87 ]] --[[ Name: isClickable ]]
    -- upvalues: v12 (copy)
    local v28 = {};
    if not v26.Active then
        if not v26:IsA("GuiButton") and not v26:IsA("TextBox") then
            local v29 = {};
            local l_v26_FullName_0 = v26:GetFullName();
            for _, v32 in v26:GetDescendants() do
                if v32:IsA("GuiButton") or v32:IsA("TextBox") then
                    local v33 = string.sub(string.format("%s (%s)", v32:GetFullName(), v32.ClassName), #l_v26_FullName_0 + 1);
                    table.insert(v29, string.format("%s%s", v26.Name, v33));
                end;
            end;
            table.insert(v28, string.format("target is not a GuiButton or TextBox, so it will not sink inputs unless `Active` is true.\n" .. "\tThe target instance has the following descendants that may be better click targets:%s\n\n" .. "\tIf you are intentionally simulating clicks on a GUI element that is not typically interactive\n" .. "\t(like a Frame or an ImageLabel), consider using `element:clickWithoutValidation` instead.", if #v29 > 0 then "\n\t\t* " .. table.concat(v29, "\n\t\t* ") else " <none>"));
        end;
        if not v27 then
            table.insert(v28, "target is not Active");
        end;
    end;
    if not v26.Visible then
        table.insert(v28, "target is not Visible");
    end;
    if v26.AbsoluteSize.X <= 0 then
        table.insert(v28, string.format("target has 0 width; element bounds: %s", v12(v26)));
    end;
    if v26.AbsoluteSize.Y <= 0 then
        table.insert(v28, string.format("target has 0 height; element bounds: %s", v12(v26)));
    end;
    if not v26:FindFirstAncestorWhichIsA("LayerCollector") then
        table.insert(v28, "target is not a descendant of a LayerCollector, like a ScreenGui or a SurfaceGui");
    end;
    return #v28 == 0, v28;
end;
local function v36(v35) --[[ Line: 146 ]] --[[ Name: assertMounted ]]
    -- upvalues: v8 (copy)
    if not v35:IsA("GuiObject") then
        error(string.format("%s: %s is not a GuiObject", "[Testing Library] input validation", v8(v35)));
    end;
    if not v35:FindFirstAncestorOfClass("DataModel") then
        error(string.format("%s: %s is not mounted into the DataModel", "[Testing Library] input validation", v8(v35)));
    end;
end;
local function v42(v37, v38) --[[ Line: 163 ]] --[[ Name: assertCanActivate ]]
    -- upvalues: v34 (copy)
    local v39;
    if v37:IsA("GuiObject") then
        v39 = v37;
    else
        error(("expected instance to be a GuiObject, but got `%s`"):format(v37.ClassName));
        v39 = nil;
    end;
    local v40, v41 = v34(v39, v38);
    if not v40 then
        error(string.format("%s: %s was not clickable for the following reason(s):\n* %s", "[Testing Library] input validation", string.format("%s (%s)", v39:GetFullName(), v39.ClassName), table.concat(v41, "\n* ")));
    end;
end;
local function v49(v43) --[[ Line: 179 ]] --[[ Name: assertVisibleWithinAncestors ]]
    -- upvalues: v25 (copy), v12 (copy), v14 (copy)
    local v44;
    if v43:IsA("GuiObject") then
        v44 = v43;
    else
        error(("expected instance to be a GuiObject, but got `%s`"):format(v43.ClassName));
        v44 = nil;
    end;
    local l_AbsolutePosition_2 = v44.AbsolutePosition;
    local l_AbsoluteSize_2 = v44.AbsoluteSize;
    local v47 = Vector2.new(l_AbsolutePosition_2.X + l_AbsoluteSize_2.X / 2, l_AbsolutePosition_2.Y + l_AbsoluteSize_2.Y / 2);
    local v48;
    l_AbsolutePosition_2, l_AbsoluteSize_2, v48 = v25(v44, v47);
    if l_AbsolutePosition_2 then
        error(string.format("%s: %s is outside bounds of ancestor %s (%s)\n\nclick at: (%s)\ntarget:   %s\nancestor: %s", "[Testing Library] input validation", v43.Name, l_AbsoluteSize_2.Name, v48, tostring(v47), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v44:GetFullName(), v44.ClassName), v12(v44)), v14(l_AbsoluteSize_2)));
    end;
end;
local function v57(v50) --[[ Line: 200 ]] --[[ Name: assertFirstInputTarget ]]
    -- upvalues: v14 (copy), l_VirtualInputManager_0 (copy), v34 (copy), v25 (copy), v12 (copy)
    local v51;
    if v50:IsA("GuiObject") then
        v51 = v50;
    else
        error(("expected instance to be a GuiObject, but got `%s`"):format(v50.ClassName));
        v51 = nil;
    end;
    local l_AbsolutePosition_3 = v51.AbsolutePosition;
    local l_AbsoluteSize_3 = v51.AbsoluteSize;
    local v54 = Vector2.new(l_AbsolutePosition_3.X + l_AbsoluteSize_3.X / 2, l_AbsolutePosition_3.Y + l_AbsoluteSize_3.Y / 2);
    l_AbsolutePosition_3 = v50:FindFirstAncestorWhichIsA("BasePlayerGui");
    if not l_AbsolutePosition_3 then
        error(string.format("%s: %s is not a descendant of a BasePlayerGui (like CoreGui or LocalPlayer.PlayerGui)", "[Testing Library] input validation", v14(v51)));
    end;
    l_VirtualInputManager_0:SendMouseMoveEvent(v54.X, v54.Y, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
    for _, v56 in (l_AbsolutePosition_3:GetGuiObjectsAtPosition(v54.X, v54.Y)) do
        if v56 ~= v50 then
            if v34(v56, true) and not v25(v56, v54) then
                error(string.format("%s: element is obscured by another clickable GuiObject at the target click location\n\n click at: (%s)\n   target: %s\nobscuring: %s", "[Testing Library] input validation", tostring(v54), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v50:GetFullName(), v50.ClassName), v12(v50)), v14(v56)));
            end;
        else
            break;
        end;
    end;
end;
local function v69(v58, v59) --[[ Line: 255 ]] --[[ Name: validateInputReceived ]]
    local v60 = {};
    local v61 = false;
    if v58:IsA("GuiButton") then
        table.insert(v60, v58.Activated:Connect(function(v62) --[[ Line: 262 ]]
            -- upvalues: v61 (ref)
            if v62.UserInputState ~= Enum.UserInputState.Cancel then
                v61 = true;
            end;
        end));
    elseif v58:IsA("TextBox") and not v58:IsFocused() then
        table.insert(v60, v58.Focused:Connect(function() --[[ Line: 273 ]]
            -- upvalues: v61 (ref)
            v61 = true;
        end));
    else
        local v63 = false;
        do
            local l_v63_0 = v63;
            table.insert(v60, v58.InputBegan:Connect(function(v65) --[[ Line: 282 ]]
                -- upvalues: l_v63_0 (ref)
                if v65.UserInputState ~= Enum.UserInputState.Cancel then
                    l_v63_0 = true;
                end;
            end));
            table.insert(v60, v58.InputEnded:Connect(function(v66) --[[ Line: 290 ]]
                -- upvalues: l_v63_0 (ref), v61 (ref)
                if v66.UserInputState ~= Enum.UserInputState.Cancel and l_v63_0 then
                    v61 = true;
                end;
            end));
        end;
    end;
    v59();
    for _, v68 in v60 do
        v68:Disconnect();
    end;
    return v61;
end;
return {
    getGuiObject = v2, 
    getCenter = v6, 
    assertMounted = v36, 
    assertCanActivate = v42, 
    assertVisibleWithinAncestors = v49, 
    assertFirstInputTarget = v57, 
    validateInput = function(v70, v71) --[[ Line: 308 ]] --[[ Name: validateInput ]]
        -- upvalues: v36 (copy), l_VirtualInputManager_0 (copy), v69 (copy), v42 (copy), v49 (copy), v57 (copy), v14 (copy)
        v36(v70);
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
        if not v69(v70, v71) then
            v42(v70);
            v49(v70);
            v57(v70);
            error(string.format("%s: failed to click %s - reason unknown\n%s", "[Testing Library] input validation", v70.Name, v14(v70)));
        end;
    end
};