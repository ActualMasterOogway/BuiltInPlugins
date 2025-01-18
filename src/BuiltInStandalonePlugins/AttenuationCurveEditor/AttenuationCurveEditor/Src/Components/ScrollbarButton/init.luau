local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v3.UI.DragListener;
local l_isInputMainPress_0 = v3.Util.isInputMainPress;
local l_joinTags_0 = v3.Styling.joinTags;
return function(v7) --[[ Line: 27 ]] --[[ Name: ScrollbarButton ]]
    -- upvalues: l_useState_0 (copy), v1 (copy), l_joinTags_0 (copy), l_isInputMainPress_0 (copy), l_DragListener_0 (copy)
    local v8, v9 = l_useState_0(false);
    local v10 = v7.DragTarget == v7.ControlId;
    local v11 = if v7.Text then v7.Text else "";
    local v12 = "";
    if v10 then
        v12 = "Pressed";
    elseif v8 then
        v12 = "Hovered";
    end;
    return v1.createElement("TextButton", {
        AnchorPoint = v7.AnchorPoint, 
        AutoButtonColor = false, 
        Position = v7.Position, 
        Size = v7.Size, 
        Text = v11, 
        [v1.Tag] = l_joinTags_0("ScrollbarButton", v12, v7.Tag), 
        [v1.Event.InputBegan] = function(v13, v14) --[[ Line: 47 ]]
            -- upvalues: l_isInputMainPress_0 (ref), v7 (copy), v9 (copy)
            if l_isInputMainPress_0(v14) and v7.OnDragBegan then
                v7.OnDragBegan(v7.ControlId, v13, v14);
                return;
            else
                if v14.UserInputType == Enum.UserInputType.MouseMovement then
                    v9(true);
                end;
                return;
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v16) --[[ Line: 54 ]]
            -- upvalues: l_isInputMainPress_0 (ref), v7 (copy), v9 (copy)
            if l_isInputMainPress_0(v16) and v7.OnDragEnded then
                v7.OnDragEnded();
                return;
            else
                if v16.UserInputType == Enum.UserInputType.MouseMovement then
                    v9(false);
                end;
                return;
            end;
        end
    }, {
        DragListener = v10 and v1.createElement(l_DragListener_0, {
            OnDragMoved = v7.OnDragMoved, 
            OnDragEnded = v7.OnDragEnded
        })
    });
end;