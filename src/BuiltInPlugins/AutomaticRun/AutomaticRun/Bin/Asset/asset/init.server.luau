if not plugin then
    return;
else
    game:DefineFastInt("ApolloPlaceLoadWait", 5);
    local l_game_FastInt_0 = game:GetFastInt("ApolloPlaceLoadWait");
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AutomaticRun");
    local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v2.launch("AutomaticRun", l_script_FirstAncestor_0.Src);
    if v2.isCli() then
        return;
    elseif not require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagDebugEnableAutomaticRun() then
        return;
    else
        local v3 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        if v3.get() ~= v3.Asset then
            return;
        else
            if game:GetService("RunService"):IsEdit() then
                wait(l_game_FastInt_0);
                local v4 = {
                    DataModel = "Standalone", 
                    PluginId = "RunTools", 
                    Category = "Actions", 
                    ItemId = "Run"
                };
                plugin:GetPluginComponent("Actions"):ActivateAsync(v4);
            end;
            return;
        end;
    end;
end;