local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_CrossPluginCommunication_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.CrossPluginCommunication;
local v2 = require(l_script_FirstAncestor_0.Core.Actions.SetTutorialLimits);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.UpdateSearchTerm);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.UpdatePageInfo);
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
return {
    setup = function(v6, v7) --[[ Line: 13 ]] --[[ Name: setup ]]
        -- upvalues: l_CrossPluginCommunication_0 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
        if v6.comms then
            return;
        else
            v6.comms = l_CrossPluginCommunication_0.new("Toolbox");
            v6.comms:OnInvoke("SetTutorialLimits", function(v8) --[[ Line: 19 ]]
                -- upvalues: v7 (copy), v2 (ref), v3 (ref), v4 (ref), v5 (ref)
                v7:dispatch(v2(v8.assetIds, v8.positionOverride, v8.scriptWarningOverride));
                if v8.assetIds == nil then
                    v7:dispatch(v3(""));
                    return;
                else
                    v7:dispatch(v4({
                        categoryName = v5.FREE_MODELS.name, 
                        currentTab = v5.MARKETPLACE_KEY
                    }));
                    return;
                end;
            end);
            return;
        end;
    end, 
    fire = function(v9, ...) --[[ Line: 33 ]] --[[ Name: fire ]]
        if v9.comms and v9.comms.Fire then
            v9.comms:Fire(...);
        end;
    end
};