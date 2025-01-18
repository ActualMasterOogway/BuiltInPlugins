local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = v1.Component:extend("LocalSpaceIndicator");
v2.defaultProps = {
    BackgroundTransparency = 1, 
    Font = Enum.Font.ArialBold, 
    TextSize = 16, 
    TextColor3 = Color3.new(1, 1, 1), 
    TextStrokeColor3 = Color3.new(0, 0, 0), 
    TextStrokeTransparency = 0
};
v2.init = function(_, v4) --[[ Line: 23 ]] --[[ Name: init ]]
    assert(v4.CFrame, "Missing required proprty CFrame");
    assert(v4.Size, "Missing required proprty Size");
    assert(v4.DraggerContext, "Missing required proprty DraggerContext");
end;
v2.render = function(v5) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v5.props;
    local l_DraggerContext_0 = l_props_0.DraggerContext;
    local l_CFrame_0 = l_props_0.CFrame;
    local v9 = l_props_0.Size / 2;
    local v10 = -v9;
    local v11 = {
        Vector3.new(v10.X, v10.Y, v10.Z), 
        Vector3.new(v10.X, v9.Y, v10.Z), 
        Vector3.new(v10.X, v9.Y, v9.Z), 
        Vector3.new(v10.X, v10.Y, v9.Z), 
        Vector3.new(v9.X, v10.Y, v10.Z), 
        Vector3.new(v9.X, v9.Y, v10.Z), 
        Vector3.new(v9.X, v9.Y, v9.Z), 
        (Vector3.new(v9.X, v10.Y, v9.Z))
    };
    local v12 = {};
    local v13 = -1e999;
    local v14 = -1e999;
    for v15 = 1, #v11 do
        local v16, v17 = l_DraggerContext_0:worldToViewportPoint((l_CFrame_0:PointToWorldSpace(v11[v15])));
        local v18 = Vector2.new(v16.X, v16.Y);
        table.insert(v12, {
            point = v18, 
            onScreen = v17
        });
        v13 = math.max(v13, v18.X);
        v14 = math.max(v14, v18.Y);
    end;
    local v19 = Vector2.new(v13, v14);
    local v20 = 1e999;
    local v21 = false;
    local v22 = nil;
    for v23 = 1, #v12 do
        local l_point_0 = v12[v23].point;
        local l_Magnitude_0 = (l_point_0 - v19).Magnitude;
        if l_Magnitude_0 < v20 then
            v20 = l_Magnitude_0;
            v22 = l_point_0;
            v21 = v12[v23].onScreen;
        end;
    end;
    if not v21 then
        return nil;
    else
        local v26 = l_props_0.TextSize + 6;
        return v1.createElement("ScreenGui", {}, {
            v1.createElement("TextLabel", {
                BackgroundTransparency = l_props_0.BackgroundTransparency, 
                Position = UDim2.fromOffset(v22.X, v22.Y), 
                Size = UDim2.fromOffset(v26, v26), 
                Font = l_props_0.Font, 
                TextSize = l_props_0.TextSize, 
                Text = "L", 
                TextColor3 = l_props_0.TextColor3, 
                TextStrokeColor3 = l_props_0.TextStrokeColor3, 
                TextStrokeTransparency = l_props_0.TextStrokeTransparency, 
                Selectable = false
            })
        });
    end;
end;
return v2;