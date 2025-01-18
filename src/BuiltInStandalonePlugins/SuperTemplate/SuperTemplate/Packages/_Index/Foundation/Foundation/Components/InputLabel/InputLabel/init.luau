local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.Text);
local v3 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v8 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v9 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local function _(v10, v11) --[[ Line: 40 ]] --[[ Name: labelText ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v11 == nil or v11 == v4.None then
        return v10;
    elseif v11 then
        return v10 .. "*";
    else
        return (v3:FormatByKey("CommonUI.Controls.Input.Optional", {
            inputLabel = v10
        }));
    end;
end;
return v4.memo(v4.forwardRef(function(v13, v14) --[[ Line: 50 ]] --[[ Name: InputLabel ]]
    -- upvalues: v4 (copy), v8 (copy), v2 (copy), v7 (copy), v3 (copy), v6 (copy), v9 (copy)
    local v16 = v4.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v13 (copy), v8 (ref)
        if v13.onHover ~= nil then
            return function(v15) --[[ Line: 53 ]]
                -- upvalues: v13 (ref), v8 (ref)
                v13.onHover(v15 == v8.Hover);
            end;
        else
            return nil;
        end;
    end, {
        v13.onHover
    });
    local l_createElement_0 = v4.createElement;
    local l_v2_0 = v2;
    local l_v7_0 = v7;
    local l_v13_0 = v13;
    local v21 = {};
    local l_Text_0 = v13.Text;
    local l_isRequired_0 = v13.isRequired;
    v21.Text = if not (l_isRequired_0 ~= nil) or l_isRequired_0 == v4.None then l_Text_0 else if l_isRequired_0 then l_Text_0 .. "*" else v3:FormatByKey("CommonUI.Controls.Input.Optional", {
        inputLabel = l_Text_0
    });
    v21.RichText = v13.RichText;
    v21.selection = {
        Selectable = false
    };
    v21.onActivated = v13.onActivated;
    v21.onStateChanged = v16;
    v21.stateLayer = {
        affordance = v6.None
    };
    v21.textStyle = v13.textStyle;
    v21.tag = {
        ["size-0 auto-xy content-default text-align-x-left text-align-y-top text-wrap"] = true, 
        ["text-body-small"] = v13.size == v9.Small, 
        ["text-body-medium"] = v13.size == v9.Medium, 
        ["text-body-large"] = v13.size == v9.Large
    };
    v21.ref = v14;
    return l_createElement_0(l_v2_0, l_v7_0(l_v13_0, v21));
end));