if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AudioActions", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
        if not v2.getFFlagEnableAudioActions() then
            return;
        else
            require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil).createLocalization();
            local v3 = require(l_script_FirstAncestor_0.Src.Actions.FindPlaying);
            local v4 = require(l_script_FirstAncestor_0.Src.Actions.Insert);
            local v5 = require(l_script_FirstAncestor_0.Src.Actions.InsertFrom);
            local v6 = require(l_script_FirstAncestor_0.Src.Actions.MainVolume);
            local v7 = require(l_script_FirstAncestor_0.Src.Actions.MigrateSounds);
            local v8 = require(l_script_FirstAncestor_0.Src.Actions.Select);
            local v9 = require(l_script_FirstAncestor_0.Src.Actions.WireUp);
            if v2.getFFlagEnableAction("FindPlaying") then
                v3.register(plugin);
            end;
            if v2.getFFlagEnableAction("Insert") then
                v4.register(plugin);
            end;
            if v2.getFFlagEnableAction("InsertFrom") then
                v5.register(plugin);
            end;
            if v2.getFFlagEnableAction("MainVolume") then
                v6.register(plugin);
            end;
            if v2.getFFlagEnableAction("MigrateSounds") then
                v7.register(plugin);
            end;
            if v2.getFFlagEnableAction("Select") then
                v8.register(plugin);
            end;
            if v2.getFFlagEnableAction("WireUp") then
                v9.register(plugin);
            end;
            local l_FocusedDataModelSession_0 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
            if l_FocusedDataModelSession_0 then
                l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Once(function() --[[ Line: 55 ]]
                    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
                    v3.deregister();
                    v4.deregister();
                    v5.deregister();
                    v6.deregister();
                    v7.deregister();
                    v8.deregister();
                    v9.deregister();
                end);
            end;
            local v11 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
            if v11.get() ~= v11.Asset then
                return;
            else
                local v12 = require(l_script_FirstAncestor_0.Bin.Common.setup);
                local v13 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
                v12(plugin, v13);
                return;
            end;
        end;
    end;
end;