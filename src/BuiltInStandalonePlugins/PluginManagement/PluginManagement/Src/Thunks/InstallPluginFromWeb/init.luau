local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v2 = require(l_Parent_0.Src.Actions.SetPluginInstallStatus);
local v3 = require(l_Parent_0.Src.Actions.SetPluginId);
local v4 = require(l_Parent_0.Src.Actions.SetPluginMetadata);
local v5 = require(l_Parent_0.Src.Actions.ClearPluginData);
return function(v6, v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v3 (copy), v1 (copy), v2 (copy), v4 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v5 (ref), v9 (copy), v3 (ref), v8 (copy), v1 (ref), v2 (ref), v7 (copy), v4 (ref), v6 (copy)
        v10:dispatch(v5(v9));
        v10:dispatch(v3(v9));
        v10:flush();
        v8:report("TryInstallPluginFromWeb", v9);
        local function _(v11, v12) --[[ Line: 21 ]] --[[ Name: setStatus ]]
            -- upvalues: v1 (ref), v8 (ref), v9 (ref), v10 (copy), v2 (ref)
            if v11 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                v8:report("InstallPluginFromWebSuccess", v9);
            else
                v8:report("InstallPluginFromWebFailure", v9, v11);
            end;
            v10:dispatch(v2(v9, v11, v12));
        end;
        local function v30(v14) --[[ Line: 30 ]] --[[ Name: ownershipSuccessHandler ]]
            -- upvalues: v7 (ref), v9 (ref), v10 (copy), v4 (ref), v6 (ref), v1 (ref), v8 (ref), v2 (ref)
            if tostring(v14.responseBody) == "true" then
                return v7.Develop.v1.Plugins({
                    v9
                }):andThen(function(v15) --[[ Line: 36 ]]
                    -- upvalues: v10 (ref), v4 (ref), v9 (ref), v6 (ref), v1 (ref), v8 (ref), v2 (ref)
                    if v15.responseBody and v15.responseBody.data then
                        local v16 = v15.responseBody.data[1];
                        if v16 and v16.versionId then
                            v10:dispatch(v4(v9, v16.name, v16.description or "", tostring(v16.versionId) or "", v16.created or "", v16.updated or ""));
                            local l_versionId_0 = v16.versionId;
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
                                -- upvalues: v6 (ref), v9 (ref), l_versionId_0 (copy)
                                v6:TryInstallPlugin(v9, l_versionId_0);
                            end);
                            if l_status_0 then
                                local l_PLUGIN_INSTALLED_SUCCESSFULLY_0 = v1.PLUGIN_INSTALLED_SUCCESSFULLY;
                                if l_PLUGIN_INSTALLED_SUCCESSFULLY_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                    v8:report("InstallPluginFromWebSuccess", v9);
                                else
                                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_INSTALLED_SUCCESSFULLY_0);
                                end;
                                v10:dispatch(v2(v9, l_PLUGIN_INSTALLED_SUCCESSFULLY_0, ""));
                                return;
                            else
                                local l_PLUGIN_NOT_INSTALLED_0 = v1.PLUGIN_NOT_INSTALLED;
                                local v22 = l_result_0 or "";
                                if l_PLUGIN_NOT_INSTALLED_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                    v8:report("InstallPluginFromWebSuccess", v9);
                                else
                                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_NOT_INSTALLED_0);
                                end;
                                v10:dispatch(v2(v9, l_PLUGIN_NOT_INSTALLED_0, v22));
                                return;
                            end;
                        else
                            local l_PLUGIN_DETAILS_UNAVAILABLE_0 = v1.PLUGIN_DETAILS_UNAVAILABLE;
                            local v24 = tostring(v15.responseBody);
                            if l_PLUGIN_DETAILS_UNAVAILABLE_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                                v8:report("InstallPluginFromWebSuccess", v9);
                            else
                                v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_DETAILS_UNAVAILABLE_0);
                            end;
                            v10:dispatch(v2(v9, l_PLUGIN_DETAILS_UNAVAILABLE_0, v24));
                            return;
                        end;
                    else
                        local l_PLUGIN_DETAILS_UNAVAILABLE_1 = v1.PLUGIN_DETAILS_UNAVAILABLE;
                        local v26 = tostring(v15.responseBody);
                        if l_PLUGIN_DETAILS_UNAVAILABLE_1 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                            v8:report("InstallPluginFromWebSuccess", v9);
                        else
                            v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_DETAILS_UNAVAILABLE_1);
                        end;
                        v10:dispatch(v2(v9, l_PLUGIN_DETAILS_UNAVAILABLE_1, v26));
                        return;
                    end;
                end, function(v27) --[[ Line: 75 ]]
                    -- upvalues: v1 (ref), v8 (ref), v9 (ref), v10 (ref), v2 (ref)
                    local l_HTTP_ERROR_0 = v1.HTTP_ERROR;
                    if l_HTTP_ERROR_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                        v8:report("InstallPluginFromWebSuccess", v9);
                    else
                        v8:report("InstallPluginFromWebFailure", v9, l_HTTP_ERROR_0);
                    end;
                    v10:dispatch(v2(v9, l_HTTP_ERROR_0, v27));
                end);
            else
                local l_PLUGIN_NOT_OWNED_0 = v1.PLUGIN_NOT_OWNED;
                if l_PLUGIN_NOT_OWNED_0 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                    v8:report("InstallPluginFromWebSuccess", v9);
                else
                    v8:report("InstallPluginFromWebFailure", v9, l_PLUGIN_NOT_OWNED_0);
                end;
                v10:dispatch(v2(v9, l_PLUGIN_NOT_OWNED_0, ""));
                return;
            end;
        end;
        local function v33(v31) --[[ Line: 87 ]] --[[ Name: ownershipFailureHandler ]]
            -- upvalues: v1 (ref), v8 (ref), v9 (ref), v10 (copy), v2 (ref)
            local l_HTTP_ERROR_1 = v1.HTTP_ERROR;
            if l_HTTP_ERROR_1 == v1.PLUGIN_INSTALLED_SUCCESSFULLY then
                v8:report("InstallPluginFromWebSuccess", v9);
            else
                v8:report("InstallPluginFromWebFailure", v9, l_HTTP_ERROR_1);
            end;
            v10:dispatch(v2(v9, l_HTTP_ERROR_1, v31));
        end;
        local l_v6_UserId_0 = v6:GetUserId();
        v7.Inventory.v1.Users.Items.IsOwned(l_v6_UserId_0, Enum.AvatarItemType.Asset, v9):andThen(v30, v33);
    end;
end;