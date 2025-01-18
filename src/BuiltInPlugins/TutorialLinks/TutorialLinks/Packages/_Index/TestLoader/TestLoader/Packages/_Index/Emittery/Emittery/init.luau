local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_Symbol_0 = v1.Symbol;
local l_WeakMap_0 = v1.WeakMap;
local l_console_0 = v1.console;
local v11 = require(l_Parent_0.Promise);
local l_HttpService_0 = game:GetService("HttpService");
local v13 = nil;
local l_None_0 = l_Object_0.None;
local v15 = {};
local v16 = l_WeakMap_0.new();
local v17 = l_WeakMap_0.new();
local v18 = l_WeakMap_0.new();
local v19 = l_Symbol_0("anyProducer");
local v20 = v11.resolve();
local v21 = l_Symbol_0("listenerAdded");
local v22 = l_Symbol_0("listenerRemoved");
local v23 = l_Symbol_0("metaEventsAllowed");
local v24 = false;
local function _(v25) --[[ Line: 58 ]] --[[ Name: isSymbol ]]
    local v26 = false;
    if typeof(v25) == "userdata" then
        v26 = tostring(v25):match("Symbol%(.*%)") ~= nil;
    end;
    return v26;
end;
local function _(v28) --[[ Line: 67 ]] --[[ Name: isCallable ]]
    local v29 = true;
    if typeof(v28) ~= "function" then
        v29 = false;
        if typeof(v28) == "table" then
            v29 = false;
            if typeof((getmetatable(v28))) == "table" then
                v29 = typeof(getmetatable(v28).__call) == "function";
            end;
        end;
    end;
    return v29;
end;
local function v34(v31, v32) --[[ Line: 77 ]] --[[ Name: assertEventName ]]
    -- upvalues: l_Error_0 (copy), v13 (ref), v23 (copy)
    if typeof(v31) ~= "string" then
        local v33 = false;
        if typeof(v31) == "userdata" then
            v33 = tostring(v31):match("Symbol%(.*%)") ~= nil;
        end;
        if not v33 and typeof(v31) ~= "number" then
            error(l_Error_0.new("`eventName` must be a string, symbol, or number"));
        end;
    end;
    if v13(v31) and v32 ~= v23 then
        error(l_Error_0.new("`eventName` cannot be meta event `listenerAdded` or `listenerRemoved`"));
    end;
end;
local function _(v35) --[[ Line: 91 ]] --[[ Name: assertListener ]]
    -- upvalues: l_Error_0 (copy)
    local v36 = true;
    if typeof(v35) ~= "function" then
        v36 = false;
        if typeof(v35) == "table" then
            v36 = false;
            if typeof((getmetatable(v35))) == "table" then
                v36 = typeof(getmetatable(v35).__call) == "function";
            end;
        end;
    end;
    if not v36 then
        error(l_Error_0.new("listener must be a function"));
    end;
end;
local function _(v38, v39) --[[ Line: 98 ]] --[[ Name: getListeners ]]
    -- upvalues: v17 (copy), l_Set_0 (copy)
    local v40 = v17:get(v38);
    if not v40:has(v39) then
        v40:set(v39, l_Set_0.new());
    end;
    return v40:get(v39);
end;
local function v48(v42, v43) --[[ Line: 106 ]] --[[ Name: getEventProducers ]]
    -- upvalues: v19 (copy), v18 (copy), l_Set_0 (copy)
    local v44 = false;
    local v45;
    if typeof(v43) ~= "string" then
        local v46 = false;
        if typeof(v43) == "userdata" then
            v46 = tostring(v43):match("Symbol%(.*%)") ~= nil;
        end;
        if not v46 and typeof(v43) ~= "number" then
            v45 = v19;
            v44 = true;
        end;
    end;
    if not v44 then
        v45 = v43;
    end;
    v44 = false;
    local v47 = v18:get(v42);
    if not v47:has(v45) then
        v47:set(v45, l_Set_0.new());
    end;
    return v47:get(v45);
end;
local function v58(v49, v50, v51) --[[ Line: 120 ]] --[[ Name: enqueueProducers ]]
    -- upvalues: v18 (copy), v19 (copy), v11 (copy)
    local v52 = v18:get(v49);
    if v52:has(v50) then
        for _, v54 in v52:get(v50):ipairs() do
            v54:enqueue(v51);
        end;
    end;
    if v52:has(v19) then
        local v55 = v11.all({
            v11.resolve(v50), 
            v11.resolve(v51)
        });
        for _, v57 in v52:get(v19):ipairs() do
            v57:enqueue(v55);
        end;
    end;
end;
local function v77(v59, v60) --[[ Line: 140 ]] --[[ Name: iterator ]]
    -- upvalues: l_Array_0 (copy), l_None_0 (copy), v48 (copy), v11 (copy)
    if not l_Array_0.isArray(v60) then
        v60 = if v60 ~= nil then {
            v60
        } else {
            l_None_0
        };
    end;
    local v61 = false;
    local function v62() --[[ Line: 144 ]] --[[ Name: flush ]]

    end;
    local v63 = {};
    local v67 = {
        enqueue = function(_, v65) --[[ Line: 149 ]] --[[ Name: enqueue ]]
            -- upvalues: v63 (ref), v62 (ref)
            table.insert(v63, v65);
            v62();
        end, 
        finish = function(_) --[[ Line: 153 ]] --[[ Name: finish ]]
            -- upvalues: v61 (ref), v62 (ref)
            v61 = true;
            v62();
        end
    };
    for _, v69 in v60 do
        v48(v59, v69):add(v67);
    end;
    return {
        next = function(v70) --[[ Line: 164 ]] --[[ Name: next ]]
            -- upvalues: v11 (ref), v63 (ref), v61 (ref), v62 (ref)
            return v11.resolve():andThen(function() --[[ Line: 165 ]]
                -- upvalues: v63 (ref), v61 (ref), v70 (copy), v11 (ref), v62 (ref)
                if v63 == nil then
                    return {
                        done = true
                    };
                elseif #v63 == 0 then
                    if v61 then
                        v63 = nil;
                        return v70:next();
                    else
                        v11.new(function(v71) --[[ Line: 175 ]]
                            -- upvalues: v62 (ref)
                            v62 = v71;
                        end):expect();
                        return v70:next();
                    end;
                else
                    return {
                        done = false, 
                        value = v11.resolve((table.remove(v63, 1))):expect()
                    };
                end;
            end);
        end, 
        ["return"] = function(_, ...) --[[ Line: 188 ]]
            -- upvalues: v11 (ref), v63 (ref), v60 (ref), v48 (ref), v59 (copy), v67 (copy), v62 (ref)
            local v73 = ...;
            local v74 = {
                ...
            };
            return v11.resolve():andThen(function() --[[ Line: 191 ]]
                -- upvalues: v63 (ref), v60 (ref), v48 (ref), v59 (ref), v67 (ref), v62 (ref), v74 (copy), v73 (copy)
                v63 = nil;
                for _, v76 in v60 do
                    v48(v59, v76):delete(v67);
                end;
                v62();
                if #v74 > 0 then
                    return {
                        done = true, 
                        value = v73:expect()
                    };
                else
                    return {
                        done = true
                    };
                end;
            end);
        end
    };
end;
v13 = function(v78) --[[ Line: 234 ]] --[[ Name: isMetaEvent ]]
    -- upvalues: v21 (copy), v22 (copy)
    local v79 = true;
    if v78 ~= v21 then
        v79 = v78 == v22;
    end;
    return v79;
end;
local v80 = {};
v80.__index = v80;
v80.new = function(v81) --[[ Line: 256 ]] --[[ Name: new ]]
    -- upvalues: v80 (copy), v16 (copy), l_Set_0 (copy), v17 (copy), l_Map_0 (copy), v18 (copy), l_Boolean_0 (copy), l_HttpService_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_console_0 (copy)
    local v82 = setmetatable({}, v80);
    local v83 = if v81 ~= nil then v81 else {};
    v16:set(v82, l_Set_0.new());
    v17:set(v82, l_Map_0.new());
    v18:set(v82, l_Map_0.new());
    v82.debug = l_Boolean_0.toJSBoolean(v83.debug) and v83.debug or {};
    if v82.debug.enabled == nil then
        v82.debug.enabled = false;
    end;
    if not l_Boolean_0.toJSBoolean(v82.debug.logger) then
        v82.debug.logger = function(_, v85, v86, v87, v88) --[[ Line: 269 ]]
            -- upvalues: l_HttpService_0 (ref), l_Array_0 (ref), l_Object_0 (ref), l_console_0 (ref)
            xpcall(function() --[[ Line: 270 ]]
                -- upvalues: v88 (ref), l_HttpService_0 (ref)
                v88 = l_HttpService_0:JSONEncode(v88);
            end, function() --[[ Line: 273 ]]
                -- upvalues: v88 (ref), l_Array_0 (ref), l_Object_0 (ref)
                v88 = ("Object with the following keys failed to stringify: %s"):format(l_Array_0.join(l_Object_0.keys(v88), ","));
            end);
            local l_v87_0 = v87;
            local v90 = false;
            if typeof(l_v87_0) == "userdata" then
                v90 = tostring(l_v87_0):match("Symbol%(.*%)") ~= nil;
            end;
            if v90 or typeof(v87) == "number" then
                v87 = tostring(v87);
            end;
            v90 = DateTime.now():ToUniversalTime();
            l_v87_0 = ("%d:%d:%d.%d"):format(v90.Hour, v90.Minute, v90.Second, v90.Millisecond);
            l_console_0.log(("[%s][emittery:%s][%s] Event Name: %s\n\tdata: %s"):format(l_v87_0, tostring(v85), tostring(v86), tostring(v87), (tostring(v88))));
        end;
    end;
    return v82;
end;
v80.getIsDebugEnabled = function() --[[ Line: 371 ]] --[[ Name: getIsDebugEnabled ]]
    -- upvalues: v24 (ref), l_Boolean_0 (copy)
    return v24;
end;
v80.setIsDebugEnabled = function(v91) --[[ Line: 380 ]] --[[ Name: setIsDebugEnabled ]]
    -- upvalues: v24 (ref)
    v24 = v91;
end;
v80.logIfDebugEnabled = function(v92, v93, v94, v95) --[[ Line: 384 ]] --[[ Name: logIfDebugEnabled ]]
    -- upvalues: v80 (copy)
    if v80.getIsDebugEnabled() or v92.debug.enabled then
        v92.debug:logger(v93, v92.debug.name, v94, v95);
    end;
end;
v80.on = function(v96, v97, v98) --[[ Line: 393 ]] --[[ Name: on ]]
    -- upvalues: l_Error_0 (copy), l_Array_0 (copy), v34 (copy), v23 (copy), v17 (copy), l_Set_0 (copy), v13 (ref), v21 (copy)
    local v99 = true;
    if typeof(v98) ~= "function" then
        v99 = false;
        if typeof(v98) == "table" then
            v99 = false;
            if typeof((getmetatable(v98))) == "table" then
                v99 = typeof(getmetatable(v98).__call) == "function";
            end;
        end;
    end;
    if not v99 then
        error(l_Error_0.new("listener must be a function"));
    end;
    if not l_Array_0.isArray(v97) then
        v97 = {
            v97
        };
    end;
    for _, v101 in v97 do
        v34(v101, v23);
        local v102 = v17:get(v96);
        if not v102:has(v101) then
            v102:set(v101, l_Set_0.new());
        end;
        v102:get(v101):add(v98);
        v96:logIfDebugEnabled("subscribe", v101, nil);
        if not v13(v101) then
            v96:emit(v21, {
                eventName = v101, 
                listener = v98
            }, v23);
        end;
    end;
    return function() --[[ Line: 407 ]]
        -- upvalues: v96 (copy), v97 (ref), v98 (copy)
        return v96:off(v97, v98);
    end;
end;
v80.off = function(v103, v104, v105) --[[ Line: 412 ]] --[[ Name: off ]]
    -- upvalues: l_Error_0 (copy), l_Array_0 (copy), v34 (copy), v23 (copy), v17 (copy), l_Set_0 (copy), v13 (ref), v22 (copy)
    local v106 = true;
    if typeof(v105) ~= "function" then
        v106 = false;
        if typeof(v105) == "table" then
            v106 = false;
            if typeof((getmetatable(v105))) == "table" then
                v106 = typeof(getmetatable(v105).__call) == "function";
            end;
        end;
    end;
    if not v106 then
        error(l_Error_0.new("listener must be a function"));
    end;
    if not l_Array_0.isArray(v104) then
        v104 = {
            v104
        };
    end;
    for _, v108 in v104 do
        v34(v108, v23);
        local v109 = v17:get(v103);
        if not v109:has(v108) then
            v109:set(v108, l_Set_0.new());
        end;
        v109:get(v108):delete(v105);
        v103:logIfDebugEnabled("unsubscribe", v108, nil);
        if not v13(v108) then
            v103:emit(v22, {
                eventName = v108, 
                listener = v105
            }, v23);
        end;
    end;
end;
v80.once = function(v110, v111) --[[ Line: 428 ]] --[[ Name: once ]]
    -- upvalues: v11 (copy)
    return v11.new(function(v112) --[[ Line: 429 ]]
        -- upvalues: v110 (copy), v111 (copy)
        local v113 = nil;
        v113 = v110:on(v111, function(v114) --[[ Line: 431 ]]
            -- upvalues: v113 (ref), v112 (copy)
            v113();
            v112(v114);
        end);
    end);
end;
v80.events = function(v115, v116) --[[ Line: 438 ]] --[[ Name: events ]]
    -- upvalues: l_Array_0 (copy), v34 (copy), v23 (copy), v77 (copy)
    if not l_Array_0.isArray(v116) then
        v116 = {
            v116
        };
    end;
    for _, v118 in v116 do
        v34(v118, v23);
    end;
    return (v77(v115, v116));
end;
v80.emit = function(v119, v120, v121, v122) --[[ Line: 448 ]] --[[ Name: emit ]]
    -- upvalues: v11 (copy), v34 (copy), v58 (copy), v17 (copy), l_Set_0 (copy), v16 (copy), l_Array_0 (copy), l_Boolean_0 (copy), v13 (ref), v20 (copy)
    return v11.resolve():andThen(function() --[[ Line: 449 ]]
        -- upvalues: v34 (ref), v120 (copy), v122 (copy), v119 (copy), v121 (copy), v58 (ref), v17 (ref), l_Set_0 (ref), v16 (ref), l_Array_0 (ref), l_Boolean_0 (ref), v13 (ref), v20 (ref), v11 (ref)
        v34(v120, v122);
        v119:logIfDebugEnabled("emit", v120, v121);
        v58(v119, v120, v121);
        local l_v119_0 = v119;
        local l_v120_0 = v120;
        local v125 = v17:get(l_v119_0);
        if not v125:has(l_v120_0) then
            v125:set(l_v120_0, l_Set_0.new());
        end;
        local v126 = v125:get(l_v120_0);
        l_v119_0 = v16:get(v119);
        l_v120_0 = l_Array_0.concat({}, l_Array_0.from(v126));
        v125 = if l_Boolean_0.toJSBoolean(v13(v120)) then {} else l_Array_0.concat({}, l_Array_0.from(l_v119_0));
        v20:andThen(function(...) --[[ Line: 465 ]]
            -- upvalues: v11 (ref)
            return v11.delay(0):andThenReturn(...);
        end):expect();
        v11.all(l_Array_0.concat({}, l_Array_0.map(l_v120_0, function(v127) --[[ Line: 472 ]]
            -- upvalues: v11 (ref), v126 (copy), v121 (ref)
            return v11.resolve():andThen(function() --[[ Line: 473 ]]
                -- upvalues: v126 (ref), v127 (copy), v121 (ref)
                if v126:has(v127) then
                    return v127(v121);
                else
                    return;
                end;
            end);
        end), l_Array_0.map(v125, function(v128) --[[ Line: 480 ]]
            -- upvalues: v11 (ref), l_v119_0 (copy), v120 (ref), v121 (ref)
            return v11.resolve():andThen(function() --[[ Line: 481 ]]
                -- upvalues: l_v119_0 (ref), v128 (copy), v120 (ref), v121 (ref)
                if l_v119_0:has(v128) then
                    return v128(v120, v121);
                else
                    return;
                end;
            end);
        end))):expect();
    end);
end;
v80.emitSerial = function(v129, v130, v131, v132) --[[ Line: 492 ]] --[[ Name: emitSerial ]]
    -- upvalues: v11 (copy), v34 (copy), v17 (copy), l_Set_0 (copy), v16 (copy), l_Array_0 (copy), v20 (copy)
    return v11.resolve():andThen(function() --[[ Line: 493 ]]
        -- upvalues: v34 (ref), v130 (copy), v132 (copy), v129 (copy), v131 (copy), v17 (ref), l_Set_0 (ref), v16 (ref), l_Array_0 (ref), v20 (ref), v11 (ref)
        v34(v130, v132);
        v129:logIfDebugEnabled("emitSerial", v130, v131);
        local l_v129_0 = v129;
        local l_v130_0 = v130;
        local v135 = v17:get(l_v129_0);
        if not v135:has(l_v130_0) then
            v135:set(l_v130_0, l_Set_0.new());
        end;
        local v136 = v135:get(l_v130_0);
        l_v129_0 = v16:get(v129);
        l_v130_0 = l_Array_0.concat({}, l_Array_0.from(v136));
        v135 = l_Array_0.concat({}, l_Array_0.from(l_v129_0));
        v20:andThen(function(...) --[[ Line: 505 ]]
            -- upvalues: v11 (ref)
            return v11.delay(0):andThenReturn(...);
        end):expect();
        for _, v138 in l_v130_0 do
            if v136:has(v138) then
                v11.resolve(v138(v131)):expect();
            end;
        end;
        for _, v140 in v135 do
            if l_v129_0:has(v140) then
                v11.resolve(v140(v130, v131)):expect();
            end;
        end;
    end);
end;
v80.onAny = function(v141, v142) --[[ Line: 528 ]] --[[ Name: onAny ]]
    -- upvalues: l_Error_0 (copy), v16 (copy), v21 (copy), v23 (copy)
    local v143 = true;
    if typeof(v142) ~= "function" then
        v143 = false;
        if typeof(v142) == "table" then
            v143 = false;
            if typeof((getmetatable(v142))) == "table" then
                v143 = typeof(getmetatable(v142).__call) == "function";
            end;
        end;
    end;
    if not v143 then
        error(l_Error_0.new("listener must be a function"));
    end;
    v141:logIfDebugEnabled("subscribeAny", nil, nil);
    v16:get(v141):add(v142);
    v141:emit(v21, {
        listener = v142
    }, v23);
    return function() --[[ Line: 535 ]]
        -- upvalues: v141 (copy), v142 (copy)
        v141:offAny(v142);
    end;
end;
v80.anyEvent = function(v144) --[[ Line: 540 ]] --[[ Name: anyEvent ]]
    -- upvalues: v77 (copy)
    return (v77(v144));
end;
v80.offAny = function(v145, v146) --[[ Line: 544 ]] --[[ Name: offAny ]]
    -- upvalues: l_Error_0 (copy), v22 (copy), v23 (copy), v16 (copy)
    local v147 = true;
    if typeof(v146) ~= "function" then
        v147 = false;
        if typeof(v146) == "table" then
            v147 = false;
            if typeof((getmetatable(v146))) == "table" then
                v147 = typeof(getmetatable(v146).__call) == "function";
            end;
        end;
    end;
    if not v147 then
        error(l_Error_0.new("listener must be a function"));
    end;
    v145:logIfDebugEnabled("unsubscribeAny", nil, nil);
    v145:emit(v22, {
        listener = v146
    }, v23);
    v16:get(v145):delete(v146);
end;
v80.clearListeners = function(v148, v149) --[[ Line: 553 ]] --[[ Name: clearListeners ]]
    -- upvalues: l_Array_0 (copy), l_None_0 (copy), v17 (copy), l_Set_0 (copy), v48 (copy), v16 (copy), v18 (copy)
    if not l_Array_0.isArray(v149) then
        v149 = if v149 ~= nil then {
            v149
        } else {
            l_None_0
        };
    end;
    for _, v151 in v149 do
        v148:logIfDebugEnabled("clear", v151, nil);
        if typeof(v151) ~= "string" then
            local v152 = false;
            if typeof(v151) == "userdata" then
                v152 = tostring(v151):match("Symbol%(.*%)") ~= nil;
            end;
            if not v152 and typeof(v151) ~= "number" then
                v16:get(v148):clear();
                for _, v154 in v17:get(v148):values() do
                    v154:clear();
                end;
                for _, v156 in v18:get(v148):values() do
                    for _, v158 in v156:ipairs() do
                        v158:finish();
                    end;
                    v156:clear();
                end;
                continue;
            end;
        end;
        local v159 = v17:get(v148);
        if not v159:has(v151) then
            v159:set(v151, l_Set_0.new());
        end;
        v159:get(v151):clear();
        local v160 = v48(v148, v151);
        for _, v162 in v160:ipairs() do
            v162:finish();
        end;
        v160:clear();
    end;
end;
v80.listenerCount = function(v163, v164) --[[ Line: 593 ]] --[[ Name: listenerCount ]]
    -- upvalues: l_Array_0 (copy), l_None_0 (copy), v16 (copy), v17 (copy), l_Set_0 (copy), v48 (copy), v34 (copy), v23 (copy), v18 (copy)
    if not l_Array_0.isArray(v164) then
        v164 = if v164 ~= nil then {
            v164
        } else {
            l_None_0
        };
    end;
    local v165 = 0;
    for _, v167 in v164 do
        if typeof(v167) == "string" then
            local l_size_0 = v16:get(v163).size;
            local v169 = v17:get(v163);
            if not v169:has(v167) then
                v169:set(v167, l_Set_0.new());
            end;
            v165 = v165 + (l_size_0 + v169:get(v167).size + v48(v163, v167).size + v48(v163).size);
        else
            if v167 ~= nil and v167 ~= l_None_0 then
                v34(v167, v23);
            end;
            v165 = v165 + v16:get(v163).size;
            for _, v171 in v17:get(v163):values() do
                v165 = v165 + v171.size;
            end;
            for _, v173 in v18:get(v163):values() do
                v165 = v165 + v173.size;
            end;
        end;
    end;
    return v165;
end;
v80.listenerAdded = v21;
v80.listenerRemoved = v22;
v15.default = v80;
return v15;