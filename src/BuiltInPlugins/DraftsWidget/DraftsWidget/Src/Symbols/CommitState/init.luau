local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Symbol);
return {
    Uncommitted = v1.named("CommitStatusUncommitted"), 
    Committing = v1.named("CommitStatusCommitting"), 
    Committed = v1.named("CommitStatusCommitted")
};