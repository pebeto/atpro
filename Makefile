ATPRO = atpro
MEMAB = memab
DISTRIBUTE = dist

FLAGS = CONFIG_660=1

ifeq ($(CONFIG_620), 1)
FLAGS = CONFIG_620=1
endif

ifeq ($(CONFIG_63X), 1)
FLAGS = CONFIG_63X=1
endif

ifeq ($(RELEASE), 1)
FLAGS += RELEASE=1
else
FLAGS += DEBUG=1

ifeq ($(ENABLE_LOGGER), 1)
FLAGS += ENABLE_LOGGER=1
endif

ifeq ($(TRACE), 1)
FLAGS += TRACE=1
endif

endif

ifeq ($(ENABLE_PEERLOCK), 1)
FLAGS += ENABLE_PEERLOCK=1
endif

ifeq ($(ENABLE_NETLOCK), 1)
FLAGS += ENABLE_NETLOCK=1
endif

ifeq ($(PDP_DIRTY_MAGIC), 1)
FLAGS += PDP_DIRTY_MAGIC=1
endif

ifeq ($(BROADCAST_TO_LOCALHOST), 1)
FLAGS += BROADCAST_TO_LOCALHOST=1
endif

ifeq ($(LOCALHOST_AS_PEER), 1)
FLAGS += LOCALHOST_AS_PEER=1
endif

all:
	@mkdir $(DISTRIBUTE) || true
	@mkdir $(DISTRIBUTE)/seplugins || true
	@mkdir $(DISTRIBUTE)/kd || true
	@touch $(DISTRIBUTE)/seplugins/hotspot.txt || true
	@touch $(DISTRIBUTE)/seplugins/server.txt || true

	@cd $(ATPRO); make $(FLAGS)
	@cd $(MEMAB); make $(FLAGS)

	@mv $(ATPRO)/$(ATPRO).prx $(DISTRIBUTE)/seplugins/$(ATPRO).prx
	@mv $(MEMAB)/$(MEMAB).prx $(DISTRIBUTE)/kd/$(MEMAB).prx

clean:
	@cd $(ATPRO); make clean $(FLAGS)
	@cd $(MEMAB); make clean $(FLAGS)
	@rm -rf $(DISTRIBUTE) || true
