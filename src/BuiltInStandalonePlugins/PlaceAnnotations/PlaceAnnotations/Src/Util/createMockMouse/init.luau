local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local l_jest_0 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals).jest;
return function() --[[ Line: 7 ]] --[[ Name: createMockMouse ]]
    -- upvalues: l_jest_0 (copy)
    local v2 = {};
    local v3 = nil;
    v2.Button1Down = {
        Fire = function(_) --[[ Line: 12 ]] --[[ Name: Fire ]]
            -- upvalues: v3 (ref)
            if v3 then
                v3();
            end;
        end, 
        Connect = l_jest_0.fn(function(_, v6) --[[ Line: 17 ]]
            -- upvalues: v3 (ref)
            v3 = v6;
            return {
                Disconnect = function() --[[ Line: 20 ]] --[[ Name: Disconnect ]]
                    -- upvalues: v3 (ref)
                    v3 = nil;
                end
            };
        end)
    };
    local v7 = nil;
    v2.Move = {
        Fire = function(_) --[[ Line: 29 ]] --[[ Name: Fire ]]
            -- upvalues: v7 (ref)
            if v7 then
                v7();
            end;
        end, 
        Connect = l_jest_0.fn(function(_, v10) --[[ Line: 34 ]]
            -- upvalues: v7 (ref)
            v7 = v10;
            return {
                Disconnect = function() --[[ Line: 37 ]] --[[ Name: Disconnect ]]
                    -- upvalues: v7 (ref)
                    v7 = nil;
                end
            };
        end)
    };
    v2.Hit = CFrame.new();
    v2.Origin = CFrame.new();
    v2.UnitRay = Ray.new(Vector3.zero, (Vector3.new(0, 0, -1, 0)));
    return v2;
end;