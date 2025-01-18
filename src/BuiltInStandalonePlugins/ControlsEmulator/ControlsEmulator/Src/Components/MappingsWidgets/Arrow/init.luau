local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return v1.memo(function(v2) --[[ Line: 16 ]] --[[ Name: Arrow ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(nil);
    local v4, v5 = v1.useState(false);
    local v7 = v1.useCallback(function(v6) --[[ Line: 19 ]]
        -- upvalues: v3 (copy), v5 (copy)
        v3.current = v6;
        v5(true);
    end, {
        v3, 
        v5
    });
    local v10 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v2 (copy)
        local l_arrowDestination_0 = v2.arrowDestination;
        if v2.arrowBendPoint then
            local v9 = (v2.arrowDestination.X.Scale - v2.arrowStart.X.Scale) * v2.arrowBendPoint + v2.arrowStart.X.Scale;
            l_arrowDestination_0 = UDim2.new(v9, 0, v2.arrowStart.Y.Scale, 0);
        end;
        return {
            v2.arrowStart, 
            l_arrowDestination_0, 
            v2.arrowDestination
        };
    end, {
        v2.arrowStart, 
        v2.arrowDestination, 
        v2.arrowBendPoint
    });
    v1.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v4 (copy), v3 (copy), v10 (copy)
        if v4 and v3.current then
            local v11 = #v3.current:GetControlPoints() > 0;
            for v12, v13 in ipairs(v10) do
                if v11 then
                    v3.current:UpdateControlPoint(v12, Path2DControlPoint.new(v13));
                else
                    v3.current:InsertControlPoint(v12, Path2DControlPoint.new(v13));
                end;
            end;
        end;
    end, {
        v10, 
        v4
    });
    return v1.createElement(v1.Fragment, nil, {
        Circle = v1.createElement("Frame", {
            [v1.Tag] = "Component-Arrow-Circle X-Circle data-testid=ArrowCircle", 
            Position = v2.arrowDestination
        }), 
        Arrow = v1.createElement("Path2D", {
            [v1.Tag] = "Component-Arrow data-testid=ArrowLine", 
            Thickness = 1, 
            ref = v7
        })
    });
end);