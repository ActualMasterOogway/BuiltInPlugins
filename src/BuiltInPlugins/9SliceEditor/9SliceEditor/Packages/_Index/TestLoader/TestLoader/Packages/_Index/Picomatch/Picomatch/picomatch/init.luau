local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local v7 = require(l_Parent_1.RegExp);
local v8 = require(l_Parent_0.scan);
local v9 = require(l_Parent_0.parse);
local v10 = require(l_Parent_0.utils);
local v11 = require(l_Parent_0.constants);
local function _(v12) --[[ Line: 22 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    local v13 = false;
    if typeof(v12) == "table" then
        v13 = not l_Array_0.isArray(v12);
    end;
    return v13;
end;
local v15 = nil;
local v20 = setmetatable({}, {
    __call = function(_, v17, v18, v19) --[[ Line: 51 ]] --[[ Name: __call ]]
        -- upvalues: v15 (ref)
        return v15(v17, v18, v19);
    end
});
v15 = function(v21, v22, v23) --[[ Line: 56 ]] --[[ Name: picomatch_ ]]
    -- upvalues: l_Array_0 (copy), v20 (copy), l_Boolean_0 (copy), l_Error_0 (copy), v10 (copy), l_Object_0 (copy)
    local v24 = v23 or false;
    if l_Array_0.isArray(v21) then
        local v26 = l_Array_0.map(v21, function(v25) --[[ Line: 68 ]]
            -- upvalues: v20 (ref), v22 (copy), v24 (copy)
            return v20(v25, v22, v24);
        end);
        local v27 = nil;
        local v30 = setmetatable({}, {
            __call = function(_, v29) --[[ Line: 74 ]] --[[ Name: __call ]]
                -- upvalues: v27 (ref)
                return v27(v29);
            end
        });
        v27 = function(v31) --[[ Line: 79 ]] --[[ Name: arrayMatcher_ ]]
            -- upvalues: v26 (copy)
            for _, v33 in ipairs(v26) do
                local v34 = v33(v31);
                if v34 then
                    return v34;
                end;
            end;
            return false;
        end;
        return v30;
    else
        local v35 = false;
        if typeof(v21) == "table" then
            v35 = not l_Array_0.isArray(v21);
        end;
        if v35 then
            v35 = l_Boolean_0.toJSBoolean(v21.tokens) and l_Boolean_0.toJSBoolean(v21.input);
        end;
        if v21 == "" or typeof(v21) ~= "string" and not v35 then
            error(l_Error_0.new("TypeError: Expected pattern to be a non-empty string"));
        end;
        local v36 = v22 or {};
        local v37 = v10.isWindows(v22);
        local v38 = if v35 then v20.compileRe(v21, v22) else v20.makeRe(v21, v22, false, true);
        local l_state_0 = v38.state;
        v38.state = nil;
        local v40 = nil;
        v40 = function(_) --[[ Line: 108 ]] --[[ Name: isIgnored ]]
            return false;
        end;
        if l_Boolean_0.toJSBoolean(v36.ignore) then
            local v42 = l_Object_0.assign({}, v22, {
                ignore = l_Object_0.None, 
                onMatch = l_Object_0.None, 
                onResult = l_Object_0.None
            });
            v40 = v20(v36.ignore, v42, v24);
        end;
        local v43 = nil;
        local v47 = setmetatable({}, {
            __call = function(_, v45, v46) --[[ Line: 124 ]] --[[ Name: __call ]]
                -- upvalues: v43 (ref)
                return v43(v45, v46);
            end
        });
        v43 = function(v48, v49) --[[ Line: 129 ]] --[[ Name: matcher_ ]]
            -- upvalues: v20 (ref), v38 (copy), v22 (copy), v21 (copy), v37 (copy), l_state_0 (copy), v36 (copy), v40 (ref)
            local v50 = v49 or false;
            local v51 = v20.test(v48, v38, v22, {
                glob = v21, 
                posix = v37
            });
            local l_isMatch_0 = v51.isMatch;
            local l_match_0 = v51.match;
            local l_output_0 = v51.output;
            local v55 = {
                glob = v21, 
                state = l_state_0, 
                regex = v38, 
                posix = v37, 
                input = v48, 
                output = l_output_0, 
                match = l_match_0, 
                isMatch = l_isMatch_0
            };
            if typeof(v36.onResult) == "function" then
                v36.onResult(v55);
            end;
            if l_isMatch_0 == false then
                v55.isMatch = false;
                if v50 then
                    return v55;
                else
                    return false;
                end;
            elseif v40(v48) then
                if typeof(v36.onIgnore) == "function" then
                    v36.onIgnore(v55);
                end;
                v55.isMatch = false;
                if v50 then
                    return v55;
                else
                    return false;
                end;
            else
                if typeof(v36.onMatch) == "function" then
                    v36.onMatch(v55);
                end;
                if v50 then
                    return v55;
                else
                    return true;
                end;
            end;
        end;
        if l_Boolean_0.toJSBoolean(v24) then
            v47.state = l_state_0;
        end;
        return v47;
    end;
end;
v20.test = function(v56, v57, v58, v59) --[[ Line: 191 ]] --[[ Name: test ]]
    -- upvalues: l_Error_0 (copy), l_Boolean_0 (copy), v10 (copy), v20 (copy)
    local v60 = v59 or {};
    local l_glob_0 = v60.glob;
    local l_posix_0 = v60.posix;
    if typeof(v56) ~= "string" then
        error(l_Error_0.new("TypeError: Expected input to be a string"));
    end;
    if v56 == "" then
        return {
            isMatch = false, 
            output = ""
        };
    else
        local v63 = v58 or {};
        local v64 = if l_Boolean_0.toJSBoolean(v63.format) then v63.format else if l_Boolean_0.toJSBoolean(l_posix_0) then v10.toPosixSlashes else nil;
        local v65 = v56 == l_glob_0;
        local v66 = if v65 and l_Boolean_0.toJSBoolean(v64) then v64(v56) else v56;
        if v65 == false then
            v66 = if l_Boolean_0.toJSBoolean(v64) then v64(v56) else v56;
            v65 = v66 == l_glob_0;
        end;
        if v65 == false or v63.capture == true then
            v65 = if not (v63.matchBase ~= true) or v63.basename == true then v20.matchBase(v56, v57, v58, l_posix_0) else v57:exec(v66);
        end;
        return {
            isMatch = l_Boolean_0.toJSBoolean(v65), 
            match = v65, 
            output = v66
        };
    end;
end;
v20.matchBase = function(_, _, _, _) --[[ Line: 242 ]] --[[ Name: matchBase ]]
    error("matchBase not implemented");
end;
v20.isMatch = function(v71, v72, v73) --[[ Line: 269 ]] --[[ Name: isMatch ]]
    -- upvalues: v20 (copy)
    return v20(v72, v73)(v71);
end;
v20.parse = function(v74, v75) --[[ Line: 287 ]] --[[ Name: parse ]]
    -- upvalues: l_Array_0 (copy), v20 (copy), v9 (copy), l_Object_0 (copy)
    if l_Array_0.isArray(v74) then
        return l_Array_0.map(v74, function(v76) --[[ Line: 289 ]]
            -- upvalues: v20 (ref), v75 (copy)
            return v20.parse(v76, v75);
        end);
    else
        return v9(v74, l_Object_0.assign({}, v75, {
            fastpaths = false
        }));
    end;
end;
v20.scan = function(v77, v78) --[[ Line: 323 ]] --[[ Name: scan ]]
    -- upvalues: v8 (copy)
    return v8(v77, v78);
end;
v20.compileRe = function(v79, v80, v81, v82) --[[ Line: 339 ]]
    -- upvalues: l_Boolean_0 (copy), v20 (copy)
    local v83 = v81 or false;
    local v84 = v82 or false;
    if v83 == true then
        return v79.output;
    else
        local v85 = v80 or {};
        local v86 = l_Boolean_0.toJSBoolean(v85.contains) and "" or "^";
        local v87 = l_Boolean_0.toJSBoolean(v85.contains) and "" or "$";
        local v88 = ("%s(?:%s)%s"):format(v86, tostring(v79.output), v87);
        if typeof(v79) == "table" and v79.negated == true then
            v88 = ("^(?!%s).*$"):format(v88);
        end;
        local v89 = v20.toRegex(v88, v80);
        if v84 == true then
            v89.state = v79;
        end;
        return v89;
    end;
end;
v20.makeRe = function(v90, v91, v92, v93) --[[ Line: 383 ]] --[[ Name: makeRe ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy), v9 (copy), v20 (copy)
    local v94 = v91 or {};
    local v95 = v92 or false;
    local v96 = v93 or false;
    if not l_Boolean_0.toJSBoolean(v90) or typeof(v90) ~= "string" then
        error(l_Error_0.new("TypeError: Expected a non-empty string"));
    end;
    local v97 = {
        negated = false, 
        fastpaths = true
    };
    if v94.fastpaths ~= false and (string.sub(v90, 1, 1) == "." or string.sub(v90, 1, 1) == "*") then
        v97.output = v9.fastpaths(v90, v94);
    end;
    if not l_Boolean_0.toJSBoolean(v97.output) then
        v97 = v9(v90, v94);
    end;
    return v20.compileRe(v97, v94, v95, v96);
end;
v20.toRegex = function(v98, v99) --[[ Line: 422 ]] --[[ Name: toRegex ]]
    -- upvalues: v7 (copy), l_Boolean_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 423 ]]
        -- upvalues: v99 (copy), v7 (ref), v98 (copy), l_Boolean_0 (ref)
        local v100 = v99 or {};
        return v7(v98, l_Boolean_0.toJSBoolean(v100.flags) and v100.flags or l_Boolean_0.toJSBoolean(v100.nocase) and "i" or "");
    end);
    if not l_status_0 then
        if v99 ~= nil and v99.debug == true then
            error(l_result_0);
        end;
        return v7("$^");
    else
        return l_result_0;
    end;
end;
v20.constants = v11;
return v20;