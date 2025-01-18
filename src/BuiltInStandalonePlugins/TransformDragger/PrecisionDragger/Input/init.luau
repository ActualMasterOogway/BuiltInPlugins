local v0 = {
    Key = {
        MOUSE_BUTTON1 = 0, 
        MOUSE_BUTTON2 = 1
    }, 
    State = {
        UP = nil, 
        DOWN = true
    }
};
local v1 = {};
local v2 = nil;
local function v3() --[[ Line: 19 ]] --[[ Name: getMouse ]]
    -- upvalues: v2 (ref)
    return v2;
end;
local function v5(v4) --[[ Line: 22 ]] --[[ Name: setMouse ]]
    -- upvalues: v2 (ref)
    v2 = v4;
end;
local function v7(v6) --[[ Line: 26 ]] --[[ Name: getButtonState ]]
    -- upvalues: v1 (copy)
    return v1[v6];
end;
local function v10(v8, v9) --[[ Line: 30 ]] --[[ Name: setButtonState ]]
    -- upvalues: v1 (copy)
    v1[v8] = v9;
end;
local function v11() --[[ Line: 34 ]] --[[ Name: getMouseLocation ]]
    -- upvalues: v2 (ref)
    if not v2 then
        return nil;
    else
        return v2.Origin.p;
    end;
end;
return {
    setMouse = v5, 
    getMouse = v3, 
    Enum = v0, 
    getButtonState = v7, 
    setButtonState = v10, 
    getMouseLocation = v11
};