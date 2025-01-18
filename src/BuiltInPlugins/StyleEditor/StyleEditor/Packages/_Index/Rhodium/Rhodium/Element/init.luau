local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v1 = require(l_script_FirstAncestor_0.VirtualInput);
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v3 = require(l_script_FirstAncestor_0.XPath);
local v4 = require(l_script_FirstAncestor_0.validateInputReceived);
local function v6(v5) --[[ Line: 111 ]] --[[ Name: describeInstance ]]
    return string.format("%s (%s)", v5:GetFullName(), v5.ClassName);
end;
local function v10(v7) --[[ Line: 115 ]] --[[ Name: describeBounds ]]
    local l_AbsolutePosition_0 = v7.AbsolutePosition;
    local l_AbsoluteSize_0 = v7.AbsoluteSize;
    return string.format("(%s) (%s)", tostring(l_AbsolutePosition_0), (tostring(l_AbsoluteSize_0 + l_AbsolutePosition_0)));
end;
local function v12(v11) --[[ Line: 125 ]] --[[ Name: describeGuiBase2d ]]
    -- upvalues: v10 (copy)
    return string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v11:GetFullName(), v11.ClassName), v10(v11));
end;
local function v16(v13, v14) --[[ Line: 129 ]] --[[ Name: isPointOutsideViewport ]]
    local v15 = {};
    if v13.Y < v14.AbsolutePosition.Y then
        table.insert(v15, "top");
    end;
    if v13.Y > v14.AbsolutePosition.Y + v14.AbsoluteSize.Y then
        table.insert(v15, "bottom");
    end;
    if v13.X < v14.AbsolutePosition.X then
        table.insert(v15, "left");
    end;
    if v13.X > v14.AbsolutePosition.X + v14.AbsoluteSize.X then
        table.insert(v15, "right");
    end;
    if #v15 > 0 then
        return true, table.concat(v15, "-");
    else
        return false;
    end;
end;
local function v23(v17, v18) --[[ Line: 151 ]] --[[ Name: isPointClippedByAncestor ]]
    -- upvalues: v16 (copy)
    local l_Parent_0 = v17.Parent;
    while true do
        if l_Parent_0 ~= nil then
            if l_Parent_0:IsA("GuiBase2d") then
                local v20 = not l_Parent_0:IsA("GuiObject") or l_Parent_0.ClipsDescendants;
                local v21, v22 = v16(v18, l_Parent_0);
                if v20 and v21 then
                    return true, l_Parent_0, v22;
                end;
            end;
            l_Parent_0 = l_Parent_0.Parent;
        else
            return false;
        end;
    end;
end;
local function v32(v24, v25) --[[ Line: 169 ]] --[[ Name: isClickable ]]
    -- upvalues: v10 (copy)
    local v26 = {};
    if not v24.Active then
        if not v24:IsA("GuiButton") and not v24:IsA("TextBox") then
            local v27 = {};
            local l_v24_FullName_0 = v24:GetFullName();
            for _, v30 in v24:GetDescendants() do
                if v30:IsA("GuiButton") or v30:IsA("TextBox") then
                    local v31 = string.sub(string.format("%s (%s)", v30:GetFullName(), v30.ClassName), #l_v24_FullName_0 + 1);
                    table.insert(v27, string.format("%s%s", v24.Name, v31));
                end;
            end;
            table.insert(v26, string.format("target is not a GuiButton or TextBox, so it will not sink inputs unless `Active` is true.\n" .. "\tThe target instance has the following descendants that may be better click targets:%s\n\n" .. "\tIf you are intentionally simulating clicks on a GUI element that is not typically interactive\n" .. "\t(like a Frame or an ImageLabel), consider using `element:clickWithoutValidation` instead.", if #v27 > 0 then "\n\t\t* " .. table.concat(v27, "\n\t\t* ") else " <none>"));
        end;
        if not v25 then
            table.insert(v26, "target is not Active");
        end;
    end;
    if not v24.Visible then
        table.insert(v26, "target is not Visible");
    end;
    if v24.AbsoluteSize.X <= 0 then
        table.insert(v26, string.format("target has 0 width; element bounds: %s", v10(v24)));
    end;
    if v24.AbsoluteSize.Y <= 0 then
        table.insert(v26, string.format("target has 0 height; element bounds: %s", v10(v24)));
    end;
    if not v24:FindFirstAncestorWhichIsA("LayerCollector") then
        table.insert(v26, "target is not a descendant of a LayerCollector, like a ScreenGui or a SurfaceGui");
    end;
    return #v26 == 0, v26;
end;
local function v33(v34) --[[ Line: 228 ]] --[[ Name: countScrollingFrames ]]
    -- upvalues: v33 (copy)
    if v34 and v34 ~= game then
        local v35 = v33(v34.Parent);
        if v34:IsA("ScrollingFrame") then
            v35 = v35 + 1;
        end;
        return v35;
    else
        return 0;
    end;
end;
local v36 = {};
v36.__index = v36;
v36.new = function(v37) --[[ Line: 245 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v33 (copy), v36 (copy)
    local v38 = nil;
    local v39 = nil;
    if type(v37) == "string" then
        v38 = v3.new(v37);
    elseif type(v37) == "table" and v37.__type == "XPath" then
        v38 = v37;
    elseif type(v37) == "userdata" then
        v38 = v3.new(v37);
        v39 = v37;
    else
        error(string.format("invalid parameter for element: %s", (typeof(v37))));
    end;
    local v40 = {
        path = v38, 
        rbxInstance = v39
    };
    local l_v39_0 = v39;
    local v42;
    if l_v39_0 and l_v39_0 ~= game then
        local v43 = v33(l_v39_0.Parent);
        if l_v39_0:IsA("ScrollingFrame") then
            v43 = v43 + 1;
        end;
        v42 = v43;
    else
        v42 = 0;
    end;
    v40.isInScrollingFrame = v42 ~= 0;
    v40.anchor = nil;
    return (setmetatable(v40, v36));
end;
v36.assertInteractable = function(v44) --[[ Line: 270 ]] --[[ Name: assertInteractable ]]
    -- upvalues: v6 (copy)
    local v45 = v44:getRbxInstance();
    if v45 == nil then
        error(string.format("%s: element with XPath %s does not describe any existing Instance", "[Rhodium] input validation", v44.path:toString()));
    end;
    if not v45:IsA("GuiObject") then
        error(string.format("%s: %s is not a GuiObject", "[Rhodium] input validation", v6(v45)));
    end;
    if not v45:FindFirstAncestorOfClass("DataModel") then
        error(string.format("%s: %s is not mounted into the DataModel", "[Rhodium] input validation", v6(v45)));
    end;
end;
v36.assertClickable = function(v46, v47) --[[ Line: 297 ]] --[[ Name: assertClickable ]]
    -- upvalues: v32 (copy)
    local v48 = v46:_getGuiObject();
    local v49, v50 = v32(v48, v47);
    if not v49 then
        error(string.format("%s: %s was not clickable for the following reason(s):\n* %s", "[Rhodium] input validation", string.format("%s (%s)", v48:GetFullName(), v48.ClassName), table.concat(v50, "\n* ")));
    end;
end;
v36.assertVisibleWithinAncestors = function(v51) --[[ Line: 313 ]] --[[ Name: assertVisibleWithinAncestors ]]
    -- upvalues: v23 (copy), v10 (copy), v12 (copy)
    local v52 = v51:_getGuiObject();
    local v53 = v51:getAnchor();
    local v54, v55, v56 = v23(v52, v53);
    if v54 then
        error(string.format("%s: %s is outside bounds of ancestor %s (%s)\n\nclick at: (%s)\ntarget:   %s\nancestor: %s", "[Rhodium] input validation", v52.Name, v55.Name, v56, tostring(v53), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v52:GetFullName(), v52.ClassName), v10(v52)), v12(v55)));
    end;
end;
v36.assertFirstClickTarget = function(v57) --[[ Line: 334 ]] --[[ Name: assertFirstClickTarget ]]
    -- upvalues: v12 (copy), v1 (copy), v2 (copy), v32 (copy), v23 (copy), v10 (copy)
    local v58 = v57:_getGuiObject();
    local v59 = v57:getAnchor();
    local l_v58_FirstAncestorWhichIsA_0 = v58:FindFirstAncestorWhichIsA("BasePlayerGui");
    if not l_v58_FirstAncestorWhichIsA_0 then
        error(string.format("%s: %s is not a descendant of a BasePlayerGui (like CoreGui or LocalPlayer.PlayerGui)", "[Rhodium] input validation", v12(v58)));
    end;
    v1.Mouse.SendMouseMoveEvent(v59.X, v59.Y);
    v2.waitForInputEventsProcessed();
    for _, v62 in (l_v58_FirstAncestorWhichIsA_0:GetGuiObjectsAtPosition(v59.X, v59.Y)) do
        if v62 ~= v58 then
            if v32(v62, true) and not v23(v62, v59) then
                error(string.format("%s: element is obscured by another clickable GuiObject at the target click location\n\n click at: (%s)\n   target: %s\nobscuring: %s", "[Rhodium] input validation", tostring(v59), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v58:GetFullName(), v58.ClassName), v10(v58)), v12(v62)));
            end;
        else
            break;
        end;
    end;
end;
v36.getAttribute = function(v63, v64) --[[ Line: 387 ]] --[[ Name: getAttribute ]]
    return v63:getRbxInstance()[v64];
end;
v36.getLocation = function(v65) --[[ Line: 391 ]] --[[ Name: getLocation ]]
    return v65:_getGuiBase2d().AbsolutePosition;
end;
v36.getRect = function(v66) --[[ Line: 395 ]] --[[ Name: getRect ]]
    local v67 = v66:getSize();
    local v68 = v66:getLocation();
    local v69 = v67 + v68;
    return Rect.new(v68.X, v68.Y, v69.X, v69.Y);
end;
v36.getSize = function(v70) --[[ Line: 402 ]] --[[ Name: getSize ]]
    return v70:_getGuiBase2d().AbsoluteSize;
end;
v36.getCenter = function(v71) --[[ Line: 406 ]] --[[ Name: getCenter ]]
    return v71:getLocation() + v71:getSize() / 2;
end;
v36.getText = function(v72) --[[ Line: 412 ]] --[[ Name: getText ]]
    local v73 = v72:getRbxInstanceOrThrow();
    if v73:IsA("TextLabel") or v73:IsA("TextButton") or v73:IsA("TextBox") then
        return v73.Text;
    else
        error(("expected element to have text, but got `%s`"):format(v73.ClassName));
        return;
    end;
end;
v36.getAnchor = function(v74) --[[ Line: 420 ]] --[[ Name: getAnchor ]]
    if v74.anchor ~= nil then
        return v74:getLocation() + v74.anchor;
    else
        return v74:getCenter();
    end;
end;
v36.setAnchor = function(v75, v76, v77) --[[ Line: 430 ]] --[[ Name: setAnchor ]]
    local v78 = v75:getSize();
    if v78.X < v76 or v78.Y < v77 or v76 < 0 or v77 < 0 then
        error("Attempt to set anchor beyond element's bounds");
        return;
    else
        v75.anchor = Vector2.new(v76, v77);
        return;
    end;
end;
v36.unsetAnchor = function(v79) --[[ Line: 440 ]] --[[ Name: unsetAnchor ]]
    v79.anchor = nil;
end;
v36.isDisplayed = function(v80) --[[ Line: 444 ]] --[[ Name: isDisplayed ]]
    return v80:_getGuiObject().Visible;
end;
v36.isSelected = function(v81) --[[ Line: 448 ]] --[[ Name: isSelected ]]
    return v81:_getGuiButton().Selected;
end;
v36.getRbxInstance = function(v82) --[[ Line: 452 ]] --[[ Name: getRbxInstance ]]
    return v82:waitForRbxInstance(v82.path.waitDelay, v82.path.waitTimeOut);
end;
v36.getRbxInstanceOrThrow = function(v83) --[[ Line: 456 ]] --[[ Name: getRbxInstanceOrThrow ]]
    local v84 = v83:getRbxInstance();
    if v84 == nil then
        error(string.format("Failed to get instance for element with path %s", v83.path:toString()));
    end;
    return v84;
end;
v36._getGuiObject = function(v85) --[[ Line: 464 ]] --[[ Name: _getGuiObject ]]
    return (v85:_getInstanceOfClass("GuiObject"));
end;
v36._getGuiButton = function(v86) --[[ Line: 468 ]] --[[ Name: _getGuiButton ]]
    return (v86:_getInstanceOfClass("GuiButton"));
end;
v36._getGuiBase2d = function(v87) --[[ Line: 472 ]] --[[ Name: _getGuiBase2d ]]
    return (v87:_getInstanceOfClass("GuiBase2d"));
end;
v36._getInstanceOfClass = function(v88, v89) --[[ Line: 476 ]] --[[ Name: _getInstanceOfClass ]]
    local v90 = v88:getRbxInstanceOrThrow();
    if v90:IsA(v89) then
        return v90;
    else
        error(("expected element to be a %s, but got `%s`"):format(v89, v90.ClassName));
        return;
    end;
end;
v36.waitForRbxInstance = function(v91, v92, v93) --[[ Line: 484 ]] --[[ Name: waitForRbxInstance ]]
    local l_rbxInstance_0 = v91.rbxInstance;
    if l_rbxInstance_0 == nil and v91.path ~= nil then
        v91.path:setWait(v92, v93);
        l_rbxInstance_0 = v91.path:waitForFirstInstance();
        v91.rbxInstance = l_rbxInstance_0;
    end;
    return l_rbxInstance_0;
end;
v36.centralizeInstance = function(v95) --[[ Line: 495 ]] --[[ Name: centralizeInstance ]]
    v95:_centralizeInScrollingFrame((v95:_getInstanceOfClass("GuiObject")));
end;
v36.centralize = function(v96) --[[ Line: 499 ]] --[[ Name: centralize ]]
    if v96:getRbxInstance() then
        v96:centralizeInstance();
        return;
    else
        v96:centralizeWithInfiniteScrolling();
        return;
    end;
end;
v36._centralizeInScrollingFrame = function(v97, v98, v99) --[[ Line: 508 ]] --[[ Name: _centralizeInScrollingFrame ]]
    local v100 = false;
    if v98 == game then
        return;
    else
        local v101 = v99 or v98.Parent;
        if v101 == game then
            return;
        else
            if v101:IsA("ScrollingFrame") then
                v97:_centralizeInScrollingFrame(v101, v101.Parent);
                local v102 = false;
                while not v102 do
                    local l_AbsolutePosition_1 = v98.AbsolutePosition;
                    local l_CanvasPosition_0 = v101.CanvasPosition;
                    local v105 = Vector2.new(math.min(300, v101.AbsoluteSize.X), (math.min(300, v101.AbsoluteSize.Y)));
                    v101.CanvasPosition = v101.CanvasPosition + v105;
                    task.wait();
                    local v106 = (v101.CanvasPosition - l_CanvasPosition_0).Magnitude <= 2;
                    local v107 = v98.AbsolutePosition - l_AbsolutePosition_1;
                    v102 = v106 or v107.Magnitude > 2;
                end;
                for _ = 1, 2 do
                    local v109 = v101.AbsolutePosition + v101.AbsoluteSize / 2;
                    local v110 = v98.AbsolutePosition + v98.AbsoluteSize / 2 - v109;
                    if v110.Magnitude > 2 then
                        v101.CanvasPosition = v101.CanvasPosition + v110;
                        task.wait();
                    else
                        v100 = true;
                    end;
                    if v100 then
                        break;
                    end;
                end;
                if not v100 then
                    return;
                end;
            else
                v97:_centralizeInScrollingFrame(v98, v101.Parent);
            end;
            v100 = false;
            return;
        end;
    end;
end;
v36._scrollToFindInstance = function(_, v112, v113) --[[ Line: 555 ]] --[[ Name: _scrollToFindInstance ]]
    v112.CanvasPosition = Vector2.new(0, 0);
    local l_X_0 = v112.AbsoluteSize.X;
    local l_Y_0 = v112.AbsoluteSize.Y;
    local v116 = false;
    local v117 = nil;
    while true do
        if not v116 then
            task.wait(0.1);
            v117 = v113:getFirstInstance();
            if v117 then
                return v117;
            else
                local l_CanvasPosition_1 = v112.CanvasPosition;
                v112.CanvasPosition = v112.CanvasPosition + Vector2.new(math.min(l_X_0, 300), (math.min(l_Y_0, 300)));
                if (v112.CanvasPosition - l_CanvasPosition_1).Magnitude >= 2 then
                    v116 = false;
                else
                    v116 = true;
                end;
            end;
        else
            return nil;
        end;
    end;
end;
v36.centralizeWithInfiniteScrolling = function(v119) --[[ Line: 585 ]] --[[ Name: centralizeWithInfiniteScrolling ]]
    local v120, v121 = v119.path:getInstances();
    if #v120 > 0 then
        v119:centralizeInstance();
    end;
    local v122 = v119.path:copy();
    while v121 < v122:size() do
        v122 = v122:parent();
    end;
    local v123 = v122:getFirstInstance();
    local v124 = nil;
    while true do
        assert(v123 ~= nil, "Rhodium encountered an internal error");
        if v123:IsA("ScrollingFrame") then
            v124 = v123;
            break;
        else
            v123 = v123.Parent;
            if v123 == game then
                break;
            end;
        end;
    end;
    if v124 == nil then
        return;
    elseif v119:_scrollToFindInstance(v124, v119.path) == nil then
        return;
    else
        v119:_centralizeInScrollingFrame((v119:_getInstanceOfClass("GuiObject")));
        return;
    end;
end;
v36.setPluginWindow = function(v125) --[[ Line: 619 ]] --[[ Name: setPluginWindow ]]
    -- upvalues: v1 (copy)
    local l_FirstAncestorWhichIsA_0 = v125:getRbxInstanceOrThrow():FindFirstAncestorWhichIsA("PluginGui");
    v1.setCurrentWindow(l_FirstAncestorWhichIsA_0);
end;
v36._validateInput = function(v127, v128) --[[ Line: 624 ]] --[[ Name: _validateInput ]]
    -- upvalues: v2 (copy), v4 (copy), v12 (copy)
    v127:assertInteractable();
    local v129 = v127:_getGuiObject();
    v2.waitForInputEventsProcessed();
    if not v4(v129, v128) then
        v127:assertClickable();
        v127:assertVisibleWithinAncestors();
        v127:assertFirstClickTarget();
        error(string.format("%s: failed to click %s - reason unknown\n%s", "[Rhodium] input validation", v129.Name, v12(v129)));
    end;
end;
v36.clickWithoutValidation = function(v130, v131) --[[ Line: 652 ]] --[[ Name: clickWithoutValidation ]]
    -- upvalues: v1 (copy)
    v130:centralize();
    v130:setPluginWindow();
    v131 = v131 or 1;
    v1.Mouse.multiClick(v130:getAnchor(), v131);
end;
v36.click = function(v132, v133) --[[ Line: 660 ]] --[[ Name: click ]]
    v132:_validateInput(function() --[[ Line: 661 ]]
        -- upvalues: v132 (copy), v133 (copy)
        v132:clickWithoutValidation(v133);
    end);
end;
v36.rightClick = function(v134) --[[ Line: 666 ]] --[[ Name: rightClick ]]
    -- upvalues: v1 (copy)
    v134:centralize();
    v134:setPluginWindow();
    v1.Mouse.rightClick(v134:getAnchor());
end;
v36.mouseWheel = function(v135, v136) --[[ Line: 673 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v1 (copy)
    v135:centralize();
    v1.Mouse.mouseWheel(v135:getAnchor(), v136);
end;
v36.mouseDrag = function(v137, v138, v139, v140) --[[ Line: 678 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v1 (copy)
    v137:centralize();
    local v141 = v137:getAnchor() + Vector2.new(v138, v139);
    v1.Mouse.mouseDrag(v137:getAnchor(), v141, v140);
end;
v36.mouseDragTo = function(v142, v143, v144) --[[ Line: 685 ]] --[[ Name: mouseDragTo ]]
    -- upvalues: v1 (copy)
    v142:centralize();
    v1.Mouse.mouseDrag(v142:getAnchor(), v143, v144);
end;
v36.sendKey = function(v145, v146) --[[ Line: 690 ]] --[[ Name: sendKey ]]
    -- upvalues: v1 (copy)
    v145:setPluginWindow();
    v1.Keyboard.hitKey(v146);
end;
v36.sendText = function(v147, v148) --[[ Line: 695 ]] --[[ Name: sendText ]]
    -- upvalues: v1 (copy)
    v147:clickWithoutValidation();
    task.wait(0);
    v1.Text.sendText(v148);
end;
v36.tapWithoutValidation = function(v149) --[[ Line: 702 ]] --[[ Name: tapWithoutValidation ]]
    -- upvalues: v1 (copy)
    v149:centralize();
    v1.Touch.tap(v149:getAnchor());
end;
v36.tap = function(v150) --[[ Line: 707 ]] --[[ Name: tap ]]
    v150:_validateInput(function() --[[ Line: 708 ]]
        -- upvalues: v150 (copy)
        v150:tapWithoutValidation();
    end);
end;
v36.touchScroll = function(v151, v152, v153, v154, v155) --[[ Line: 713 ]] --[[ Name: touchScroll ]]
    -- upvalues: v1 (copy)
    v151:centralize();
    v1.Touch.touchScroll(v151:getAnchor(), v152, v153, v154, true, v155);
end;
return v36;