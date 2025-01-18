local v0 = nil;
v0 = pcall;
local function _(v1, v2, v3) --[[ Line: 27 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v0 (ref)
    return function(...) --[[ Line: 28 ]]
        -- upvalues: v0 (ref), v1 (copy), v2 (copy), v3 (copy)
        local v4 = {
            v0(v1, ...)
        };
        if table.remove(v4, 1) then
            v2(unpack(v4));
            return;
        else
            v3(unpack(v4));
            return;
        end;
    end;
end;
local function _(v6) --[[ Line: 40 ]] --[[ Name: isEmpty ]]
    return next(v6) == nil;
end;
local v8 = {};
v8.__index = v8;
v8.Status = {
    Started = "Started", 
    Resolved = "Resolved", 
    Rejected = "Rejected"
};
v8.new = function(v9) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v0 (ref)
    local v10 = {
        _source = debug.traceback(), 
        _type = "Promise", 
        _status = v8.Status.Started, 
        _value = nil, 
        _queuedResolve = {}, 
        _queuedReject = {}
    };
    setmetatable(v10, v8);
    local function v11(...) --[[ Line: 98 ]] --[[ Name: resolve ]]
        -- upvalues: v10 (copy)
        v10:_resolve(...);
    end;
    local function v12(...) --[[ Line: 102 ]] --[[ Name: reject ]]
        -- upvalues: v10 (copy)
        v10:_reject(...);
    end;
    local v13, v14 = v0(v9, v11, v12);
    if not v13 and v10._status == v8.Status.Started then
        v12(v14);
    end;
    return v10;
end;
v8.resolve = function(v15) --[[ Line: 118 ]] --[[ Name: resolve ]]
    -- upvalues: v8 (copy)
    return v8.new(function(v16) --[[ Line: 119 ]]
        -- upvalues: v15 (copy)
        v16(v15);
    end);
end;
v8.reject = function(v17) --[[ Line: 127 ]] --[[ Name: reject ]]
    -- upvalues: v8 (copy)
    return v8.new(function(_, v19) --[[ Line: 128 ]]
        -- upvalues: v17 (copy)
        v19(v17);
    end);
end;
v8.all = function(...) --[[ Line: 138 ]] --[[ Name: all ]]
    -- upvalues: v8 (copy)
    local v20 = {
        ...
    };
    if type(v20[1]) == "table" and v20[1]._type ~= "Promise" then
        v20 = v20[1];
    end;
    return v8.new(function(v21, v22) --[[ Line: 147 ]]
        -- upvalues: v20 (ref), v8 (ref)
        local v23 = false;
        local v24 = {};
        local v25 = 0;
        local function _(v26, v27) --[[ Line: 151 ]] --[[ Name: promiseCompleted ]]
            -- upvalues: v23 (ref), v24 (copy), v25 (ref), v20 (ref), v21 (copy)
            if v23 then
                return;
            else
                table.insert(v24, v26, v27);
                v25 = v25 + 1;
                if v25 == #v20 then
                    v21(v24);
                    v23 = true;
                end;
                return;
            end;
        end;
        for v29, v30 in ipairs(v20) do
            if v30._status == v8.Status.Started then
                v30:andThen(function(v31) --[[ Line: 169 ]]
                    -- upvalues: v29 (copy), v23 (ref), v24 (copy), v25 (ref), v20 (ref), v21 (copy)
                    local l_v29_0 = v29;
                    if v23 then
                        return;
                    else
                        table.insert(v24, l_v29_0, v31);
                        v25 = v25 + 1;
                        if v25 == #v20 then
                            v21(v24);
                            v23 = true;
                        end;
                        return;
                    end;
                end):catch(function(v33) --[[ Line: 172 ]]
                    -- upvalues: v23 (ref), v22 (copy)
                    v23 = true;
                    v22(v33);
                end);
            elseif v30._status == v8.Status.Resolved then
                local l__value_0 = v30._value;
                if not v23 then
                    table.insert(v24, v29, l__value_0);
                    v25 = v25 + 1;
                    if v25 == #v20 then
                        v21(v24);
                        v23 = true;
                    end;
                end;
            else
                v23 = true;
                v22(v30._value);
            end;
        end;
    end);
end;
v8.is = function(v35) --[[ Line: 193 ]] --[[ Name: is ]]
    if type(v35) ~= "table" then
        return false;
    else
        return v35._type == "Promise";
    end;
end;
v8.andThen = function(v36, v37, v38) --[[ Line: 206 ]] --[[ Name: andThen ]]
    -- upvalues: v8 (copy), v0 (ref)
    return v8.new(function(v39, v40) --[[ Line: 208 ]]
        -- upvalues: v37 (copy), v0 (ref), v38 (copy), v36 (copy), v8 (ref)
        local l_v39_0 = v39;
        if v37 then
            local l_v37_0 = v37;
            local l_l_v37_0_0 = l_v37_0 --[[ copy: 3 -> 5 ]];
            l_v39_0 = function(...) --[[ Line: 28 ]]
                -- upvalues: v0 (ref), l_l_v37_0_0 (copy), v39 (copy), v40 (copy)
                local v44 = {
                    v0(l_l_v37_0_0, ...)
                };
                if table.remove(v44, 1) then
                    v39(unpack(v44));
                    return;
                else
                    v40(unpack(v44));
                    return;
                end;
            end;
        end;
        local l_v40_0 = v40;
        if v38 then
            local l_v38_0 = v38;
            l_v40_0 = function(...) --[[ Line: 28 ]]
                -- upvalues: v0 (ref), l_v38_0 (copy), v39 (copy), v40 (copy)
                local v47 = {
                    v0(l_v38_0, ...)
                };
                if table.remove(v47, 1) then
                    v39(unpack(v47));
                    return;
                else
                    v40(unpack(v47));
                    return;
                end;
            end;
        end;
        if v36._status == v8.Status.Started then
            table.insert(v36._queuedResolve, l_v39_0);
            table.insert(v36._queuedReject, l_v40_0);
            return;
        elseif v36._status == v8.Status.Resolved then
            l_v39_0(unpack(v36._value));
            return;
        else
            if v36._status == v8.Status.Rejected then
                l_v40_0(unpack(v36._value));
            end;
            return;
        end;
    end);
end;
v8.catch = function(v48, v49) --[[ Line: 239 ]] --[[ Name: catch ]]
    return v48:andThen(nil, v49);
end;
v8.await = function(v50) --[[ Line: 248 ]] --[[ Name: await ]]
    -- upvalues: v8 (copy)
    if v50._status == v8.Status.Started then
        local v51 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v50:andThen(function(...) --[[ Line: 253 ]]
            -- upvalues: v51 (ref), l_BindableEvent_0 (copy)
            v51 = {
                ...
            };
            l_BindableEvent_0:Fire(true);
        end, function(...) --[[ Line: 256 ]]
            -- upvalues: v51 (ref), l_BindableEvent_0 (copy)
            v51 = {
                ...
            };
            l_BindableEvent_0:Fire(false);
        end);
        local v53 = l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        if not v53 then
            error(tostring(v51[1]), 2);
        end;
        return unpack(v51);
    elseif v50._status == v8.Status.Resolved then
        return unpack(v50._value);
    else
        if v50._status == v8.Status.Rejected then
            error(tostring(v50._value[1]), 2);
        end;
        return;
    end;
end;
v8._resolve = function(v54, ...) --[[ Line: 277 ]] --[[ Name: _resolve ]]
    -- upvalues: v8 (copy)
    if v54._status ~= v8.Status.Started then
        return;
    elseif v8.is((...)) then
        if select("#", ...) > 1 then

        end;
        (...):andThen(function(...) --[[ Line: 294 ]]
            -- upvalues: v54 (copy)
            v54:_resolve(...);
        end, function(...) --[[ Line: 296 ]]
            -- upvalues: v54 (copy)
            v54:_reject(...);
        end);
        return;
    else
        v54._status = v8.Status.Resolved;
        v54._value = {
            ...
        };
        for _, v56 in ipairs(v54._queuedResolve) do
            v56(...);
        end;
        return;
    end;
end;
v8._reject = function(v57, ...) --[[ Line: 313 ]] --[[ Name: _reject ]]
    -- upvalues: v8 (copy)
    if v57._status ~= v8.Status.Started then
        return;
    else
        v57._status = v8.Status.Rejected;
        v57._value = {
            ...
        };
        local l__queuedReject_0 = v57._queuedReject;
        if not (next(l__queuedReject_0) == nil) then
            for _, v60 in ipairs(v57._queuedReject) do
                v60(...);
            end;
        end;
        return;
    end;
end;
return v8;