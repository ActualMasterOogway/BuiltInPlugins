local v0 = require(script.Parent.Parent.Parent.StateTable);
local v1 = require(script.Parent.Parent.NavigationEvents);
local v2 = require(script.Parent.validate);
local v3 = tostring(v1.WillFocus);
local v4 = tostring(v1.DidFocus);
local v5 = tostring(v1.WillBlur);
local v6 = tostring(v1.DidBlur);
local v7 = tostring(v1.Action);
local v8 = tostring(v1.Refocus);
return function(v9, v10, v11, v12) --[[ Line: 44 ]]
    -- upvalues: v2 (copy), v0 (copy), v3 (copy), v1 (copy), v7 (copy), v8 (copy), v4 (copy), v5 (copy), v6 (copy)
    v2(type(v9) == "string", "name must be a string");
    v2(type(v10) == "string", "initialState must be a string");
    v2(type(v11) == "function", "emitAction must be a function");
    v2(type(v12) == "function", "disconnectAllAction must be a function");
    local function v19(...) --[[ Line: 50 ]] --[[ Name: doEmit ]]
        -- upvalues: v11 (copy)
        local v13 = {
            ...
        };
        return function(_, _, v16) --[[ Line: 52 ]]
            -- upvalues: v13 (copy), v11 (ref)
            for _, v18 in ipairs(v13) do
                v11(v18, v16);
            end;
        end;
    end;
    return v0.new("SubscriberEventsTable(" .. v9 .. ")", v10, nil, {
        Blurred = {
            [v3 .. "A"] = {
                nextState = "Focused", 
                action = v19(v1.WillFocus, v1.DidFocus)
            }, 
            [v7 .. "A"] = {
                nextState = "Focused", 
                action = v19(v1.WillFocus, v1.DidFocus)
            }, 
            [v3 .. "AT"] = {
                nextState = "Focusing", 
                action = v19(v1.WillFocus)
            }, 
            [v7 .. "AT"] = {
                nextState = "Focusing", 
                action = v19(v1.WillFocus)
            }, 
            shutdown = {
                nextState = "Disconnected", 
                action = v12
            }, 
            [v8] = {
                action = v19(v1.Refocus)
            }
        }, 
        Focusing = {
            [v4 .. "A"] = {
                nextState = "Focused", 
                action = v19(v1.DidFocus)
            }, 
            [v7 .. "A"] = {
                nextState = "Focused", 
                action = v19(v1.DidFocus)
            }, 
            [v5 .. "T"] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v8] = {
                action = v19(v1.Refocus)
            }
        }, 
        Focused = {
            [v5] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v5 .. "T"] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v5 .. "A"] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v5 .. "AT"] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v7] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v7 .. "T"] = {
                nextState = "Blurring", 
                action = v19(v1.WillBlur)
            }, 
            [v7 .. "A"] = {
                action = v19(v1.Action)
            }, 
            [v7 .. "AT"] = {
                action = v19(v1.Action)
            }, 
            [v8] = {
                action = v19(v1.Refocus)
            }
        }, 
        Blurring = {
            [v7] = {
                nextState = "Blurred", 
                action = v19(v1.DidBlur)
            }, 
            [v6] = {
                nextState = "Blurred", 
                action = v19(v1.DidBlur)
            }, 
            [v6 .. "A"] = {
                nextState = "Blurred", 
                action = v19(v1.DidBlur)
            }, 
            [v6 .. "T"] = {
                nextState = "Blurred", 
                action = v19(v1.DidBlur)
            }, 
            [v6 .. "AT"] = {
                nextState = "Blurred", 
                action = v19(v1.DidBlur)
            }, 
            [v7 .. "A"] = {
                nextState = "Focused", 
                action = v19(v1.DidFocus)
            }, 
            [v7 .. "AT"] = {
                nextState = "Focusing", 
                action = v19(v1.WillFocus)
            }, 
            [v8] = {
                action = v19(v1.Refocus)
            }
        }, 
        Disconnected = {}
    });
end;