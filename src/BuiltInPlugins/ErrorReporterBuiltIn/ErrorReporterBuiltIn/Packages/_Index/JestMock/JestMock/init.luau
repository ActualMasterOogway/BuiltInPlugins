local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_Symbol_0 = v1.Symbol;
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: l_Set_0 (copy), v5 (copy)
    local v6 = {
        _mockState = {}, 
        _mockConfigRegistry = {}, 
        _invocationCallCounter = 1, 
        _spyState = l_Set_0.new()
    };
    setmetatable(v6, v5);
    return v6;
end;
v5._ensureMockConfig = function(v7, v8) --[[ Line: 86 ]] --[[ Name: _ensureMockConfig ]]
    local v9 = v7._mockConfigRegistry[v8];
    if not v9 then
        v9 = v7:_defaultMockConfig();
        v7._mockConfigRegistry[v8] = v9;
    end;
    return v9;
end;
v5._ensureMockState = function(v10, v11) --[[ Line: 97 ]] --[[ Name: _ensureMockState ]]
    local v12 = v10._mockState[v11];
    if not v12 then
        v12 = v10:_defaultMockState();
        v10._mockState[v11] = v12;
    end;
    return v12;
end;
v5._defaultMockConfig = function(_) --[[ Line: 107 ]] --[[ Name: _defaultMockConfig ]]
    return {
        mockImpl = nil, 
        mockName = "jest.fn()", 
        specificMockImpls = {}, 
        specificReturnValues = {}
    };
end;
v5._defaultMockState = function(_) --[[ Line: 116 ]] --[[ Name: _defaultMockState ]]
    return {
        calls = {}, 
        instances = {}, 
        invocationCallOrder = {}, 
        results = {}
    };
end;
v5._makeComponent = function(v15, v16, v17) --[[ Line: 125 ]] --[[ Name: _makeComponent ]]
    -- upvalues: l_Symbol_0 (copy), l_Array_0 (copy)
    if v16.type == "function" then
        local function v28(v18, ...) --[[ Line: 132 ]]
            -- upvalues: v15 (copy), l_Symbol_0 (ref), v15 (copy), l_Array_0 (ref)
            local v19 = {
                ...
            };
            local v20 = v15:_ensureMockState(v18);
            local v21 = v15:_ensureMockConfig(v18);
            table.insert(v20.instances, v18);
            for v22 = 1, select("#", ...) do
                if v19[v22] == nil then
                    v19[v22] = l_Symbol_0.for_("$$nil");
                end;
            end;
            table.insert(v20.calls, v19);
            local v23 = {
                type = "incomplete", 
                value = nil
            };
            table.insert(v20.results, v23);
            table.insert(v20.invocationCallOrder, v15._invocationCallCounter);
            v15._invocationCallCounter = v15._invocationCallCounter + 1;
            local l_status_0, l_result_0 = pcall(function(v24) --[[ Line: 165 ]]
                -- upvalues: l_Array_0 (ref), v21 (copy)
                local v25 = l_Array_0.shift(v21.specificMockImpls);
                if v25 == nil then
                    v25 = v21.mockImpl;
                end;
                if v25 then
                    return v25(unpack(v24));
                else
                    return nil;
                end;
            end, {
                ...
            });
            if not l_status_0 then
                v23.type = "throw";
                v23.value = l_result_0;
                error(l_result_0);
            end;
            v23.type = "return";
            v23.value = l_result_0;
            return l_result_0;
        end;
        local v29 = {};
        setmetatable(v29, {
            __call = v28
        });
        v29._isMockFunction = true;
        v29.getMockImplementation = function() --[[ Line: 198 ]]
            -- upvalues: v15 (copy), v29 (copy)
            return v15:_ensureMockConfig(v29).mockImpl;
        end;
        if typeof(v17) == "function" then
            v15._spyState.add(v17);
        end;
        v15._mockState[v29] = v15._defaultMockState();
        v15._mockConfigRegistry[v29] = v15._defaultMockConfig();
        v29.mock = setmetatable({}, {
            __index = function(_, v31) --[[ Line: 210 ]] --[[ Name: __index ]]
                -- upvalues: v15 (copy), v29 (copy)
                return v15:_ensureMockState(v29)[v31];
            end
        });
        v29.mockClear = function() --[[ Line: 223 ]]
            -- upvalues: v15 (copy), v29 (copy)
            v15._mockState[v29] = nil;
            return v29;
        end;
        v29.mockReset = function() --[[ Line: 228 ]]
            -- upvalues: v29 (copy), v15 (copy)
            v29.mockClear();
            v15._mockConfigRegistry[v29] = nil;
            return v29;
        end;
        v29.mockRestore = function() --[[ Line: 234 ]]
            -- upvalues: v29 (copy), v17 (copy)
            v29.mockReset();
            if v17 then
                return v17();
            else
                return nil;
            end;
        end;
        v29.mockImplementationOnce = function(v32) --[[ Line: 245 ]]
            -- upvalues: v15 (copy), v29 (copy)
            table.insert(v15:_ensureMockConfig(v29).specificMockImpls, v32);
            return v29;
        end;
        v29.mockImplementation = function(v33) --[[ Line: 253 ]]
            -- upvalues: v15 (copy), v29 (copy)
            v15:_ensureMockConfig(v29).mockImpl = v33;
            return v29;
        end;
        v29.mockReturnValueOnce = function(v34) --[[ Line: 260 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementationOnce(function() --[[ Line: 262 ]]
                -- upvalues: v34 (copy)
                return v34;
            end);
        end;
        v29.mockReturnValue = function(v35) --[[ Line: 267 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementation(function() --[[ Line: 269 ]]
                -- upvalues: v35 (copy)
                return v35;
            end);
        end;
        v29.mockReturnThis = function() --[[ Line: 272 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementation(function(_) --[[ Line: 273 ]]
                -- upvalues: v29 (ref)
                return v29;
            end);
        end;
        v29.mockName = function(v37) --[[ Line: 278 ]]
            -- upvalues: v15 (copy), v29 (copy)
            if v37 then
                v15:_ensureMockConfig(v29).mockName = v37;
            end;
            return v29;
        end;
        v29.getMockName = function() --[[ Line: 286 ]]
            -- upvalues: v15 (copy), v29 (copy)
            return v15:_ensureMockConfig(v29).mockName or "jest.fn()";
        end;
        v29.new = function(...) --[[ Line: 293 ]]
            -- upvalues: v29 (copy)
            v29(...);
            return v29;
        end;
        if v16.mockImpl then
            v29.mockImplementation(v16.mockImpl);
        end;
        return v29;
    else
        error("Call to _makeComponent with non-function");
        return;
    end;
end;
v5._createMockFunction = function(_, v39, v40) --[[ Line: 308 ]] --[[ Name: _createMockFunction ]]
    if not v39.name then
        return v40;
    else
        return v40;
    end;
end;
v5.isMockFunction = function(_, v42) --[[ Line: 321 ]] --[[ Name: isMockFunction ]]
    local v43 = false;
    if typeof(v42) == "table" then
        v43 = v42._isMockFunction == true;
    end;
    return v43;
end;
v5.fn = function(v44, v45) --[[ Line: 327 ]] --[[ Name: fn ]]
    local v46 = v44:_makeComponent({
        length = 0, 
        type = "function"
    });
    if v45 then
        v46.mockImplementation(v45);
    end;
    return v46, function(...) --[[ Line: 336 ]] --[[ Name: mockFn ]]
        -- upvalues: v46 (copy)
        return getmetatable(v46).__call(v46, ...);
    end;
end;
v5.clearAllMocks = function(v47) --[[ Line: 343 ]] --[[ Name: clearAllMocks ]]
    v47._mockState = {};
end;
v5.resetAllMocks = function(v48) --[[ Line: 347 ]] --[[ Name: resetAllMocks ]]
    v48._mockConfigRegistry = {};
    v48._mockState = {};
end;
v5.restoreAllMocks = function(v49) --[[ Line: 352 ]] --[[ Name: restoreAllMocks ]]
    -- upvalues: l_Set_0 (copy)
    for v50, _ in ipairs(v49._spyState) do
        v50();
    end;
    v49._spyState = l_Set_0.new();
end;
return v5;