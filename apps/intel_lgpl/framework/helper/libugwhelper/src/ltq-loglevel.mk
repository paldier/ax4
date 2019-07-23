
define func_ltq_dbg_level
	if [ -n "$(1)" ]; then lchk="$(1)"; else lchk="$(GLOBAL_DEBUG_LEVEL)"; fi; \
	clvl=0;for lvl in EMERG ALERT CRIT ERR WARNING NOTICE INFO DEBUG; do \
		echo -DSYS_LOG_$$lvl; \
		if [ "$$clvl" = "$$lchk" ]; then break; fi; \
		clvl=$$((clvl+1)); \
	done
endef
ltq_dbg_add=$(shell $(call func_ltq_dbg_level,$(1)))

