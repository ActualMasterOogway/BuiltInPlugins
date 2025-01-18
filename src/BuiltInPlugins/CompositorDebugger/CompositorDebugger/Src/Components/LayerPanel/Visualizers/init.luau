local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {};
local v3 = {
    Blend1D = require(script.Blend1D), 
    Blend2D = require(script.Blend2D), 
    BlendSpace = {
        Locomotion = require(script.Blend2D), 
        Scalar = require(script.Blend1D), 
        Directional = require(script.Blend2D)
    }
};
v2.getModule = function(v4) --[[ Line: 17 ]] --[[ Name: getModule ]]
    -- upvalues: v3 (copy)
    if v4 and v4.className then
        if v4.className == "BlendSpace" then
            if v4.props then
                return v3.BlendSpace[v4.props.blendSpaceType];
            else
                return nil;
            end;
        else
            return v3[v4.className];
        end;
    else
        return nil;
    end;
end;
return v2;