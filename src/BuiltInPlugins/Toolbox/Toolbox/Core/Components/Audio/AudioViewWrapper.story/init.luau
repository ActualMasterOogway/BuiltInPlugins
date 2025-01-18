local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v3 = require(l_script_FirstAncestor_0.Core.Networking.NetworkInterface);
local v4 = require(script.Parent.AudioViewWrapper);
return {
    story = function() --[[ Line: 10 ]] --[[ Name: story ]]
        -- upvalues: v3 (copy), v1 (copy), v2 (copy), v4 (copy)
        local v5 = v3.new();
        return v1.createElement(v2, {
            networkInterface = v5
        }, {
            AudioViewWrapper = v1.createElement(v4)
        });
    end
};