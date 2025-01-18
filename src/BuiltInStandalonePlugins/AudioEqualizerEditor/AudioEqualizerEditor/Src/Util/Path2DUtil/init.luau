local _ = script:FindFirstAncestor("AudioEqualizerEditor");
return {
    makeControlPoint = function(v1, v2, v3) --[[ Line: 10 ]] --[[ Name: makeControlPoint ]]
        if not v1 then
            return Path2DControlPoint.new();
        elseif not v2 or not v3 then
            return Path2DControlPoint.new(UDim2.fromOffset(v1.X, v1.Y));
        else
            return Path2DControlPoint.new(UDim2.fromOffset(v1.X, v1.Y), UDim2.fromOffset(v2.X, v2.Y), UDim2.fromOffset(v3.X, v3.Y));
        end;
    end
};