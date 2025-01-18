local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_0.Utility.Colors);
local v5 = v3.Component:extend("SelectionDot");
v5.defaultProps = {
    BackgroundColor3 = v4.WHITE, 
    BorderColor3 = v4.BLACK, 
    Position = Vector3.new(), 
    Size = 3
};
v5.render = function(v6) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_Workspace_0 (copy), v3 (copy)
    local v7, v8 = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v6.props.Position);
    if not v8 then
        return nil;
    else
        local l_Size_0 = v6.props.Size;
        return v3.createElement("ScreenGui", {}, {
            v3.createElement("Frame", {
                BackgroundColor3 = v6.props.BackgroundColor3, 
                BorderColor3 = v6.props.BorderColor3, 
                BorderSizePixel = 1, 
                Position = UDim2.new(0, v7.X, 0, v7.Y), 
                Selectable = false, 
                Size = UDim2.new(0, l_Size_0, 0, l_Size_0)
            })
        });
    end;
end;
return v5;