local v0 = require(script.Parent.VirtualInput);
local v1 = require(script.Parent.XPath);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    if type(v3) == "string" then
        v4.path = v1.new(v3);
    elseif type(v3) == "table" and v3.__type == "XPath" then
        v4.path = v3;
    elseif type(v3) == "userdata" then
        v4.path = v1.new(v3);
        v4.rbxInstance = v3;
    else
        error("invalid parameter for element");
    end;
    setmetatable(v4, v2);
    v4.isInScrollingFrame = v4:_scrollingFrames(v4.rbxInstance) ~= 0;
    return v4;
end;
v2.getAttribute = function(v5, v6) --[[ Line: 28 ]] --[[ Name: getAttribute ]]
    return v5:getRbxInstance()[v6];
end;
v2.getLocation = function(v7) --[[ Line: 32 ]] --[[ Name: getLocation ]]
    return v7:getRbxInstance().AbsolutePosition;
end;
v2.getRect = function(v8) --[[ Line: 36 ]] --[[ Name: getRect ]]
    local v9 = v8:getLocation();
    local v10 = v8:getSize() + v9;
    return Rect.new(v9.x, v9.y, v10.x, v10.y);
end;
v2.getSize = function(v11) --[[ Line: 42 ]] --[[ Name: getSize ]]
    return v11:getRbxInstance().AbsoluteSize;
end;
v2.getCenter = function(v12) --[[ Line: 46 ]] --[[ Name: getCenter ]]
    return v12:getLocation() + v12:getSize() / 2;
end;
v2.getText = function(v13) --[[ Line: 50 ]] --[[ Name: getText ]]
    return v13:getRbxInstance().Text;
end;
v2.getAnchor = function(v14) --[[ Line: 54 ]] --[[ Name: getAnchor ]]
    return v14:getLocation() + v14.anchor;
end;
v2.setAnchor = function(v15, v16, v17) --[[ Line: 59 ]] --[[ Name: setAnchor ]]
    if v15:getSize().x < v16 or v15:getSize().y < v17 or v16 < 0 or v17 < 0 then
        error("Attempt to set anchor beyond element's bounds");
        return;
    else
        v15.anchor = Vector2.new(v16, v17);
        return;
    end;
end;
v2.isDisplayed = function(v18) --[[ Line: 67 ]] --[[ Name: isDisplayed ]]
    return v18:getRbxInstance().Visible;
end;
v2.isSelected = function(v19) --[[ Line: 71 ]] --[[ Name: isSelected ]]
    return v19:getRbxInstance().Selected;
end;
v2.getRbxInstance = function(v20) --[[ Line: 75 ]] --[[ Name: getRbxInstance ]]
    return v20:waitForRbxInstance(v20.path.waitDelay, v20.path.waitTimeout);
end;
v2.waitForRbxInstance = function(v21, v22, v23) --[[ Line: 79 ]] --[[ Name: waitForRbxInstance ]]
    if v21.rbxInstance == nil and v21.path ~= nil then
        v21.path:setWait(v22, v23);
        v21.rbxInstance = v21.path:waitForFirstInstance();
    end;
    if v21.rbxInstance and not v21.anchor then
        if pcall(function() --[[ Line: 86 ]]
            -- upvalues: v21 (copy)
            local _ = v21.rbxInstance.AbsoluteSize;
        end) then
            v21.anchor = v21.rbxInstance.AbsoluteSize / 2;
        else
            v21.anchor = nil;
        end;
    end;
    return v21.rbxInstance;
end;
v2._override = function(v25, v26) --[[ Line: 96 ]] --[[ Name: _override ]]
    for v27, v28 in pairs(v26) do
        if not v27:find("^_") then
            v25[v27] = v28;
        end;
    end;
end;
v2.centralizeInstance = function(v29) --[[ Line: 104 ]] --[[ Name: centralizeInstance ]]
    v29:_centralizeInScrollingFrame(v29:getRbxInstance());
end;
v2.centralize = function(v30) --[[ Line: 108 ]] --[[ Name: centralize ]]
    if v30:getRbxInstance() then
        v30:centralizeInstance();
        return;
    else
        v30:centralizeWithInfiniteScrolling();
        return;
    end;
end;
v2._scrollingFrames = function(v31, v32) --[[ Line: 117 ]] --[[ Name: _scrollingFrames ]]
    if v32 == nil or v32 == game then
        return 0;
    else
        local v33 = v31:_scrollingFrames(v32.Parent);
        if v32.ClassName == "ScrollingFrame" then
            v33 = v33 + 1;
        end;
        return v33;
    end;
end;
v2._centralizeInScrollingFrame = function(v34, v35, v36) --[[ Line: 124 ]] --[[ Name: _centralizeInScrollingFrame ]]
    local v37 = false;
    if v35 == game then
        return;
    else
        v36 = v36 or v35.Parent;
        if v36 == game then
            return;
        else
            if v36.ClassName == "ScrollingFrame" then
                v34:_centralizeInScrollingFrame(v36, v36.Parent);
                local v38 = false;
                while not v38 do
                    local l_AbsolutePosition_0 = v35.AbsolutePosition;
                    local l_CanvasPosition_0 = v36.CanvasPosition;
                    local v41 = Vector2.new(math.min(300, v36.AbsoluteSize.X), (math.min(300, v36.AbsoluteSize.Y)));
                    v36.CanvasPosition = v36.CanvasPosition + v41;
                    wait();
                    local v42 = (v36.CanvasPosition - l_CanvasPosition_0).Magnitude <= 2;
                    local v43 = v35.AbsolutePosition - l_AbsolutePosition_0;
                    v38 = v42 or v43.Magnitude > 2;
                end;
                for _ = 1, 2 do
                    local v45 = v36.AbsolutePosition + v36.AbsoluteSize / 2;
                    local v46 = v35.AbsolutePosition + v35.AbsoluteSize / 2 - v45;
                    if v46.Magnitude > 2 then
                        v36.CanvasPosition = v36.CanvasPosition + v46;
                        wait();
                    else
                        v37 = true;
                    end;
                    if v37 then
                        break;
                    end;
                end;
                if not v37 then
                    return;
                end;
            else
                v34:_centralizeInScrollingFrame(v35, v36.Parent);
            end;
            v37 = false;
            return;
        end;
    end;
end;
v2._scrollToFindInstance = function(_, v48, v49) --[[ Line: 165 ]] --[[ Name: _scrollToFindInstance ]]
    v48.CanvasPosition = Vector2.new(0, 0);
    local l_X_0 = v48.AbsoluteSize.X;
    local l_Y_0 = v48.AbsoluteSize.Y;
    local v52 = false;
    local v53 = nil;
    while true do
        if not v52 then
            wait(0.1);
            v53 = v49:getFirstInstance();
            if v53 then
                return v53;
            else
                local l_CanvasPosition_1 = v48.CanvasPosition;
                v48.CanvasPosition = v48.CanvasPosition + Vector2.new(math.min(l_X_0, 300), (math.min(l_Y_0, 300)));
                if (v48.CanvasPosition - l_CanvasPosition_1).Magnitude >= 2 then
                    v52 = false;
                else
                    v52 = true;
                end;
            end;
        else
            return nil;
        end;
    end;
end;
v2.centralizeWithInfiniteScrolling = function(v55) --[[ Line: 191 ]] --[[ Name: centralizeWithInfiniteScrolling ]]
    local v56, v57 = v55.path:getInstances();
    if #v56 > 0 then
        v55:centralizeInstance();
    end;
    local v58 = v55.path:copy();
    while v57 < #v58.data do
        table.remove(v58.data);
    end;
    local v59 = v58:getFirstInstance();
    local v60 = nil;
    while true do
        if v59.ClassName == "ScrollingFrame" then
            v60 = v59;
            break;
        else
            v59 = v59.Parent;
            if v59 == game then
                break;
            end;
        end;
    end;
    if v60 == nil then
        return;
    elseif v55:_scrollToFindInstance(v60, v55.path) == nil then
        return;
    else
        v55:_centralizeInScrollingFrame(v55:getRbxInstance());
        return;
    end;
end;
v2.setPluginWindow = function(v61) --[[ Line: 215 ]] --[[ Name: setPluginWindow ]]
    -- upvalues: v0 (copy)
    local l_FirstAncestorOfClass_0 = v61.rbxInstance:FindFirstAncestorOfClass("DockWidgetPluginGui");
    v0.setCurrentWindow(l_FirstAncestorOfClass_0);
end;
v2.click = function(v63, v64) --[[ Line: 220 ]] --[[ Name: click ]]
    -- upvalues: v0 (copy)
    v63:centralize();
    v63:setPluginWindow();
    v64 = v64 or 1;
    v0.Mouse.multiClick(v63:getAnchor(), v64);
end;
v2.rightClick = function(v65) --[[ Line: 228 ]] --[[ Name: rightClick ]]
    -- upvalues: v0 (copy)
    v65:centralize();
    v65:setPluginWindow();
    v0.Mouse.rightClick(v65:getAnchor());
end;
v2.mouseWheel = function(v66, v67) --[[ Line: 235 ]] --[[ Name: mouseWheel ]]
    -- upvalues: v0 (copy)
    v66:centralize();
    v0.Mouse.mouseWheel(v66:getAnchor(), v67);
end;
v2.mouseDrag = function(v68, v69, v70, v71) --[[ Line: 240 ]] --[[ Name: mouseDrag ]]
    -- upvalues: v0 (copy)
    v68:centralize();
    local v72 = v68:getAnchor() + Vector2.new(v69, v70);
    v0.Mouse.mouseDrag(v68:getAnchor(), v72, v71, true);
end;
v2.mouseDragTo = function(v73, v74, v75) --[[ Line: 246 ]] --[[ Name: mouseDragTo ]]
    -- upvalues: v0 (copy)
    v73:centralize();
    v0.Mouse.mouseDrag(v73:getAnchor(), v74, v75, true);
end;
v2.sendKey = function(v76, v77) --[[ Line: 251 ]] --[[ Name: sendKey ]]
    -- upvalues: v0 (copy)
    v76:setPluginWindow();
    v0.Keyboard.hitKey(v77);
end;
v2.sendText = function(v78, v79) --[[ Line: 256 ]] --[[ Name: sendText ]]
    -- upvalues: v0 (copy)
    v78:click();
    wait(0);
    v0.Text.sendText(v79);
end;
v2.tap = function(v80) --[[ Line: 262 ]] --[[ Name: tap ]]
    -- upvalues: v0 (copy)
    v80:centralize();
    v0.Touch.tap(v80:getAnchor());
end;
v2.touchScroll = function(v81, v82, v83, v84, v85) --[[ Line: 267 ]] --[[ Name: touchScroll ]]
    -- upvalues: v0 (copy)
    v81:centralize();
    v0.Touch.touchScroll(v81:getAnchor(), v82, v83, v84, true, v85);
end;
return v2;