local _ = require(script.Parent.ReactElementType);
local _ = require(script.Parent["flowtypes.roblox"]);
local v2 = require(script.Parent.ReactSymbols);
local l_REACT_SUSPENSE_TYPE_0 = v2.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v2.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v2.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = v2.REACT_MEMO_TYPE;
local l_REACT_BLOCK_TYPE_0 = v2.REACT_BLOCK_TYPE;
local l_REACT_LAZY_TYPE_0 = v2.REACT_LAZY_TYPE;
local v9 = require(script.Parent["ConsolePatchingDev.roblox"]);
local l_disableLogs_0 = v9.disableLogs;
local l_reenableLogs_0 = v9.reenableLogs;
local l_ReactCurrentDispatcher_0 = require(script.Parent.ReactSharedInternals).ReactCurrentDispatcher;
local v13 = nil;
local v14 = nil;
local function _(v15) --[[ Line: 57 ]] --[[ Name: describeOwner ]]
    if type(v15) == "function" then
        return debug.info(v15, "n");
    elseif type(v15) == "table" then
        return (tostring(v15));
    else
        return nil;
    end;
end;
local function v21(v17, v18, v19) --[[ Line: 66 ]] --[[ Name: describeBuiltInComponentFrame ]]
    -- upvalues: v13 (ref)
    local v20 = nil;
    if _G.__DEV__ and v19 then
        v20 = if type(v19) == "function" then debug.info(v19, "n") else if type(v19) == "table" then tostring(v19) else nil;
    end;
    return v13(v17, v18, v20);
end;
local v22 = false;
local v23 = nil;
if _G.__DEV__ then
    v23 = setmetatable({}, {
        __mode = "k"
    });
end;
local function v46(v24, v25) --[[ Line: 113 ]] --[[ Name: describeNativeComponentFrame ]]
    -- upvalues: v22 (ref), v23 (ref), l_ReactCurrentDispatcher_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v13 (ref)
    local v26 = false;
    if not v24 or v22 then
        return "";
    else
        if _G.__DEV__ then
            local v27 = v23[v24];
            if v27 ~= nil then
                return v27;
            end;
        end;
        local v28 = nil;
        v22 = true;
        local v29 = nil;
        if _G.__DEV__ then
            v29 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = nil;
            l_disableLogs_0();
        end;
        local v30 = nil;
        local _, v35 = xpcall(function() --[[ Line: 153 ]]
            -- upvalues: v25 (copy), v30 (ref), v28 (ref), v24 (copy)
            if v25 then
                return;
            else
                local _, l_result_0 = pcall(function() --[[ Line: 159 ]]
                    -- upvalues: v30 (ref)
                    v30 = debug.traceback();
                    error({
                        stack = v30
                    });
                end);
                v28 = l_result_0;
                v24();
                return;
            end;
        end, function(v33) --[[ Line: 169 ]]
            -- upvalues: v30 (ref)
            return {
                message = v33, 
                stack = v30
            };
        end);
        local v36 = nil;
        if v35 and v28 and type(v35.stack) == "string" then
            local v37 = string.split(v35.stack, "\n");
            local v38 = string.split(v28.stack, "\n");
            local v39 = #v37 - 1;
            local v40 = #v38 - 1;
            while v39 >= 2 and v40 >= 0 and v37[v39] ~= v38[v40] do
                v40 = v40 - 1;
            end;
            while v39 >= 3 and v40 >= 1 do
                v39 = v39 - 1;
                v40 = v40 - 1;
                if v37[v39] ~= v38[v40] then
                    if v39 ~= 1 or v40 ~= 1 then
                        repeat
                            v39 = v39 - 1;
                            v40 = v40 - 1;
                            if v40 < 0 or v37[v39] ~= v38[v40] then
                                local v41 = "\n" .. "    in " .. v37[v39];
                                if _G.__DEV__ then
                                    v23[v24] = v41;
                                end;
                                v36 = v41;
                            end;
                            v26 = v39 < 3 or v40 < 1;
                        until v26;
                    else
                        break;
                    end;
                end;
                if v26 then
                    break;
                end;
            end;
        end;
        v26 = false;
        v22 = false;
        if _G.__DEV__ then
            l_ReactCurrentDispatcher_0.current = v29;
            l_reenableLogs_0();
        end;
        if v36 ~= nil then
            return v36;
        else
            local v42 = if type(v24) == "function" then debug.info(v24, "n") else if type(v24) == "table" then tostring(v24) else "";
            local v43 = "";
            if v42 ~= nil and v42 ~= "" then
                local v44 = nil;
                local _ = _G.__DEV__;
                v43 = v13(v42, nil, v44);
            end;
            if _G.__DEV__ then
                v23[v24] = v43;
            end;
            return v43;
        end;
    end;
end;
v13 = function(v47, v48, v49) --[[ Line: 283 ]] --[[ Name: describeComponentFrame ]]
    local v50 = "";
    if _G.__DEV__ and v48 then
        local l_fileName_0 = v48.fileName;
        local v52 = string.gsub(l_fileName_0, "^(.*)[\\/]", "");
        if string.match(v52, "^init%.") then
            local v53 = string.match(l_fileName_0, "^(.*)[\\/]");
            if v53 and #v53 ~= 0 then
                v52 = string.gsub(v53, "^(.*)[\\/]", "") .. "/" .. v52;
            end;
        end;
        v50 = " (at " .. v52 .. ":" .. v48.lineNumber .. ")";
    elseif v49 then
        v50 = " (created by " .. v49 .. ")";
    end;
    return "\n    in " .. (v47 or "Unknown") .. v50;
end;
local function v59(v54, v55, v56) --[[ Line: 316 ]] --[[ Name: describeClassComponentFrame ]]
    -- upvalues: v13 (ref)
    local v57 = tostring(v54);
    local v58 = nil;
    if _G.__DEV__ and v56 then
        v58 = if type(v56) == "function" then debug.info(v56, "n") else if type(v56) == "table" then tostring(v56) else nil;
    end;
    return v13(v57, v55, v58);
end;
v14 = function(v60, v61, v62) --[[ Line: 340 ]] --[[ Name: describeFunctionComponentFrame ]]
    -- upvalues: v13 (ref)
    if not v60 then
        return "";
    else
        local v63 = if type(v60) == "function" then debug.info(v60, "n") else tostring(v60);
        local v64 = nil;
        if _G.__DEV__ and v62 then
            v64 = if type(v62) == "function" then debug.info(v62, "n") else if type(v62) == "table" then tostring(v62) else nil;
        end;
        return v13(v63, v61, v64);
    end;
end;
local function v65(v66, v67, v68) --[[ Line: 387 ]] --[[ Name: describeUnknownElementTypeFrameInDEV ]]
    -- upvalues: v59 (copy), v14 (ref), v21 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v65 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if not _G.__DEV__ then
        return "";
    elseif v66 == nil then
        return "";
    elseif type(v66) == "table" and type(v66.__ctor) == "function" then
        return v59(v66, v67, v68);
    elseif type(v66) == "function" then
        return v14(v66, v67, v68);
    elseif type(v66) == "string" then
        return v21(v66, v67, v68);
    elseif v66 == l_REACT_SUSPENSE_TYPE_0 then
        return v21("Suspense", v67, v68);
    elseif v66 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return v21("SuspenseList", v67, v68);
    else
        if type(v66) == "table" then
            local v69 = v66["$$typeof"];
            if v69 == l_REACT_FORWARD_REF_TYPE_0 then
                return v14(v66.render, v67, v68);
            elseif v69 == l_REACT_MEMO_TYPE_0 then
                return v65(v66.type, v67, v68);
            elseif v69 == l_REACT_BLOCK_TYPE_0 then
                return v14(v66._render, v67, v68);
            elseif v69 == l_REACT_LAZY_TYPE_0 then
                local l__payload_0 = v66._payload;
                local l__init_0 = v66._init;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 446 ]]
                    -- upvalues: v65 (ref), l__init_0 (copy), l__payload_0 (copy), v67 (copy), v68 (copy)
                    v65(l__init_0(l__payload_0), v67, v68);
                end);
                if l_status_1 then
                    return l_result_1;
                end;
            end;
        end;
        return "";
    end;
end;
return {
    describeComponentFrame = v13, 
    describeBuiltInComponentFrame = v21, 
    describeNativeComponentFrame = v46, 
    describeClassComponentFrame = v59, 
    describeFunctionComponentFrame = v14, 
    describeUnknownElementTypeFrameInDEV = v65
};