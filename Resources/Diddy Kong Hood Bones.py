__author__ = "mawwwk"
__version__ = "1.0"

from BrawlCrate.API import *
from BrawlCrate.NodeWrappers import *
from BrawlLib.SSBB.ResourceNodes import *
from BrawlLib.Wii.Animations import *

arc = BrawlAPI.RootNode
fit_diddy_motion = arc.Children[1]
fit_diddy_motion_A = arc.Children[2]
animation_data = fit_diddy_motion.Children[0]
animation_data_A = fit_diddy_motion_A.Children[0]

sourceChrGroup = animation_data.Children[0]
targetChrGroup = animation_data_A.Children[0]

# Loop through source animations (P+)
for sourceCHR in sourceChrGroup.Children:
    
    # Get matching target anim (3.02)
    targetCHR = targetChrGroup.FindChild(sourceCHR.Name)
    
    # Skip if doesn't exist
    if not targetCHR:
        continue
    
    # Loop through source bone entries
    for sourceBone in sourceCHR.Children:
        boneName = sourceBone.Name
        
        if not targetCHR.FindChild(boneName):
            # If entry doesn't exist in target anim, add it and replace with source
            entry = targetCHR.CreateEntry(boneName)
            entry.Replace(sourceBone)