local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local v3 = {};
local v4 = {
    print = print, 
    warn = warn, 
    math = {
        random = math.random
    }
};
v3.__index = v3;
v3.new = function() --[[ Line: 63 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v5 = setmetatable({}, v3);
    v5.automocks = v5:_createGlobalAutomocks();
    v5.envObject = v5:_createGlobalEnv(v5.automocks);
    v5.currentlyMocked = false;
    return v5;
end;
v3.isMockGlobalLibrary = function(_, v7) --[[ Line: 73 ]] --[[ Name: isMockGlobalLibrary ]]
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = v7._isMockGlobalLibrary == true;
    end;
    return v8;
end;
v3._createGlobalAutomocks = function(_) --[[ Line: 77 ]] --[[ Name: _createGlobalAutomocks ]]
    -- upvalues: v4 (copy)
    local function v10(v11, v12) --[[ Line: 78 ]] --[[ Name: implement ]]
        -- upvalues: v10 (copy)
        for v13, v14 in v11 do
            if typeof(v14) == "function" then
                v12[v13] = {
                    _isGlobalAutomockFn = true, 
                    _maybeMock = nil, 
                    _maybeUnmocked = nil
                };
            elseif typeof(v14) == "table" then
                local v15 = {};
                v10(v14, v15);
                v12[v13] = v15;
            else
                error("Unexpected mockable global type - this is an internal bug");
            end;
        end;
    end;
    local v16 = {};
    v10(v4, v16);
    return v16;
end;
v3._createGlobalEnv = function(_, v18) --[[ Line: 100 ]] --[[ Name: _createGlobalEnv ]]
    local function v19(v20, v21) --[[ Line: 101 ]] --[[ Name: makeSentinelForLibrary ]]
        -- upvalues: v19 (copy)
        local v22 = {
            _isMockGlobalLibrary = true, 
            _automocksRef = v20
        };
        for v23, v24 in v20 do
            if typeof(v24) == "table" and not v24._isGlobalAutomockFn then
                local v25 = table.clone(v21);
                table.insert(v25, v23);
                v22[v23] = v19(v24, v25);
            end;
        end;
        setmetatable(v22, {
            __index = function(_, v27) --[[ Line: 120 ]] --[[ Name: __index ]]
                -- upvalues: v20 (copy), v21 (copy)
                if typeof(v27) ~= "string" then
                    error((("Cannot index globalEnv with %* (expected string)"):format(v27)));
                end;
                if string.sub(v27, 1, 2) == "$$" then
                    return nil;
                else
                    local v28 = v20[v27];
                    if typeof(v28) == "table" and v28._isGlobalAutomockFn then
                        return v28._maybeUnmocked or error("globalEnv has not been initialised by Jest here");
                    else
                        local v29 = "";
                        for _, v31 in v21 do
                            v29 = v29 .. v31 .. ".";
                        end;
                        v29 = v29 .. v27;
                        error((("Jest does not yet support mocking the %* global."):format(v29)));
                        return;
                    end;
                end;
            end
        });
        return table.freeze(v22);
    end;
    return (v19(v18, {}));
end;
v2.GlobalMocker = v3;
v2.MOCKABLE_GLOBALS = v4;
return v2;