local _ = require(script.Parent.types);
local v1 = require(script.Parent.Parent.Util.Constants);
local v2 = {};
v2.__index = v2;
local l_DefaultThickness_0 = v1.ControlEdge.DefaultThickness;
v2.new = function() --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_DefaultThickness_0 (copy)
    local v4 = setmetatable({}, v2);
    v4.render = function(v5, v6) --[[ Line: 13 ]] --[[ Name: render ]]
        -- upvalues: l_DefaultThickness_0 (ref)
        local l_StartPoint_0 = v6.StartPoint;
        local l_EndPoint_0 = v6.EndPoint;
        local l_Adornee_0 = v6.Adornee;
        local l_Parent_0 = v6.Parent;
        local l_Transparency_0 = v6.Transparency;
        local l_Color_0 = v6.Color;
        local v13 = v6.Thickness or l_DefaultThickness_0;
        local l_Visible_0 = v6.Visible;
        local l_Magnitude_0 = (l_StartPoint_0 - l_EndPoint_0).Magnitude;
        local v16 = CFrame.new(Vector3.new(0, 0, 0, 0), (l_EndPoint_0 - l_StartPoint_0).Unit) + l_StartPoint_0;
        if not v5.edge then
            v5.edge = Instance.new("LineHandleAdornment");
            v5.edge.AlwaysOnTop = false;
            v5.edge.ZIndex = 1;
            v5.edge.Archivable = false;
        end;
        v5.edge.Length = l_Magnitude_0;
        v5.edge.CFrame = v16;
        v5.edge.Thickness = v13;
        v5.edge.Transparency = l_Transparency_0;
        v5.edge.Color3 = l_Color_0;
        v5.edge.Adornee = l_Adornee_0;
        v5.edge.Parent = l_Parent_0;
        v5.edge.Visible = l_Visible_0;
    end;
    v4.cleanup = function(v17) --[[ Line: 44 ]] --[[ Name: cleanup ]]
        if v17.edge then
            v17.edge:Destroy();
            v17.edge = nil;
        end;
    end;
    return v4;
end;
return v2;