local v0 = require(script.Parent.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.StackViewInterpolator);
local v2 = require(script.Parent.StackPresentationStyle);
local v3 = {
    frequency = 3, 
    dampingRatio = 1
};
local v4 = {
    transitionSpec = v3, 
    screenInterpolator = v1.forHorizontal
};
local v5 = {
    transitionSpec = v3, 
    screenInterpolator = v1.forVertical
};
local v6 = {
    transitionSpec = v3, 
    screenInterpolator = v1.forFade
};
return {
    getDefaultTransitionConfig = function(_, _, v9) --[[ Line: 25 ]] --[[ Name: getDefaultTransitionConfig ]]
        -- upvalues: v2 (copy), v5 (copy), v6 (copy), v4 (copy)
        if v9 == v2.Modal then
            return v5;
        elseif v9 == v2.Overlay then
            return v6;
        else
            return v4;
        end;
    end, 
    getTransitionConfig = function(v10, v11, v12, v13) --[[ Line: 35 ]] --[[ Name: getTransitionConfig ]]
        -- upvalues: v2 (copy), v5 (copy), v6 (copy), v4 (copy), v0 (copy)
        local v14 = if v13 == v2.Modal then v5 else if v13 == v2.Overlay then v6 else v4;
        if v10 then
            return v0.Dictionary.join(v14, v10(v11, v12, v13));
        else
            return v14;
        end;
    end, 
    SlideFromRight = v4, 
    ModalSlideFromBottom = v5, 
    FadeInPlace = v6
};