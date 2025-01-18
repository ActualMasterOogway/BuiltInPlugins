local v0 = {
    __mode = "k"
};
local function v8(v1, v2) --[[ Line: 13 ]] --[[ Name: makeEnum ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        v3[v5] = v5;
    end;
    return (setmetatable(v3, {
        __index = function(_, v7) --[[ Line: 21 ]] --[[ Name: __index ]]
            -- upvalues: v1 (copy)
            error(string.format("%s is not in %s!", v7, v1), 2);
        end, 
        __newindex = function() --[[ Line: 24 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (copy)
            error(string.format("Creating new members in %s is not allowed!", v1), 2);
        end
    }));
end;
local v9 = nil;
v9 = {
    Kind = v8("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v9.__index = v9;
v9.new = function(v10, v11) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v9 (ref)
    v10 = v10 or {};
    return (setmetatable({
        error = tostring(v10.error) or "[This error has no error text.]", 
        trace = v10.trace, 
        context = v10.context, 
        kind = v10.kind, 
        parent = v11, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v9));
end;
v9.is = function(v12) --[[ Line: 59 ]] --[[ Name: is ]]
    if type(v12) == "table" then
        local v13 = getmetatable(v12);
        if type(v13) == "table" then
            local v14 = false;
            if rawget(v12, "error") ~= nil then
                v14 = type((rawget(v13, "extend"))) == "function";
            end;
            return v14;
        end;
    end;
    return false;
end;
v9.isKind = function(v15, v16) --[[ Line: 71 ]] --[[ Name: isKind ]]
    -- upvalues: v9 (ref)
    assert(v16 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v9.is(v15) and v15.kind == v16;
end;
v9.extend = function(v17, v18) --[[ Line: 77 ]] --[[ Name: extend ]]
    -- upvalues: v9 (ref)
    v18 = v18 or {};
    v18.kind = v18.kind or v17.kind;
    return v9.new(v18, v17);
end;
v9.getErrorChain = function(v19) --[[ Line: 85 ]] --[[ Name: getErrorChain ]]
    local v20 = {
        v19
    };
    while v20[#v20].parent do
        table.insert(v20, v20[#v20].parent);
    end;
    return v20;
end;
v9.__tostring = function(v21) --[[ Line: 95 ]] --[[ Name: __tostring ]]
    local v22 = {
        string.format("-- Promise.Error(%s) --", v21.kind or "?")
    };
    for _, v24 in ipairs(v21:getErrorChain()) do
        table.insert(v22, table.concat({
            v24.trace or v24.error, 
            v24.context
        }, "\n"));
    end;
    return table.concat(v22, "\n");
end;
local function v25(...) --[[ Line: 116 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v27(v26, ...) --[[ Line: 123 ]] --[[ Name: packResult ]]
    return v26, select("#", ...), {
        ...
    };
end;
local function _(v28) --[[ Line: 127 ]] --[[ Name: makeErrorHandler ]]
    -- upvalues: v9 (ref)
    assert(v28 ~= nil);
    return function(v29) --[[ Line: 130 ]]
        -- upvalues: v9 (ref), v28 (copy)
        if type(v29) == "table" then
            return v29;
        else
            return v9.new({
                error = v29, 
                kind = v9.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v29), 2), 
                context = "Promise created at:\n\n" .. v28
            });
        end;
    end;
end;
local function v37(v31, v32, ...) --[[ Line: 150 ]] --[[ Name: runExecutor ]]
    -- upvalues: v27 (copy), v9 (ref)
    local l_v27_0 = v27;
    local l_xpcall_0 = xpcall;
    local l_v32_0 = v32;
    assert(v31 ~= nil);
    return l_v27_0(l_xpcall_0(l_v32_0, function(v36) --[[ Line: 130 ]]
        -- upvalues: v9 (ref), v31 (copy)
        if type(v36) == "table" then
            return v36;
        else
            return v9.new({
                error = v36, 
                kind = v9.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v36), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end, ...));
end;
local function _(v38, v39, v40, v41) --[[ Line: 158 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v37 (copy)
    return function(...) --[[ Line: 159 ]]
        -- upvalues: v37 (ref), v38 (copy), v39 (copy), v40 (copy), v41 (copy)
        local v42, v43, v44 = v37(v38, v39, ...);
        if v42 then
            v40(unpack(v44, 1, v43));
            return;
        else
            v41(v44[1]);
            return;
        end;
    end;
end;
local function _(v46) --[[ Line: 170 ]] --[[ Name: isEmpty ]]
    return next(v46) == nil;
end;
local v48 = {
    Error = v9, 
    Status = v8("Promise.Status", {
        "Started", 
        "Resolved", 
        "Rejected", 
        "Cancelled"
    }), 
    _getTime = os.clock, 
    _timeEvent = game:GetService("RunService").Heartbeat, 
    _unhandledRejectionCallbacks = {}, 
    prototype = {}
};
v48.__index = v48.prototype;
v48._new = function(v49, v50, v51) --[[ Line: 196 ]] --[[ Name: _new ]]
    -- upvalues: v48 (copy), v0 (copy), v37 (copy)
    if v51 ~= nil and not v48.is(v51) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v52 = {
        _source = v49, 
        _status = v48.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v51, 
        _consumers = setmetatable({}, v0)
    };
    if v51 and v51._status == v48.Status.Started then
        v51._consumers[v52] = true;
    end;
    setmetatable(v52, v48);
    local function v53(...) --[[ Line: 241 ]] --[[ Name: resolve ]]
        -- upvalues: v52 (copy)
        v52:_resolve(...);
    end;
    local function v54(...) --[[ Line: 245 ]] --[[ Name: reject ]]
        -- upvalues: v52 (copy)
        v52:_reject(...);
    end;
    local function v56(v55) --[[ Line: 249 ]] --[[ Name: onCancel ]]
        -- upvalues: v52 (copy), v48 (ref)
        if v55 then
            if v52._status == v48.Status.Cancelled then
                v55();
            else
                v52._cancellationHook = v55;
            end;
        end;
        return v52._status == v48.Status.Cancelled;
    end;
    coroutine.wrap(function() --[[ Line: 261 ]]
        -- upvalues: v37 (ref), v52 (copy), v50 (copy), v53 (copy), v54 (copy), v56 (copy)
        local v57, _, v59 = v37(v52._source, v50, v53, v54, v56);
        if not v57 then
            v54(v59[1]);
        end;
    end)();
    return v52;
end;
v48.new = function(v60) --[[ Line: 278 ]] --[[ Name: new ]]
    -- upvalues: v48 (copy)
    return v48._new(debug.traceback(nil, 2), v60);
end;
v48.__tostring = function(v61) --[[ Line: 282 ]] --[[ Name: __tostring ]]
    return string.format("Promise(%s)", v61._status);
end;
v48.defer = function(v62) --[[ Line: 289 ]] --[[ Name: defer ]]
    -- upvalues: v48 (copy), v37 (copy)
    local v63 = debug.traceback(nil, 2);
    local _ = nil;
    return (v48._new(v63, function(v65, v66, v67) --[[ Line: 292 ]]
        -- upvalues: v48 (ref), v37 (ref), v63 (copy), v62 (copy)
        local v68 = nil;
        v68 = v48._timeEvent:Connect(function() --[[ Line: 294 ]]
            -- upvalues: v68 (ref), v37 (ref), v63 (ref), v62 (ref), v65 (copy), v66 (copy), v67 (copy)
            v68:Disconnect();
            local v69, _, v71 = v37(v63, v62, v65, v66, v67);
            if not v69 then
                v66(v71[1]);
            end;
        end);
    end));
end;
v48.async = v48.defer;
v48.resolve = function(...) --[[ Line: 313 ]] --[[ Name: resolve ]]
    -- upvalues: v25 (copy), v48 (copy)
    local v72, v73 = v25(...);
    return v48._new(debug.traceback(nil, 2), function(v74) --[[ Line: 315 ]]
        -- upvalues: v73 (copy), v72 (copy)
        v74(unpack(v73, 1, v72));
    end);
end;
v48.reject = function(...) --[[ Line: 323 ]] --[[ Name: reject ]]
    -- upvalues: v25 (copy), v48 (copy)
    local v75, v76 = v25(...);
    return v48._new(debug.traceback(nil, 2), function(_, v78) --[[ Line: 325 ]]
        -- upvalues: v76 (copy), v75 (copy)
        v78(unpack(v76, 1, v75));
    end);
end;
v48._try = function(v79, v80, ...) --[[ Line: 334 ]] --[[ Name: _try ]]
    -- upvalues: v25 (copy), v48 (copy)
    local v81, v82 = v25(...);
    return v48._new(v79, function(v83) --[[ Line: 337 ]]
        -- upvalues: v80 (copy), v82 (copy), v81 (copy)
        v83(v80(unpack(v82, 1, v81)));
    end);
end;
v48.try = function(...) --[[ Line: 345 ]] --[[ Name: try ]]
    -- upvalues: v48 (copy)
    return v48._try(debug.traceback(nil, 2), ...);
end;
v48._all = function(v84, v85, v86) --[[ Line: 354 ]] --[[ Name: _all ]]
    -- upvalues: v48 (copy)
    if type(v85) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v87, v88 in pairs(v85) do
        if not v48.is(v88) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v87))), 3);
        end;
    end;
    if #v85 == 0 or v86 == 0 then
        return v48.resolve({});
    else
        return v48._new(v84, function(v89, v90, v91) --[[ Line: 372 ]]
            -- upvalues: v86 (copy), v85 (copy)
            local v92 = {};
            local v93 = {};
            local v94 = 0;
            local v95 = 0;
            local v96 = false;
            local function v99() --[[ Line: 383 ]] --[[ Name: cancel ]]
                -- upvalues: v93 (copy)
                for _, v98 in ipairs(v93) do
                    v98:cancel();
                end;
            end;
            local function v103(v100, ...) --[[ Line: 390 ]] --[[ Name: resolveOne ]]
                -- upvalues: v96 (ref), v94 (ref), v86 (ref), v92 (copy), v85 (ref), v89 (copy), v93 (copy)
                if v96 then
                    return;
                else
                    v94 = v94 + 1;
                    if v86 == nil then
                        v92[v100] = ...;
                    else
                        v92[v94] = ...;
                    end;
                    if v94 >= (v86 or #v85) then
                        v96 = true;
                        v89(v92);
                        for _, v102 in ipairs(v93) do
                            v102:cancel();
                        end;
                    end;
                    return;
                end;
            end;
            v91(v99);
            for v104, v105 in ipairs(v85) do
                v93[v104] = v105:andThen(function(...) --[[ Line: 416 ]]
                    -- upvalues: v103 (copy), v104 (copy)
                    v103(v104, ...);
                end, function(...) --[[ Line: 419 ]]
                    -- upvalues: v95 (ref), v86 (ref), v85 (ref), v93 (copy), v96 (ref), v90 (copy)
                    v95 = v95 + 1;
                    if v86 == nil or #v85 - v95 < v86 then
                        for _, v107 in ipairs(v93) do
                            v107:cancel();
                        end;
                        v96 = true;
                        v90(...);
                    end;
                end);
            end;
            if v96 then
                for _, v109 in ipairs(v93) do
                    v109:cancel();
                end;
            end;
        end);
    end;
end;
v48.all = function(...) --[[ Line: 438 ]] --[[ Name: all ]]
    -- upvalues: v48 (copy)
    local v110 = {
        ...
    };
    if type(v110[1]) == "table" and not v48.is(v110[1]) then
        v110 = v110[1];
    end;
    return v48._all(debug.traceback(nil, 2), v110);
end;
v48.fold = function(v111, v112, v113) --[[ Line: 450 ]] --[[ Name: fold ]]
    -- upvalues: v48 (copy)
    assert(type(v111) == "table", "Bad argument #1 to Promise.fold: must be a table");
    assert(type(v112) == "function", "Bad argument #2 to Promise.fold: must be a function");
    local v114 = v48.resolve(v113);
    return v48.each(v111, function(v115, v116) --[[ Line: 455 ]]
        -- upvalues: v114 (ref), v112 (copy)
        v114 = v114:andThen(function(v117) --[[ Line: 456 ]]
            -- upvalues: v112 (ref), v115 (copy), v116 (copy)
            return v112(v117, v115, v116);
        end);
    end):andThenReturn(v114);
end;
v48.some = function(v118, v119) --[[ Line: 462 ]] --[[ Name: some ]]
    -- upvalues: v48 (copy)
    assert(type(v119) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v48._all(debug.traceback(nil, 2), v118, v119);
end;
v48.any = function(v120) --[[ Line: 468 ]] --[[ Name: any ]]
    -- upvalues: v48 (copy)
    return v48._all(debug.traceback(nil, 2), v120, 1):andThen(function(v121) --[[ Line: 469 ]]
        return v121[1];
    end);
end;
v48.allSettled = function(v122) --[[ Line: 474 ]] --[[ Name: allSettled ]]
    -- upvalues: v48 (copy)
    if type(v122) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v123, v124 in pairs(v122) do
        if not v48.is(v124) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v123))), 2);
        end;
    end;
    if #v122 == 0 then
        return v48.resolve({});
    else
        return v48._new(debug.traceback(nil, 2), function(v125, _, v127) --[[ Line: 492 ]]
            -- upvalues: v122 (copy)
            local v128 = {};
            local v129 = {};
            local v130 = 0;
            local function v132(v131, ...) --[[ Line: 502 ]] --[[ Name: resolveOne ]]
                -- upvalues: v130 (ref), v128 (copy), v122 (ref), v125 (copy)
                v130 = v130 + 1;
                v128[v131] = ...;
                if v130 >= #v122 then
                    v125(v128);
                end;
            end;
            v127(function() --[[ Line: 512 ]]
                -- upvalues: v129 (copy)
                for _, v134 in ipairs(v129) do
                    v134:cancel();
                end;
            end);
            for v135, v136 in ipairs(v122) do
                v129[v135] = v136:finally(function(...) --[[ Line: 522 ]]
                    -- upvalues: v132 (copy), v135 (copy)
                    v132(v135, ...);
                end);
            end;
        end);
    end;
end;
v48.race = function(v137) --[[ Line: 534 ]] --[[ Name: race ]]
    -- upvalues: v48 (copy)
    assert(type(v137) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v138, v139 in pairs(v137) do
        assert(v48.is(v139), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v138))));
    end;
    return v48._new(debug.traceback(nil, 2), function(v140, v141, v142) --[[ Line: 541 ]]
        -- upvalues: v137 (copy)
        local v143 = {};
        local v144 = false;
        local _ = function() --[[ Line: 545 ]] --[[ Name: cancel ]]
            -- upvalues: v143 (copy)
            for _, v146 in ipairs(v143) do
                v146:cancel();
            end;
        end;
        local _ = function(v148) --[[ Line: 551 ]] --[[ Name: finalize ]]
            -- upvalues: v143 (copy), v144 (ref)
            return function(...) --[[ Line: 552 ]]
                -- upvalues: v143 (ref), v144 (ref), v148 (copy)
                for _, v150 in ipairs(v143) do
                    v150:cancel();
                end;
                v144 = true;
                return v148(...);
            end;
        end;
        if v142(function(...) --[[ Line: 552 ]]
            -- upvalues: v143 (copy), v144 (ref), v141 (copy)
            for _, v153 in ipairs(v143) do
                v153:cancel();
            end;
            v144 = true;
            return v141(...);
        end) then
            return;
        else
            for v154, v155 in ipairs(v137) do
                v143[v154] = v155:andThen(function(...) --[[ Line: 552 ]]
                    -- upvalues: v143 (copy), v144 (ref), v140 (copy)
                    for _, v157 in ipairs(v143) do
                        v157:cancel();
                    end;
                    v144 = true;
                    return v140(...);
                end, function(...) --[[ Line: 552 ]]
                    -- upvalues: v143 (copy), v144 (ref), v141 (copy)
                    for _, v159 in ipairs(v143) do
                        v159:cancel();
                    end;
                    v144 = true;
                    return v141(...);
                end);
            end;
            if v144 then
                for _, v161 in ipairs(v143) do
                    v161:cancel();
                end;
            end;
            return;
        end;
    end);
end;
v48.each = function(v162, v163) --[[ Line: 581 ]] --[[ Name: each ]]
    -- upvalues: v48 (copy), v9 (ref)
    assert(type(v162) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    assert(type(v163) == "function", string.format("Please pass a handler function to %s!", "Promise.each"));
    return v48._new(debug.traceback(nil, 2), function(v164, v165, v166) --[[ Line: 585 ]]
        -- upvalues: v162 (copy), v48 (ref), v9 (ref), v163 (copy)
        local v167 = {};
        local v168 = {};
        local v169 = false;
        local _ = function() --[[ Line: 591 ]] --[[ Name: cancel ]]
            -- upvalues: v168 (copy)
            for _, v171 in ipairs(v168) do
                v171:cancel();
            end;
        end;
        v166(function() --[[ Line: 597 ]]
            -- upvalues: v169 (ref), v168 (copy)
            v169 = true;
            for _, v174 in ipairs(v168) do
                v174:cancel();
            end;
        end);
        local v175 = {};
        for v176, v177 in ipairs(v162) do
            if v48.is(v177) then
                if v177:getStatus() == v48.Status.Cancelled then
                    for _, v179 in ipairs(v168) do
                        v179:cancel();
                    end;
                    return v165(v9.new({
                        error = "Promise is cancelled", 
                        kind = v9.Kind.AlreadyCancelled, 
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v176, v177._source)
                    }));
                elseif v177:getStatus() == v48.Status.Rejected then
                    for _, v181 in ipairs(v168) do
                        v181:cancel();
                    end;
                    return v165(select(2, v177:await()));
                else
                    local v182 = v177:andThen(function(...) --[[ Line: 630 ]]
                        return ...;
                    end);
                    table.insert(v168, v182);
                    v175[v176] = v182;
                end;
            else
                v175[v176] = v177;
            end;
        end;
        for v183, v184 in ipairs(v175) do
            if v48.is(v184) then
                local v185 = nil;
                local v186, v187 = v184:await();
                v185 = v186;
                v184 = v187;
                if not v185 then
                    for _, v189 in ipairs(v168) do
                        v189:cancel();
                    end;
                    return v165(v184);
                end;
            end;
            if v169 then
                return;
            else
                local v190 = v48.resolve(v163(v184, v183));
                table.insert(v168, v190);
                local v191, v192 = v190:await();
                if not v191 then
                    for _, v194 in ipairs(v168) do
                        v194:cancel();
                    end;
                    return v165(v192);
                else
                    v167[v183] = v192;
                end;
            end;
        end;
        v164(v167);
    end);
end;
v48.is = function(v195) --[[ Line: 677 ]] --[[ Name: is ]]
    -- upvalues: v48 (copy)
    if type(v195) ~= "table" then
        return false;
    else
        local v196 = getmetatable(v195);
        if v196 == v48 then
            return true;
        elseif v196 == nil then
            return type(v195.andThen) == "function";
        elseif type(v196) == "table" and type((rawget(v196, "__index"))) == "table" and type((rawget(rawget(v196, "__index"), "andThen"))) == "function" then
            return true;
        else
            return false;
        end;
    end;
end;
v48.promisify = function(v197) --[[ Line: 705 ]] --[[ Name: promisify ]]
    -- upvalues: v48 (copy)
    return function(...) --[[ Line: 706 ]]
        -- upvalues: v48 (ref), v197 (copy)
        return v48._try(debug.traceback(nil, 2), v197, ...);
    end;
end;
local v198 = nil;
local v199 = nil;
do
    local l_v198_0, l_v199_0 = v198, v199;
    v48.delay = function(v202) --[[ Line: 721 ]] --[[ Name: delay ]]
        -- upvalues: v48 (copy), l_v199_0 (ref), l_v198_0 (ref)
        assert(type(v202) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if v202 < 0.016666666666666666 or v202 == 1e999 then
            v202 = 0.016666666666666666;
        end;
        return v48._new(debug.traceback(nil, 2), function(v203, _, v205) --[[ Line: 729 ]]
            -- upvalues: v48 (ref), v202 (ref), l_v199_0 (ref), l_v198_0 (ref)
            local v206 = v48._getTime();
            local v207 = v206 + v202;
            local v208 = {
                resolve = v203, 
                startTime = v206, 
                endTime = v207
            };
            if l_v199_0 == nil then
                l_v198_0 = v208;
                l_v199_0 = v48._timeEvent:Connect(function() --[[ Line: 741 ]]
                    -- upvalues: v48 (ref), l_v198_0 (ref), l_v199_0 (ref)
                    local v209 = v48._getTime();
                    while l_v198_0 ~= nil and l_v198_0.endTime < v209 do
                        local l_l_v198_0_0 = l_v198_0;
                        l_v198_0 = l_l_v198_0_0.next;
                        if l_v198_0 == nil then
                            l_v199_0:Disconnect();
                            l_v199_0 = nil;
                        else
                            l_v198_0.previous = nil;
                        end;
                        l_l_v198_0_0.resolve(v48._getTime() - l_l_v198_0_0.startTime);
                    end;
                end);
            elseif l_v198_0.endTime < v207 then
                local l_l_v198_0_1 = l_v198_0;
                local l_next_0 = l_l_v198_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v207 do
                    l_l_v198_0_1 = l_next_0;
                    l_next_0 = l_l_v198_0_1.next;
                end;
                l_l_v198_0_1.next = v208;
                v208.previous = l_l_v198_0_1;
                if l_next_0 ~= nil then
                    v208.next = l_next_0;
                    l_next_0.previous = v208;
                end;
            else
                v208.next = l_v198_0;
                l_v198_0.previous = v208;
                l_v198_0 = v208;
            end;
            v205(function() --[[ Line: 786 ]]
                -- upvalues: v208 (copy), l_v198_0 (ref), l_v199_0 (ref)
                local l_next_1 = v208.next;
                if l_v198_0 == v208 then
                    if l_next_1 == nil then
                        l_v199_0:Disconnect();
                        l_v199_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v198_0 = l_next_1;
                    return;
                else
                    local l_previous_0 = v208.previous;
                    l_previous_0.next = l_next_1;
                    if l_next_1 ~= nil then
                        l_next_1.previous = l_previous_0;
                    end;
                    return;
                end;
            end);
        end);
    end;
end;
v198 = function(v215, v216, v217) --[[ Line: 815 ]] --[[ Name: timeout ]]
    -- upvalues: v48 (copy), v9 (ref)
    local v218 = debug.traceback(nil, 2);
    return v48.race({
        v48.delay(v216):andThen(function() --[[ Line: 819 ]]
            -- upvalues: v48 (ref), v217 (copy), v9 (ref), v216 (copy), v218 (copy)
            return v48.reject(v217 == nil and v9.new({
                kind = v9.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v216, v218)
            }) or v217);
        end), 
        v215
    });
end;
v48.prototype.timeout = v198;
v48.prototype.getStatus = function(v219) --[[ Line: 834 ]] --[[ Name: getStatus ]]
    return v219._status;
end;
v198 = function(v220, v221, v222, v223) --[[ Line: 843 ]] --[[ Name: _andThen ]]
    -- upvalues: v48 (copy), v37 (copy), v9 (ref)
    v220._unhandledRejection = false;
    return v48._new(v221, function(v224, v225) --[[ Line: 847 ]]
        -- upvalues: v222 (copy), v221 (copy), v37 (ref), v223 (copy), v220 (copy), v48 (ref), v9 (ref)
        local l_v224_0 = v224;
        if v222 then
            local l_v221_0 = v221;
            local l_v222_0 = v222;
            local l_l_v221_0_0 = l_v221_0 --[[ copy: 3 -> 6 ]];
            local l_l_v222_0_0 = l_v222_0 --[[ copy: 4 -> 7 ]];
            l_v224_0 = function(...) --[[ Line: 159 ]]
                -- upvalues: v37 (ref), l_l_v221_0_0 (copy), l_l_v222_0_0 (copy), v224 (copy), v225 (copy)
                local v231, v232, v233 = v37(l_l_v221_0_0, l_l_v222_0_0, ...);
                if v231 then
                    v224(unpack(v233, 1, v232));
                    return;
                else
                    v225(v233[1]);
                    return;
                end;
            end;
        end;
        local l_v225_0 = v225;
        if v223 then
            local l_v221_1 = v221;
            local l_v223_0 = v223;
            l_v225_0 = function(...) --[[ Line: 159 ]]
                -- upvalues: v37 (ref), l_v221_1 (copy), l_v223_0 (copy), v224 (copy), v225 (copy)
                local v237, v238, v239 = v37(l_v221_1, l_v223_0, ...);
                if v237 then
                    v224(unpack(v239, 1, v238));
                    return;
                else
                    v225(v239[1]);
                    return;
                end;
            end;
        end;
        if v220._status == v48.Status.Started then
            table.insert(v220._queuedResolve, l_v224_0);
            table.insert(v220._queuedReject, l_v225_0);
            return;
        elseif v220._status == v48.Status.Resolved then
            l_v224_0(unpack(v220._values, 1, v220._valuesLength));
            return;
        elseif v220._status == v48.Status.Rejected then
            l_v225_0(unpack(v220._values, 1, v220._valuesLength));
            return;
        else
            if v220._status == v48.Status.Cancelled then
                v225(v9.new({
                    error = "Promise is cancelled", 
                    kind = v9.Kind.AlreadyCancelled, 
                    context = "Promise created at\n\n" .. v221
                }));
            end;
            return;
        end;
    end, v220);
end;
v48.prototype._andThen = v198;
v48.prototype.andThen = function(v240, v241, v242) --[[ Line: 893 ]] --[[ Name: andThen ]]
    local v243 = true;
    if v241 ~= nil then
        v243 = true;
        if type(v241) ~= "function" then
            v243 = v241.__call ~= nil;
        end;
    end;
    assert(v243, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    v243 = true;
    if v242 ~= nil then
        v243 = true;
        if type(v242) ~= "function" then
            v243 = v242.__call ~= nil;
        end;
    end;
    assert(v243, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    return v240:_andThen(debug.traceback(nil, 2), v241, v242);
end;
v48.prototype.catch = function(v244, v245) --[[ Line: 909 ]] --[[ Name: catch ]]
    local v246 = true;
    if v245 ~= nil then
        v246 = true;
        if type(v245) ~= "function" then
            v246 = v245.__call ~= nil;
        end;
    end;
    assert(v246, string.format("Please pass a handler function to %s!", "Promise:catch"));
    return v244:_andThen(debug.traceback(nil, 2), nil, v245);
end;
v48.prototype.tap = function(v247, v248) --[[ Line: 921 ]] --[[ Name: tap ]]
    -- upvalues: v48 (copy), v25 (copy)
    assert(type(v248) == "function", string.format("Please pass a handler function to %s!", "Promise:tap"));
    return v247:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 923 ]]
        -- upvalues: v248 (copy), v48 (ref), v25 (ref)
        local v249 = v248(...);
        if v48.is(v249) then
            local v250, v251 = v25(...);
            return v249:andThen(function() --[[ Line: 928 ]]
                -- upvalues: v251 (copy), v250 (copy)
                return unpack(v251, 1, v250);
            end);
        else
            return ...;
        end;
    end);
end;
v48.prototype.andThenCall = function(v252, v253, ...) --[[ Line: 940 ]] --[[ Name: andThenCall ]]
    -- upvalues: v25 (copy)
    assert(type(v253) == "function", string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local v254, v255 = v25(...);
    return v252:_andThen(debug.traceback(nil, 2), function() --[[ Line: 943 ]]
        -- upvalues: v253 (copy), v255 (copy), v254 (copy)
        return v253(unpack(v255, 1, v254));
    end);
end;
v48.prototype.andThenReturn = function(v256, ...) --[[ Line: 951 ]] --[[ Name: andThenReturn ]]
    -- upvalues: v25 (copy)
    local v257, v258 = v25(...);
    return v256:_andThen(debug.traceback(nil, 2), function() --[[ Line: 953 ]]
        -- upvalues: v258 (copy), v257 (copy)
        return unpack(v258, 1, v257);
    end);
end;
v48.prototype.cancel = function(v259) --[[ Line: 962 ]] --[[ Name: cancel ]]
    -- upvalues: v48 (copy)
    if v259._status ~= v48.Status.Started then
        return;
    else
        v259._status = v48.Status.Cancelled;
        if v259._cancellationHook then
            v259._cancellationHook();
        end;
        if v259._parent then
            v259._parent:_consumerCancelled(v259);
        end;
        for v260 in pairs(v259._consumers) do
            v260:cancel();
        end;
        v259:_finalize();
        return;
    end;
end;
v48.prototype._consumerCancelled = function(v261, v262) --[[ Line: 988 ]] --[[ Name: _consumerCancelled ]]
    -- upvalues: v48 (copy)
    if v261._status ~= v48.Status.Started then
        return;
    else
        v261._consumers[v262] = nil;
        if next(v261._consumers) == nil then
            v261:cancel();
        end;
        return;
    end;
end;
v48.prototype._finally = function(v263, v264, v265, v266) --[[ Line: 1004 ]] --[[ Name: _finally ]]
    -- upvalues: v48 (copy), v37 (copy)
    if not v266 then
        v263._unhandledRejection = false;
    end;
    return v48._new(v264, function(v267, v268) --[[ Line: 1010 ]]
        -- upvalues: v265 (copy), v264 (copy), v37 (ref), v266 (copy), v263 (copy), v48 (ref)
        local l_v267_0 = v267;
        if v265 then
            local l_v264_0 = v264;
            local l_v265_0 = v265;
            local l_l_v264_0_0 = l_v264_0 --[[ copy: 3 -> 5 ]];
            l_v267_0 = function(...) --[[ Line: 159 ]]
                -- upvalues: v37 (ref), l_l_v264_0_0 (copy), l_v265_0 (copy), v267 (copy), v268 (copy)
                local v273, v274, v275 = v37(l_l_v264_0_0, l_v265_0, ...);
                if v273 then
                    v267(unpack(v275, 1, v274));
                    return;
                else
                    v268(v275[1]);
                    return;
                end;
            end;
        end;
        if v266 then
            local l_l_v267_0_0 = l_v267_0;
            l_v267_0 = function(...) --[[ Line: 1023 ]]
                -- upvalues: v263 (ref), v48 (ref), v267 (copy), l_l_v267_0_0 (copy)
                if v263._status == v48.Status.Rejected then
                    return v267(v263);
                else
                    return l_l_v267_0_0(...);
                end;
            end;
        end;
        if v263._status == v48.Status.Started then
            table.insert(v263._queuedFinally, l_v267_0);
            return;
        else
            l_v267_0(v263._status);
            return;
        end;
    end, v263);
end;
v48.prototype.finally = function(v277, v278) --[[ Line: 1042 ]] --[[ Name: finally ]]
    local v279 = true;
    if v278 ~= nil then
        v279 = true;
        if type(v278) ~= "function" then
            v279 = v278.__call ~= nill;
        end;
    end;
    assert(v279, string.format("Please pass a handler function to %s!", "Promise:finally"));
    return v277:_finally(debug.traceback(nil, 2), v278);
end;
v48.prototype.finallyCall = function(v280, v281, ...) --[[ Line: 1053 ]] --[[ Name: finallyCall ]]
    -- upvalues: v25 (copy)
    assert(type(v281) == "function", string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local v282, v283 = v25(...);
    return v280:_finally(debug.traceback(nil, 2), function() --[[ Line: 1056 ]]
        -- upvalues: v281 (copy), v283 (copy), v282 (copy)
        return v281(unpack(v283, 1, v282));
    end);
end;
v48.prototype.finallyReturn = function(v284, ...) --[[ Line: 1064 ]] --[[ Name: finallyReturn ]]
    -- upvalues: v25 (copy)
    local v285, v286 = v25(...);
    return v284:_finally(debug.traceback(nil, 2), function() --[[ Line: 1066 ]]
        -- upvalues: v286 (copy), v285 (copy)
        return unpack(v286, 1, v285);
    end);
end;
v48.prototype.done = function(v287, v288) --[[ Line: 1074 ]] --[[ Name: done ]]
    local v289 = true;
    if v288 ~= nil then
        v289 = true;
        if type(v288) ~= "function" then
            v289 = v288.__call ~= nill;
        end;
    end;
    assert(v289, string.format("Please pass a handler function to %s!", "Promise:done"));
    return v287:_finally(debug.traceback(nil, 2), v288, true);
end;
v48.prototype.doneCall = function(v290, v291, ...) --[[ Line: 1085 ]] --[[ Name: doneCall ]]
    -- upvalues: v25 (copy)
    assert(type(v291) == "function", string.format("Please pass a handler function to %s!", "Promise:doneCall"));
    local v292, v293 = v25(...);
    return v290:_finally(debug.traceback(nil, 2), function() --[[ Line: 1088 ]]
        -- upvalues: v291 (copy), v293 (copy), v292 (copy)
        return v291(unpack(v293, 1, v292));
    end, true);
end;
v48.prototype.doneReturn = function(v294, ...) --[[ Line: 1096 ]] --[[ Name: doneReturn ]]
    -- upvalues: v25 (copy)
    local v295, v296 = v25(...);
    return v294:_finally(debug.traceback(nil, 2), function() --[[ Line: 1098 ]]
        -- upvalues: v296 (copy), v295 (copy)
        return unpack(v296, 1, v295);
    end, true);
end;
v48.prototype.awaitStatus = function(v297) --[[ Line: 1108 ]] --[[ Name: awaitStatus ]]
    -- upvalues: v48 (copy)
    v297._unhandledRejection = false;
    if v297._status == v48.Status.Started then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v297:finally(function() --[[ Line: 1114 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire();
        end);
        l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
    end;
    if v297._status == v48.Status.Resolved then
        return v297._status, unpack(v297._values, 1, v297._valuesLength);
    elseif v297._status == v48.Status.Rejected then
        return v297._status, unpack(v297._values, 1, v297._valuesLength);
    else
        return v297._status;
    end;
end;
v198 = function(v299, ...) --[[ Line: 1131 ]] --[[ Name: awaitHelper ]]
    -- upvalues: v48 (copy)
    return v299 == v48.Status.Resolved, ...;
end;
v48.prototype.await = function(v300) --[[ Line: 1138 ]] --[[ Name: await ]]
    -- upvalues: v198 (copy)
    return v198(v300:awaitStatus());
end;
v199 = function(v301, ...) --[[ Line: 1142 ]] --[[ Name: expectHelper ]]
    -- upvalues: v48 (copy)
    if v301 ~= v48.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v48.prototype.expect = function(v302) --[[ Line: 1154 ]] --[[ Name: expect ]]
    -- upvalues: v199 (copy)
    return v199(v302:awaitStatus());
end;
v48.prototype.awaitValue = v48.prototype.expect;
v48.prototype._unwrap = function(v303) --[[ Line: 1168 ]] --[[ Name: _unwrap ]]
    -- upvalues: v48 (copy)
    if v303._status == v48.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v303._status == v48.Status.Resolved, unpack(v303._values, 1, v303._valuesLength);
end;
local function v313(v304, ...) --[[ Line: 1178 ]] --[[ Name: _resolve ]]
    -- upvalues: v48 (copy), v9 (ref), v25 (copy)
    if v304._status ~= v48.Status.Started then
        if v48.is((...)) then
            (...):_consumerCancelled(v304);
        end;
        return;
    elseif v48.is((...)) then
        if select("#", ...) > 1 then
            local v305 = string.format("When returning a Promise from andThen, extra arguments are " .. "discarded! See:\n\n%s", v304._source);
            warn(v305);
        end;
        local v306 = ...;
        local v308 = v306:andThen(function(...) --[[ Line: 1201 ]]
            -- upvalues: v304 (copy)
            v304:_resolve(...);
        end, function(...) --[[ Line: 1204 ]]
            -- upvalues: v306 (copy), v9 (ref), v304 (copy)
            local v307 = v306._values[1];
            if v306._error then
                v307 = v9.new({
                    error = v306._error, 
                    kind = v9.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if v9.isKind(v307, v9.Kind.ExecutionError) then
                return v304:_reject(v307:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v304._source)
                }));
            else
                v304:_reject(...);
                return;
            end;
        end);
        if v308._status == v48.Status.Cancelled then
            v304:cancel();
            return;
        else
            if v308._status == v48.Status.Started then
                v304._parent = v308;
                v308._consumers[v304] = true;
            end;
            return;
        end;
    else
        v304._status = v48.Status.Resolved;
        local v309, v310 = v25(...);
        v304._valuesLength = v309;
        v304._values = v310;
        for _, v312 in ipairs(v304._queuedResolve) do
            coroutine.wrap(v312)(...);
        end;
        v304:_finalize();
        return;
    end;
end;
v48.prototype._resolve = v313;
v48.prototype._reject = function(v314, ...) --[[ Line: 1253 ]] --[[ Name: _reject ]]
    -- upvalues: v48 (copy), v25 (copy)
    if v314._status ~= v48.Status.Started then
        return;
    else
        v314._status = v48.Status.Rejected;
        local v315, v316 = v25(...);
        v314._valuesLength = v315;
        v314._values = v316;
        v316 = v314._queuedReject;
        if not (next(v316) == nil) then
            for _, v318 in ipairs(v314._queuedReject) do
                coroutine.wrap(v318)(...);
            end;
        else
            v315 = tostring((...));
            coroutine.wrap(function() --[[ Line: 1275 ]]
                -- upvalues: v48 (ref), v314 (copy), v315 (copy)
                v48._timeEvent:Wait();
                if not v314._unhandledRejection then
                    return;
                else
                    local v319 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v315, v314._source);
                    for _, v321 in ipairs(v48._unhandledRejectionCallbacks) do
                        task.spawn(v321, v314, unpack(v314._values, 1, v314._valuesLength));
                    end;
                    if v48.TEST then
                        return;
                    else
                        warn(v319);
                        return;
                    end;
                end;
            end)();
        end;
        v314:_finalize();
        return;
    end;
end;
v48.prototype._finalize = function(v322) --[[ Line: 1311 ]] --[[ Name: _finalize ]]
    -- upvalues: v48 (copy)
    for _, v324 in ipairs(v322._queuedFinally) do
        coroutine.wrap(v324)(v322._status);
    end;
    v322._queuedFinally = nil;
    v322._queuedReject = nil;
    v322._queuedResolve = nil;
    if not v48.TEST then
        v322._parent = nil;
        v322._consumers = nil;
    end;
end;
v313 = function(v325, v326) --[[ Line: 1334 ]] --[[ Name: now ]]
    -- upvalues: v48 (copy), v9 (ref)
    local v327 = debug.traceback(nil, 2);
    if v325._status == v48.Status.Resolved then
        return v325:_andThen(v327, function(...) --[[ Line: 1337 ]]
            return ...;
        end);
    else
        return v48.reject(v326 == nil and v9.new({
            kind = v9.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v327
        }) or v326);
    end;
end;
v48.prototype.now = v313;
v48.retry = function(v328, v329, ...) --[[ Line: 1352 ]] --[[ Name: retry ]]
    -- upvalues: v48 (copy)
    assert(type(v328) == "function", "Parameter #1 to Promise.retry must be a function");
    assert(type(v329) == "number", "Parameter #2 to Promise.retry must be a number");
    local v330 = {
        ...
    };
    local v331 = select("#", ...);
    return v48.resolve(v328(...)):catch(function(...) --[[ Line: 1358 ]]
        -- upvalues: v329 (copy), v48 (ref), v328 (copy), v330 (copy), v331 (copy)
        if v329 > 0 then
            return v48.retry(v328, v329 - 1, unpack(v330, 1, v331));
        else
            return v48.reject(...);
        end;
    end);
end;
v48.fromEvent = function(v332, v333) --[[ Line: 1370 ]] --[[ Name: fromEvent ]]
    -- upvalues: v48 (copy)
    v333 = v333 or function() --[[ Line: 1371 ]]
        return true;
    end;
    return v48._new(debug.traceback(nil, 2), function(v334, _, v336) --[[ Line: 1375 ]]
        -- upvalues: v332 (copy), v333 (ref)
        local v337 = nil;
        local v338 = false;
        local function v339() --[[ Line: 1379 ]] --[[ Name: disconnect ]]
            -- upvalues: v337 (ref)
            v337:Disconnect();
            v337 = nil;
        end;
        v337 = v332:Connect(function(...) --[[ Line: 1388 ]]
            -- upvalues: v333 (ref), v334 (copy), v337 (ref), v338 (ref)
            local v340 = v333(...);
            if v340 == true then
                v334(...);
                if v337 then
                    v337:Disconnect();
                    v337 = nil;
                    return;
                else
                    v338 = true;
                    return;
                end;
            else
                if type(v340) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v338 and v337 then
            return v339();
        else
            v336(v339);
            return;
        end;
    end);
end;
v48.onUnhandledRejection = function(v341) --[[ Line: 1421 ]] --[[ Name: onUnhandledRejection ]]
    -- upvalues: v48 (copy)
    table.insert(v48._unhandledRejectionCallbacks, v341);
    return function() --[[ Line: 1424 ]]
        -- upvalues: v48 (ref), v341 (copy)
        local v342 = table.find(v48._unhandledRejectionCallbacks, v341);
        if v342 then
            table.remove(v48._unhandledRejectionCallbacks, v342);
        end;
    end;
end;
return v48;