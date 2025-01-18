local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetGamepadEnabled);
local _ = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetKeyboardEnabled);
local _ = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetMouseClickEnabled);
local _ = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetMouseMoveEnabled);
local _ = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetTouchEnabled);
local v8 = {
    mouseMove = true, 
    mouseClick = true, 
    keyboard = true, 
    gamepad = true, 
    touch = true
};
local function v19() --[[ Line: 30 ]] --[[ Name: makeEnabledListReducer ]]
    -- upvalues: v1 (copy), v8 (copy), l_join_0 (copy)
    return v1.createReducer(v8, {
        SetGamepadEnabled = function(v9, v10) --[[ Line: 32 ]] --[[ Name: SetGamepadEnabled ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v9, {
                gamepad = v10.gamepadEnabled
            });
        end, 
        SetKeyboardEnabled = function(v11, v12) --[[ Line: 40 ]] --[[ Name: SetKeyboardEnabled ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v11, {
                keyboard = v12.keyboardEnabled
            });
        end, 
        SetMouseClickEnabled = function(v13, v14) --[[ Line: 48 ]] --[[ Name: SetMouseClickEnabled ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v13, {
                mouseClick = v14.mouseClickEnabled
            });
        end, 
        SetMouseMoveEnabled = function(v15, v16) --[[ Line: 56 ]] --[[ Name: SetMouseMoveEnabled ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v15, {
                mouseMove = v16.mouseMoveEnabled
            });
        end, 
        SetTouchEnabled = function(v17, v18) --[[ Line: 64 ]] --[[ Name: SetTouchEnabled ]]
            -- upvalues: l_join_0 (ref)
            return l_join_0(v17, {
                touch = v18.touchEnabled
            });
        end
    });
end;
local function _(v20, v21) --[[ Line: 72 ]] --[[ Name: makeReducer ]]
    return function(v22, v23) --[[ Line: 76 ]]
        -- upvalues: v21 (copy), v20 (copy)
        if v22 == nil or v23.context == v21 then
            return v20(v22, v23);
        else
            return v22;
        end;
    end;
end;
return {
    makeReducerForName = function(v25) --[[ Line: 85 ]] --[[ Name: makeReducerForName ]]
        -- upvalues: v19 (copy)
        local v26 = v19();
        return function(v27, v28) --[[ Line: 76 ]]
            -- upvalues: v25 (copy), v26 (copy)
            if v27 == nil or v28.context == v25 then
                return v26(v27, v28);
            else
                return v27;
            end;
        end;
    end
};