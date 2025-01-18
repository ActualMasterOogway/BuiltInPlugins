local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.KeyLabel);
local function v5(v4) --[[ Line: 7 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, v4);
end;
local v6 = {};
for _, v8 in Enum.KeyCode:GetEnumItems() do
    local v11 = {
        name = tostring(v8), 
        story = function(v9) --[[ Line: 16 ]] --[[ Name: story ]]
            -- upvalues: v5 (copy), v8 (copy)
            return v5({
                keyCode = v8, 
                holdBehavior = if v9.controls.holdBehavior then {
                    holdTime = v9.controls.holdTime, 
                    resetTime = v9.controls.resetTime, 
                    onBeginHold = function() --[[ Line: 23 ]] --[[ Name: onBeginHold ]]
                        print("BEGIN HOLD ");
                    end, 
                    onEndHold = function(v10) --[[ Line: 26 ]] --[[ Name: onEndHold ]]
                        print("END HOLD: " .. (v10 and "TRUE" or "FALSE"));
                    end
                } else nil, 
                Size = UDim2.fromOffset(35, 35)
            });
        end
    };
    v6[tostring(v8)] = v11;
end;
return {
    summary = "KeyLabel", 
    stories = v6, 
    controls = {
        holdTime = 1, 
        resetTime = 0.5, 
        holdBehavior = true
    }
};