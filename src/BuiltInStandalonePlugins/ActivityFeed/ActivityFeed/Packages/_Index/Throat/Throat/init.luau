local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local v4 = require(l_Parent_0.Promise);
local v5 = {};
local v6 = {};
local v7 = nil;
local function _(v8) --[[ Line: 59 ]] --[[ Name: isCallable ]]
    local v9 = true;
    if typeof(v8) ~= "function" then
        v9 = false;
        if typeof(v8) == "table" then
            v9 = false;
            if typeof((getmetatable(v8))) == "table" then
                v9 = typeof(getmetatable(v8).__call) == "function";
            end;
        end;
    end;
    return v9;
end;
local function v30(v11) --[[ Line: 69 ]] --[[ Name: throatInternal ]]
    -- upvalues: v7 (ref), v4 (copy), v6 (copy)
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = v7.new();
    local v17 = bit32.bor(v11, 0);
    local function v22(v18, v19) --[[ Line: 79 ]] --[[ Name: run ]]
        -- upvalues: v17 (ref), v4 (ref), v13 (ref), v14 (ref), v16 (copy), v6 (ref), v12 (ref)
        if bit32.bor(v17, 0) ~= 0 then
            v17 = bit32.bor(v17, 0) - 1;
            return v4.new(function(v20) --[[ Line: 82 ]]
                -- upvalues: v18 (copy), v19 (copy)
                v20(v18(table.unpack(v19)));
            end):andThen(v13, v14);
        else
            return v4.new(function(v21) --[[ Line: 86 ]]
                -- upvalues: v16 (ref), v6 (ref), v18 (copy), v19 (copy)
                v16:push(v6.new(v21, v18, v19));
            end):andThen(v12);
        end;
    end;
    v12 = function(v23) --[[ Line: 90 ]] --[[ Name: runDelayed ]]
        -- upvalues: v4 (ref), v13 (ref), v14 (ref)
        local v24, v25, v26 = pcall(function() --[[ Line: 91 ]]
            -- upvalues: v4 (ref), v23 (copy), v13 (ref), v14 (ref)
            return v4.resolve(v23.fn(table.unpack(v23.args))):andThen(v13, v14), true;
        end);
        if not v24 then
            v14(v25);
        end;
        if v26 then
            return v25;
        else
            return;
        end;
    end;
    v13 = function(v27) --[[ Line: 103 ]] --[[ Name: onFulfill ]]
        -- upvalues: v15 (ref)
        v15();
        return v27;
    end;
    v14 = function(v28) --[[ Line: 107 ]] --[[ Name: onReject ]]
        -- upvalues: v15 (ref)
        v15();
        error(v28);
    end;
    v15 = function() --[[ Line: 111 ]] --[[ Name: release ]]
        -- upvalues: v16 (copy), v17 (ref)
        local v29 = v16:shift();
        if v29 ~= nil then
            v29:resolve(v29);
            return;
        else
            v17 = bit32.bor(v17, 0) + 1;
            return;
        end;
    end;
    return v22;
end;
local function _(v31, v32) --[[ Line: 122 ]] --[[ Name: earlyBound ]]
    -- upvalues: v30 (copy)
    local v33 = v30((bit32.bor(v31, 0)));
    return function(...) --[[ Line: 124 ]]
        -- upvalues: v33 (copy), v32 (copy)
        local v34 = {
            ...
        };
        local v35 = {};
        for v36 = 0, #v34 - 1 do
            v35[v36 + 1] = v34[v36 + 1];
        end;
        return v33(v32, v35);
    end;
end;
local function _(v38) --[[ Line: 133 ]] --[[ Name: lateBound ]]
    -- upvalues: v30 (copy), l_Error_0 (copy)
    local v39 = v30((bit32.bor(v38, 0)));
    return function(v40, ...) --[[ Line: 135 ]]
        -- upvalues: l_Error_0 (ref), v39 (copy)
        local v41 = {
            v40, 
            ...
        };
        local v42 = true;
        if typeof(v40) ~= "function" then
            v42 = false;
            if typeof(v40) == "table" then
                v42 = false;
                if typeof((getmetatable(v40))) == "table" then
                    v42 = typeof(getmetatable(v40).__call) == "function";
                end;
            end;
        end;
        if not v42 then
            error(l_Error_0.new("Expected throat fn to be a function but got " .. tostring((typeof(v40)))));
        end;
        v42 = {};
        for v43 = 1, #v41 - 1 do
            v42[v43] = v41[v43 + 1];
        end;
        return v39(v40, v42);
    end;
end;
v5.default = function(v45, v46) --[[ Line: 149 ]]
    -- upvalues: l_Error_0 (copy), v30 (copy)
    local l_v45_0 = v45;
    local v48 = true;
    if typeof(l_v45_0) ~= "function" then
        v48 = false;
        if typeof(l_v45_0) == "table" then
            v48 = false;
            if typeof((getmetatable(l_v45_0))) == "table" then
                v48 = typeof(getmetatable(l_v45_0).__call) == "function";
            end;
        end;
    end;
    if v48 then
        v48 = v46;
        v46 = v45;
        v45 = v48;
    end;
    if typeof(v45) ~= "number" then
        error(l_Error_0.new("Expected throat size to be a number but got " .. tostring((typeof(v45)))));
    end;
    if v46 ~= nil then
        l_v45_0 = v46;
        v48 = true;
        if typeof(l_v45_0) ~= "function" then
            v48 = false;
            if typeof(l_v45_0) == "table" then
                v48 = false;
                if typeof((getmetatable(l_v45_0))) == "table" then
                    v48 = typeof(getmetatable(l_v45_0).__call) == "function";
                end;
            end;
        end;
        if not v48 then
            error(l_Error_0.new("Expected throat fn to be a function but got " .. tostring((typeof(v46)))));
        end;
    end;
    if v46 ~= nil then
        l_v45_0 = v46;
        v48 = true;
        if typeof(l_v45_0) ~= "function" then
            v48 = false;
            if typeof(l_v45_0) == "table" then
                v48 = false;
                if typeof((getmetatable(l_v45_0))) == "table" then
                    v48 = typeof(getmetatable(l_v45_0).__call) == "function";
                end;
            end;
        end;
        if v48 then
            l_v45_0 = bit32.bor(v45, 0);
            local l_v46_0 = v46;
            local v50 = v30((bit32.bor(l_v45_0, 0)));
            return function(...) --[[ Line: 124 ]]
                -- upvalues: v50 (copy), l_v46_0 (copy)
                local v51 = {
                    ...
                };
                local v52 = {};
                for v53 = 0, #v51 - 1 do
                    v52[v53 + 1] = v51[v53 + 1];
                end;
                return v50(l_v46_0, v52);
            end;
        end;
    end;
    l_v45_0 = bit32.bor(v45, 0);
    local v54 = v30((bit32.bor(l_v45_0, 0)));
    return function(v55, ...) --[[ Line: 135 ]]
        -- upvalues: l_Error_0 (ref), v54 (copy)
        local v56 = {
            v55, 
            ...
        };
        local v57 = true;
        if typeof(v55) ~= "function" then
            v57 = false;
            if typeof(v55) == "table" then
                v57 = false;
                if typeof((getmetatable(v55))) == "table" then
                    v57 = typeof(getmetatable(v55).__call) == "function";
                end;
            end;
        end;
        if not v57 then
            error(l_Error_0.new("Expected throat fn to be a function but got " .. tostring((typeof(v55)))));
        end;
        v57 = {};
        for v58 = 1, #v56 - 1 do
            v57[v58] = v56[v58 + 1];
        end;
        return v54(v55, v57);
    end;
end;
v6.__index = v6;
v6.new = function(v59, v60, v61) --[[ Line: 182 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v62 = setmetatable({}, v6);
    v62.resolve = v59;
    v62.fn = v60;
    v62.args = v61;
    return v62;
end;
local v63 = {};
v63.__index = v63;
v63.new = function() --[[ Line: 210 ]] --[[ Name: new ]]
    -- upvalues: v63 (copy)
    local v64 = setmetatable({}, v63);
    v64._s1 = {};
    v64._s2 = {};
    v64._pushBlock = {};
    v64._shiftBlock = v64._pushBlock;
    v64._pushIndex = 0;
    v64._shiftIndex = 0;
    return v64;
end;
v63.push = function(v65, v66) --[[ Line: 221 ]] --[[ Name: push ]]
    if v65._pushIndex == 64 then
        v65._pushIndex = 0;
        v65._pushBlock = {};
        v65._s1[#v65._s1 + 1] = v65._pushBlock;
    end;
    v65._pushBlock[v65._pushIndex + 1] = v66;
    v65._pushIndex = v65._pushIndex + 1;
end;
v63.shift = function(v67) --[[ Line: 231 ]] --[[ Name: shift ]]
    -- upvalues: l_Array_0 (copy)
    if v67._shiftIndex == 64 then
        v67._shiftIndex = 0;
        local l__s2_0 = v67._s2;
        if #l__s2_0 == 0 then
            local l__s1_0 = v67._s1;
            if #l__s1_0 == 0 then
                return nil;
            else
                v67._s1 = l__s2_0;
                v67._s2 = l_Array_0.reverse(l__s1_0);
                l__s2_0 = v67._s2;
            end;
        end;
        v67._shiftBlock = table.remove(l__s2_0);
    end;
    if v67._pushBlock == v67._shiftBlock and v67._pushIndex == v67._shiftIndex then
        return nil;
    else
        local v70 = v67._shiftBlock[v67._shiftIndex + 1];
        v67._shiftBlock[v67._shiftIndex + 1] = nil;
        v67._shiftIndex = v67._shiftIndex + 1;
        return v70;
    end;
end;
v7 = v63;
return v5;