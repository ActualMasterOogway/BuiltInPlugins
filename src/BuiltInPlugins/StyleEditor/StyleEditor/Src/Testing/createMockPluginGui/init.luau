local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
return function() --[[ Line: 13 ]]
    -- upvalues: l_Signal_0 (copy)
    return (setmetatable({
        _screenGui = Instance.new("ScreenGui"), 
        _windowFocused = l_Signal_0.new(), 
        _windowFocusReleased = l_Signal_0.new()
    }, {
        __index = function(v2, v3) --[[ Line: 21 ]] --[[ Name: __index ]]
            if v3 == "WindowFocused" then
                return v2._windowFocused;
            elseif v3 == "WindowFocusReleased" then
                return v2._windowFocusReleased;
            else
                local v4 = v2._screenGui[v3];
                if typeof(v4) == "function" then
                    return function(...) --[[ Line: 30 ]]
                        -- upvalues: v4 (copy), v2 (copy)
                        local v5 = {
                            ...
                        };
                        return v4(v2._screenGui, unpack(v5, 2, #v5));
                    end;
                else
                    return v4;
                end;
            end;
        end, 
        __newIndex = function(v6, v7, v8) --[[ Line: 47 ]] --[[ Name: __newIndex ]]
            v6._screenGui[v7] = v8;
        end
    }));
end;