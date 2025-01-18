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
    if typeof(v15) == "function" then
        return debug.info(v15, "n");
    elseif typeof(v15) == "table" then
        return (tostring(v15));
    else
        return nil;
    end;
end;
local function v21(v17, v18, v19) --[[ Line: 66 ]] --[[ Name: describeBuiltInComponentFrame ]]
    -- upvalues: v13 (ref)
    local v20 = nil;
    if _G.__DEV__ and v19 then
        v20 = if typeof(v19) == "function" then debug.info(v19, "n") else if typeof(v19) == "table" then tostring(v19) else nil;
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
local function v47(v24, v25) --[[ Line: 113 ]] --[[ Name: describeNativeComponentFrame ]]
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
        if v35 and v28 and typeof(v35.stack) == "string" then
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
            local v42 = "";
            if typeof(v24) == "function" then
                v42 = debug.info(v24, "n");
            elseif typeof(v24) == "table" then
                v42 = tostring(v24);
            end;
            local v43 = "";
            if v42 ~= nil and v42 ~= "" then
                local l_v42_0 = v42;
                local v45 = nil;
                local _ = _G.__DEV__;
                v43 = v13(l_v42_0, nil, v45);
            end;
            if _G.__DEV__ then
                v23[v24] = v43;
            end;
            return v43;
        end;
    end;
end;
v13 = function(v48, v49, v50) --[[ Line: 288 ]] --[[ Name: describeComponentFrame ]]
    local v51 = "";
    if _G.__DEV__ and v49 then
        local l_fileName_0 = v49.fileName;
        local v53 = string.gsub(l_fileName_0, "^(.*)[\\/]", "");
        if string.match(v53, "^init%.") then
            local v54 = string.match(l_fileName_0, "^(.*)[\\/]");
            if v54 and #v54 ~= 0 then
                v53 = string.gsub(v54, "^(.*)[\\/]", "") .. "/" .. v53;
            end;
        end;
        v51 = " (at " .. v53 .. ":" .. v49.lineNumber .. ")";
    elseif v50 then
        v51 = " (created by " .. v50 .. ")";
    end;
    return "\n    in " .. (v48 or "Unknown") .. v51;
end;
local function v60(v55, v56, v57) --[[ Line: 321 ]] --[[ Name: describeClassComponentFrame ]]
    -- upvalues: v13 (ref)
    local v58 = tostring(v55);
    local v59 = nil;
    if _G.__DEV__ and v57 then
        v59 = if typeof(v57) == "function" then debug.info(v57, "n") else if typeof(v57) == "table" then tostring(v57) else nil;
    end;
    return v13(v58, v56, v59);
end;
v14 = function(v61, v62, v63) --[[ Line: 345 ]] --[[ Name: describeFunctionComponentFrame ]]
    -- upvalues: v13 (ref)
    if not v61 then
        return "";
    else
        local v64 = debug.info(v61, "n");
        local v65 = nil;
        if _G.__DEV__ and v63 then
            v65 = if typeof(v63) == "function" then debug.info(v63, "n") else if typeof(v63) == "table" then tostring(v63) else nil;
        end;
        return v13(v64, v62, v65);
    end;
end;
local function v66(v67, v68, v69) --[[ Line: 389 ]] --[[ Name: describeUnknownElementTypeFrameInDEV ]]
    -- upvalues: v60 (copy), v14 (ref), v21 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v66 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if not _G.__DEV__ then
        return "";
    elseif v67 == nil then
        return "";
    elseif typeof(v67) == "table" and typeof(v67.__ctor) == "function" then
        return v60(v67, v68, v69);
    elseif typeof(v67) == "function" then
        return v14(v67, v68, v69);
    elseif typeof(v67) == "string" then
        return v21(v67, v68, v69);
    elseif v67 == l_REACT_SUSPENSE_TYPE_0 then
        return v21("Suspense", v68, v69);
    elseif v67 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return v21("SuspenseList", v68, v69);
    else
        if typeof(v67) == "table" then
            local v70 = v67["$$typeof"];
            if v70 == l_REACT_FORWARD_REF_TYPE_0 then
                return v14(v67.render, v68, v69);
            elseif v70 == l_REACT_MEMO_TYPE_0 then
                return v66(v67.type, v68, v69);
            elseif v70 == l_REACT_BLOCK_TYPE_0 then
                return v14(v67._render, v68, v69);
            elseif v70 == l_REACT_LAZY_TYPE_0 then
                local l__payload_0 = v67._payload;
                local l__init_0 = v67._init;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 448 ]]
                    -- upvalues: v66 (ref), l__init_0 (copy), l__payload_0 (copy), v68 (copy), v69 (copy)
                    v66(l__init_0(l__payload_0), v68, v69);
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
    describeNativeComponentFrame = v47, 
    describeClassComponentFrame = v60, 
    describeFunctionComponentFrame = v14, 
    describeUnknownElementTypeFrameInDEV = v66
};