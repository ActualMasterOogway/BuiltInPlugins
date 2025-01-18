local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.UI.ContextServices.ContextItem);
local v3 = require(l_Parent_0.Resources);
local l_Signal_0 = require(l_Parent_0.Util).Signal;
local v5 = require(l_Parent_0.Parent.Cryo);
local v6 = v2:extend("Localization");
v6.new = function(v7) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: l_StudioService_0 (copy), l_Signal_0 (copy), v5 (copy), v3 (copy), v6 (copy)
    assert(type(v7) == "table", "Localization props is expected to be a table.");
    assert(v7.stringResourceTable ~= nil, "Localization must have a .csv string resource table for English strings");
    assert(v7.translationResourceTable ~= nil, "Localization must have a .csv string resource table of translations");
    assert(type(v7.pluginName) == "string", "Please specify the plugin's name");
    if v7.libraries ~= nil then
        assert(type(v7.libraries) == "table", "Localization libraries prop must be a table or nil");
        for v8, v9 in pairs(v7.libraries) do
            assert(type(v8) == "string", "Localization libraries key must be a string");
            assert(type(v9) == "table", "Localization libraries value must be a table");
            assert(v9.stringResourceTable ~= nil, string.format("Localization table %s must have a .csv string resource table for English strings", v8));
            assert(v9.translationResourceTable ~= nil, string.format("Localization table %s must have a .csv string resource table of translations", v8));
        end;
    end;
    local l_stringResourceTable_0 = v7.stringResourceTable;
    local l_translationResourceTable_0 = v7.translationResourceTable;
    local l_getLocale_0 = v7.getLocale;
    local l_overrideLocaleId_0 = v7.overrideLocaleId;
    local l_overrideLocaleChangedSignal_0 = v7.overrideLocaleChangedSignal;
    local l_namespace_0 = v7.namespace;
    local l_pluginName_0 = v7.pluginName;
    if l_namespace_0 == nil then
        l_namespace_0 = "Studio";
    end;
    local v17 = nil;
    v17 = l_overrideLocaleChangedSignal_0 or l_StudioService_0:GetPropertyChangedSignal("StudioLocaleId");
    local function v18() --[[ Line: 117 ]] --[[ Name: getLocale ]]
        -- upvalues: l_getLocale_0 (copy), l_overrideLocaleId_0 (copy), l_StudioService_0 (ref)
        if l_getLocale_0 then
            return l_getLocale_0();
        elseif l_overrideLocaleId_0 ~= nil then
            return l_overrideLocaleId_0;
        else
            return l_StudioService_0.StudioLocaleId;
        end;
    end;
    local v19 = {
        localeChanged = l_Signal_0.new(), 
        externalLocaleChanged = v17, 
        externalLocaleChangedConnection = nil, 
        locale = "en-us", 
        keyNamespace = l_namespace_0, 
        keyPluginName = l_pluginName_0, 
        getLocale = v18
    };
    v19.projects = v5.Dictionary.join(v7.libraries or {}, {
        [v19.keyPluginName] = {
            stringResourceTable = l_stringResourceTable_0, 
            translationResourceTable = l_translationResourceTable_0
        }, 
        [v3.LOCALIZATION_PROJECT_NAME] = {
            stringResourceTable = v3.SourceStrings, 
            translationResourceTable = v3.LocalizedStrings
        }
    });
    v19.translators = {};
    v19.fallbackTranslators = {};
    setmetatable(v19, v6);
    v19.localeChangedConnection = v19.externalLocaleChanged:Connect(function() --[[ Line: 175 ]]
        -- upvalues: v19 (copy)
        v19:updateLocaleAndTranslator();
        v19.localeChanged:Fire(v19);
    end);
    v19:updateLocaleAndTranslator();
    return v19;
end;
v6.getSignal = function(v20) --[[ Line: 185 ]] --[[ Name: getSignal ]]
    return v20.localeChanged;
end;
v6.getConsumerItem = function(v21) --[[ Line: 189 ]] --[[ Name: getConsumerItem ]]
    return table.clone(v21);
end;
v6.getText = function(v22, v23, v24, v25) --[[ Line: 196 ]] --[[ Name: getText ]]
    return v22:getProjectText(v22.keyPluginName, v23, v24, v25);
end;
v6.getProjectText = function(v26, v27, v28, v29, v30) --[[ Line: 204 ]] --[[ Name: getProjectText ]]
    assert(type(v27) == "string", "Cannot fetch the string without a project");
    assert(type(v28) == "string", "Cannot fetch the string without a scope");
    assert(type(v29) == "string", "Cannot fetch a string without the key");
    assert(v26.projects[v27] ~= nil, string.format("Project %s is not available", v27));
    local v31 = string.format("%s.%s.%s.%s", v26.keyNamespace, v27, v28, v29);
    local function _(v32) --[[ Line: 212 ]] --[[ Name: getTranslation ]]
        -- upvalues: v31 (copy), v30 (copy)
        if not v32 then
            return false, nil;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 217 ]]
                -- upvalues: v32 (copy), v31 (ref), v30 (ref)
                return v32:FormatByKey(v31, v30);
            end);
            return l_status_0, l_result_0;
        end;
    end;
    local v36 = v26.translators[v27];
    local v37 = v26.fallbackTranslators[v27];
    local v38 = nil;
    local v39 = nil;
    if v26.locale == "en-us" then
        local v40, v41;
        if not v37 then
            v40 = false;
            v41 = nil;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 217 ]]
                -- upvalues: v37 (copy), v31 (copy), v30 (copy)
                return v37:FormatByKey(v31, v30);
            end);
            v40 = l_status_1;
            v41 = l_result_1;
        end;
        v38 = v40;
        v39 = v41;
        if v38 then
            return v39;
        end;
    else
        local v44, v45;
        if not v36 then
            v44 = false;
            v45 = nil;
        else
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 217 ]]
                -- upvalues: v36 (copy), v31 (copy), v30 (copy)
                return v36:FormatByKey(v31, v30);
            end);
            v44 = l_status_2;
            v45 = l_result_2;
        end;
        v38 = v44;
        v39 = v45;
        if v38 then
            return v39;
        else
            if not v37 then
                v44 = false;
                v45 = nil;
            else
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 217 ]]
                    -- upvalues: v37 (copy), v31 (copy), v30 (copy)
                    return v37:FormatByKey(v31, v30);
                end);
                v44 = l_status_3;
                v45 = l_result_3;
            end;
            v38 = v44;
            v39 = v45;
            if v38 then
                return v39;
            end;
        end;
    end;
    if game:GetEngineFeature("RefactorTranslatorInstance") then
        if v26.keyPluginName ~= "Test" and not v38 and not string.find(v39, "Key .* not found for locale") then
            warn(v39, debug.traceback());
            return v31;
        end;
    elseif v26.keyPluginName ~= "Test" and not v38 and not string.find(v39, "LocalizationTable or parent tables do not contain a translation") then
        warn(v39, debug.traceback());
    end;
    return v31;
end;
v6.destroy = function(v50) --[[ Line: 275 ]] --[[ Name: destroy ]]
    if v50.localeChangedConnection then
        v50.localeChangedConnection:Disconnect();
    end;
end;
v6.updateLocaleAndTranslator = function(v51) --[[ Line: 281 ]] --[[ Name: updateLocaleAndTranslator ]]
    v51.locale = v51.getLocale();
    for v52, v53 in pairs(v51.projects) do
        v51.translators[v52] = v53.translationResourceTable:GetTranslator(v51.locale);
        v51.fallbackTranslators[v52] = v53.stringResourceTable:GetTranslator("en-us");
    end;
end;
local v54 = require(l_Parent_0.Util.RoundingBehaviour);
local v55 = {
    ["en-us"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "K"
        }, 
        {
            1000000, 
            "M"
        }, 
        {
            1000000000, 
            "B"
        }
    }, 
    ["es-es"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " M"
        }
    }, 
    ["fr-fr"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " k"
        }, 
        {
            1000000, 
            " M"
        }, 
        {
            1000000000, 
            " Md"
        }
    }, 
    ["de-de"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " Tsd."
        }, 
        {
            1000000, 
            " Mio."
        }, 
        {
            1000000000, 
            " Mrd."
        }
    }, 
    ["pt-br"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " mi"
        }, 
        {
            1000000000, 
            " bi"
        }
    }, 
    ["zh-cn"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-cjv"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-tw"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\232\144\172"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["ko-kr"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\236\178\156"
        }, 
        {
            10000, 
            "\235\167\140"
        }, 
        {
            100000000, 
            "\236\150\181"
        }
    }, 
    ["ja-jp"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["it-it"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mila"
        }, 
        {
            1000000, 
            " Mln"
        }, 
        {
            1000000000, 
            " Mld"
        }
    }, 
    ["ru-ru"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \209\130\209\139\209\129"
        }, 
        {
            1000000, 
            " \208\188\208\187\208\189"
        }, 
        {
            1000000000, 
            " \208\188\208\187\209\128\208\180"
        }
    }, 
    ["id-id"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " rb"
        }, 
        {
            1000000, 
            " jt"
        }, 
        {
            1000000000, 
            " M"
        }
    }, 
    ["vi-vn"] = {
        decimalSeparator = ".", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " N"
        }, 
        {
            1000000, 
            " Tr"
        }, 
        {
            1000000000, 
            " T"
        }
    }, 
    ["th-th"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \224\184\158"
        }, 
        {
            10000, 
            " \224\184\161"
        }, 
        {
            100000, 
            " \224\184\170"
        }, 
        {
            1000000, 
            " \224\184\165"
        }
    }, 
    ["tr-tr"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " B"
        }, 
        {
            1000000, 
            " Mn"
        }, 
        {
            1000000000, 
            " Mr"
        }
    }
};
v55["en-gb"] = v55["en-us"];
v55["es-mx"] = v55["es-es"];
local function _(v56) --[[ Line: 460 ]] --[[ Name: findDecimalPointIndex ]]
    return string.find(v56, "%.") or #v56 + 1;
end;
local function _(v58) --[[ Line: 465 ]] --[[ Name: findDecimalOffset ]]
    if v58 == 0 then
        return 0;
    else
        return -(math.floor((math.log10((math.abs(v58))))) + 1);
    end;
end;
local _ = function(v60, v61, v62) --[[ Line: 474 ]] --[[ Name: roundToSignificantDigits ]]
    -- upvalues: v54 (copy)
    local v63 = 10 ^ (v61 + (v60 == 0 and 0 or -(math.floor((math.log10((math.abs(v60))))) + 1)));
    local _ = nil;
    return (if v62 == v54.Truncate then math.modf(v60 * v63) else math.floor(v60 * v63 + 0.5)) / v63;
end;
local function v72(v66, v67) --[[ Line: 486 ]] --[[ Name: addGroupDelimiters ]]
    local l_v66_0 = v66;
    local v69 = string.format("%%1%s%%2", v67);
    repeat
        local v70, v71 = string.gsub(l_v66_0, "^(-?%d+)(%d%d%d)", v69);
        l_v66_0 = v70;
    until v71 == 0;
    return l_v66_0;
end;
local function v81(v73, v74, v75) --[[ Line: 499 ]] --[[ Name: findDenominationEntry ]]
    -- upvalues: v54 (copy)
    local v76 = v73[1];
    local v77 = math.abs(v74);
    for v78 = #v73, 2, -1 do
        local v79 = v73[v78];
        local _ = nil;
        if (if v75 == v54.Truncate then v79[1] else v79[1] - v73[v78 - 1][1] / 2) <= v77 then
            return v79;
        end;
    end;
    return v76;
end;
v6.localizeNumber = function(v82, v83) --[[ Line: 519 ]] --[[ Name: localizeNumber ]]
    -- upvalues: v55 (copy), v72 (copy)
    if v83 == 0 then
        return "0";
    else
        local v84 = v55[v82.locale] or v55["en-us"];
        if v84.groupDelimiter then
            return (v72(v83, v84.groupDelimiter));
        else
            return v83;
        end;
    end;
end;
v6.localizeAndAbbreviateNumber = function(v85, v86, v87, v88) --[[ Line: 539 ]] --[[ Name: localizeAndAbbreviateNumber ]]
    -- upvalues: v54 (copy), v55 (copy), v81 (copy), v72 (copy)
    if v86 == 0 then
        return "0";
    else
        if v87 == nil then
            v87 = v54.RoundToClosest;
        end;
        if v88 == nil then
            v88 = 3;
        end;
        local v89 = v55[v85.locale] or v55["en-us"];
        local v90 = v81(v89, v86, v87);
        local v91 = v90[1];
        local v92 = v90[2];
        local v93 = v86 / v91;
        local l_v88_0 = v88;
        local l_v87_0 = v87;
        local v96 = 10 ^ (l_v88_0 + (v93 == 0 and 0 or -(math.floor((math.log10((math.abs(v93))))) + 1)));
        local _ = nil;
        local v98 = (if l_v87_0 == v54.Truncate then math.modf(v93 * v96) else math.floor(v93 * v96 + 0.5)) / v96;
        v93 = nil;
        l_v88_0 = tostring(if v87 == v54.Truncate then math.modf(v98 * 10) / 10 else math.floor(v98 * 10 + 0.5) / 10);
        l_v87_0 = string.find(l_v88_0, "%.") or #l_v88_0 + 1;
        local v99 = string.sub(l_v88_0, 1, l_v87_0 - 1);
        v96 = string.sub(l_v88_0, l_v87_0 + 1, #l_v88_0);
        if v89.groupDelimiter then
            v99 = v72(v99, v89.groupDelimiter);
        end;
        if #v96 > 0 then
            return v99 .. v89.decimalSeparator .. v96 .. v92;
        else
            return v99 .. v92;
        end;
    end;
end;
v6.mock = function(v100) --[[ Line: 592 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy), v5 (copy), l_Signal_0 (copy)
    v100 = v100 or {};
    local v107 = {
        GetTranslator = function() --[[ Line: 596 ]] --[[ Name: GetTranslator ]]
            return {
                FormatByKey = function(_, v102, v103) --[[ Line: 598 ]] --[[ Name: FormatByKey ]]
                    local v104 = "";
                    if v103 then
                        if type(v103) ~= "table" then
                            error("Args must be a table");
                        else
                            for v105, v106 in pairs(v103) do
                                v104 = string.format("%s,%s:%s", v104, v105, v106);
                            end;
                            v104 = string.sub(v104, 2);
                        end;
                    end;
                    return string.format("%s:[%s]", v102, v104);
                end
            };
        end
    };
    local v108 = v100.getLocale or function() --[[ Line: 621 ]]
        return "en-us";
    end;
    return v6.new(v5.Dictionary.join({
        stringResourceTable = v107, 
        translationResourceTable = v107, 
        pluginName = "Test", 
        overrideLocaleChangedSignal = l_Signal_0.new(), 
        getLocale = v108
    }, v100 or {}));
end;
return v6;