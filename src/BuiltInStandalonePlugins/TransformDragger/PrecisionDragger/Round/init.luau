round = function(v0) --[[ Line: 1 ]] --[[ Name: round ]]
    return (math.floor(v0 + 0.5));
end;
roundToNearest = function(v1, v2) --[[ Line: 5 ]] --[[ Name: roundToNearest ]]
    if not v2 or v2 == 0 then
        return v1;
    else
        local v3 = v1 + v2 / 2;
        return v3 - v3 % v2;
    end;
end;
roundVector3 = function(v4) --[[ Line: 14 ]] --[[ Name: roundVector3 ]]
    return (Vector3.new(round(v4.X), round(v4.Y), round(v4.Z)));
end;
roundVector3ToNearest = function(v5, v6) --[[ Line: 18 ]] --[[ Name: roundVector3ToNearest ]]
    return (Vector3.new(roundToNearest(v5.X, v6), roundToNearest(v5.Y, v6), roundToNearest(v5.Z, v6)));
end;
return {
    roundToNearest = roundToNearest, 
    roundVector3ToNearest = roundVector3ToNearest
};