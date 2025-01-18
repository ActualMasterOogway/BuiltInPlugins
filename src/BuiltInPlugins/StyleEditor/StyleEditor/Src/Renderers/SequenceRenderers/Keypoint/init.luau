local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_DragListener_0 = v2.UI.DragListener;
local l_HoverArea_0 = v2.UI.HoverArea;
local l_isInputMainPress_0 = v2.Util.isInputMainPress;
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
return function(v8) --[[ Line: 29 ]] --[[ Name: Keypoint ]]
    -- upvalues: v1 (copy), l_HoverArea_0 (copy), l_Attribute_0 (copy), l_DragListener_0 (copy), l_joinTags_0 (copy), l_isInputMainPress_0 (copy)
    local v9, v10 = v1.useState(false);
    local v11 = {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = function() --[[ Line: 36 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v8 (copy)
                if v8.OnHoverStart then
                    v8.OnHoverStart();
                end;
            end, 
            MouseLeave = function() --[[ Line: 41 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v8 (copy)
                if v8.OnHoverEnd then
                    v8.OnHoverEnd();
                end;
            end
        })
    };
    if v9 then
        v11.DragListener = v1.createElement(l_DragListener_0, {
            OnDragMoved = function(v12) --[[ Line: 51 ]] --[[ Name: OnDragMoved ]]
                -- upvalues: v8 (copy)
                if v8.OnMoved then
                    local v13 = Vector2.new(v12.Position.X, v12.Position.Y);
                    v8.OnMoved(v13);
                end;
            end, 
            OnDragEnded = function() --[[ Line: 57 ]] --[[ Name: OnDragEnded ]]
                -- upvalues: v10 (copy), v8 (copy)
                v10(false);
                if v8.OnDragEnd then
                    v8.OnDragEnd();
                end;
            end
        });
    end;
    local v14 = v8.Selected and "Selected" or "";
    return v1.createElement("TextButton", {
        Position = UDim2.fromScale(v8.Position.X, 1 - v8.Position.Y), 
        [v1.Tag] = l_joinTags_0("SequenceKeypoint", v14, v8.Tag), 
        [v1.Event.InputBegan] = function(_, v16) --[[ Line: 73 ]]
            -- upvalues: l_isInputMainPress_0 (ref), v10 (copy)
            if l_isInputMainPress_0(v16) then
                v10(true);
            end;
        end
    }, v11);
end;