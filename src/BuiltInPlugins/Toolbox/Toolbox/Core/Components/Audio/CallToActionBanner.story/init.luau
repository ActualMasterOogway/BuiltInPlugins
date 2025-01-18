local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Components.CallToActionBanner.CallToActionBanner);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = require(l_script_FirstAncestor_0.Core.Util.Images);
local function v6() --[[ Line: 12 ]]
    print("click");
end;
return {
    name = "Banner", 
    story = function() --[[ Line: 18 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy)
        return v2.createElement(v4, {}, {
            CallToActionBanner = v3.Generator({
                Image = v5.MONSTER_CAT_BANNER, 
                Text = "Find tracks from Mostercat", 
                OnClick = v6
            })
        });
    end
};