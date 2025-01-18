local _ = require(script.Parent.ReactElementType);
local l_enableComponentStackLocations_0 = require(script.Parent.ReactFeatureFlags).enableComponentStackLocations;
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
local function v18(v15, v16, _) --[[ Line: 42 ]] --[[ Name: describeBuiltInComponentFrame ]]
    -- upvalues: l_enableComponentStackLocations_0 (copy), v13 (ref)
    if l_enableComponentStackLocations_0 then
        return "\n" .. "    in " .. v15;
    else
        return v13(v15, v16, nil);
    end;
end;
local v19 = false;
local v20 = nil;
if _G.__DEV__ then
    v20 = setmetatable({}, {
        __mode = "k"
    });
end;
local function v42(v21, v22) --[[ Line: 80 ]] --[[ Name: describeNativeComponentFrame ]]
    -- upvalues: v19 (ref), v20 (ref), l_ReactCurrentDispatcher_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), l_enableComponentStackLocations_0 (copy), v13 (ref)
    local v23 = false;
    if not v21 or v19 then
        return "";
    else
        if _G.__DEV__ then
            local v24 = v20[v21];
            if v24 ~= nil then
                return v24;
            end;
        end;
        local v25 = nil;
        v19 = true;
        local v26 = nil;
        if _G.__DEV__ then
            v26 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = nil;
            l_disableLogs_0();
        end;
        local v27 = nil;
        local _, v32 = xpcall(function() --[[ Line: 120 ]]
            -- upvalues: v22 (copy), v27 (ref), v25 (ref), v21 (copy)
            if v22 then
                return;
            else
                local _, l_result_0 = pcall(function() --[[ Line: 126 ]]
                    -- upvalues: v27 (ref)
                    v27 = debug.traceback();
                    error({
                        stack = v27
                    });
                end);
                v25 = l_result_0;
                v21();
                return;
            end;
        end, function(v30) --[[ Line: 136 ]]
            -- upvalues: v27 (ref)
            return {
                message = v30, 
                stack = v27
            };
        end);
        local v33 = nil;
        if v32 and v25 and typeof(v32.stack) == "string" then
            local v34 = v32.stack:split("\n");
            local v35 = v25.stack:split("\n");
            local v36 = #v34 - 1;
            local v37 = #v35 - 1;
            while v36 >= 2 and v37 >= 0 and v34[v36] ~= v35[v37] do
                v37 = v37 - 1;
            end;
            while v36 >= 3 and v37 >= 1 do
                v36 = v36 - 1;
                v37 = v37 - 1;
                if v34[v36] ~= v35[v37] then
                    if v36 ~= 1 or v37 ~= 1 then
                        repeat
                            v36 = v36 - 1;
                            v37 = v37 - 1;
                            if v37 < 0 or v34[v36] ~= v35[v37] then
                                local v38 = "\n" .. "    in " .. v34[v36];
                                if _G.__DEV__ then
                                    v20[v21] = v38;
                                end;
                                v33 = v38;
                            end;
                            v23 = v36 < 3 or v37 < 1;
                        until v23;
                    else
                        break;
                    end;
                end;
                if v23 then
                    break;
                end;
            end;
        end;
        v23 = false;
        v19 = false;
        if _G.__DEV__ then
            l_ReactCurrentDispatcher_0.current = v26;
            l_reenableLogs_0();
        end;
        if v33 ~= nil then
            return v33;
        else
            local v39 = "";
            if typeof(v21) == "function" then
                v39 = debug.info(v21, "n");
            elseif typeof(v21) == "table" then
                v39 = tostring(v21);
            end;
            local v40 = "";
            if v39 ~= nil and v39 ~= "" then
                local l_v39_0 = v39;
                v40 = if l_enableComponentStackLocations_0 then "\n" .. "    in " .. l_v39_0 else v13(l_v39_0, nil, nil);
            end;
            if _G.__DEV__ then
                v20[v21] = v40;
            end;
            return v40;
        end;
    end;
end;
v13 = function(v43, v44, v45) --[[ Line: 255 ]] --[[ Name: describeComponentFrame ]]
    local v46 = "";
    if _G.__DEV__ and v44 then
        local l_fileName_0 = v44.fileName;
        local v48 = l_fileName_0:gsub("^(.*)[\\/]", "");
        if v48:match("^init%.") then
            local v49 = l_fileName_0:match("^(.*)[\\/]");
            if v49 and v49:len() ~= 0 then
                v48 = v49:gsub("^(.*)[\\/]", "") .. "/" .. v48;
            end;
        end;
        v46 = " (at " .. v48 .. ":" .. v44.lineNumber .. ")";
    elseif v45 then
        v46 = " (created by " .. v45 .. ")";
    end;
    return "\n    in " .. (v43 or "Unknown") .. v46;
end;
local function v53(v50, v51, v52) --[[ Line: 289 ]] --[[ Name: describeClassComponentFrame ]]
    -- upvalues: l_enableComponentStackLocations_0 (copy), v42 (copy), v14 (ref)
    if l_enableComponentStackLocations_0 then
        return (v42(v50, true));
    else
        return v14(v50, v51, v52);
    end;
end;
v14 = function(v54, v55, _) --[[ Line: 301 ]] --[[ Name: describeFunctionComponentFrame ]]
    -- upvalues: l_enableComponentStackLocations_0 (copy), v42 (copy), v13 (ref)
    if l_enableComponentStackLocations_0 then
        return (v42(v54, false));
    elseif not v54 then
        return "";
    else
        return v13(nil, v55, nil);
    end;
end;
local function v57(v58, v59, v60) --[[ Line: 331 ]] --[[ Name: describeUnknownElementTypeFrameInDEV ]]
    -- upvalues: l_enableComponentStackLocations_0 (copy), v42 (copy), v14 (ref), v18 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v57 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if not _G.__DEV__ then
        return "";
    elseif v58 == nil then
        return "";
    elseif typeof(v58) == "table" and typeof(v58.__ctor) == "function" then
        if l_enableComponentStackLocations_0 then
            return (v42(v58, true));
        else
            return v14(v58, v59, v60);
        end;
    elseif typeof(v58) == "function" then
        if l_enableComponentStackLocations_0 then
            return (v42(v58, false));
        else
            return v14(v58, v59, v60);
        end;
    elseif typeof(v58) == "string" then
        return v18(v58, v59, v60);
    elseif v58 == l_REACT_SUSPENSE_TYPE_0 then
        return v18("Suspense", v59, v60);
    elseif v58 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return v18("SuspenseList", v59, v60);
    else
        if typeof(v58) == "table" then
            local v61 = v58["$$typeof"];
            if v61 == l_REACT_FORWARD_REF_TYPE_0 then
                return v14(v58.render, v59, v60);
            elseif v61 == l_REACT_MEMO_TYPE_0 then
                return v57(v58.type, v59, v60);
            elseif v61 == l_REACT_BLOCK_TYPE_0 then
                return v14(v58._render, v59, v60);
            elseif v61 == l_REACT_LAZY_TYPE_0 then
                local l__payload_0 = v58._payload;
                local l__init_0 = v58._init;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 383 ]]
                    -- upvalues: v57 (ref), l__init_0 (copy), l__payload_0 (copy), v59 (copy), v60 (copy)
                    v57(l__init_0(l__payload_0), v59, v60);
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
    describeBuiltInComponentFrame = v18, 
    describeNativeComponentFrame = v42, 
    describeClassComponentFrame = v53, 
    describeFunctionComponentFrame = v14, 
    describeUnknownElementTypeFrameInDEV = v57
};