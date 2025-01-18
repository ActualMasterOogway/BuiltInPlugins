local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Set_0 = v1.Set;
local l_Symbol_0 = v1.Symbol;
local l_GlobalMocker_0 = require(l_Parent_0.JestMockGenv).GlobalMocker;
local v8 = {};
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 141 ]] --[[ Name: new ]]
    -- upvalues: l_Set_0 (copy), v9 (copy)
    local v10 = {
        _mockState = {}, 
        _mockConfigRegistry = {}, 
        _invocationCallCounter = 1, 
        _spyState = l_Set_0.new()
    };
    setmetatable(v10, v9);
    return v10;
end;
v9._ensureMockConfig = function(v11, v12) --[[ Line: 156 ]] --[[ Name: _ensureMockConfig ]]
    local v13 = v11._mockConfigRegistry[v12];
    if not v13 then
        v13 = v11:_defaultMockConfig();
        v11._mockConfigRegistry[v12] = v13;
    end;
    return v13;
end;
v9._ensureMockState = function(v14, v15) --[[ Line: 167 ]] --[[ Name: _ensureMockState ]]
    local v16 = v14._mockState[v15];
    if not v16 then
        v16 = v14:_defaultMockState();
        v14._mockState[v15] = v16;
    end;
    if #v16.calls > 0 then
        v16.lastCall = v16.calls[#v16.calls];
    end;
    return v16;
end;
v9._defaultMockConfig = function(_) --[[ Line: 189 ]] --[[ Name: _defaultMockConfig ]]
    return {
        mockImpl = nil, 
        mockName = "jest.fn()", 
        specificMockImpls = {}, 
        specificReturnValues = {}
    };
end;
v9._defaultMockState = function(_) --[[ Line: 198 ]] --[[ Name: _defaultMockState ]]
    return {
        calls = {}, 
        contexts = {}, 
        instances = {}, 
        invocationCallOrder = {}, 
        results = {}
    };
end;
v9._makeComponent = function(v19, v20, v21) --[[ Line: 208 ]] --[[ Name: _makeComponent ]]
    -- upvalues: l_Symbol_0 (copy), l_Array_0 (copy)
    if v20.type == "function" then
        local v32 = setmetatable({}, {
            __call = function(v22, ...) --[[ Line: 212 ]]
                -- upvalues: v19 (copy), l_Symbol_0 (ref), l_Array_0 (ref)
                local v23 = {
                    ...
                };
                local v24 = v19:_ensureMockState(v22);
                local v25 = v19:_ensureMockConfig(v22);
                table.insert(v24.instances, v22);
                table.insert(v24.contexts, v23[1]);
                for v26 = 1, select("#", ...) do
                    if v23[v26] == nil then
                        v23[v26] = l_Symbol_0.for_("$$nil");
                    end;
                end;
                table.insert(v24.calls, v23);
                local v27 = {
                    type = "incomplete", 
                    value = nil
                };
                table.insert(v24.results, v27);
                table.insert(v24.invocationCallOrder, v19._invocationCallCounter);
                v19._invocationCallCounter = v19._invocationCallCounter + 1;
                local l_status_0, l_result_0 = pcall(function(v28) --[[ Line: 251 ]]
                    -- upvalues: l_Array_0 (ref), v25 (copy)
                    local v29 = l_Array_0.shift(v25.specificMockImpls);
                    if v29 == nil then
                        v29 = v25.mockImpl;
                    end;
                    if v29 then
                        return v29(unpack(v28));
                    else
                        return nil;
                    end;
                end, {
                    ...
                });
                if not l_status_0 then
                    v27.type = "throw";
                    v27.value = l_result_0;
                    error(l_result_0);
                end;
                v27.type = "return";
                v27.value = l_result_0;
                return l_result_0;
            end
        });
        v32._isMockFunction = true;
        v32.getMockImplementation = function() --[[ Line: 283 ]]
            -- upvalues: v19 (copy), v32 (copy)
            return v19:_ensureMockConfig(v32).mockImpl;
        end;
        if typeof(v21) == "function" then
            v19._spyState:add(v21);
        end;
        v19._mockState[v32] = v19._defaultMockState();
        v19._mockConfigRegistry[v32] = v19._defaultMockConfig();
        v32.mock = setmetatable({}, {
            __index = function(_, v34) --[[ Line: 295 ]] --[[ Name: __index ]]
                -- upvalues: v19 (copy), v32 (copy)
                return v19:_ensureMockState(v32)[v34];
            end
        });
        v32.mockClear = function() --[[ Line: 307 ]]
            -- upvalues: v19 (copy), v32 (copy)
            v19._mockState[v32] = nil;
            return v32;
        end;
        v32.mockReset = function() --[[ Line: 312 ]]
            -- upvalues: v32 (copy), v19 (copy)
            v32.mockClear();
            v19._mockConfigRegistry[v32] = nil;
            return v32;
        end;
        v32.mockRestore = function() --[[ Line: 318 ]]
            -- upvalues: v32 (copy), v21 (copy)
            v32.mockReset();
            if v21 then
                return v21();
            else
                return nil;
            end;
        end;
        v32.mockImplementationOnce = function(v35) --[[ Line: 329 ]]
            -- upvalues: v19 (copy), v32 (copy)
            table.insert(v19:_ensureMockConfig(v32).specificMockImpls, v35);
            return v32;
        end;
        v32.mockImplementation = function(v36) --[[ Line: 337 ]]
            -- upvalues: v19 (copy), v32 (copy)
            v19:_ensureMockConfig(v32).mockImpl = v36;
            return v32;
        end;
        v32.mockReturnValueOnce = function(v37) --[[ Line: 344 ]]
            -- upvalues: v32 (copy)
            return v32.mockImplementationOnce(function() --[[ Line: 346 ]]
                -- upvalues: v37 (copy)
                return v37;
            end);
        end;
        v32.mockReturnValue = function(v38) --[[ Line: 353 ]]
            -- upvalues: v32 (copy)
            return v32.mockImplementation(function() --[[ Line: 355 ]]
                -- upvalues: v38 (copy)
                return v38;
            end);
        end;
        v32.mockReturnThis = function() --[[ Line: 360 ]]
            -- upvalues: v32 (copy)
            return v32.mockImplementation(function(_) --[[ Line: 361 ]]
                -- upvalues: v32 (ref)
                return v32;
            end);
        end;
        v32.mockName = function(v40) --[[ Line: 366 ]]
            -- upvalues: v19 (copy), v32 (copy)
            if v40 then
                v19:_ensureMockConfig(v32).mockName = v40;
            end;
            return v32;
        end;
        v32.getMockName = function() --[[ Line: 374 ]]
            -- upvalues: v19 (copy), v32 (copy)
            return v19:_ensureMockConfig(v32).mockName or "jest.fn()";
        end;
        v32.new = function(...) --[[ Line: 381 ]]
            -- upvalues: v32 (copy)
            v32(...);
            return v32;
        end;
        if v20.mockImpl then
            v32.mockImplementation(v20.mockImpl);
        end;
        return v32;
    else
        error("Call to _makeComponent with non-function");
        return;
    end;
end;
v9._createMockFunction = function(_, v42, v43) --[[ Line: 396 ]] --[[ Name: _createMockFunction ]]
    if not v42.name then
        return v43;
    else
        return v43;
    end;
end;
v9.isMockFunction = function(_, v45) --[[ Line: 406 ]] --[[ Name: isMockFunction ]]
    local v46 = false;
    if typeof(v45) == "table" then
        v46 = v45._isMockFunction == true;
    end;
    return v46;
end;
v9.fn = function(v47, v48) --[[ Line: 412 ]] --[[ Name: fn ]]
    local v49 = v47:_makeComponent({
        length = 0, 
        type = "function"
    });
    if v48 then
        v49.mockImplementation(v48);
    end;
    return v49, function(...) --[[ Line: 421 ]] --[[ Name: mockFn ]]
        -- upvalues: v49 (copy)
        return getmetatable(v49).__call(v49, ...);
    end;
end;
v9.spyOn = function(v50, v51, v52, v53) --[[ Line: 428 ]] --[[ Name: spyOn ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy), l_GlobalMocker_0 (copy)
    if l_Boolean_0.toJSBoolean(v53) then
        return v50:_spyOnProperty(v51, v52, v53);
    else
        if typeof(v51) ~= "table" then
            error(l_Error_0.new(("Cannot spyOn on a primitive value; %s given"):format((typeof(v51)))));
        end;
        if l_GlobalMocker_0:isMockGlobalLibrary(v51) then
            local v54 = v51._automocksRef[v52];
            if typeof(v54) ~= "table" or not v54._isGlobalAutomockFn then
                error(l_Error_0.new(("Cannot spy the %s property because it is not a function; %s given instead"):format(tostring(v52), (typeof(v54)))));
            elseif v54._maybeMock == nil then
                error(l_Error_0.new("globalEnv has not been initialised by Jest here"));
            end;
            return v54._maybeMock;
        else
            local v55 = v51[v52];
            if not l_Boolean_0.toJSBoolean(v50:isMockFunction(v55)) then
                if typeof(v55) ~= "function" then
                    error(l_Error_0.new(("Cannot spy the %s property because it is not a function; %s given instead"):format(tostring(v52), (typeof(v55)))));
                end;
                local v56 = rawget(v51, v52) ~= nil;
                local v57 = nil;
                v57 = v50:_makeComponent({
                    type = "function"
                }, function() --[[ Line: 492 ]]
                    -- upvalues: l_Boolean_0 (ref), v56 (copy), v51 (copy), v52 (copy), v55 (copy)
                    if l_Boolean_0.toJSBoolean(v56) then
                        v51[v52] = v55;
                        return;
                    else
                        v51[v52] = nil;
                        return;
                    end;
                end);
                v51[v52] = v57;
                v57.mockImplementation(function(...) --[[ Line: 501 ]]
                    -- upvalues: v55 (copy)
                    return v55(...);
                end);
            end;
            return v51[v52];
        end;
    end;
end;
v9._spyOnProperty = function(_, _, _, _) --[[ Line: 507 ]] --[[ Name: _spyOnProperty ]]
    error("spyOn with accessors is not currently supported");
end;
v9.clearAllMocks = function(v62) --[[ Line: 567 ]] --[[ Name: clearAllMocks ]]
    v62._mockState = {};
end;
v9.resetAllMocks = function(v63) --[[ Line: 571 ]] --[[ Name: resetAllMocks ]]
    v63._mockConfigRegistry = {};
    v63._mockState = {};
end;
v9.restoreAllMocks = function(v64) --[[ Line: 576 ]] --[[ Name: restoreAllMocks ]]
    -- upvalues: l_Set_0 (copy)
    for _, v66 in v64._spyState do
        v66();
    end;
    v64._spyState = l_Set_0.new();
end;
v9.mocked = function(_, v68, _) --[[ Line: 591 ]] --[[ Name: mocked ]]
    return v68;
end;
v9.mockGlobals = function(v70, v71, v72) --[[ Line: 596 ]] --[[ Name: mockGlobals ]]
    assert(not v71.currentlyMocked, "Attempt to mock globals while they're already mocked");
    v71.currentlyMocked = true;
    local function v73(v74, v75) --[[ Line: 599 ]] --[[ Name: implement ]]
        -- upvalues: v70 (copy), v73 (copy)
        for v76, v77 in v74 do
            if v77._isGlobalAutomockFn then
                local v78 = v75[v76];
                local v79 = nil;
                do
                    local l_v79_0 = v79;
                    local function v81() --[[ Line: 604 ]] --[[ Name: mockOriginalImplementation ]]
                        -- upvalues: l_v79_0 (ref), v78 (copy)
                        l_v79_0.mockImplementation(function(...) --[[ Line: 605 ]]
                            -- upvalues: v78 (ref)
                            return v78(...);
                        end);
                    end;
                    l_v79_0 = v70:_makeComponent({
                        type = "function"
                    }, v81);
                    l_v79_0.mockImplementation(function(...) --[[ Line: 605 ]]
                        -- upvalues: v78 (copy)
                        return v78(...);
                    end);
                    v77._maybeUnmocked = v78;
                    v77._maybeMock = l_v79_0;
                end;
            else
                v73(v77, v75[v76]);
            end;
        end;
    end;
    v73(v71.automocks, v72);
end;
v9.unmockGlobals = function(_, v83) --[[ Line: 623 ]] --[[ Name: unmockGlobals ]]
    v83.currentlyMocked = false;
    local function v84(v85) --[[ Line: 625 ]] --[[ Name: unimplement ]]
        -- upvalues: v84 (copy)
        for _, v87 in v85 do
            if v87._isGlobalAutomockFn then
                v87._maybeUnmocked = nil;
                v87._maybeMock = nil;
            else
                v84(v87);
            end;
        end;
    end;
    v84(v83.automocks);
end;
v8.ModuleMocker = v9;
local v88 = v9.new();
v8.fn = function(v89) --[[ Line: 642 ]]
    -- upvalues: v88 (copy)
    return v88:fn(v89);
end;
v8.spyOn = function(v90, v91, v92) --[[ Line: 646 ]]
    -- upvalues: v88 (copy)
    return v88:spyOn(v90, v91, v92);
end;
v8.mocked = function(v93, v94) --[[ Line: 650 ]]
    -- upvalues: v88 (copy)
    return v88:mocked(v93, v94);
end;
return v8;