return function(v0, v1) --[[ Line: 8 ]]
    if not v0 then
        return Vector2.new(0, 0);
    else
        assert(v0, "element should be valid");
        local l_AbsoluteSize_0 = v0.AbsoluteSize;
        local v3 = v1 - v0.AbsolutePosition;
        return Vector2.new(math.clamp(v3.X / l_AbsoluteSize_0.X, 0, 1), (math.clamp(v3.Y / l_AbsoluteSize_0.Y, 0, 1)));
    end;
end;