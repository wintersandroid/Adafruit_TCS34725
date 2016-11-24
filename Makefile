# GNU Make solution makefile autogenerated by Premake
# Type "make help" for usage help

ifndef config
  config=debug_arm
endif
export config

PROJECTS := Adafruit_TCS34725_Rpi

.PHONY: all clean help $(PROJECTS)

all: $(PROJECTS)

Adafruit_TCS34725_Rpi: 
	@echo "==== Building Adafruit_TCS34725_Rpi ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f Adafruit_TCS34725_Rpi.make

clean:
	@${MAKE} --no-print-directory -C . -f Adafruit_TCS34725_Rpi.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "   debug_arm"
	@echo "   release_arm"
	@echo "   mocks_arm"
	@echo "   debug"
	@echo "   release"
	@echo "   mocks"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   Adafruit_TCS34725_Rpi"
	@echo ""
	@echo "For more information, see http://industriousone.com/premake/quick-start"
