local l_StylingService_0 = game:GetService("StylingService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.createStyle);
return function() --[[ Line: 11 ]] --[[ Name: useStyleSheet ]]
    -- upvalues: v3 (copy), l_StylingService_0 (copy), v2 (copy), v4 (copy)
    local v6 = v3.useState(function() --[[ Line: 12 ]]
        -- upvalues: l_StylingService_0 (ref), v2 (ref), v4 (ref)
        local l_StudioDesign_0 = l_StylingService_0:FindFirstChild("StudioDesign");
        if l_StudioDesign_0 == nil then
            l_StudioDesign_0 = v2.Styling.createStudioDesign();
            l_StudioDesign_0.Parent = l_StylingService_0;
        end;
        return v2.Styling.createStyleSheet("ViewportToolingFramework", v4(), {}, {
            l_StudioDesign_0.Design
        });
    end);
    v3.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v6 (copy), l_StylingService_0 (ref)
        v6.Parent = l_StylingService_0;
        return function() --[[ Line: 32 ]]
            -- upvalues: v6 (ref)
            v6:Destroy();
        end;
    end, {});
    return v6;
end;