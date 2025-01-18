local v0 = require(script.Parent.tutils);
local v1 = nil;
v1 = function(v2, ...) --[[ Line: 12 ]]
    local v3 = {
        pcall(v2, ...)
    };
    if not v3[1] then
        warn(v3[2]);
    end;
    return unpack(v3);
end;
local function _(v4, v5, v6) --[[ Line: 29 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v1 (ref)
    return function(...) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), v4 (copy), v5 (copy), v6 (copy)
        local v7 = {
            v1(v4, ...)
        };
        if table.remove(v7, 1) then
            v5(unpack(v7));
            return;
        else
            v6(unpack(v7));
            return;
        end;
    end;
end;
local function _(v9) --[[ Line: 42 ]] --[[ Name: isEmpty ]]
    return next(v9) == nil;
end;
local v11 = {};
v11.__index = v11;
v11.Status = {
    Started = "Started", 
    Resolved = "Resolved", 
    Rejected = "Rejected"
};
v11.new = function(v12) --[[ Line: 79 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v1 (ref)
    local v13 = {
        _source = debug.traceback(), 
        _type = "Promise", 
        _status = v11.Status.Started, 
        _value = nil, 
        _unhandledRejection = false, 
        _queuedResolve = {}, 
        _queuedReject = {}
    };
    setmetatable(v13, v11);
    local function v14(...) --[[ Line: 103 ]] --[[ Name: resolve ]]
        -- upvalues: v13 (copy)
        v13:_resolve(...);
    end;
    local function v15(...) --[[ Line: 107 ]] --[[ Name: reject ]]
        -- upvalues: v13 (copy)
        v13:_reject(...);
    end;
    local v16, v17 = v1(v12, v14, v15);
    if not v16 and v13._status == v11.Status.Started then
        v15(v17);
    end;
    return v13;
end;
v11.resolve = function(v18) --[[ Line: 123 ]] --[[ Name: resolve ]]
    -- upvalues: v11 (copy)
    return v11.new(function(v19) --[[ Line: 124 ]]
        -- upvalues: v18 (copy)
        v19(v18);
    end);
end;
v11.reject = function(v20) --[[ Line: 132 ]] --[[ Name: reject ]]
    -- upvalues: v11 (copy)
    return v11.new(function(_, v22) --[[ Line: 133 ]]
        -- upvalues: v20 (copy)
        v22(v20);
    end);
end;
v11.all = function(...) --[[ Line: 143 ]] --[[ Name: all ]]
    -- upvalues: v11 (copy)
    local v23 = {
        ...
    };
    if type(v23[1]) == "table" and v23[1]._type ~= "Promise" then
        v23 = v23[1];
    end;
    return v11.new(function(v24, v25) --[[ Line: 152 ]]
        -- upvalues: v23 (ref), v11 (ref)
        local v26 = false;
        local v27 = {};
        local v28 = 0;
        local function _(v29, v30) --[[ Line: 156 ]] --[[ Name: promiseCompleted ]]
            -- upvalues: v26 (ref), v27 (copy), v28 (ref), v23 (ref), v24 (copy)
            if v26 then
                return;
            else
                v27[v29] = v30;
                v28 = v28 + 1;
                if v28 == #v23 then
                    v24(v27);
                    v26 = true;
                end;
                return;
            end;
        end;
        if #v23 == 0 then
            v24(v27);
            v26 = true;
            return;
        else
            for v32, v33 in ipairs(v23) do
                if v33._status == v11.Status.Started then
                    v33:andThen(function(v34) --[[ Line: 179 ]]
                        -- upvalues: v32 (copy), v26 (ref), v27 (copy), v28 (ref), v23 (ref), v24 (copy)
                        local l_v32_0 = v32;
                        if v26 then
                            return;
                        else
                            v27[l_v32_0] = v34;
                            v28 = v28 + 1;
                            if v28 == #v23 then
                                v24(v27);
                                v26 = true;
                            end;
                            return;
                        end;
                    end):catch(function(v36) --[[ Line: 181 ]]
                        -- upvalues: v26 (ref), v25 (copy)
                        v26 = true;
                        v25(v36);
                    end);
                elseif v33._status == v11.Status.Resolved then
                    local v37 = unpack(v33._value);
                    if not v26 then
                        v27[v32] = v37;
                        v28 = v28 + 1;
                        if v28 == #v23 then
                            v24(v27);
                            v26 = true;
                        end;
                    end;
                else
                    v26 = true;
                    v25(unpack(v33._value));
                end;
            end;
            return;
        end;
    end);
end;
v11.is = function(v38) --[[ Line: 202 ]] --[[ Name: is ]]
    if type(v38) ~= "table" then
        return false;
    else
        return v38._type == "Promise";
    end;
end;
v11.andThen = function(v39, v40, v41) --[[ Line: 215 ]] --[[ Name: andThen ]]
    -- upvalues: v11 (copy), v1 (ref)
    v39._unhandledRejection = false;
    return v11.new(function(v42, v43) --[[ Line: 222 ]]
        -- upvalues: v40 (copy), v1 (ref), v41 (copy), v39 (copy), v11 (ref)
        local l_v42_0 = v42;
        if v40 then
            local l_v40_0 = v40;
            local l_l_v40_0_0 = l_v40_0 --[[ copy: 3 -> 5 ]];
            l_v42_0 = function(...) --[[ Line: 30 ]]
                -- upvalues: v1 (ref), l_l_v40_0_0 (copy), v42 (copy), v43 (copy)
                local v47 = {
                    v1(l_l_v40_0_0, ...)
                };
                if table.remove(v47, 1) then
                    v42(unpack(v47));
                    return;
                else
                    v43(unpack(v47));
                    return;
                end;
            end;
        end;
        local l_v43_0 = v43;
        if v41 then
            local l_v41_0 = v41;
            l_v43_0 = function(...) --[[ Line: 30 ]]
                -- upvalues: v1 (ref), l_v41_0 (copy), v42 (copy), v43 (copy)
                local v50 = {
                    v1(l_v41_0, ...)
                };
                if table.remove(v50, 1) then
                    v42(unpack(v50));
                    return;
                else
                    v43(unpack(v50));
                    return;
                end;
            end;
        end;
        if v39._status == v11.Status.Started then
            table.insert(v39._queuedResolve, l_v42_0);
            table.insert(v39._queuedReject, l_v43_0);
            return;
        elseif v39._status == v11.Status.Resolved then
            l_v42_0(unpack(v39._value));
            return;
        else
            if v39._status == v11.Status.Rejected then
                l_v43_0(unpack(v39._value));
            end;
            return;
        end;
    end);
end;
v11.catch = function(v51, v52) --[[ Line: 253 ]] --[[ Name: catch ]]
    return v51:andThen(nil, v52);
end;
v11.await = function(v53) --[[ Line: 262 ]] --[[ Name: await ]]
    -- upvalues: v11 (copy)
    v53._unhandledRejection = false;
    if v53._status == v11.Status.Started then
        local v54 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v53:andThen(function(...) --[[ Line: 269 ]]
            -- upvalues: v54 (ref), l_BindableEvent_0 (copy)
            v54 = {
                ...
            };
            l_BindableEvent_0:Fire(true);
        end, function(...) --[[ Line: 272 ]]
            -- upvalues: v54 (ref), l_BindableEvent_0 (copy)
            v54 = {
                ...
            };
            l_BindableEvent_0:Fire(false);
        end);
        local v56 = l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        if not v56 then
            error(tostring(v54[1]), 2);
        end;
        return unpack(v54);
    elseif v53._status == v11.Status.Resolved then
        return unpack(v53._value);
    else
        if v53._status == v11.Status.Rejected then
            error(tostring(v53._value[1]), 2);
        end;
        return;
    end;
end;
v11._resolve = function(v57, ...) --[[ Line: 292 ]] --[[ Name: _resolve ]]
    -- upvalues: v11 (copy)
    if v57._status ~= v11.Status.Started then
        return;
    elseif v11.is((...)) then
        if select("#", ...) > 1 then
            local v58 = ("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(v57._source);
            warn(v58);
        end;
        (...):andThen(function(...) --[[ Line: 307 ]]
            -- upvalues: v57 (copy)
            v57:_resolve(...);
        end, function(...) --[[ Line: 309 ]]
            -- upvalues: v57 (copy)
            v57:_reject(...);
        end);
        return;
    else
        v57._status = v11.Status.Resolved;
        v57._value = {
            ...
        };
        for _, v60 in ipairs(v57._queuedResolve) do
            v60(...);
        end;
        return;
    end;
end;
v11._reject = function(v61, ...) --[[ Line: 325 ]] --[[ Name: _reject ]]
    -- upvalues: v11 (copy), v0 (copy)
    if v61._status ~= v11.Status.Started then
        return;
    else
        v61._status = v11.Status.Rejected;
        v61._value = {
            ...
        };
        local l__queuedReject_0 = v61._queuedReject;
        if not (next(l__queuedReject_0) == nil) then
            for _, v64 in ipairs(v61._queuedReject) do
                v64(...);
            end;
            return;
        else
            v61._unhandledRejection = true;
            local v65 = v0.toString((...));
            spawn(function() --[[ Line: 350 ]]
                -- upvalues: v61 (copy), v65 (copy)
                if not v61._unhandledRejection then
                    return;
                else
                    local v66 = ("Unhandled promise rejection:\n\n%s\n\n%s"):format(v65, v61._source);
                    warn(v66);
                    return;
                end;
            end);
            return;
        end;
    end;
end;
return v11;