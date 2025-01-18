local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v2 = require(l_Actions_0.ClearSelectedMaterial);
local v3 = require(l_Actions_0.DoneGeneratingImages);
local v4 = require(l_Actions_0.MergeFilteredTextPrompt);
local v5 = require(l_Actions_0.SetGeneratingImages);
local v6 = require(l_Actions_0.SetGenerationError);
local v7 = require(l_Actions_0.SetMaterialGenerationSession);
local _ = require(l_Actions_0.SetSelectedMaterial);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v10 = require(l_Thunks_0.CreateGeneratedMaterials);
local l_Enum_0 = l_Parent_0.Src.Enum;
local v12 = require(l_Enum_0.GenerationErrorType);
local v13 = require(l_Parent_0.Src.Util.DebugFlags);
local v14 = require(l_Parent_0.Src.Util.parseGenerationError);
local v15 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_MaterialGeneratorErrorAnalytics_0 = game:GetFastFlag("MaterialGeneratorErrorAnalytics");
local _ = require(l_Parent_0.Src.Types);
return function(v19, v20, v21) --[[ Line: 32 ]]
    -- upvalues: v7 (copy), v6 (copy), v12 (copy), v16 (copy), v15 (copy), v2 (copy), v5 (copy), l_MaterialGeneratorErrorAnalytics_0 (copy), v13 (copy), v3 (copy), v14 (copy), v4 (copy), v10 (copy)
    return function(v22) --[[ Line: 33 ]]
        -- upvalues: v19 (copy), v7 (ref), v6 (ref), v12 (ref), v16 (ref), v15 (ref), v2 (ref), v5 (ref), l_MaterialGeneratorErrorAnalytics_0 (ref), v13 (ref), v3 (ref), v14 (ref), v4 (ref), v20 (copy), v10 (ref), v21 (copy)
        local v23 = v22:getState();
        local v24 = v19:getService("MaterialGenerationService");
        local l_session_0 = v23.MaterialsReducer.session;
        if not l_session_0 then
            l_session_0 = v24:StartSession();
            if l_session_0 then
                v22:dispatch(v7(l_session_0));
            else
                v22:dispatch(v6(v12.NoSession));
                return;
            end;
        end;
        local l_textPrompt_0 = v23.AppStateReducer.textPrompt;
        if not l_textPrompt_0 or l_textPrompt_0 == "" then
            return;
        else
            local v27 = nil;
            if v16() then
                v27 = v23.MaterialsReducer.initialImageId;
            end;
            local v28 = {
                InitialImage = v27, 
                Samples = 4
            };
            if not v15() then
                v22:dispatch(v2());
            end;
            v22:dispatch(v5(v28.Samples));
            v22:dispatch(v6(v12.None, nil));
            task.spawn(function() --[[ Line: 72 ]]
                -- upvalues: l_MaterialGeneratorErrorAnalytics_0 (ref), v13 (ref), l_session_0 (ref), l_textPrompt_0 (copy), v28 (copy), v22 (copy), v3 (ref), v14 (ref), v12 (ref), v4 (ref), v6 (ref), v20 (ref), v27 (ref), v19 (ref), v10 (ref), v21 (ref)
                local v29 = nil;
                local v30 = nil;
                local v31 = nil;
                if l_MaterialGeneratorErrorAnalytics_0 then
                    local v32 = nil;
                    local v33 = nil;
                    if v13.ForceGenerationError() then
                        v32 = false;
                        v33 = nil;
                    else
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 82 ]]
                            -- upvalues: v29 (ref), v30 (ref), v31 (ref), l_session_0 (ref), l_textPrompt_0 (ref), v28 (ref)
                            local v34, v35, v36 = l_session_0:GenerateImagesAsync(l_textPrompt_0, v28);
                            v29 = v34;
                            v30 = v35;
                            v31 = v36;
                        end);
                        v32 = l_status_0;
                        v33 = l_result_0;
                    end;
                    v22:dispatch(v3());
                    if not v32 then
                        local v39, v40 = v14(v33);
                        if v39 == v12.TextFullyFiltered then
                            v22:dispatch(v4(l_textPrompt_0, string.gsub(l_textPrompt_0, "[^ \n]", "#")));
                        end;
                        v22:dispatch(v6(v39, v40));
                        if v20 then
                            v20:report("generateMaterialsError", l_textPrompt_0, v27, v39, v40);
                        end;
                        return;
                    end;
                else
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 104 ]]
                        -- upvalues: v29 (ref), v30 (ref), v31 (ref), l_session_0 (ref), l_textPrompt_0 (ref), v28 (ref)
                        local v41, v42, v43 = l_session_0:GenerateImagesAsync(l_textPrompt_0, v28);
                        v29 = v41;
                        v30 = v42;
                        v31 = v43;
                    end);
                    v22:dispatch(v3());
                    if not l_status_1 then
                        if type(l_result_1) == "string" then
                            if string.find(l_result_1, "got network error status: 429") then
                                v22:dispatch(v6(v12.TooManyRequests, nil));
                            elseif string.find(l_result_1, "got network error status: 500") then
                                v22:dispatch(v6(v12.ServerError500, nil));
                            elseif string.find(l_result_1, "got network error status: 504") then
                                v22:dispatch(v6(v12.ServerError504, nil));
                            elseif string.find(l_result_1, "TextFullyFiltered") then
                                v22:dispatch(v4(l_textPrompt_0, string.gsub(l_textPrompt_0, "[^ \n]", "#")));
                                v22:dispatch(v6(v12.TextFullyFiltered, nil));
                            elseif string.find(l_result_1, "AccountingFailed") and string.find(l_result_1, "Decrementing account failed") then
                                v22:dispatch(v6(v12.AccountingFailedDecrement, nil));
                            else
                                v22:dispatch(v6(v12.CustomMessage, l_result_1));
                            end;
                        else
                            v22:dispatch(v6(v12.Unknown, nil));
                        end;
                        return;
                    end;
                end;
                local l_l_textPrompt_0_0 = l_textPrompt_0;
                if type(v30) == "string" and #v30 > 0 then
                    l_l_textPrompt_0_0 = v30;
                    v22:dispatch(v4(l_textPrompt_0, v30));
                end;
                local v47 = v19:getService("HttpService"):GenerateGUID(false);
                v22:dispatch(v10(l_l_textPrompt_0_0, v29, v47, v19));
                if v20 then
                    if l_MaterialGeneratorErrorAnalytics_0 then
                        v20:report("generateMaterials", v47, v21, #v29, l_textPrompt_0, v30);
                    else
                        v20:report("generateButtonClicked", v47, #v29, l_textPrompt_0, v30);
                    end;
                end;
            end);
            return;
        end;
    end;
end;