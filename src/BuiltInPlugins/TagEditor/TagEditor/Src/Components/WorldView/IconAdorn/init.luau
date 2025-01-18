local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Components.Icon);
return function(v3) --[[ Line: 5 ]] --[[ Name: IconAdorn ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    if #v3.Icon > 1 then
        v4.UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0.125, 0)
        });
    end;
    for v5 = 1, #v3.Icon do
        local v6 = v3.Icon[v5];
        v4[v5] = v1.createElement(v2, {
            Name = v6, 
            Size = UDim2.new(1 / #v3.Icon, 0, 1, 0), 
            Style = "WorldView", 
            TextScaled = true
        });
    end;
    return v1.createElement("BillboardGui", {
        Adornee = v3.Adornee, 
        Size = UDim2.new(#v3.Icon, 0, 1, 0), 
        SizeOffset = Vector2.new(0.5, 0.5), 
        ExtentsOffsetWorldSpace = Vector3.new(1, 1, 1, 0), 
        AlwaysOnTop = v3.AlwaysOnTop
    }, v4);
end;