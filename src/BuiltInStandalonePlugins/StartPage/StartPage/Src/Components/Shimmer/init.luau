local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_RunService_0 = game:GetService("RunService");
local v5 = os.clock();
local v6 = 0;
local v7, v8 = v1.createBinding(Vector2.new(-1, -1));
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 23 ]]
    -- upvalues: v6 (ref), v5 (ref), v8 (copy)
    if v6 < 1 then
        return;
    else
        local v9 = (os.clock() - v5) % 2 / 2 * 2 - 1;
        v8(Vector2.new(v9, v9));
        return;
    end;
end);
return {
    Component = function(v10) --[[ Line: 46 ]]
        -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v6 (ref), v1 (copy), v7 (copy)
        local v11, v12 = l_useState_0(Vector2.zero);
        l_useEffect_0(function() --[[ Line: 49 ]]
            -- upvalues: v6 (ref)
            v6 = v6 + 1;
            return function() --[[ Line: 51 ]]
                -- upvalues: v6 (ref)
                v6 = v6 - 1;
            end;
        end, {});
        local v13 = "StartPage-RoundedCorner" .. (v10.CornerRadius or 16);
        local l_Rotation_0 = v10.Rotation;
        if not l_Rotation_0 then
            local v15 = v11.X / v11.Y;
            l_Rotation_0 = v15 > 1.5 and 0 or v15 < 0.3 and 90 or 45;
        end;
        return v1.createElement("Frame", {
            Size = v10.Size, 
            Position = v10.Position, 
            AnchorPoint = v10.AnchorPoint, 
            ClipsDescendants = true, 
            [v1.Change.AbsoluteSize] = function(v16) --[[ Line: 75 ]]
                -- upvalues: v12 (copy)
                v12(v16.AbsoluteSize);
            end, 
            [v1.Tag] = "StartPage-NoBorder StartPage-ShimmerBackground " .. v13
        }, {
            v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                [v1.Tag] = "StartPage-NoBorder StartPage-ShimmerForeground " .. v13
            }, {
                v1.createElement("UIGradient", {
                    Rotation = l_Rotation_0, 
                    Offset = v7, 
                    [v1.Tag] = "StartPage-ShimmerGradient"
                })
            })
        });
    end, 
    restartAnimation = function() --[[ Line: 93 ]]
        -- upvalues: v5 (ref)
        v5 = os.clock() - 2;
    end
};