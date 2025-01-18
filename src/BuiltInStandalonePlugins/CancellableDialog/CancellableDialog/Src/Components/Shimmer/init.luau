local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local v4 = os.clock();
return function(v5) --[[ Line: 20 ]] --[[ Name: Shimmer ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v4 (copy), v1 (copy)
    local v6, v7 = l_useState_0(Vector2.zero);
    local v8, v9 = l_useState_0(Vector2.new(-1, -1));
    l_useEffect_0(function() --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v9 (copy)
        local v10 = true;
        task.defer(function() --[[ Line: 26 ]]
            -- upvalues: v10 (ref), v4 (ref), v9 (ref)
            while v10 do
                local v11 = (os.clock() - v4) % 2 / 2 * 2 - 1;
                v9(Vector2.new(v11, v11));
                task.wait(0.022222222222222223);
            end;
        end);
        return function() --[[ Line: 38 ]]
            -- upvalues: v10 (ref)
            v10 = false;
        end;
    end, {});
    local v12 = 45;
    local v13 = v6.X / v6.Y;
    if v13 > 1.5 then
        v12 = 0;
    elseif v13 < 0.3 then
        v12 = 90;
    end;
    return v1.createElement("Frame", {
        Size = v5.Size, 
        ClipsDescendants = true, 
        LayoutOrder = v5.LayoutOrder, 
        [v1.Tag] = "Component-Shimmer", 
        [v1.Change.AbsoluteSize] = function(v14) --[[ Line: 57 ]]
            -- upvalues: v7 (copy)
            v7(v14.AbsoluteSize);
        end
    }, {
        v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [v1.Tag] = "NoBorder ShimmerForeground RoundedCorner8"
        }, {
            v1.createElement("UIGradient", {
                Rotation = v12, 
                Offset = v8, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.95), 
                    NumberSequenceKeypoint.new(0.1, 0.95), 
                    NumberSequenceKeypoint.new(0.5, 0.52), 
                    NumberSequenceKeypoint.new(0.9, 0.95), 
                    NumberSequenceKeypoint.new(1, 0.95)
                })
            })
        })
    });
end;