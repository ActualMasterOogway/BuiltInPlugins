local _ = require(script.Parent.FFlag);
local v1 = require(script.Parent.CoreGuiManager);
local v2 = nil;
local v3 = false;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = {};
local v8 = Color3.new(0.7019, 0.7019, 0.7019);
local function _(v9, v10, v11) --[[ Line: 25 ]] --[[ Name: createFrame ]]
    local v12 = Instance.new("Frame", v9);
    v12.BorderSizePixel = v10;
    v12.BackgroundColor3 = v11;
    return v12;
end;
local function v18() --[[ Line: 32 ]] --[[ Name: createRubberband ]]
    -- upvalues: v6 (ref), v1 (copy), v7 (ref), v8 (copy)
    v6 = Instance.new("ScreenGui", v1:findOrCreateFolder("Rubberband"));
    local l_v7_0 = v7;
    local l_v6_0 = v6;
    local l_v8_0 = v8;
    local v17 = Instance.new("Frame", l_v6_0);
    v17.BorderSizePixel = 0;
    v17.BackgroundColor3 = l_v8_0;
    l_v7_0[1] = v17;
    l_v7_0 = v7;
    l_v6_0 = v6;
    l_v8_0 = v8;
    v17 = Instance.new("Frame", l_v6_0);
    v17.BorderSizePixel = 0;
    v17.BackgroundColor3 = l_v8_0;
    l_v7_0[2] = v17;
    l_v7_0 = v7;
    l_v6_0 = v6;
    l_v8_0 = v8;
    v17 = Instance.new("Frame", l_v6_0);
    v17.BorderSizePixel = 0;
    v17.BackgroundColor3 = l_v8_0;
    l_v7_0[3] = v17;
    l_v7_0 = v7;
    l_v6_0 = v6;
    l_v8_0 = v8;
    v17 = Instance.new("Frame", l_v6_0);
    v17.BorderSizePixel = 0;
    v17.BackgroundColor3 = l_v8_0;
    l_v7_0[4] = v17;
end;
return {
    startRubberbandDrag = function(_, v20) --[[ Line: 42 ]] --[[ Name: startRubberbandDrag ]]
        -- upvalues: v3 (ref), v4 (ref), v5 (ref), v6 (ref), v18 (copy), v2 (ref)
        v3 = true;
        v4 = v20;
        v5 = v20;
        if not v6 then
            v18();
        end;
        v2:onRubberbandBegan(v20);
    end, 
    updateRubberband = function(_, v22) --[[ Line: 54 ]] --[[ Name: updateRubberband ]]
        -- upvalues: v3 (ref), v5 (ref), v4 (ref), v7 (ref)
        if not v3 then
            return;
        else
            v5 = v22;
            local v23 = v5 - v4;
            v7[1].Size = UDim2.new(0, 1, 0, v23.Y + 1);
            v7[2].Size = UDim2.new(0, 1, 0, v23.Y + 1);
            v7[3].Size = UDim2.new(0, v23.X + 1, 0, 1);
            v7[4].Size = UDim2.new(0, v23.X + 1, 0, 1);
            v7[1].Position = UDim2.new(0, v4.X, 0, v4.Y);
            v7[2].Position = UDim2.new(0, v4.X + v23.X, 0, v4.Y);
            v7[3].Position = UDim2.new(0, v4.X, 0, v4.Y);
            v7[4].Position = UDim2.new(0, v4.X, 0, v4.Y + v23.Y);
            return;
        end;
    end, 
    finishRubberbandDrag = function(_) --[[ Line: 73 ]] --[[ Name: finishRubberbandDrag ]]
        -- upvalues: v3 (ref), v4 (ref), v6 (ref), v7 (ref), v2 (ref)
        if not v3 then
            return;
        else
            v3 = false;
            v4 = nil;
            if v6 then
                v6:Destroy();
                v6 = nil;
                v7 = {};
            end;
            v2:onRubberbandEnded();
            return;
        end;
    end, 
    isDragInProgress = function(_) --[[ Line: 90 ]] --[[ Name: isDragInProgress ]]
        -- upvalues: v3 (ref)
        return v3;
    end, 
    getBounds = function(_) --[[ Line: 94 ]] --[[ Name: getBounds ]]
        -- upvalues: v4 (ref), v5 (ref)
        return v4, v5;
    end, 
    setActionMediator = function(_, v28) --[[ Line: 98 ]] --[[ Name: setActionMediator ]]
        -- upvalues: v2 (ref)
        v2 = v28;
    end
};