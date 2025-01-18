local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useClock_0 = require(l_Parent_0.ReactUtils).useClock;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v7 = require(l_script_FirstAncestor_0.Enums.Radius);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v12 = require(l_script_FirstAncestor_0.Utility.lerp);
local v13 = require(l_script_FirstAncestor_0.Utility.Flags);
local v14 = {
    radius = v7.None, 
    Size = UDim2.fromScale(1, 1)
};
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 38 ]] --[[ Name: Skeleton ]]
    -- upvalues: v10 (copy), v14 (copy), l_useClock_0 (copy), v8 (copy), v9 (copy), v7 (copy), v2 (copy), v5 (copy), v11 (copy), v12 (copy), v13 (copy)
    local v17 = v10(v15, v14);
    local v18 = l_useClock_0();
    local v19 = v8();
    local v20 = v9();
    local v21 = if v17.radius ~= v7.None then UDim.new(0, v19.Radius[v17.radius]) else nil;
    return v2.createElement(v5, v11(v17, {
        cornerRadius = v21, 
        backgroundStyle = if v20.reducedMotion then v18:map(function(v22) --[[ Line: 51 ]]
            -- upvalues: v19 (copy), v12 (ref)
            local v23 = (1 + math.sin(v22 * 2)) / 2;
            return {
                Color3 = v19.Color.Content.Emphasis.Color3, 
                Transparency = v12(v19.Color.Extended.White.White_10.Transparency, v19.Color.Extended.White.White_10.Transparency - 0.1, v23)
            };
        end) else if v13.FoundationSkeletonDarkThemeFix then v19.Color.Extended.White.White_30 else v19.Color.Extended.White.White_10, 
        Size = v17.Size, 
        ref = v16
    }), {
        Gradient = if not v20.reducedMotion then v2.createElement("UIGradient", {
            Color = if v13.FoundationSkeletonDarkThemeFix then ColorSequence.new({
                ColorSequenceKeypoint.new(0, v19.Color.Common.Shimmer.Color3), 
                ColorSequenceKeypoint.new(0.5, v19.Color.Extended.White.White_30.Color3), 
                ColorSequenceKeypoint.new(1, v19.Color.Common.Shimmer.Color3)
            }) else ColorSequence.new(v19.Color.Content.Emphasis.Color3), 
            Transparency = if v13.FoundationSkeletonDarkThemeFix then NumberSequence.new(v19.Color.Common.Shimmer.Transparency) else NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0), 
                NumberSequenceKeypoint.new(0.5, 1), 
                NumberSequenceKeypoint.new(1, 0)
            }), 
            Offset = v18:map(function(v24) --[[ Line: 85 ]]
                return Vector2.new(v24 * 2 % 3 - 1.5, 0);
            end), 
            Rotation = 15
        }) else nil
    });
end));