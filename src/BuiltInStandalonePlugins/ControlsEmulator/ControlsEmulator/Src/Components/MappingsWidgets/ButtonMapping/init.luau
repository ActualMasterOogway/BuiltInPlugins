local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(script.Parent.Arrow);
local v3 = require(script.Parent.MappingLabel);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
return v1.memo(function(v5) --[[ Line: 19 ]] --[[ Name: ButtonMapping ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = "Mapping-Widget Width-Scaling"
    }, {
        Label = v1.createElement(v3, {
            keyName = v5.keyName, 
            side = v5.side, 
            Position = v5.Position
        }), 
        Arrow = v1.createElement(v2, {
            arrowStart = v5.Position, 
            arrowDestination = v5.arrowDestination, 
            arrowBendPoint = v5.arrowBendPoint
        })
    });
end);