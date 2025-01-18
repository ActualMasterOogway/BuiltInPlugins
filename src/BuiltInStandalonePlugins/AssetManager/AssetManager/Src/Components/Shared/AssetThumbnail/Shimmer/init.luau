local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_RunService_0 = game:GetService("RunService");
local v4 = os.clock();
local v5 = 0;
local v6, v7 = v1.createBinding(Vector2.new(-1, -1));
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 17 ]]
    -- upvalues: v5 (ref), v4 (ref), v7 (copy)
    if v5 < 1 then
        return;
    else
        local v8 = (os.clock() - v4) % 2 / 2 * 2 - 1;
        v7(Vector2.new(v8, v8));
        return;
    end;
end);
return {
    Component = function(v9) --[[ Line: 37 ]]
        -- upvalues: l_useEffect_0 (copy), v5 (ref), v1 (copy), v6 (copy)
        l_useEffect_0(function() --[[ Line: 38 ]]
            -- upvalues: v5 (ref)
            v5 = v5 + 1;
            return function() --[[ Line: 40 ]]
                -- upvalues: v5 (ref)
                v5 = v5 - 1;
            end;
        end, {});
        return v1.createElement("Frame", {
            [v1.Tag] = "X-Fill"
        }, {
            Shimmer = v1.createElement("UIGradient", {
                Offset = v6, 
                Rotation = v9.Rotation, 
                Transparency = v9.Transparency
            })
        });
    end, 
    restartAnimation = function() --[[ Line: 56 ]]
        -- upvalues: v4 (ref)
        v4 = os.clock() - 2;
    end
};