# Lantiq SoC xRX500 Family/Reference Boards

define Profile/None
  NAME:=Generic Profile
endef

define Profile/None/Description
	Basic profile
endef
$(eval $(call Profile,None))

define Profile/HAPS
  NAME:=LANTIQ GRX500 HAPS 
endef

define Profile/HAPS/Description
	Lantiq GRX500 HAPS Platform
endef
$(eval $(call Profile,HAPS))

define Profile/grx500_evm
  NAME:=LANTIQ GRX500 EVM Boards
endef

define Profile/grx500_evm/Description
	Lantiq GRX500 EVM Board
endef
$(eval $(call Profile,grx500_evm))

define Profile/easy350_anywan
  NAME:=EASY350 ANYWAN 600MHz Board
endef

define Profile/easy350_anywan/Description
        EASY350 ANYWAN Board
endef
$(eval $(call Profile,easy350_anywan))

define Profile/easy350_anywan_800m
  NAME:=EASY350 ANYWAN 800Mhz Board
endef

define Profile/easy350_anywan_800m/Description
        EASY350 ANYWAN 800Mhz DT
endef
$(eval $(call Profile,easy350_anywan_800m))

define Profile/easy350_anywan_800m_host
  NAME:=EASY350 ANYWAN 800Mhz Board for host os
endef

define Profile/easy350_anywan_800m_host/Description
        EASY350 ANYWAN 800Mhz DT for host os
endef
$(eval $(call Profile,easy350_anywan_800m_host))



define Profile/easy350_anywan_ire
  NAME:=IRX200 ANYWAN 800Mhz Board
endef

define Profile/easy350_anywan_ire/Description
        IRX200 ANYWAN 800Mhz DT
endef
$(eval $(call Profile,easy350_anywan_ire))

define Profile/easy350_anywan_axepoint
  NAME:=AxePoint ANYWAN 800Mhz Board
endef

define Profile/easy350_anywan_axepoint/Description
	AxePoint ANYWAN 800Mhz DT
endef
$(eval $(call Profile,easy350_anywan_axepoint))

define Profile/easy350_anywan_ire220
  NAME:=IRE220 ANYWAN 800Mhz Board
endef

define Profile/easy350_anywan_ire/Description
        IRE220 ANYWAN 800Mhz DT
endef
$(eval $(call Profile,easy350_anywan_ire220))


define Profile/easy350_anywan_router
  NAME:=EASY350 ANYWAN 600Mhz Router Board
endef

define Profile/easy350_anywan_router/Description
        EASY350 ANYWAN 600Mhz Router DT
endef
$(eval $(call Profile,easy350_anywan_router))



define Profile/easy350_anywan_router_800m
  NAME:=EASY350 ANYWAN 800Mhz Router Board
endef

define Profile/easy350_anywan_router_800m/Description
        EASY350 ANYWAN 800Mhz Router DT
endef
$(eval $(call Profile,easy350_anywan_router_800m))


define Profile/easy350_m
  NAME:=EASY350-M Board with GPON and G.Fast
endef

define Profile/easy350_m/Description
        EASY350-M Board with GPON and G.Fast
endef
$(eval $(call Profile,easy350_m))

define Profile/easy550_anywan_gw
  NAME:=EASY550 ANYWAN 1GHz Gateway Board
endef

define Profile/easy550_anywan_gw/Description
        EASY550 ANYWAN Gateway Board
endef
$(eval $(call Profile,easy550_anywan_gw))

define Profile/easy350_anywan_mpe
  NAME:=EASY350 ANYWAN Board for MPE (600MHz/800MHz)
endef

define Profile/easy350_anywan_mpe/Description
        EASY350 ANYWAN Board DT for MPE
endef
$(eval $(call Profile,easy350_anywan_mpe))

define Profile/easy550_anywan_router
  NAME:=EASY550 ANYWAN Router Board
endef

define Profile/easy550_anywan_router/Description
        EASY550 ANYWAN Router DT
endef
$(eval $(call Profile,easy550_anywan_router))

define Profile/easy550v2_anywan_gw
  NAME:=EASY550 2000V2 ANYWAN Gateway Board
endef

define Profile/easy550v2_anywan_gw/Description
        EASY550 2000V2 ANYWAN Gateway Board
endef
$(eval $(call Profile,easy550v2_anywan_gw))

define Profile/easy350v2_anywan_gw
  NAME:=EASY350 1600 V2 ANYWAN Gateway Board
endef

define Profile/easy350v2_anywan_gw/Description
        EASY350 1600 V2 ANYWAN Gateway Board
endef
$(eval $(call Profile,easy350v2_anywan_gw))

define Profile/easy350_1200v2_anywan_gw
  NAME:= EASY350 1200V2 ANYWAN Gateway Board
endef

define Profile/easy350_1200v2_anywan_gw/Description
        EASY350 1200V2 ANYWAN Gateway Board
endef
$(eval $(call Profile,easy350_1200v2_anywan_gw))

define Profile/easy350_hgu
  NAME:=EASY350 HGU Board
endef

define Profile/easy350_hgu/Description
        EASY350 HGU
endef
$(eval $(call Profile,easy350_hgu))

