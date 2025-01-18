local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.InputLabel);
local v5 = require(l_Components_0.HintText);
local v6 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v11 = {
    width = UDim.new(0, 400), 
    size = v10.Small
};
return v2.forwardRef(function(v12, v13) --[[ Line: 41 ]] --[[ Name: InputField ]]
    -- upvalues: v8 (copy), v11 (copy), v2 (copy), v6 (copy), v9 (copy), v4 (copy), v5 (copy)
    local v14 = v8(v12, v11);
    local v15 = v2.useRef(nil);
    local v16 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v15 (copy)
        if v15.current and not v15.current.getIsFocused() then
            v15.current.focus();
        end;
    end, {});
    local v18 = v2.useCallback(function(v17) --[[ Line: 51 ]]
        -- upvalues: v15 (copy)
        if v15.current then
            v15.current.setHover(v17);
        end;
    end, {});
    v2.useImperativeHandle(v14.textBoxRef, function() --[[ Line: 57 ]]
        -- upvalues: v15 (copy)
        if not v15.current then
            return nil;
        else
            return {
                focus = v15.current.focus, 
                getIsFocused = v15.current.getIsFocused
            };
        end;
    end, {});
    return v2.createElement(v6, v9(v14, {
        Size = UDim2.new(v14.width, UDim.new(0, 0)), 
        tag = "col gap-xsmall auto-y", 
        ref = v13
    }), {
        Label = if #v14.label > 0 then v2.createElement(v4, {
            Text = v14.label, 
            size = v14.size, 
            isRequired = v14.isRequired, 
            onActivated = v16, 
            onHover = v18, 
            LayoutOrder = 1
        }) else nil, 
        InputWrapper = v2.createElement(v6, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2
        }, {
            Input = v14.input(v15)
        }), 
        Hint = if v14.hint then v2.createElement(v5, {
            text = v14.hint, 
            hasError = v14.hasError, 
            LayoutOrder = 3
        }) else nil
    });
end);