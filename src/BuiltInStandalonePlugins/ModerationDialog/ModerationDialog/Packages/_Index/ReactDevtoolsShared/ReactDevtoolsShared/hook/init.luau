local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local v5 = {};
local v6 = require(script.Parent.backend.console);
local l_patch_0 = v6.patch;
local l_registerRenderer_0 = v6.registerRenderer;
local _ = require(script.Parent.backend.types);
local l__G_0 = _G;
v5.installHook = function(v11) --[[ Line: 29 ]]
    -- upvalues: l_Map_0 (copy), l__G_0 (copy), l_registerRenderer_0 (copy), l_patch_0 (copy), l_Array_0 (copy), l_Set_0 (copy)
    if v11.__REACT_DEVTOOLS_GLOBAL_HOOK__ then
        return nil;
    else
        local v12 = nil;
        local v13 = {};
        local v14 = l_Map_0.new();
        local v15 = {};
        local v16 = l_Map_0.new();
        local _ = function(_) --[[ Line: 44 ]] --[[ Name: detectReactBuildType ]]
            return "production";
        end;
        local function v20(_) --[[ Line: 48 ]] --[[ Name: checkDCE ]]

        end;
        local v21 = 1;
        local function _() --[[ Line: 54 ]] --[[ Name: PREFIX_INCREMENT ]]
            -- upvalues: v21 (ref)
            v21 = v21 + 1;
            return v21;
        end;
        local function v30(v23) --[[ Line: 59 ]] --[[ Name: inject ]]
            -- upvalues: v21 (ref), v16 (copy), l__G_0 (ref), l_registerRenderer_0 (ref), l_patch_0 (ref), v11 (copy), v12 (ref)
            v21 = v21 + 1;
            local l_v21_0 = v21;
            v16:set(l_v21_0, v23);
            local v25 = "production";
            if _G.__DEV__ then
                pcall(function() --[[ Line: 71 ]]
                    -- upvalues: l__G_0 (ref), l_registerRenderer_0 (ref), v23 (copy), l_patch_0 (ref)
                    local v26 = l__G_0.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ ~= false;
                    local v27 = l__G_0.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ == true;
                    if v26 or v27 then
                        l_registerRenderer_0(v23);
                        l_patch_0({
                            appendComponentStack = v26, 
                            breakOnConsoleErrors = v27
                        });
                    end;
                end);
            end;
            local l___REACT_DEVTOOLS_ATTACH___0 = v11.__REACT_DEVTOOLS_ATTACH__;
            if type(l___REACT_DEVTOOLS_ATTACH___0) == "function" then
                local v29 = l___REACT_DEVTOOLS_ATTACH___0(v12, l_v21_0, v23, v11);
                v12.rendererInterfaces:set(l_v21_0, v29);
            end;
            v12.emit("renderer", {
                id = l_v21_0, 
                renderer = v23, 
                reactBuildType = v25
            });
            return l_v21_0;
        end;
        local function v33(v31, v32) --[[ Line: 109 ]] --[[ Name: sub ]]
            -- upvalues: v12 (ref)
            v12.on(v31, v32);
            return function() --[[ Line: 111 ]]
                -- upvalues: v12 (ref), v31 (copy), v32 (copy)
                return v12.off(v31, v32);
            end;
        end;
        local function v36(v34, v35) --[[ Line: 115 ]] --[[ Name: on ]]
            -- upvalues: v15 (copy)
            if not v15[v34] then
                v15[v34] = {};
            end;
            table.insert(v15[v34], v35);
        end;
        local function v40(v37, v38) --[[ Line: 121 ]] --[[ Name: off ]]
            -- upvalues: v15 (copy), l_Array_0 (ref)
            if not v15[v37] then
                return;
            else
                local v39 = l_Array_0.indexOf(v15[v37], v38);
                if v39 ~= -1 then
                    l_Array_0.splice(v15[v37], v39, 1);
                end;
                if #v15[v37] == 0 then
                    v15[v37] = nil;
                end;
                return;
            end;
        end;
        local function v45(v41, v42) --[[ Line: 135 ]] --[[ Name: emit ]]
            -- upvalues: v15 (copy)
            if v15[v41] then
                for _, v44 in v15[v41] do
                    v44(v42);
                end;
            end;
        end;
        local function v48(v46) --[[ Line: 142 ]] --[[ Name: getFiberRoots ]]
            -- upvalues: v13 (copy), l_Set_0 (ref)
            local l_v13_0 = v13;
            if not l_v13_0[v46] then
                l_v13_0[v46] = l_Set_0.new();
            end;
            return l_v13_0[v46];
        end;
        local function v52(v49, v50) --[[ Line: 151 ]] --[[ Name: onCommitFiberUnmount ]]
            -- upvalues: v14 (copy)
            local v51 = v14:get(v49);
            if v51 ~= nil then
                v51.handleCommitFiberUnmount(v50);
            end;
        end;
        local function v61(v53, v54, v55) --[[ Line: 158 ]] --[[ Name: onCommitFiberRoot ]]
            -- upvalues: v12 (ref), v14 (copy)
            local v56 = v12.getFiberRoots(v53);
            local l_current_0 = v54.current;
            local v58 = v56[v54] ~= nil;
            local v59 = true;
            if l_current_0.memoizedState ~= nil then
                v59 = l_current_0.memoizedState.element == nil;
            end;
            if not v58 and not v59 then
                v56[v54] = true;
            elseif v58 and v59 then
                v56[v54] = nil;
            end;
            local v60 = v14:get(v53);
            if v60 ~= nil then
                v60.handleCommitFiberRoot(v54, v55);
            end;
        end;
        v12 = {
            rendererInterfaces = v14, 
            listeners = v15, 
            renderers = v16, 
            emit = v45, 
            getFiberRoots = v48, 
            inject = v30, 
            on = v36, 
            off = v40, 
            sub = v33, 
            supportsFiber = true, 
            checkDCE = v20, 
            onCommitFiberUnmount = v52, 
            onCommitFiberRoot = v61
        };
        v11.__REACT_DEVTOOLS_GLOBAL_HOOK__ = v12;
        return v12;
    end;
end;
return v5;