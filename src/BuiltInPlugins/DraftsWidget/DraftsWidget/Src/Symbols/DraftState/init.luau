local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Symbol);
return {
    Outdated = v1.named("DraftStateOudated"), 
    Deleted = v1.named("DraftStateDeleted"), 
    Committed = v1.named("DraftStateCommitted"), 
    Autosaved = v1.named("DraftStateAutosaved")
};