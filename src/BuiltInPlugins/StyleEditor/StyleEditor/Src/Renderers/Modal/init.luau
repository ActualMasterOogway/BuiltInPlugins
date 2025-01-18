local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_Parent_0.Packages.Framework);
local l_CaptureFocus_0 = v3.UI.CaptureFocus;
local l_Pane_0 = v3.UI.Pane;
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v7 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local _ = require(l_Parent_0.Src.Types);
return function(v9) --[[ Line: 30 ]] --[[ Name: Modal ]]
    -- upvalues: v7 (copy), l_useState_0 (copy), v1 (copy), l_CaptureFocus_0 (copy), l_Pane_0 (copy), l_join_0 (copy)
    local v10 = v7();
    local v11, v12 = l_useState_0(Vector2.zero);
    local function v24() --[[ Line: 35 ]] --[[ Name: calculatePosition ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy)
        if not v9.ObjectRef or not v9.ObjectRef.current then
            return UDim2.fromOffset(0, 0);
        else
            local v13 = v10.Focus:get();
            local v14 = v9.MinSize or Vector2.zero;
            local l_current_0 = v9.ObjectRef.current;
            local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_AbsoluteSize_1 = v13.AbsoluteSize;
            local v19 = math.max(math.min(l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y, l_AbsoluteSize_1.Y - v11.Y), 0);
            local v20 = math.max(v14.X, v11.X);
            local v21 = math.min(l_AbsoluteSize_1.X, v9.MaxSize.X);
            if v21 < v20 then
                local l_v21_0 = v21;
                v21 = v20;
                v20 = l_v21_0;
            end;
            local v23 = math.max(math.min(l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2 - v21 / 2, l_AbsoluteSize_1.X - v21), 0);
            return UDim2.fromOffset(v23, v19);
        end;
    end;
    return v9.Open and v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = v9.OnFocusLost
    }, {
        Window = v1.createElement(l_Pane_0, {
            Position = v24(), 
            [v1.Tag] = "Paper X-Center X-Column X-Fill X-Stroke", 
            [v1.Change.AbsoluteSize] = function(v25) --[[ Line: 75 ]]
                -- upvalues: v12 (copy)
                if v25 then
                    v12(v25.AbsoluteSize);
                end;
            end
        }, l_join_0(v9.children, {
            UISizeConstraint = v1.createElement("UISizeConstraint", {
                MinSize = v9.MinSize, 
                MaxSize = v9.MaxSize
            })
        }))
    });
end;