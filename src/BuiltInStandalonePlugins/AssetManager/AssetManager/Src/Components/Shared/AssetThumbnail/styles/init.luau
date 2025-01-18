local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
return require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule(".AssetThumbnail", {
    Size = UDim2.fromScale(1, 1)
}, {}, {
    Rotation = 45, 
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.05, 1), 
        NumberSequenceKeypoint.new(0.5, 0.7), 
        NumberSequenceKeypoint.new(0.95, 1), 
        NumberSequenceKeypoint.new(1, 1)
    })
});