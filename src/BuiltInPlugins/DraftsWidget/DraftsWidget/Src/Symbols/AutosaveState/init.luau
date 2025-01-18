local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Symbol);
return {
    Saved = v1.named("AutosaveStateSaved"), 
    Saving = v1.named("AutosaveStateSaving"), 
    SaveFailed = v1.named("AutosaveStateSaveFailed")
};