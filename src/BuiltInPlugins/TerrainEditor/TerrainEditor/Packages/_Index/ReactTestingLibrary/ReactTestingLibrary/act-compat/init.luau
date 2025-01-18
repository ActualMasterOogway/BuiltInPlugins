local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local l_act_0 = require(script.Parent.jsHelpers["react-dom"]["test-utils"]).act;
local v5 = l_act_0 ~= nil;
local v6 = false;
local v7 = nil;
local function v21(v8) --[[ Line: 34 ]] --[[ Name: asyncAct ]]
    -- upvalues: v5 (copy), v7 (ref), v2 (copy), l_console_0 (copy), l_act_0 (copy), v6 (ref), l_act_0 (copy)
    if v5 == true then
        if v7 == nil then
            return v2.new(function(v9, v10) --[[ Line: 37 ]]
                -- upvalues: l_console_0 (ref), v7 (ref), l_act_0 (ref), v8 (copy), v6 (ref), v2 (ref), l_act_0 (ref)
                local l_error_0 = l_console_0.error;
                l_console_0.error = function(...) --[[ Line: 40 ]]
                    -- upvalues: v7 (ref), l_error_0 (copy)
                    local v12 = table.pack(...);
                    local v13 = typeof(v12[1]) == "string";
                    if v13 and string.find(v12[1], "Warning: Do not await the result of calling ReactTestUtils.act") == 1 then
                        v7 = false;
                        return;
                    elseif v13 and string.find(v12[1], "Warning: The callback passed to ReactTestUtils.act(...) function must not return anything") == 1 then
                        return;
                    else
                        l_error_0(...);
                        return;
                    end;
                end;
                local v14 = nil;
                local v15 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
                    -- upvalues: v15 (ref), l_act_0 (ref), v14 (ref), v8 (ref)
                    v15 = l_act_0(function() --[[ Line: 73 ]]
                        -- upvalues: v14 (ref), v8 (ref)
                        v14 = v8();
                        return v14;
                    end);
                end);
                if not l_status_0 then
                    l_console_0.error = l_error_0;
                    v10(l_result_0);
                    return;
                else
                    v15:andThen(function() --[[ Line: 85 ]]
                        -- upvalues: l_console_0 (ref), l_error_0 (copy), v7 (ref), v9 (copy)
                        l_console_0.error = l_error_0;
                        v7 = true;
                        v9();
                    end, function(v18) --[[ Line: 90 ]]
                        -- upvalues: l_console_0 (ref), l_error_0 (copy), v7 (ref), v10 (copy)
                        l_console_0.error = l_error_0;
                        v7 = true;
                        v10(v18);
                    end);
                    if v7 == false then
                        l_console_0.error = l_error_0;
                        if not v6 then
                            l_console_0.error("It looks like you're using a version of react-dom that supports the \"act\" function, but not an awaitable version of \"act\" which you will need. Please upgrade to at least react-dom@16.9.0 to remove this warning.");
                            v6 = true;
                        end;
                        v14:andThen(function() --[[ Line: 111 ]]
                            -- upvalues: v2 (ref), l_act_0 (ref), v9 (copy)
                            v2.resolve():andThen(function() --[[ Line: 114 ]]
                                -- upvalues: l_act_0 (ref), v9 (ref)
                                l_act_0(function() --[[ Line: 116 ]]

                                end);
                                v9();
                            end);
                        end, v10);
                    end;
                    return;
                end;
            end);
        elseif v7 == false then
            local v19 = nil;
            l_act_0(function() --[[ Line: 125 ]]
                -- upvalues: v19 (ref), v8 (copy)
                v19 = v8();
            end);
            return (v19:andThen(function() --[[ Line: 128 ]]
                -- upvalues: v2 (ref), l_act_0 (ref)
                return v2.resolve():andThen(function() --[[ Line: 129 ]]
                    -- upvalues: l_act_0 (ref)
                    l_act_0(function() --[[ Line: 131 ]]

                    end);
                end);
            end));
        else
            return l_act_0(v8);
        end;
    else
        local v20 = nil;
        l_act_0(function() --[[ Line: 141 ]]
            -- upvalues: v20 (ref), v8 (copy)
            v20 = v8();
        end);
        return v20:andThen(function() --[[ Line: 144 ]]
            -- upvalues: v2 (ref), l_act_0 (ref)
            return v2.resolve():andThen(function() --[[ Line: 145 ]]
                -- upvalues: l_act_0 (ref)
                l_act_0(function() --[[ Line: 147 ]]

                end);
            end);
        end);
    end;
end;
v3.default = l_act_0;
v3.asyncAct = v21;
return v3;