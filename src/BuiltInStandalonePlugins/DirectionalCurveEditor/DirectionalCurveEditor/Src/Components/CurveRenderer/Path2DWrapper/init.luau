local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v3 = v1.Component:extend("Path2DWrapper");
v3.init = function(v4) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v4.pathContainerRef = v1.createRef();
    v4.setControlPoints = function() --[[ Line: 19 ]]
        -- upvalues: v4 (copy)
        local v5 = v4.pathContainerRef:getValue();
        if not v5 then
            return;
        else
            local v6 = 1;
            for _, v8 in v5:GetChildren() do
                local v9 = {};
                local v10 = #v4.props.ControlPoints;
                for v11 = v6, v6 + 100 - 1 do
                    if v10 >= v11 then
                        table.insert(v9, v4.props.ControlPoints[v11]);
                    else
                        break;
                    end;
                end;
                v8:SetControlPoints(v9);
                v6 = v6 + 99;
            end;
            return;
        end;
    end;
end;
v3.render = function(v12) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy)
    local v13 = "";
    if v12.props.Tag then
        v13 = v12.props.Tag;
    end;
    local v14 = {};
    for _ = 2, #v12.props.ControlPoints, 99 do
        table.insert(v14, v1.createElement("Path2D", {
            [v1.Tag] = v13
        }));
    end;
    return v1.createElement(l_Pane_0, {
        ref = v12.pathContainerRef, 
        Size = UDim2.fromScale(1, 1)
    }, v14);
end;
v3.didMount = function(v16) --[[ Line: 74 ]] --[[ Name: didMount ]]
    v16.setControlPoints();
end;
v3.didUpdate = function(v17) --[[ Line: 78 ]] --[[ Name: didUpdate ]]
    v17.setControlPoints();
end;
return v3;