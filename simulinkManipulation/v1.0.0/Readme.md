# Simulink Manipulation Utilities

## Overview 

A collection of functions for programatically manipulating the structure and connectivity of Simulink models. In Simulink, models can be altered using a collection of built-in function calls (e.g. `add_block`, `add_line`) and by modifying block parameters (using `set` and `set_param`). Maniuplating these parameters directly is tedious and requires a great deal of error-checking code. These functions make a variety of tasks--adding or removing a block, connecting or disconnecting pairs of blocks, modifying block positions and sizes, etc.--to accomplish via simple function calls.

## Design principle

Generally, the most common use of these functions is in a masked subsystem
initialization callback. For example, if you design a masked subsystem which has
an adjustable number of inputs, when the user changes the number of inputs
required, the initialization callback will need to create additional or destroy
extra block inports and connect them to their desired destinations within the
subsystem. To this end, these functions are designed to (a) do as little as
needed and (b) fail silently. 

The first time the callback runs, many changes might need to be made to the
system, but on subsequent initializations, few or no changes will need to be
made. To improve build speeds, these functions will make as few changes as
possible to the model, and do nothing if the model is already configured as
desired. For example, when you try to add a block with a particular name,
`addBlockSafe` will only add the block if it does not already exist. If you use
`setBlockParam` to change a particular block parameter, `set_param` will only be
called internally if the block parameter actually needs to be changed.

Secondly, whenever a function would otherwise fail, these functions typically
just return without doing anything. This obviates the need for tedious error
checking in your code, i.e. if you'd like to delete a block, you don't need to
check whether it exists before calling `deleteBlock`.

## List of functions

addBlockSafe                   - Adds a new block by copying an existing block (typically from Simulink library)
addLineExclusive               - Connects one block to another, deleting other outgoing connections
addLineSafe                    - Connects one block to another at specific ports
blockExists                    - Determines whether a block exists
deleteBlock                    - Deletes a block if it exists
deleteBlockLines               - Delete incoming and outgoing lines from a block
deleteBrokenIncomingLines      - Deletes disconnected lines connected to a block's inports
deleteBrokenOutgoingLines      - Deletes disconnected lines connected to a block's outports
deleteIncomingLine             - Deletes a line connected to a specific block's inports
deleteLine                     - Deletes a connection between a particular pair of blocks/ports if one exists
deleteOutgoingLine             - Deletes a line connected to a block's specific outport
getBlockNameFromHandle         - Convert block handle to block name
getBusSignalNamesFromInport    - Retrieve names of bus signals connected to inport
getIncomingBusSignalNames      - Retrieves names of bus signals connected to block at specific inport
getIncomingLine                - Gets a handle to the line connected to a particular block inport
getIncomingLineSource          - Determines which block is connected to this block at a particular inport
getInputSignalName             - Determines the name of a signal connected to a particular inport
getNumInPorts                  - Determine the number of block inports
getNumOutPorts                 - Determine the number of block outports
getOutgoingLine                - Gets a handle to the line connected to a particular block outport
getOutgoingLineDest            - Determines all blocks/ports to which a particular outport is connected
getSysName                     - Determines the name of the outermost Simulink system containing a block
lineExists                     - Determines whether a line connects a particular pair of block ports
makePortName                   - Generates a Simulink port name
redrawLines                    - Reroute all lines connected to block
redrawLinesWithin              - Reroute all lines connected within a block
setBlockParam                  - Sets block parameters if they do not match current values
setBlockPosition               - Set block position and size
setBlockSize                   - Set block position
setOutputSignalName            - Sets the name of a block's output signal

