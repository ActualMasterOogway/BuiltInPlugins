local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_Symbol_0 = v1.Symbol;
local v5 = {};
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 112 ]] --[[ Name: new ]]
    -- upvalues: l_Set_0 (copy), v6 (copy)
    local v7 = {
        _mockState = {}, 
        _mockConfigRegistry = {}, 
        _invocationCallCounter = 1, 
        _spyState = l_Set_0.new()
    };
    setmetatable(v7, v6);
    return v7;
end;
v6._ensureMockConfig = function(v8, v9) --[[ Line: 127 ]] --[[ Name: _ensureMockConfig ]]
    local v10 = v8._mockConfigRegistry[v9];
    if not v10 then
        v10 = v8:_defaultMockConfig();
        v8._mockConfigRegistry[v9] = v10;
    end;
    return v10;
end;
v6._ensureMockState = function(v11, v12) --[[ Line: 138 ]] --[[ Name: _ensureMockState ]]
    local v13 = v11._mockState[v12];
    if not v13 then
        v13 = v11:_defaultMockState();
        v11._mockState[v12] = v13;
    end;
    return v13;
end;
v6._defaultMockConfig = function(_) --[[ Line: 148 ]] --[[ Name: _defaultMockConfig ]]
    return {
        mockImpl = nil, 
        mockName = "jest.fn()", 
        specificMockImpls = {}, 
        specificReturnValues = {}
    };
end;
v6._defaultMockState = function(_) --[[ Line: 157 ]] --[[ Name: _defaultMockState ]]
    return {
        calls = {}, 
        instances = {}, 
        invocationCallOrder = {}, 
        results = {}
    };
end;
v6._makeComponent = function(v16, v17, v18) --[[ Line: 166 ]] --[[ Name: _makeComponent ]]
    -- upvalues: l_Symbol_0 (copy), l_Array_0 (copy)
    if v17.type == "function" then
        local v29 = setmetatable({}, {
            __call = function(v19, ...) --[[ Line: 170 ]]
                -- upvalues: v16 (copy), l_Symbol_0 (ref), v16 (copy), l_Array_0 (ref)
                local v20 = {
                    ...
                };
                local v21 = v16:_ensureMockState(v19);
                local v22 = v16:_ensureMockConfig(v19);
                table.insert(v21.instances, v19);
                for v23 = 1, select("#", ...) do
                    if v20[v23] == nil then
                        v20[v23] = l_Symbol_0.for_("$$nil");
                    end;
                end;
                table.insert(v21.calls, v20);
                local v24 = {
                    type = "incomplete", 
                    value = nil
                };
                table.insert(v21.results, v24);
                table.insert(v21.invocationCallOrder, v16._invocationCallCounter);
                v16._invocationCallCounter = v16._invocationCallCounter + 1;
                local l_status_0, l_result_0 = pcall(function(v25) --[[ Line: 203 ]]
                    -- upvalues: l_Array_0 (ref), v22 (copy)
                    local v26 = l_Array_0.shift(v22.specificMockImpls);
                    if v26 == nil then
                        v26 = v22.mockImpl;
                    end;
                    if v26 then
                        return v26(unpack(v25));
                    else
                        return nil;
                    end;
                end, {
                    ...
                });
                if not l_status_0 then
                    v24.type = "throw";
                    v24.value = l_result_0;
                    error(l_result_0);
                end;
                v24.type = "return";
                v24.value = l_result_0;
                return l_result_0;
            end
        });
        v29._isMockFunction = true;
        v29.getMockImplementation = function() --[[ Line: 235 ]]
            -- upvalues: v16 (copy), v29 (copy)
            return v16:_ensureMockConfig(v29).mockImpl;
        end;
        if typeof(v18) == "function" then
            v16._spyState.add(v18);
        end;
        v16._mockState[v29] = v16._defaultMockState();
        v16._mockConfigRegistry[v29] = v16._defaultMockConfig();
        v29.mock = setmetatable({}, {
            __index = function(_, v31) --[[ Line: 247 ]] --[[ Name: __index ]]
                -- upvalues: v16 (copy), v29 (copy)
                return v16:_ensureMockState(v29)[v31];
            end
        });
        v29.mockClear = function() --[[ Line: 259 ]]
            -- upvalues: v16 (copy), v29 (copy)
            v16._mockState[v29] = nil;
            return v29;
        end;
        v29.mockReset = function() --[[ Line: 264 ]]
            -- upvalues: v29 (copy), v16 (copy)
            v29.mockClear();
            v16._mockConfigRegistry[v29] = nil;
            return v29;
        end;
        v29.mockRestore = function() --[[ Line: 270 ]]
            -- upvalues: v29 (copy), v18 (copy)
            v29.mockReset();
            if v18 then
                return v18();
            else
                return nil;
            end;
        end;
        v29.mockImplementationOnce = function(v32) --[[ Line: 281 ]]
            -- upvalues: v16 (copy), v29 (copy)
            table.insert(v16:_ensureMockConfig(v29).specificMockImpls, v32);
            return v29;
        end;
        v29.mockImplementation = function(v33) --[[ Line: 289 ]]
            -- upvalues: v16 (copy), v29 (copy)
            v16:_ensureMockConfig(v29).mockImpl = v33;
            return v29;
        end;
        v29.mockReturnValueOnce = function(v34) --[[ Line: 296 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementationOnce(function() --[[ Line: 298 ]]
                -- upvalues: v34 (copy)
                return v34;
            end);
        end;
        v29.mockReturnValue = function(v35) --[[ Line: 305 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementation(function() --[[ Line: 307 ]]
                -- upvalues: v35 (copy)
                return v35;
            end);
        end;
        v29.mockReturnThis = function() --[[ Line: 312 ]]
            -- upvalues: v29 (copy)
            return v29.mockImplementation(function(_) --[[ Line: 313 ]]
                -- upvalues: v29 (ref)
                return v29;
            end);
        end;
        v29.mockName = function(v37) --[[ Line: 318 ]]
            -- upvalues: v16 (copy), v29 (copy)
            if v37 then
                v16:_ensureMockConfig(v29).mockName = v37;
            end;
            return v29;
        end;
        v29.getMockName = function() --[[ Line: 326 ]]
            -- upvalues: v16 (copy), v29 (copy)
            return v16:_ensureMockConfig(v29).mockName or "jest.fn()";
        end;
        v29.new = function(...) --[[ Line: 333 ]]
            -- upvalues: v29 (copy)
            v29(...);
            return v29;
        end;
        if v17.mockImpl then
            v29.mockImplementation(v17.mockImpl);
        end;
        return v29;
    else
        error("Call to _makeComponent with non-function");
        return;
    end;
end;
v6._createMockFunction = function(_, v39, v40) --[[ Line: 348 ]] --[[ Name: _createMockFunction ]]
    if not v39.name then
        return v40;
    else
        return v40;
    end;
end;
v6.isMockFunction = function(_, v42) --[[ Line: 358 ]] --[[ Name: isMockFunction ]]
    local v43 = false;
    if typeof(v42) == "table" then
        v43 = v42._isMockFunction == true;
    end;
    return v43;
end;
v6.fn = function(v44, v45) --[[ Line: 363 ]] --[[ Name: fn ]]
    local v46 = v44:_makeComponent({
        length = 0, 
        type = "function"
    });
    if v45 then
        v46.mockImplementation(v45);
    end;
    return v46, function(...) --[[ Line: 372 ]] --[[ Name: mockFn ]]
        -- upvalues: v46 (copy)
        return getmetatable(v46).__call(v46, ...);
    end;
end;
v6.clearAllMocks = function(v47) --[[ Line: 379 ]] --[[ Name: clearAllMocks ]]
    v47._mockState = {};
end;
v6.resetAllMocks = function(v48) --[[ Line: 383 ]] --[[ Name: resetAllMocks ]]
    v48._mockConfigRegistry = {};
    v48._mockState = {};
end;
v6.restoreAllMocks = function(v49) --[[ Line: 388 ]] --[[ Name: restoreAllMocks ]]
    -- upvalues: l_Set_0 (copy)
    for v50, _ in ipairs(v49._spyState) do
        v50();
    end;
    v49._spyState = l_Set_0.new();
end;
v6.mocked = function(_, v53, _) --[[ Line: 403 ]] --[[ Name: mocked ]]
    return v53;
end;
v5.ModuleMocker = v6;
local v55 = v6.new();
v5.fn = v55.fn;
v5.mocked = v55.mocked;
return v5;