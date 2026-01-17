###########################################################
[CM_Addons] Tether Inject v1.0.0 [Quicklava, ilikepizza107]
###########################################################
.include "Source/CM_Addons/AddonAliases.asm"
# Disables Tether Canceling if RA-Bit [22] is set
.alias Code_Loc = TETHNJCT_WORKING_MEM_LOC

CODE @ $TETHNJCT_WORKING_MEM_LOC
{
  # +0x00 Pointer to injection
  word 2; word Code_Loc+0x50

  # +0x08 Params for Code_Loc+0x50
  word 6; word 0x80000008 # Requirement
  word 5; RA_Bit 22
  # +0x18 Params for Code_Loc+0x58
  word 0; word 0x0000000E # Value
  word 6; word 0x00000007 # Requirement
  word 5; IC_Basic 1018
  word 0; word 0x00000001 # Value
  word 5; IC_Basic 3133
  # +0x40 Params for Code_Loc+0x60
  word 6; word 0x00000008 # Requirement
  word 5; RA_Bit 19

  # +0x50 PSA commands start
  word 0x000A0200; word Code_Loc+0x08 #
  word 0x02010500; word Code_Loc+0x18 #
  word 0x02040200; word Code_Loc+0x40 #
  word 0x000F0000; word 0x00000000    #
  word 0x00080000; word 0x00000000    # Return
}
CODE @ $80FC2C70
{
  # Subroutine injection
  word 0x00070100; word Code_Loc
  word 0x00020000; word 0x00000000
}