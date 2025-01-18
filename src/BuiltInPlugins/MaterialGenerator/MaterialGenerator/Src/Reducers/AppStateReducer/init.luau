local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.DoneGeneratingImages);
local v5 = require(l_Actions_0.MergeFilteredTextPrompt);
local v6 = require(l_Actions_0.SetGeneratingImages);
local v7 = require(l_Actions_0.SetGenerationError);
local v8 = require(l_Actions_0.SetIsSavingMaterial);
local v9 = require(l_Actions_0.SetTextPrompt);
local l_Util_0 = l_Parent_0.Src.Util;
local v11 = require(l_Util_0.tryReplaceFirstText);
local l_Enum_0 = l_Parent_0.Src.Enum;
local v13 = require(l_Enum_0.GenerationErrorType);
local l_join_0 = v1.join;
local v15 = {
    isGeneratingImages = false, 
    generatingImages = 0, 
    isSavingMaterial = false, 
    textPrompt = "", 
    generationError = {
        generationErrorType = v13.None, 
        message = nil
    }
};
return (v2.createReducer(v15, {
    [v6.name] = function(v16, v17) --[[ Line: 50 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            generatingImages = v17.amount
        });
    end, 
    [v4.name] = function(v18, _) --[[ Line: 56 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v18, {
            generatingImages = 0
        });
    end, 
    [v7.name] = function(v20, v21) --[[ Line: 62 ]]
        -- upvalues: l_join_0 (copy), v1 (copy)
        return l_join_0(v20, {
            generationError = {
                generationErrorType = v21.generationErrorType, 
                message = v21.message or v1.None
            }
        });
    end, 
    [v8.name] = function(v22, v23) --[[ Line: 71 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v22, {
            isSavingMaterial = v23.isSavingMaterial
        });
    end, 
    [v9.name] = function(v24, v25) --[[ Line: 77 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v24, {
            textPrompt = v25.textPrompt
        });
    end, 
    [v5.name] = function(v26, v27) --[[ Line: 83 ]]
        -- upvalues: v11 (copy), l_join_0 (copy)
        if v27.original == v27.filteredText then
            return v26;
        else
            local v28 = v11(v26.textPrompt, v27.original, v27.filteredText);
            if v28 then
                return l_join_0(v26, {
                    textPrompt = v28
                });
            else
                return v26;
            end;
        end;
    end
}));