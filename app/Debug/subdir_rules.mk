################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
%.obj: ../%.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"C:/ti/ccs1010/ccs/tools/compiler/ti-cgt-c2000_20.2.1.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="C:/Pliki/PW/ZNE_MyResearch/TI_prog" --include_path="C:/Texas Instruments/c2000/C2000Ware_3_02_00_00/device_support/f2833x/common/include" --include_path="C:/Texas Instruments/c2000/C2000Ware_3_02_00_00/device_support/f2833x/headers/include" --include_path="C:/ti/ccs1010/ccs/tools/compiler/ti-cgt-c2000_20.2.1.LTS/include" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"C:/ti/ccs1010/ccs/tools/compiler/ti-cgt-c2000_20.2.1.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 --include_path="C:/Pliki/PW/ZNE_MyResearch/TI_prog" --include_path="C:/Texas Instruments/c2000/C2000Ware_3_02_00_00/device_support/f2833x/common/include" --include_path="C:/Texas Instruments/c2000/C2000Ware_3_02_00_00/device_support/f2833x/headers/include" --include_path="C:/ti/ccs1010/ccs/tools/compiler/ti-cgt-c2000_20.2.1.LTS/include" --define=_DEBUG --define=LARGE_MODEL -g --diag_warning=225 --diag_wrap=off --display_error_number --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


