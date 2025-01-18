local v0 = require(script.Parent.VirtualInput);
local v1 = require(script.Parent.XPath);
local function v2(v3) --[[ Line: 6 ]] --[[ Name: countScrollingFrames ]]
    -- upvalues: v2 (copy)
    if v3 and v3 ~= game then
        local v4 = v2(v3.Parent);
        if v3:IsA("ScrollingFrame") then
            v4 = v4 + 1;
        end;
        return v4;
    else
        return 0;
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy)
    local v7 = nil;
    local v8 = nil;
    if type(v6) == "string" then
        v7 = v1.new(v6);
    elseif type(v6) == "table" and v6.__type == "XPath" then
        v7 = v6;
    elseif type(v6) == "userdata" then
        v7 = v1.new(v6);
        v8 = v6;
    else
        error("invalid parameter for element");
    end;
    local v9 = {
        path = v7, 
        rbxInstance = v8
    };
    local l_v8_0 = v8;
    local v11;
    if l_v8_0 and l_v8_0 ~= game then
        local v12 = v2(l_v8_0.Parent);
        if l_v8_0:IsA("ScrollingFrame") then
            v12 = v12 + 1;
        end;
        v11 = v12;
    else
        v11 = 0;
    end;
    v9.isInScrollingFrame = v11 ~= 0;
    return (setmetatable(v9, v5));
end;
v5.getAttribute = function(v13, v14) --[[ Line: 45 ]] --[[ Name: getAttribute ]]
    return v13:getRbxInstance()[v14];
end;
v5.getLocation = function(v15) --[[ Line: 49 ]] --[[ Name: getLocation ]]
    return v15:_getGuiBase2d().AbsolutePosition;
end;
v5.getRect = function(v16) --[[ Line: 53 ]] --[[ Name: getRect ]]
    local v17 = v16:getSize();
    local v18 = v16:getLocation();
    local v19 = v17 + v18;
    return Rect.new(v18.X, v18.Y, v19.X, v19.Y);
end;
v5.getSize = function(v20) --[[ Line: 60 ]] --[[ Name: getSize ]]
    return v20:_getGuiBase2d().AbsoluteSize;
end;
v5.getCenter = function(v21) --[[ Line: 64 ]] --[[ Name: getCenter ]]
    return v21:getLocation() + v21:getSize() / 2;
end;
v5.getText = function(v22) --[[ Line: 70 ]] --[[ Name: getText ]]
    local v23 = v22:getRbxInstance();
    if v23:IsA("TextLabel") or v23:IsA("TextButton") or v23:IsA("TextBox") then
        return v23.Text;
    else
        error(("expected element to have text, but got `%s`"):format(v23.ClassName));
        return;
    end;
end;
v5.getAnchor = function(v24) --[[ Line: 78 ]] --[[ Name: getAnchor ]]
    if v24.anchor ~= nil then
        return v24:getLocation() + v24.anchor;
    else
        return v24:getCenter();
    end;
end;
v5.setAnchor = function(v25, v26, v27) --[[ Line: 88 ]] --[[ Name: setAnchor ]]
    local v28 = v25:getSize();
    if v28.X < v26 or v28.Y < v27 or v26 < 0 or v27 < 0 then
        error("Attempt to set anchor beyond element's bounds");
        return;
    else
        v25.anchor = Vector2.new(v26, v27);
        return;
    end;
end;
v5.unsetAnchor = function(v29) --[[ Line: 98 ]] --[[ Name: unsetAnchor ]]
    v29.anchor = nil;
end;
v5.isDisplayed = function(v30) --[[ Line: 102 ]] --[[ Name: isDisplayed ]]
    return v30:_getGuiObject().Visible;
end;
v5.isSelected = function(v31) --[[ Line: 106 ]] --[[ Name: isSelected ]]
    return v31:_getGuiButton().Selected;
end;
v5.getRbxInstance = function(v32) --[[ Line: 110 ]] --[[ Name: getRbxInstance ]]
    return v32:waitForRbxInstance(v32.path.waitDelay, v32.path.waitTimeout);
end;
v5._getGuiObject = function(v33) --[[ Line: 114 ]] --[[ Name: _getGuiObject ]]
    return (v33:_getInstanceOfClass("GuiObject"));
end;
v5._getGuiButton = function(v34) --[[ Line: 118 ]] --[[ Name: _getGuiButton ]]
    return (v34:_getInstanceOfClass("GuiButton"));
end;
v5._getGuiBase2d = function(v35) --[[ Line: 122 ]] --[[ Name: _getGuiBase2d ]]
    return (v35:_getInstanceOfClass("GuiBase2d"));
end;
v5._getInstanceOfClass = function(v36, v37) --[[ Line: 126 ]] --[[ Name: _getInstanceOfClass ]]
    local v38 = v36:getRbxInstance();
    if v38:IsA(v37) then
        return v38;
    else
        error(("expected element to be a %s, but got `%s`"):format(v37, v38.ClassName));
        return;
    end;
end;
v5.waitForRbxInstance = function(v39, v40, v41) --[[ Line: 134 ]] --[[ Name: waitForRbxInstance ]]
    local l_rbxInstance_0 = v39.rbxInstance;
    if l_rbxInstance_0 == nil and v39.path ~= nil then
        v39.path:setWait(v40, v41);
        l_rbxInstance_0 = v39.path:waitForFirstInstance();
        v39.rbxInstance = l_rbxInstance_0;
    end;
    return l_rbxInstance_0;
end;
v5._override = function(v43, v44) --[[ Line: 145 ]] --[[ Name: _override ]]
    for v45, v46 in pairs(v44) do
        if not v45:find("^_") then
            v43[v45] = v46;
        end;
    end;
end;
v5.centralizeInstance = function(v47) --[[ Line: 153 ]] --[[ Name: centralizeInstance ]]
    v47:_centralizeInScrollingFrame(v47:getRbxInstance());
end;
v5.centralize = function(v48) --[[ Line: 157 ]] --[[ Name: centralize ]]
    if v48:getRbxInstance() then
        v48:centralizeInstance();
        return;
    else
        v48:centralizeWithInfiniteScrolling();
        return;
    end;
end;
v5._centralizeInScrollingFrame = function(v49, v50, v51) --[[ Line: 166 ]] --[[ Name: _centralizeInScrollingFrame ]]
    local v52 = false;
    if v50 == game then
        return;
    else
        local v53 = v51 or v50.Parent;
        if v53 == game then
            return;
        else
            if v53:IsA("ScrollingFrame") then
                v49:_centralizeInScrollingFrame(v53, v53.Parent);
                local v54 = false;
                while not v54 do
                    local l_AbsolutePosition_0 = v50.AbsolutePosition;
                    local l_CanvasPosition_0 = v53.CanvasPosition;
                    local v57 = Vector2.new(math.min(300, v53.AbsoluteSize.X), (math.min(300, v53.AbsoluteSize.Y)));
                    v53.CanvasPosition = v53.CanvasPosition + v57;
                    task.wait();
                    local v58 = (v53.CanvasPosition - l_CanvasPosition_0).Magnitude <= 2;
                    local v59 = v50.AbsolutePosition - l_AbsolutePosition_0;
                    v54 = v58 or v59.Magnitude > 2;
                end;
                for _ = 1, 2 do
                    local v61 = v53.AbsolutePosition + v53.AbsoluteSize / 2;
                    local v62 = v50.AbsolutePosition + v50.AbsoluteSize / 2 - v61;
                    if v62.Magnitude > 2 then
                        v53.CanvasPosition = v53.CanvasPosition + v62;
                        task.wait();
                    else
                        v52 = true;
                    end;
                    if v52 then
                        break;
                    end;
                end;
                if not v52 then
                    return;
                end;
            else
                v49:_centralizeInScrollingFrame(v50, v53.Parent);
            end;
            v52 = false;
            return;
        end;
    end;
end;
v5._scrollToFindInstance = function(_, v64, v65) --[[ Line: 217 ]] --[[ Name: _scrollToFindInstance ]]
    v64.CanvasPosition = Vector2.new(0, 0);
    local l_X_0 = v64.AbsoluteSize.X;
    local l_Y_0 = v64.AbsoluteSize.Y;
    local v68 = false;
    local v69 = nil;
    while true do
        if not v68 then
            task.wait(0.1);
            v69 = v65:getFirstInstance();
            if v69 then
                return v69;
            else
                local l_CanvasPosition_1 = v64.CanvasPosition;
                v64.CanvasPosition = v64.CanvasPosition + Vector2.new(math.min(l_X_0, 300), (math.min(l_Y_0, 300)));
                if (v64.CanvasPosition - l_CanvasPosition_1).Magnitude >= 2 then
                    v68 = false;
                else
                    v68 = true;
                end;
            end;
        else
            return nil;
        end;
    end;
end;
v5.centralizeWithInfiniteScrolling = function(v71) --[[ Line: 245 ]] --[[ Name: centralizeWithInfiniteScrolling ]]
    local v72, v73 = v71.path:getInstances();
    if #v72 > 0 then
        v71:centralizeInstance();
    end;
    local v74 = v71.path:copy();
    while v73 < #v74.data do
        table.remove(v74.data);
    end;
    local v75 = v74:getFirstInstance();
    local v76 = nil;
    while true do
        assert(v75 ~= nil, "Rhodium encountered an internal error");
        if v75:IsA("ScrollingFrame") then
            v76 = v75;
            break;
        else
            v75 = v75.Parent;
            if v75 == game then
                break;
            end;
        end;
    end;
    if v76 == nil then
        return;
    elseif v71:_scrollToFindInstance(v76, v71.path) == nil then
        return;
    else
        v71:_centralizeInScrollingFrame(v71:getRbxInstance());
        return;
    end;
end;
v5.setPluginWindow = function(v77) --[[ Line: 279 ]] --[[ Name: setPluginWindow ]]
    -- upvalues: v0 (copy)
    local l_FirstAncestorOfClass_0 = v77.rbxInstance:FindFirstAncestorOfClass("DockWidgetPluginGui");
    v0.setCurrentWindow(l_FirstAncestorOfClass_0);
end;
v5.click = function(v79, v80) --[[ Line: 284 ]] --[[ Name: click ]]
    -- upvalues: v0 (copy)
    v79:centralize();
    v79:setPluginWindow();
    v80 = v80 or 1;
    v0.Mouse.multiClick(v79:getAnchor(), v80);
end;
v5.rightClick = function(v81) --[[ Line: 292 ]] --[[ Name: rightClick ]]
    -- upvalues: v0 (copy)
    v81:centralize();
    v81:setPluginWindow();
    v0.Mouse.rightClick(v81:getAnchor());
end;
v5.mouseWheel = function(v82, v83) --[[ Line: 299 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v0 (copy)
    v82:centralize();
    v0.Mouse.mouseWheel(v82:getAnchor(), v83);
end;
v5.mouseDrag = function(v84, v85, v86, v87) --[[ Line: 304 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v0 (copy)
    v84:centralize();
    local v88 = v84:getAnchor() + Vector2.new(v85, v86);
    v0.Mouse.mouseDrag(v84:getAnchor(), v88, v87);
end;
v5.mouseDragTo = function(v89, v90, v91) --[[ Line: 311 ]] --[[ Name: mouseDragTo ]]
    -- upvalues: v0 (copy)
    v89:centralize();
    v0.Mouse.mouseDrag(v89:getAnchor(), v90, v91);
end;
v5.sendKey = function(v92, v93) --[[ Line: 316 ]] --[[ Name: sendKey ]]
    -- upvalues: v0 (copy)
    v92:setPluginWindow();
    v0.Keyboard.hitKey(v93);
end;
v5.sendText = function(v94, v95) --[[ Line: 321 ]] --[[ Name: sendText ]]
    -- upvalues: v0 (copy)
    v94:click();
    task.wait(0);
    v0.Text.sendText(v95);
end;
v5.tap = function(v96) --[[ Line: 327 ]] --[[ Name: tap ]]
    -- upvalues: v0 (copy)
    v96:centralize();
    v0.Touch.tap(v96:getAnchor());
end;
v5.touchScroll = function(v97, v98, v99, v100, v101) --[[ Line: 332 ]] --[[ Name: touchScroll ]]
    -- upvalues: v0 (copy)
    v97:centralize();
    v0.Touch.touchScroll(v97:getAnchor(), v98, v99, v100, true, v101);
end;
return v5;