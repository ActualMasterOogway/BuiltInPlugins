local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactUtils);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(script.Parent.getVisualForKey);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Components.Image);
local v13 = require(l_script_FirstAncestor_0.Components.Text);
local v14 = require(l_script_FirstAncestor_0.Components.CircularProgressBar);
local l_EventConnection_0 = v4.EventConnection;
local v16 = {
    holdTime = 1, 
    resetTime = 0.5
};
local v17 = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25));
return v3.memo(v3.forwardRef(function(v18, _) --[[ Line: 49 ]] --[[ Name: KeyLabel ]]
    -- upvalues: v8 (copy), v16 (copy), v9 (copy), v3 (copy), v5 (copy), v6 (copy), v11 (copy), v7 (copy), v12 (copy), v17 (copy), v13 (copy), v14 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    local v20 = if v18.holdBehavior then v8(v18.holdBehavior, v16) else nil;
    local v21 = v9();
    local v22, v23 = v3.useState(nil);
    local v24 = nil;
    local v25 = nil;
    local v27, v28 = v5.useAnimatedBinding(0, function(v26) --[[ Line: 56 ]]
        -- upvalues: v20 (copy), v22 (copy), v25 (ref), v5 (ref), v23 (copy)
        if v20 and v26 == 1 and v22 then
            v25(v5.ease(0, {
                duration = v20.resetTime, 
                easingStyle = Enum.EasingStyle.Linear
            }));
            v23(nil);
            v20.onEndHold(true);
        end;
    end);
    v24 = v27;
    v25 = v28;
    v27 = v6(v18.keyCode);
    v28 = v27.keyVisualType == "Image";
    return v3.createElement(v11, v7(v18, {
        Size = v18.Size
    }), {
        Image = v3.createElement(v12, {
            Image = if v28 then v27.key else "icons/controls/keys/key_single", 
            Size = v27.size, 
            ScaleType = if not v28 then Enum.ScaleType.Slice else nil, 
            imageStyle = if v22 then v21.Color.Content.Emphasis else v21.Color.Content.Muted, 
            slice = if not v28 then {
                center = v17
            } else nil, 
            tag = "position-center-center anchor-center-center"
        }, {
            CustomPadding = if not v28 then v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 3)
            }) else nil, 
            Text = if not v28 then v3.createElement(v13, {
                Text = v27.key, 
                textStyle = if v22 then v21.Color.Content.Emphasis else v21.Color.Content.Muted, 
                tag = "text-body-medium auto-xy size-full-full text-align-x-center"
            }) else nil
        }), 
        Indicator = if v20 and v20.holdTime > 0 then v3.createElement(v14, {
            progress = v24, 
            tag = "size-full-full"
        }, {}) else nil, 
        InputBeganConnection = if v20 then v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v29) --[[ Line: 114 ]] --[[ Name: callback ]]
                -- upvalues: v22 (copy), v18 (copy), v20 (copy), v23 (copy), v25 (ref), v5 (ref), v24 (ref)
                if v22 then
                    return;
                else
                    if v29.KeyCode == v18.keyCode then
                        if v20.onBeginHold then
                            v20.onBeginHold();
                        end;
                        if v20.holdTime == 0 then
                            v20.onEndHold(true);
                            return;
                        else
                            v23(v29);
                            v25(v5.ease(1, {
                                duration = (1 - v24:getValue()) * v20.holdTime, 
                                easingStyle = Enum.EasingStyle.Linear
                            }));
                        end;
                    end;
                    return;
                end;
            end
        }) else nil, 
        InputEndedConnection = if v20 then v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = function(v30) --[[ Line: 140 ]] --[[ Name: callback ]]
                -- upvalues: v22 (copy), v20 (copy), v23 (copy), v25 (ref), v5 (ref), v24 (ref)
                if v30 == v22 then
                    if v20.onEndHold then
                        v20.onEndHold(false);
                    end;
                    v23(nil);
                    v25(v5.ease(0, {
                        duration = v24:getValue() * v20.resetTime, 
                        easingStyle = Enum.EasingStyle.Linear
                    }));
                end;
            end
        }) else nil
    });
end));